import json

import spacy
from spacy.tokens import DocBin
from spacy.util import filter_spans
from tqdm import tqdm

with open("data/medical_ner_kaggle/Corona2.json") as f:
    data = json.load(f)
print(data["examples"][0])

training_data = {"classes": ["MEDICINE", "MEDICALCONDITION", "PATHOGEN"], "annotations": []}
annotations = []
for example in data["examples"]:
    temp_dict = {}
    temp_dict["text"] = example["content"]
    temp_dict["entities"] = []
    for annotation in example["annotations"]:
        start = annotation["start"]
        end = annotation["end"]
        label = annotation["tag_name"].upper()
        temp_dict["entities"].append((start, end, label))
    annotations.append(temp_dict)
training_data["annotations"] = annotations
print(annotations[0])

nlp = spacy.blank("en")  # load a new spacy model
doc_bin = DocBin()  # create a DocBin object
for training_example in tqdm(training_data["annotations"]):
    text = training_example["text"]
    labels = training_example["entities"]
    doc = nlp.make_doc(text)
    ents = []
    for start, end, label in labels:
        span = doc.char_span(start, end, label=label, alignment_mode="contract")
        if span is None:
            print("Skipping entity")
        else:
            ents.append(span)
    filtered_ents = filter_spans(ents)
    doc.ents = filtered_ents
    doc_bin.add(doc)

doc_bin.to_disk("data/medical_ner_kaggle/training_data.spacy")  # save the docbin object
