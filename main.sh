copy_files_main() {
  local APP="$1"
  local IMG="dokku/$APP"
  local DIR="/home/dokku/${APP}/copy-files"

  echo "-----> copying files from ${DIR}..."

  while read -rd $'\0' f ; do
    dirname=$(dirname "$f")
    target="${dirname#${DIR}}"

    echo "-----> moving ${f} to ${f#${DIR}}"

    id=$(docker run -i -a stdin "$IMG" /bin/bash -c "mkdir -p "$target" && cat > ${f#${DIR}}" < "$f")
    # docker attach "$id"
    test "$(docker wait "$id")" -eq 0
    docker commit "$id" "$IMG" > /dev/null
  done < <(find "$DIR" -type f -print0)
}