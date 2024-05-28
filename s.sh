source build/envsetup.sh


sign_target_files_apks -o -d ./android-certs \
    out/target/product/phhgsi_arm64_ab/system/img \
    signed-target_files.img


ota_from_target_files -k ./android-certs/releasekey \
    --block --backup=true \
    signed-target_files.img \
    signed-ota_update.img