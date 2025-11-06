# Neovim configurations
## Directory structure
``` text
~/.config/nvim/
  |-- init.lua (エントリポイント)
  |-- lua/
      |-- core (Neovim本体の設定)
      |-- plugins (プラグインの設定)
```

## セットアップ
- `/nvim`配下を`XDG_CONFIG_HOME`にシンボリックを設定
- `jetback`プラグインの初回インストール

``` bash
bash ./setup.sh
```

Neovimを起動して、プラグインをインストールします
```bash
:JetpackSync
```

Neovimを再起動し、エラーがなければ利用可能です。
