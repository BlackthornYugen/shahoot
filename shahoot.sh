#!/usr/bin/env bash
start_time=$(date +%s)

shopt -s nocasematch
QUESTION_TIME=10

score() {
    if [[ "$ANSWER" =~ $1  ]]; then 
        printf "That's correct! "
        POINTS="$((QUESTION_TIME - (end_time - start_time) ))"
    else
        printf "That's incorrect. "
        POINTS=0
    fi
    SCORE=$((POINTS + SCORE))
    printf "%d points!\n\n" $POINTS
}

for question in quiz1/*.question ; do
    cat "$question"

    start_time=$(date +%s)
    read -r -t $QUESTION_TIME ANSWER
    end_time="$(date +%s)"

    score "$(cat "${question%%.question}.answer")"
done

echo $SCORE