package generator

import (
	"fmt"

	"android/soong/android"
)

func hsinExpandVariables(ctx android.ModuleContext, in string) string {
	hsinVars := ctx.Config().VendorConfig("hsinVarsPlugin")

	out, err := android.Expand(in, func(name string) (string, error) {
		if hsinVars.IsSet(name) {
			return hsinVars.String(name), nil
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
