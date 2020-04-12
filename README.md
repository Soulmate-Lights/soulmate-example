Example Soulmate app

Installation:
```

sudo easy_install pip

cd ~/esp
git clone -b v3.3 --recursive https://github.com/espressif/esp-idf.git
cd esp-idf
git submodule update --init --recursive
python -m pip install --user -r $IDF_PATH/requirements.txt

mkdir -p ~/esp
cd ~/esp
wget https://dl.espressif.com/dl/xtensa-esp32-elf-osx-1.22.0-80-g6c4433a-5.2.0.tar.gz
tar -xzf xtensa-esp32-elf-osx-1.22.0-80-g6c4433a-5.2.0.tar.gz

git clone git@github.com:Soulmate-Lights/soulmate-core.git ~/esp/soulmate
```

To build your Soulmate, edit `main/main.cpp`

To compile:
```
make flash
```
