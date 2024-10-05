Deps: qt6-base qt6-svg cmake ninja ... also build-essential on deb systems
Arch Linux: sudo pacman -Syu base-devel qt6-base qt6-declarative qt6-svg cmake ninja git
Ubuntu noble: sudo apt install build-essential cmake ninja-build qt6-base-dev qt6-declarative-dev qml-module-qtquick2 libgl1-mesa-dev libxkbcommon-dev

1. cmake -S. -B./build -G Ninja

2. cmake --build ./build --config Debug --target pokerth --

3. cd build; ./pokerth
