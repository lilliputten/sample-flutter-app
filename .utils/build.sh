#!/bin/sh
# @desc Create/update version tag (from build folder)
# @changed 2024.12.27, 17:29

scriptsPath=$(dirname "$(echo "$0" | sed -e 's,\\,/,g')")
rootPath=`dirname "$scriptsPath"`
prjPath="$rootPath" # `pwd`

# Import config variables (expected variable `$PUBLISH_FOLDER`)...
test -f "$scriptsPath/config.sh" && . "$scriptsPath/config.sh"
test -f "$scriptsPath/config-local.sh" && . "$scriptsPath/config-local.sh"

# Check basic required variables...
test -f "$rootPath/config-check.sh" && . "$rootPath/config-check.sh"

PROJECT_INFO=`cat "$rootPath/$PROJECT_INFO_FILE"`
APP_ID=`cat "$rootPath/$APP_ID_FILE"`
VERSION_PATH="$rootPath/${VERSION_FILE}"
VERSION=`cat "$VERSION_PATH"`
TIMESTAMP=`date -r "$VERSION_PATH" "+%Y.%m.%d %H:%M:%S %z"`
TIMETAG=`date -r "$VERSION_PATH" "+%y%m%d-%H%M"`

echo "Generating build $PROJECT_INFO..."

  # --build-number=$VERSION \
flutter build apk \
  --build-name==$VERSION \
  --dart-define-from-file=.env \
  && echo "OK"

