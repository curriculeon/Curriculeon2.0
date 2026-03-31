USER_ID=$1
ssh-keygen -t rsa -b 4096 -C $USER_ID
eval "$(ssh-agent -s)"
echo "
Host *
AddKeysToAgent yes
IgnoreUnknown UseKeychain
UseKeychain yes
IdentityFile ~/.ssh/id_rsa
" > ~/.ssh/config
ssh-add ~/.ssh/id_rsa
pbcopy < ~/.ssh/id_rsa.pub # Linux & OSX
cat ~/.ssh/id_rsa.pub | clip # git-bash