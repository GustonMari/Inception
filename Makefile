all: $(NAME)
	@echo "\\n\033[32;1mMAKE ALL OK \033[0m \\n"
	@echo "\033[32;1m      ___           ___           ___           ___                  \033[0m"
	@echo "\033[32;1m     /\__\         /\  \         /\  \         /\  \                 \033[0m"
	@echo "\033[32;1m    /:/ _/_       |::\  \       /::\  \       /::\  \         ___    \033[0m"
	@echo "\033[32;1m   /:/ /\  \      |:|:\  \     /:/\:\  \     /:/\:\__\       /|  |   \033[0m"
	@echo "\033[32;1m  /:/ /::\  \   __|:|\:\  \   /:/ /::\  \   /:/ /:/  /      |:|  |   \033[0m"
	@echo "\033[32;1m /:/__\/\:\__\ /::::|_\:\__\ /:/_/:/\:\__\ /:/_/:/__/___    |:|  |   \033[0m"
	@echo "\033[32;1m \:\  \ /:/  / \:\~~\  \/__/ \:\/:/  \/__/ \:\/:::::/  /  __|:|__|   \033[0m"
	@echo "\033[32;1m  \:\  /:/  /   \:\  \        \::/__/       \::/~~/~~~~  /::::\  \   \033[0m"
	@echo "\033[32;1m   \:\/:/  /     \:\  \        \:\  \        \:\~~\      ~~~~\:\  \  \033[0m"
	@echo "\033[32;1m    \::/  /       \:\__\        \:\__\        \:\__\          \:\__\ \033[0m"
	@echo "\033[32;1m     \/__/         \/__/         \/__/         \/__/           \/__/ \033[0m"
	@echo "\\n"
	sudo mkdir -p /home/gmary/data
	sudo docker compose -f ./srcs/docker-compose.yml up -d
	@echo "\\n\033[32;1mCOMPILATION OK \033[0m \\n"

# $(NAME):
# 	mkdir -p /home/gmary/data
# 	sudo docker compose -f /srcs/docker-compose.yml up
# 	@echo "\\n\033[32;1mCOMPILATION OK \033[0m \\n"

clean:
	@echo "\\n\033[38;5;202;1mDeleting Objects... \033[0m \\n"
	sudo docker compose -f ./srcs/docker-compose.yml down -v --rmi all
	# cd srcs ; sudo docker compose down --rmi all
	# cd srcs ; sudo docker compose down docker-compose.yml -v --rmi all
	sudo docker system prune -af
	sudo docker volume prune
	sudo docker volume rm mariadb-volume wordpress-volume
	sudo docker rm -f $(sudo docker ps -aq)
	@echo "\\n\033[32;1mDeleting OK \033[0m \\n"

fclean: clean
	@echo "\\n\033[38;5;202;1mCLEANING ALL... \033[0m \\n"
	sudo rm -rf /home/gmary/data
	@echo "\\n\033[32;1mOK \033[0m \\n"

start:
	@echo "\\n\033[38;5;202;1mSTART\033[0m \\n"
	sudo docker compose -f ./srcs/docker-compose.yml start

stop:
	@echo "\\n\033[38;5;202;1mSTOP\033[0m \\n"
	sudo docker compose ./srcs/docker-compose.yml stop

re: fclean all

# .SILENT:
