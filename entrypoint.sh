#!/usr/bin/env sh

HUGO=/usr/bin/hugo
HUGO_RELOAD_SECONDS=60

echo "HUGO_BASEURL" $HUGO_BASEURL
echo "HUGO_RELOAD_SECONDS:" $HUGO_RELOAD_SECONDS
echo "HUGO_THEME:" $HUGO_THEME
echo "ARGS" $@

while [ true ]
do
    $HUGO server --watch=true --source="/src" --theme="$HUGO_THEME" --destination="/destination" --baseUrl="$HUGO_BASEURL" --bind="0.0.0.0" "$@" || exit 1

    echo "Waiting for $HUGO_RELOAD_SECONDS seconds ..."
    sleep $HUGO_RELOAD_SECONDS
done
