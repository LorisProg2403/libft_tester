ROOT=..

STRCHR=tests-files/str/chr
CHR=chr
STRCMP=tests-files/str/cmp
CMP=cmp
STRDUP=tests-files/str/dup
DUP=dup
STRITERI=tests-files/str/iteri
ITERI=iteri
STRJOIN=tests-files/str/join
JOIN=join
STRLCAT=tests-files/str/lcat
LCAT=lcat
STRLCPY=tests-files/str/lcpy
LCPY=lcpy
STRLEN=tests-files/str/len
LEN=len
STRMAPI=tests-files/str/mapi
MAPI=mapi
STRNCAT=tests-files/str/ncat
NCAT=ncat
STRNCMP=tests-files/str/ncmp
NCMP=ncmp
STRNEW=tests-files/str/new
NEW=new
STRNSTR=tests-files/str/nstr
NSTR=nstr
STRRCHR=tests-files/str/rchr
RCHR=rchr
STRSUBSTR=tests-files/str/substr
SUBSTR=substr
STRTRIM=tests-files/str/trim
TRIM=trim

TIME_LIMIT=1000

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
PURPLE='\033[0;34m'
YELLOW='\033[0;33m'
NOCOLOR='\033[0m'

printf "\n${CYAN}╔══════════════════════════════════════════════════════════════════════════════╗${NOCOLOR}\n"
printf "${CYAN}║                           ${PURPLE}Welcome to LIBFT testers${CYAN}                           ║${NOCOLOR}\n"  #54 / 2 = 27 123456789012345678901234567
printf "${CYAN}╚═══════════════════════╦══════════════════════════════╦═══════════════════════╝${NOCOLOR}\n"
printf "${CYAN}                        ║            ${YELLOW}FT_STR${CYAN}            ║${NOCOLOR}\n"
printf "${CYAN}                        ╚══════════════════════════════╝${NOCOLOR}\n\n"

make -C $ROOT

if [[ -f "$ROOT/libft.a" ]]
then
	printf "${GREEN}\xE2\x9C\x94 Libft compilation OK${NOCOLOR}\n\n"
else
	printf "${RED}\xE2\x9D\x8C Libft compilation KO${NOCOLOR}\n\n"
	exit 1
fi

tests() {
	local DIR=$1
	local exec=$2
	local n=$3

	make -C $DIR
	for ((i=1;i<=$n;i++));
	do
		($DIR/$exec $(cat $DIR/test$i.txt) > stdout) & pid=$!
		(sleep $TIME_LIMIT && kill -HUP $pid) 2>/dev/null & watcher=$!
		wait $pid 2>/dev/null;
		(leaks -atExit -- $DIR/$exec $(cat $DIR/test$i.txt) 1>a 2>b) & pid=$!
		(sleep $TIME_LIMIT && kill -HUP $pid) 2>/dev/null & watcher=$!
		wait $pid 2>/dev/null;
		grep ": 0 leaks for 0 total leaked bytes" a > x
		grep "not found" b > y
		if [[ ! -s x ]]
		then
			printf "${RED}[LEAKS] ${NOCOLOR}"
		elif [[ $(cat stdout) = "OK" ]]
		then
			printf "${GREEN}[OK] ${NOCOLOR}"
		else
			printf "${RED}[KO] ${NOCOLOR}"
		fi
		rm -rf  stdout a b x y
	done
	make fclean -C $DIR
}

printf "FT_STRCHR : "
tests $STRCHR $CHR 3
printf "\n"
printf "FT_STRCMP : "
#tests $STRCMP $CMP 5
printf "\n"
printf "FT_STRDUP : "
#tests $STRDUP $DUP 5
printf "\n"
printf "FT_STRITERI : "
#tests $STRITERI $ITERI 5
printf "\n"
printf "FT_STRJOIN : "
#tests $STRJOIN $JOIN 5
printf "\n"
printf "FT_STRLCAT : "
#tests $STRLCAT $LCAT 5
printf "\n"
printf "FT_STRLCPY : "
#tests $STRLCPY $LCPY 5
printf "\n"
printf "FT_STRLEN : "
#tests $STRLEN $LEN 5
printf "\n"
printf "FT_STRMAPI : "
#tests $STRMAPI $MAPI 5
printf "\n"
printf "FT_STRNCAT : "
#tests $STRNCAT $NCAT 5
printf "\n"
printf "FT_STRNCMP : "
#tests $STRNCMP $NCMP 5
printf "\n"
printf "FT_STRNEW : "
#tests $STRNEW $NEW 5
printf "\n"
printf "FT_STRNSTR : "
#tests $STRNSTR $NSTR 5
printf "\n"
printf "FT_STRRCHR : "
#tests $STRRCHR $RCHR 5
printf "\n"
printf "FT_SUBSTR : "
#tests $STRSUBSTR $SUBSTR 5
printf "\n"
printf "FT_STRTRIM : "
#tests $STRTRIM $TRIM 5
printf "\n"

make fclean -C $ROOT
