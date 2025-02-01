# nvim-config

## Installation
```sh
git clone https://github.com/Alan-Kuan/nvim-config ~/.config/nvim
```

## Config
If you want to override some default configs,
you can add `config-local.lua` in `lua/` and follow the following spec:
```
return {
  colorscheme = {
    dark = 'ayu',
    light = 'everforest',
  },
}
```
