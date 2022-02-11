NER-EXAMPLE
==============================

## Table of Contents
* [Overview](#overview)
* [Functionality](#functionality)
* [Dependencies](#dependencies)
* [Installation](#installation)
    * [For Developers](#for-developers)
* [Distribution](#distribution)
* [Tests](#tests)
* [Usage](#usage)
* [Project Organization](#project-organization)

## Overview
This repository contains some template files for creating a new python repository in Ubuntu.

## Functionality
To use this project clone this repository into a specific folder.
You can choose any **folder-name** but you should use dashes (-) as a separator and use some naming convention like `[product/project name]-[purpose] (e.g. myproject-rest-api)`, as the **folder-name should be also the remote repository name**:
```sh
git clone https://github.com/lucasmtz/ner-example.git folder-name
```

Then, navigate to the **folder-name** and run the create_venv script:
```bash
cd folder-name
bash create_venv.sh
```

After doing these two steps you are ready to start working on your new project.
If you are using **Vscode** you can install the recommended set of extensions and be more productive.

If missing any dependency or application like `Python, Pip, Git, Git Flow, Vscode or Google Cloud SDK` you can use the commands in `setup_ubuntu.sh`.

**The next topics in this README are a general template for starting a new project. You can skip them as the create_venv.sh do the same steps.**

## Dependencies
- [Python 3.8+](https://www.python.org/)

## Installation

First, create a new virtual environment and install the project using:
```sh
python3 setup.py install
```

#### For Developers
Install the project in development mode:
```sh
pip install -e .[dev]
```

Run `pre-commit install` to configure the git hook scripts. The git hook scripts are useful for identifying simple problems before submitting them for code review. In the first execution run `pre-commit autoupdate` and then `pre-commit run --all-files`.

Instead of manually doing the above steps you can use the `create_venv.sh` bash script. It creates a virtual environment (`venv`) inside the root folder, install all necessary libraries and create the template files.
```sh
bash create_venv.sh
```


## Tests
The tests can be run after installation with:
```sh
pytest
```
To verify coverage:
```sh
coverage run -m pytest
coverage report -m --fail-under 80
coverage html
```

## Project Organization
After installation your initial project should have the following tree structure.

```html
 📦ner-example
 ┣ 📂.git
 ┣ 📂.vscode
 ┃ ┣ 📜extensions.json
 ┃ ┗ 📜settings.json
 ┣ 📂ner_example
 ┃ ┣ 📂tests
 ┃ ┃ ┗ 📜__init__.py
 ┃ ┣ 📜__init__.py
 ┃ ┗ 📜_version.py
 ┣ 📂venv
 ┣ 📜.gitattributes
 ┣ 📜.gitignore
 ┣ 📜.pre-commit-config.yaml
 ┣ 📜LICENSE
 ┣ 📜MANIFEST.in
 ┣ 📜README.md
 ┣ 📜create_venv.sh
 ┣ 📜setup.cfg
 ┣ 📜setup.py
 ┣ 📜setup_ubuntu.sh
 ┗ 📜versioneer.py
```

This tree is generated using the VScode extension `shinotatwu-ds.file-tree-generator`.

* All lowercase for choosing the package name.
* The repository should use the same name as the package, except that the repository substitutes dashes (-) for underscores (_).
