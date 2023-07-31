## bangrc
A few scripts that make using bash shell experience a little better

### Usage
You can load these scripts via running `source [script_name]` or you can add them in your `.bashrc`.
```bash
. [script_path]

# e.g. . ~/aliases.bash
```

### Note
In `math.bash` not all functions are "accurate". In calculation, `bash` has it's own limitations. Bash can't represent larger value than
signed 32-bit integer. `bc` on the other hand, can't perform floating point arithmetic. `log(...)` varient functions in `math.bash` are inaccurate
and rely on approximation. Please avoid using computed results on a critical area except just for the idea.
