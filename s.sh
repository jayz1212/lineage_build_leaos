source build/envsetup.sh

MAIN=/tmp/src/android
OUT=$MAIN/out/target/product/phhgsi_arm64_ab

cp -r $MAIN/android-certs $HOME/.android-certs


croot
./build/tools/releasetools/sign_target_files_apks -o -d ~/.android-certs \
    $OUT/obj/PACKAGING/target_files_intermediates/*-target_files-*.zip \
    signed-target_files.zip


./build/tools/releasetools/ota_from_target_files -k ~/.android-certs/releasekey \
    --block --backup=true \
    signed-target_files.zip \
    signed-ota_update.zip
