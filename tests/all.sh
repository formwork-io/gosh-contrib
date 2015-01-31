#!/usr/bin/env bash
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export TOP_DIR="$DIR"/../
cd "$DIR" || exit 1

if [ ! -r "$TOP_DIR"/.gosh.sh ]; then
    # Install the latest go shell
    cd ..
    URL="https://raw.githubusercontent.com/formwork-io/gosh/latest/overlay.sh"
    wget --quiet --content-disposition "$URL" -O - | bash
    cd "$DIR" || exit 1
fi

export TOP_DIR="$DIR"/../
for test_script in *.sh; do
    if [ "$test_script" == "all.sh" ]; then
        continue
    fi
    ./"$test_script"
done

