DATA_FILE="mydata.txt"

if [ $# -eq 0 ]; then
	echo "Usage: phone searchfor [...searchfor]"
	echo "(You didn't tell me what you want to search for.)"
	exit 1
fi

tmp="temp.txt"

filtered="($1"
shift

for arg in "$@"
do
	filtered+="|$arg"
done

filtered+=")"

egrep "$filtered"  "$DATA_FILE" > "$tmp"

if [ -s "$tmp" ]; then
	awk -f display.awk "$tmp"
fi


 

