#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

TEMPLATE_NAME=$1

function relative_path() {
    local SOURCE_FILE="${BASH_SOURCE[1]:-${BASH_SOURCE[0]}}"
    local SCRIPT_DIR="$(cd "$(dirname "$SOURCE_FILE")" && pwd)"   

    echo "$(readlink -f "$SCRIPT_DIR/$1")"
}

function usage_msg() {
        cat << EOF
Usage: $0 <template-name> [templates-file-path]

Description:
    Install a template from a JSON template file.

Example:
    $0 dev-template-dotnet
    $0 dev-template-dotnet ../templates.json
EOF
    exit 1
}

FULL_PATH_TO_FILE=$(relative_path "../templates.json")

if [ ! -f "$FULL_PATH_TO_FILE" ]; then
    echo -e "${RED}Error:${NC} Template file not found."
    echo -e "  ${BLUE}Searched at:${NC} $FULL_PATH_TO_FILE"
    echo
    echo -e "${YELLOW}How to fix:${NC}"
    echo "  Please specify the path to the template file manually as the second argument."
    echo
    echo -e "${GREEN}Example:${NC}"
    # $0 is the script, $1 is the TEMPLATE name that the user has already entered.
    echo "  $0 ${1:-<template-name>} ../path/to/templates.json"
    echo
    exit 1
fi
if [ -z "$TEMPLATE_NAME" ]; then
    usage_msg
    exit 1
fi

echo "Searching for template: $TEMPLATE_NAME"

TEMPLATE=$(cat $FULL_PATH_TO_FILE | grep -A 3 "\"name\": \"$TEMPLATE_NAME\"")

if [ -z "$TEMPLATE" ]; then
  echo -e "${RED}Template not found.${NC}"
  exit 1
fi

REPO=$(cat $FULL_PATH_TO_FILE | grep -A 3 "\"name\": \"$TEMPLATE_NAME\"" | grep repo | cut -d '"' -f4)

if [ -z "$REPO" ]; then
  echo -e "${RED}Template ${TEMPLATE_NAME} does not have a registered repository..${NC}"
  exit 1
fi

echo "Cloning $REPO..."

git clone https://github.com/$REPO.git $TEMPLATE_NAME

echo "Done."