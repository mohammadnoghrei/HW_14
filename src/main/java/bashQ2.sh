
function greet_user() {
    touch a.txt b.txt c.txt d.txt
    echo "create files"
}

function add_word() {

    echo "hello world" > a.txt
    echo "hello world" > b.txt
    echo "hello world" > c.txt
    echo "hello world" > d.txt
    echo "add words to files"
}


function set_word() {

    sed -i -e 's/hello/bash' a.txt
    sed -i -e 's/hello/bash' b.txt
    sed -i -e 's/hello/bash' c.txt
    sed -i -e 's/hello/bash' d.txt
    echo "change word"
}

# Call the function with an argument



# Call the function with an argument
PS3="please choose a number:"
select word in "create file" "add_word" "set_word"
do
	$word
	break
done


# Output:
# Hello, Anton!