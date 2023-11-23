ROOT=..

NOK=0
NT=0

CHECK="OK"
CHECKIS="OK"
CHECKSTR="OK"

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
printf "${CYAN}                        ║             ${YELLOW}LIBFT${CYAN}            ║${NOCOLOR}\n"
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
			CHECK="KO"
		elif [[ $(cat stdout) = "OK" ]]
		then
			printf "${GREEN}[OK] ${NOCOLOR}"
			((NOK++))
		else
			printf "${RED}[KO] ${NOCOLOR}"
			CHECK="KO"
		fi
		rm -rf  stdout a b x y
		((NT++))
	done
	make fclean -C $DIR
}

isok() {
	txt=$1
	c=$2
	if [[ $c = "OK" ]]
	then
		printf "${GREEN}\xE2\x9C\x94 $txt ${NOCOLOR}"
	else
		printf "${RED}\xE2\x9D\x8C $txt ${NOCOLOR}"
	fi
}

endtest() {
	local n=$(printf "%.0f" "$(echo "scale=2; ($NOK / $NT) * 100" | bc)")
	if [[ $n -gt 49 ]]
	then
		printf "\n${GREEN}$n / 100 ${NOCOLOR}\n"
	else
		printf "\n${RED}$n / 100 ${NOCOLOR}\n"
	fi
}
#FT_IS
printf "${PURPLE}FT_IS : ${NOCOLOR}\n\n"

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
printf "\n\n\n"
if [[ $CHECK = "OK" ]]
then
	CHECKIS="OK"
else
	CHECKIS="KO"
fi
CHECK="OK"

#FT_STR
printf "${PURPLE}FT_STR : ${NOCOLOR}\n\n"

printf "FT_STRCHR : "
tests $STRCHR $CHR 3
printf "\n\n\n"
if [[ $CHECK = "OK" ]]
then
	CHECKSTR="OK"
else
	CHECKSTR="KO"
fi
CHECK="OK"

isok "FT_IS" $CHECKIS
isok "FT_STR" $CHECKSTR
printf "\n"

endtest

make fclean -C $ROOT
