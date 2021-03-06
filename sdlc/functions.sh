# shellcheck shell=bash
export BUNDLE_PATH="${HOME}/.bundle"

PYTHON_USER_BASE="$(python3 -c "import site; print(site.USER_BASE)")"
readonly PYTHON_USER_BASE

if ! grep "${PYTHON_USER_BASE}/bin" <(printenv PATH) &>/dev/null; then
    export PATH="${PATH}:${PYTHON_USER_BASE}/bin"
fi

VERSION="$(ruby -e 'load "src/lib/octool/version.rb"; print OCTool::VERSION')"
echo "VERSION is ${VERSION}"

VCS_REF="$(git describe --dirty --tags --always --abbrev=7)"
export VCS_REF
echo "VCS_REF is ${VCS_REF}"
