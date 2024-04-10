users=("user1" "user2" "user3")

for user in "${users[@]}"
do
    if [ -d "/home/$user" ]; then
        echo "Каталог для користувача $user вже існує"
    else
        mkdir "/home/$user"
        
        adduser "$user"
        
        password=$(openssl rand -base64 12)
        echo "$user:$password" | chpasswd
        echo "Пароль користувача $user: $password" > "/home/$user/password.txt"
        
        ssh-keygen -t rsa -b 2048 -f "/home/$user/.ssh/$user_key" -q -N ""
        
        echo "Користувач $user успішно створений"
    fi
done
