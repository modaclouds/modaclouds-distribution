#!/dev/null

if ! test "${#}" -eq 0 ; then
	echo "[ee] invalid arguments; aborting!" >&2
	exit 1
fi

_modules=(
		
		modaclouds-components-platform-wrappers/modaclouds-components-fuseki
		
		modaclouds-components-platform-wrappers/modaclouds-components-monitoring-manager
		modaclouds-components-platform-wrappers/modaclouds-components-monitoring-dda
		modaclouds-components-platform-wrappers/modaclouds-components-monitoring-sda-matlab
		modaclouds-components-platform-wrappers/modaclouds-components-monitoring-sda-weka
		
		modaclouds-components-platform-wrappers/modaclouds-components-load-balancer-controller
		modaclouds-components-platform-wrappers/modaclouds-components-load-balancer-reasoner
		
		modaclouds-components-platform-wrappers/modaclouds-components-metric-explorer
		modaclouds-components-platform-wrappers/modaclouds-components-metric-importer
		
		modaclouds-mos-platform-packages
)

for _module in "${_modules[@]}" ; do
	_module="$( readlink -e -- "${_repositories}/${_module}" )"
	_do_exec1 "${_module}/scripts/tasks"
done

exit 0
