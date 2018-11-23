# Quick Start

* Register nickname:

    ```
    /msg NickServ REGISTER password youremail@example.com
    ```

* Identify yourself:

    ```
    /msg NickServ IDENTIFY password
    ```

* Use SASL to automate identification:

    ```
    /set irc.server.freenode.sasl_username $whoami
    /set irc.server.freenode.sasl_password xxxxx
    ```

* Connect to freenode and setup SSL:

    ```
    /server add freenode chat.freenode.net
    /set irc.server.freenode.addresses chat.freenode.net/6697
    /set irc.server.freenode.ssl on

    /set irc.server.freenode.nicks "dshil"
    /set irc.server.freenode.username "dshil"
    /set irc.server.freenode.realname "Dmitriy Shilin"

    /save
    /reconnect
    ```
* Setup default channels:

    ```
    /server irc.server.freenode.autojoin "#libreoffice-ru,#libreoffice-dev"
    ```

* Resources:
    * https://www.linode.com/docs/applications/messaging/using-weechat-for-irc/
    * https://gist.github.com/wikimatze/e19a312833b1be881f788ca795880fba
    * http://www.chiark.greenend.org.uk/doc/weechat-doc/html/weechat_quickstart.en.html
    * https://guides.fixato.org/setting_up_weechat.html
    * https://wiki.archlinux.org/index.php/WeeChat
