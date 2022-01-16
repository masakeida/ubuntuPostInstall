# ubuntuPostInstall

## Usage

    # ./ubuntuPostInstall.sh [-w]

    Usage:
        ubuntuPostInstall.sh [<options>]
    Options:
        --version, -v     print ubuntuPostInstall.sh version
        --vmware, -w      configure for vmware

## このスクリプトは

Ubuntu をインストールした後、環境構築を自動的に行います。

### 具体的には

1. pkg_list.txt に記載したアプリケーションを、apt-getを用いてインストールします。
1. server_list.txt に記載したサーバー・スイートを disable にします。
1. インストール後、このスクリプトを走らせて、再起動した利用しやすい環境が整っていることを目指しています。
