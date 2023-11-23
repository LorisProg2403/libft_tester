ROOT=..

ISPRINT=tests-files/is/print
PRINT=print

ISDIGIT=tests-files/is/digit
DIGIT=digit

ISALPHA=tests-files/is/alpha
ALPHA=alpha

ISALNUM=tests-files/is/alnum
ALNUM=alnum

ISASCII=tests-files/is/ascii
ASCII=ascii

ISSIGN=tests-files/is/sign
SIGN=sign

ISSPACE=tests-files/is/space
SPACE=space

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
printf "${CYAN}                        ║             ${YELLOW}FT_IS${CYAN}            ║${NOCOLOR}\n"
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

printf "FT_ISPRINT : "
tests $ISPRINT $PRINT 5
printf "\n"

printf "FT_ISDIGIT : "
tests $ISDIGIT $DIGIT 11
printf "\n"

printf "FT_ISALPHA : "
tests $ISALPHA $ALPHA 3
printf "\n"

printf "FT_ISALNUM : "
tests $ISALNUM $ALNUM 3
printf "\n"

printf "FT_ISASCII : "
tests $ISASCII $ASCII 3
printf "\n"

printf "FT_ISSIGN  : "
tests $ISSIGN $SIGN 3
printf "\n"

printf "FT_ISSPACE : "
tests $ISSPACE $SPACE 7
printf "\n"

make fclean -C $ROOT
