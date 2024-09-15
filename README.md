Deps: qt6-base qt6-svg cmake ninja ... also build-essential on deb systems

1. cmake -S. -B./build -G Ninja

2. cmake --build ./build --config Debug --target pokerth --

3. cd build; ./pokerth