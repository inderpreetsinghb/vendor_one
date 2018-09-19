package generator

import (
	"fmt"

	"android/soong/android"
)

func cafExpandVariables(ctx android.ModuleContext, in string) string {
	cafVars := ctx.Config().VendorConfig("cafVarsPlugin")

	out, err := android.Expand(in, func(name string) (string, error) {
		if cafVars.IsSet(name) {
			return cafVars.String(name), nil
		}
		// This variable is not for us, restore what the original
		// variable string will have looked like for an Expand
		// that comes later.
		return fmt.Sprintf("$(%s)", name), nil
	})

	if err != nil {
		ctx.PropertyErrorf("%s: %s", in, err.Error())
		return ""
	}

	return out
}
