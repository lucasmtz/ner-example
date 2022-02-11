#!/bin/bash
# Template repository and function names
TEMPLATE_NAME="pyproject-template"
FUNCTION_NAME="start_py_template"

# Create package folder
REPO_NAME=$(basename "$(pwd)")
PKG_NAME="${REPO_NAME//-/_}"
mkdir -m 777 "$PKG_NAME"
mkdir -m 777 "$PKG_NAME/tests"
touch $PKG_NAME/__init__.py
touch $PKG_NAME/tests/__init__.py
REPO_URL="$(git config --get remote.origin.url)"
BASE_URL=$(basename "$REPO_URL")

# Replace words in README, setup.cfg and pre-commit-config
sed -i 's@'"${TEMPLATE_NAME^^}"'@'"${REPO_NAME^^}"'@g' README.md
sed -i 's@'"${TEMPLATE_NAME}"'@'"${REPO_NAME}"'@g' README.md
sed -i 's@'"${TEMPLATE_NAME//-/_}"'@'"${PKG_NAME}"'@g' README.md
sed -i 's@package_name@'"${PKG_NAME}"'@g' setup.cfg
sed -i 's@package_name@'"${PKG_NAME}"'@g' .pre-commit-config.yaml

# Create virtual enviroment
rm -rf venv
python3 -m pip install --upgrade pip setuptools wheel
python3 -m venv venv
chmod -R 777 venv/
source venv/bin/activate

# Install versioneer
pip3 install versioneer

# Delete template git repository and start a new one
if [ "$BASE_URL" == "${TEMPLATE_NAME}.git" ]; then
    rm -rf .git
    git init
    versioneer install
fi

# Install project in editable mode
pip3 install -e .[dev]

# Install pre-commit and do the first commmit
if [ "$BASE_URL" == "${TEMPLATE_NAME}.git" ]; then
    pre-commit install
    pre-commit autoupdate
    git add .
    git commit -m "Initial commit"
    git add .
    git commit -m "Run pre-commit on all files"
    git flow init -d -t 'v'
fi

# Create a bash function for easily starting new templates
if [ "$BASE_URL" == "${TEMPLATE_NAME}.git" ] && [[ ! $(type -t $FUNCTION_NAME) == function ]]; then
    echo 'function '"$FUNCTION_NAME"'() {
    if [ ! -d $1 ]; then
        git clone '"$REPO_URL"' $1
        cd $1
        bash create_venv.sh
    else
        echo "ERROR: Destination path $1 already exists. Please choose another one."
    fi
    }' >>~/.bash_aliases

    source ~/.bash_aliases

    echo
    echo "$FUNCTION_NAME function added to ~/.bash_aliases."
    echo "You can now start new python projects using: $FUNCTION_NAME DESTINATION_PATH"
fi

# Check versioneer
echo
python setup.py version
echo

# Success message
echo "SUCCESS! $REPO_NAME repository is ready to use."
