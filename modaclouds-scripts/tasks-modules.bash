#!/dev/null

if ! test "${#}" -eq 0 ; then
	echo "[ee] invalid arguments; aborting!" >&2
	exit 1
fi

_modules=(
		modaclouds-components-knowledgebase
		modaclouds-components-monitoring-manager
		modaclouds-components-monitoring-dda
		modaclouds-components-monitoring-sda-matlab
		modaclouds-components-monitoring-sda-weka
		modaclouds-mos-platform-packages
)

for _module in "${_modules[@]}" ; do
	_module="$( readlink -e -- "${_repositories}/${_module}" )"
	_do_exec1 "${_module}/scripts/tasks"
done

exit 0
