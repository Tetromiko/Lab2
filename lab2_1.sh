if [ $# - ne 2 ]; then
	echo "Usage: $0 <local_directory_path> <remote_repository_path>"
	exit 1
fi

local_dir=$1
remote_repo=$2

git init $local_dir
git remote add origin $remote_repo

git --git-dir=$local_dir/.git --work-tree=$local_dir add .
git --git-dir=$local_dir/.git --work-tree=$local_dir commit -m "Initial commit"
git --git-dir=$local_dir/.git --work-tree=$local_dir push -u origin master
