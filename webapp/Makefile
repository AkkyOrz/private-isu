
DATE=$(shell date +%Y%m%d%H%M)


all: alp-analyze slowquery-analyze

alp-analyze:
	cat log/nginx/access.log | alp json --sort sum --reverse -m '/image/\d+','/@+'| tee log/nginx/digest.log.$(DATE)

slowquery-analyze:
	pt-query-digest log/mysql/mysql-slow.log | tee log/mysql/digest.log.$(DATE)

