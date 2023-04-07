#!/usr/bin/env bash
start_time=$(date +%s)

shopt -s nocasematch
QUESTION_TIME=10

score() {
    if [[ "$ANSWER" =~ $1  ]]; then 
        msg_prefix="That's correct!"
        points="$((QUESTION_TIME - (end_time - start_time) ))"
    else
        msg_prefix="That's incorrect."
        points=0
    fi
    SCORE=$((POINTS + SCORE))
    printf "%s %d points!\n\n" "$msg_prefix" "$points"
}

for question in quiz1/*.question ; do
    cat "$question"

    start_time=$(date +%s)
    printf "\nANSWER: "
    read -r -t $QUESTION_TIME ANSWER
    end_time="$(date +%s)"

    score "$(cat "${question%%.question}.answer")"
done

echo $SCORE