rainbow () {
    for ((b=0; $b < 8; b++)) do
        echo -ne "$b \e[4${b}m"
        for ((f=0; $f < 8; f++)) do
            echo -ne "\e[3${f}m$f"
        done
        echo -ne "\e[0m   \e[4$b;1m"
        for ((f=0; $f < 8; f++)) do
            echo -ne "\e[3${f}m$f"
        done
        echo -e "\e[0m"
    done
}
