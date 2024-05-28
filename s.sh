source build/envsetup.sh

MAIN=/tmp/src/android
OUT=$MAIN/out/target/product/phhgsi_arm64_ab/system.img

cp -r $MAIN/android-certs $HOME/.android-certs


#cd out/target/product/phhgsi_arm64_ab
./build/tools/releasetools/sign_target_files_apks -o -d ~/.android-certs \
out/target/product/phhgsi_arm64_ab/system.img \
sign.img

./build/tools/releasetools/sign_target_files_apks -k ~/.android-certs/releasekey \
    --block --backup=true \
    sign.img \
    signed.img
