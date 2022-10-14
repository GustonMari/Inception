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

$(NAME):
	mkdir -p /home/gmary/data
	sudo docker compose -f /srcs/requirements/docker-compose.yml up -d
	@echo "\\n\033[32;1mCOMPILATION OK \033[0m \\n"

clean:
	@echo "\\n\033[38;5;202;1mDeleting Objects... \033[0m \\n"
	sudo docker compose -f /srcs/requirements/docker-compose.yml down
	# cd /srcs/requirements/ ; sudo docker compose down docker-compose.yml
	sudo docker system prune -af
	sudo docker volume prune
	@echo "\\n\033[32;1mDeleting OK \033[0m \\n"

fclean: clean
	@echo "\\n\033[38;5;202;1mCLEANING ALL... \033[0m \\n"
	rm -rf /home/gmary/data
	@echo "\\n\033[32;1mOK \033[0m \\n"

start:
	@echo "\\n\033[38;5;202;1mSTART\033[0m \\n"
	sudo docker compose -f /srcs/requirements/docker-compose.yml start

stop:
	@echo "\\n\033[38;5;202;1mSTOP\033[0m \\n"
	sudo docker compose /srcs/requirements/docker-compose.yml stop

re: fclean all

.SILENT:
