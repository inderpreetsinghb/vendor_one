for var in eng user userdebug; do
add_lunch_combo one_$device-$var
done

# SDClang Environment Variables
export SDCLANG_AE_CONFIG=vendor/oneos/sdclang/sdclangAE.json
export SDCLANG_CONFIG=vendor/oneos/sdclang/sdclang.json
export SDCLANG_SA_ENABLED=false
