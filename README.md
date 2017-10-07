# where my Emacs starts

NOTE: this emacs startkit relies on spacemacs and only tested on windows 10 . If you want it to work under *NIX, modifications are necessary.


After strugling with Emacs configuration for such a long time, I found spacemacs which combines the best part of Emacs an Vim. Actually, I learnt how to use Vim by using spacemacs.

Right now, I spend even more time using Emacs to fulfill my work because of spacemacs.

# split the org settings

I use Org almost every day. As time goes by, the settings grows. There are tons of emacs-elisp in my config.el. So I split the code in config.el into several layers:
1. org basic layer which stores the basic setting for org including the global hotkey.
2. org gtd layer which stores the settings for GTD using org;
3. org export layer which stores the settings for exporting the org file as html, pdf, markdown
4. org publish layer which stores the settings for publishing the org file as a static website
5. org graph layer which stores the settings for using ditta and graphic (the two famous java package)

On my personal blog site www.zcl.space , there is a section dedicated to my use of Emacs.
