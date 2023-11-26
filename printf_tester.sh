ROOT=..

PCHAR=tests-files/printf/char
CHAR=char


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
printf "${CYAN}                        ║            ${YELLOW}PRINTF${CYAN}            ║${NOCOLOR}\n"
printf "${CYAN}                        ╚══════════════════════════════╝${NOCOLOR}\n\n"

make -C $ROOT

if [[ -f "$ROOT/libft.a" ]]
then
	printf "${GREEN}\xE2\x9C\x94 Libft compilation OK${NOCOLOR}\n\n"
else
	printf "${RED}\xE2\x9D\x8C Libft compilation KO${NOCOLOR}\n\n"
	exit 1
fi

print_tests() {
	local DIR=$1
	local exec=$2
	local n=$3

	make -C $DIR
	for ((i=1;i<=$n;i++));
	do
		#($DIR/$exec $(cat $DIR/test$i.txt) > stdout) & pid=$!
		#local out1=$($DIR/$exec $(cat $DIR/test$i.txt)) & pid=$!
		local out1=$($DIR/$exec) & pid=$!
		(sleep $TIME_LIMIT && kill -HUP $pid) 2>/dev/null & watcher=$!
		wait $pid 2>/dev/null;
		#local out2=$($DIR/print $(cat $DIR/test$i.txt)) & pid=$!
		local out2=$($DIR/print) & pid=$!
		(sleep $TIME_LIMIT && kill -HUP $pid) 2>/dev/null & watcher=$!
		wait $pid 2>/dev/null;
		#(sleep $TIME_LIMIT && kill -HUP $pid) 2>/dev/null & watcher=$!
		#($DIR/print $(cat $DIR/test$i.txt) > stdout2) & pid=$!
		#(sleep $TIME_LIMIT && kill -HUP $pid) 2>/dev/null & watcher=$!
		#wait $pid 2>/dev/null;
		#printf "\n$stdout fprint \n"
		#printf "\n$stdout2 print \n"
		difference=$(diff <(echo "$out1") <(echo "$out2"))
		if  [ -z "$difference" ]
		then
			printf "${GREEN}[OK] ${NOCOLOR}"
		else
			printf "${RED}[KO] ${NOCOLOR}"
		fi
		rm -rf  out1 out2
	done
	make fclean -C $DIR
}

printf "FT_PRINTF_CHAR : "
print_tests $PCHAR $CHAR 3
printf "\n"

make fclean -C $ROOT
