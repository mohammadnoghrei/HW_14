
function creat_files() {
    touch 1.txt 2.txt 3.txt 4.txt
    echo "create files"
}

function add_word() {

    for i in {1..4}; do
    echo "hello world" > $i.txt
    done
    echo "add word"
}


function set_word() {

    for i in {1..4}; do
        sed -i -e 's/hello/bash/g' $i.txt
        done
    echo "change word"
}


PS3="please choose a number:"
select word in "creat_files" "add_word" "set_word"
do
	$word
	break
done


