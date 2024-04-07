users={"user1" "user2" "user3"} 

for user in "$users[@]}"
do
	if [ -d "/home/$user" ]; then
		echo "Catalogue for user $user already exist"
	else
		mkdir "/home/$user"
		adduser "$user"
		password=$(openssl rand -base64 12)
		echo "$user:$password" | chpasswd
		echo "User password $user: $password" > "/home/$user/password.txt"
		ssh-keygen -t rsa -b 2048 -f "/home/$user/.ssh/$user_key" -q -N ""
		echo "User $user created succesfully"
	fi
done
