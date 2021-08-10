# Module

- module: a collection of related functions, types and typeclasses
- program: a collection of modules

code: [module](../examples/basic/module.hs)

## Import

### Script

```hs
import ModuleName1
import ModuleName2 (functionName1, functionName2) -- import only
import ModuleName3 hiding (functionName3) -- except
```

```hs
import qualified Data.Map
filter

import qualified Data.Map as M
M.filter
```

### GHCi

```hs
:m + ModuleName1 ModuleName2 ModuleName3
```
