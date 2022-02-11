# ---------------------------------------------------------------------------------------------------------------------
# Update the Apt repository cache
# ---------------------------------------------------------------------------------------------------------------------
sudo apt -y update && sudo apt -y upgrade && sudo apt -y autoremove
sudo apt-get -y update && sudo apt-get -y upgrade && sudo apt-get -y autoremove
sudo apt dist-upgrade -y

# ---------------------------------------------------------------------------------------------------------------------
# Packages needed to build python from source
# ---------------------------------------------------------------------------------------------------------------------
sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget -y

# ---------------------------------------------------------------------------------------------------------------------
# Python venv and pip
# ---------------------------------------------------------------------------------------------------------------------
sudo apt install python3-venv -y
sudo apt install python3-pip -y
sudo apt install python3-dev -y
sudo apt install python3-wheel -y
sudo apt install python3-testresources -y

# ---------------------------------------------------------------------------------------------------------------------
# Install git
# ---------------------------------------------------------------------------------------------------------------------
sudo apt update -y
sudo add-apt-repository ppa:git-core/ppa
sudo apt install git -y
sudo apt install git-flow -y

# ---------------------------------------------------------------------------------------------------------------------
# Install vscode
# ---------------------------------------------------------------------------------------------------------------------
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https -y
sudo apt update -y
sudo apt install code -y

# ---------------------------------------------------------------------------------------------------------------------
# Install google chrome
# ---------------------------------------------------------------------------------------------------------------------
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

# ---------------------------------------------------------------------------------------------------------------------
# Install google cloud sdk
# ---------------------------------------------------------------------------------------------------------------------
https://cloud.google.com/sdk/docs/quickstart#deb
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get install apt-transport-https ca-certificates gnupg
sudo apt install curl
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update && sudo apt-get install google-cloud-sdk -y
sudo apt-get install google-cloud-sdk-app-engine-python -y
sudo apt-get install google-cloud-sdk-app-engine-python-extras -y
sudo apt-get install google-cloud-sdk-bigtable-emulator -y
sudo apt-get install google-cloud-sdk-cbt -y
sudo apt-get install google-cloud-sdk-cloud-build-local -y
sudo apt-get install google-cloud-sdk-datalab -y
sudo apt-get install google-cloud-sdk-datastore-emulator -y
sudo apt-get install google-cloud-sdk-firestore-emulator -y
sudo apt-get install google-cloud-sdk-pubsub-emulator -y
sudo apt-get install kubectl -y
