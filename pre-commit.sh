#!/usr/bin/env bash

# Please symlink this to your ,git/hooks/ directory

# Check JS
FILES_PATTERN='\.(js|coffee)(\..+)?$'
FORBIDDEN='console.log'
git diff --cached --name-only | \
	grep -E $FILES_PATTERN | \
	GREP_COLOR='4;5;37;41' xargs grep --color --with-filename -n $FORBIDDEN && echo 'COMMIT REJECTED Found "console.log" references in your javascript. Please remove them before commiting' && exit 1

exit 0

