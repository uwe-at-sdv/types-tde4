#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE_DIR="${SCRIPT_DIR}"
PACKAGE_DIR="$SCRIPT_DIR/.."

TARGET=""

usage()
{
	echo "Usage: $0 {github,pypi}"
}

if [[ $# -eq 0 ]]; then
	usage
	exit 1
fi
while [[ $# -gt 0 ]]; do
	case "$1" in
		github)
			TARGET="GITHUB"
			shift
			;;
		pypi)
			TARGET="PYPI"
			shift
			;;
		-h|--help)
			usage
			exit 0
			;;
		*)
			usage
			echo "Unknown option: $1"
			exit 1
			;;
	esac
done

echo "TARGET: ${TARGET}"

VERSION=$(awk -F '"' '/^version = / { print $2; exit }' "${PACKAGE_DIR}/pyproject.toml")
if [[ -z "${VERSION}" ]]; then
	echo "Could not read project version from ${PACKAGE_DIR}/pyproject.toml"
	exit 1
fi
echo "Version: ${VERSION}"

README_COMMON=$(cat "${TEMPLATE_DIR}/README_COMMON.template.md")
README_BADGES_COMMON=$(cat "${TEMPLATE_DIR}/README_BADGES_COMMON.template.md")
README_BADGES_PYPI=$(cat "${TEMPLATE_DIR}/README_BADGES_PYPI.template.md")
README_BADGES_GITHUB=$(cat "${TEMPLATE_DIR}/README_BADGES_GITHUB.template.md")
README_LOGO_PYPI=$(cat "${TEMPLATE_DIR}/README_LOGO_PYPI.template.md")
README_LOGO_GITHUB=$(cat "${TEMPLATE_DIR}/README_LOGO_GITHUB.template.md")
README_PYPI=$(cat "${TEMPLATE_DIR}/README_PYPI.template.md")
README_GITHUB=$(cat "${TEMPLATE_DIR}/README_GITHUB.template.md")

README_BADGES_PYPI=${README_BADGES_PYPI//_VERSION_/${VERSION}}
README_BADGES_GITHUB=${README_BADGES_GITHUB//_VERSION_/${VERSION}}

README_BADGES_PYPI=${README_BADGES_PYPI//_COMMON_/${README_BADGES_COMMON}}
README_BADGES_GITHUB=${README_BADGES_GITHUB//_COMMON_/${README_BADGES_COMMON}}

README_PYPI=${README_PYPI//_BADGES_/${README_BADGES_PYPI}}
README_PYPI=${README_PYPI//_LOGO_/${README_LOGO_PYPI}}
README_PYPI=${README_PYPI//_COMMON_/${README_COMMON}}

README_GITHUB=${README_GITHUB//_BADGES_/${README_BADGES_GITHUB}}
README_GITHUB=${README_GITHUB//_LOGO_/${README_LOGO_GITHUB}}
README_GITHUB=${README_GITHUB//_COMMON_/${README_COMMON}}


if [ "${TARGET}" == "GITHUB" ]; then 
	printf "%s\n" "$README_GITHUB" > "${PACKAGE_DIR}/README.md"
fi
if [ "${TARGET}" == "PYPI" ]; then
	printf "%s\n" "$README_PYPI" > "${PACKAGE_DIR}/README.md"
fi
