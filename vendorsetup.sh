for var in eng user userdebug; do
add_lunch_combo caf_$device-$var
done

# SDClang Environment Variables
export SDCLANG_AE_CONFIG=vendor/caf/sdclang/sdclangAE.json
export SDCLANG_CONFIG=vendor/caf/sdclang/sdclang.json
export SDCLANG_SA_ENABLED=false
