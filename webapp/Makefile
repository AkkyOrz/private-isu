
DATE=$(shell date +%Y%m%d%H%M)


all: alp-analyze slowquery-analyze

rotate: rotate-nginx rotate-mysql
	@echo "Rotating logs"


alp-analyze:
	cat log/nginx/access.log | alp json --sort sum --reverse -m '/image/\d+','/@+','/posts/\d+'| tee log/nginx/digest.log.$(DATE)

slowquery-analyze:
	pt-query-digest log/mysql/mysql-slow.log | tee log/mysql/digest.log.$(DATE)

rotate-nginx:
	@echo "Rotating nginx logs"
	mv log/nginx/access.log log/nginx/access.log.$(DATE) | :
	docker compose exec nginx nginx -s reopen

rotate-mysql:
	@echo "Rotating mysql logs"
	mv log/mysql/mysql-slow.log log/mysql/mysql-slow.log.$(DATE) | :
	sudo touch log/mysql/mysql-slow.log
	sudo chmod 777  log/mysql/mysql-slow.log
	docker compose exec mysql mysqladmin flush-logs -uroot -p
