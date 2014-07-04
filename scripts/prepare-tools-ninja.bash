#!/dev/null

if ! test "${#}" -eq 0 ; then
	echo "[ee] invalid arguments; aborting!" >&2
	exit 1
fi

echo "[ii] building \`ninja\` (Ninja build tool)..." >&2

if test -e "${_tools}/bin/ninja" ; then
	echo "[ii] \`ninja\` executable already exists; aborting!" >&2
	echo "[ii] (to force the build remove the file \`${_tools}/bin/ninja\`)" >&2
	exit 0
fi

_outputs="${_temporary}/ninja--build"
_repository="${_repositories}/ninja"

echo "[ii] preparing..." >&2

mkdir -- "${_outputs}"
cd -- "${_repository}"
find . -not -name '.git' -print0 | cpio -p -0 --quiet -- "${_outputs}"
chmod -R a=rX,u=rwX -- "${_outputs}"
cd -- "${_outputs}"

_CFLAGS="${pallur_CFLAGS}"
_LDFLAGS="-static ${pallur_LDFLAGS}"
_LIBS="${pallur_LIBS}"

echo "[ii] building..." >&2

(
	export PATH="${_PATH}" CFLAGS="${_CFLAGS}" LDFLAGS="${_LDFLAGS}" LIBS="${_LIBS}"
	./bootstrap.sh || exit 1
	exit 0
) 2>&1 \
| sed -u -r -e 's!^.*$![  ] &!g' >&2

echo "[ii] deploying..." >&2

mkdir -- "${_tools}/pkg/ninja"
mkdir -- "${_tools}/pkg/ninja/bin"

cp -T -- "./ninja" "${_tools}/pkg/ninja/bin/ninja"

ln -s -T -- "${_tools}/pkg/ninja/bin/ninja" "${_tools}/bin/ninja"

echo "[ii] sealing..." >&2

chmod -R a=rX -- "${_tools}/pkg/ninja"

echo "[ii] cleaning..." >&2

rm -R -- "${_outputs}"

exit 0
