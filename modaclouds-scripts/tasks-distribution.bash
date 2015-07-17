#!/dev/null

if ! test "${#}" -eq 0 ; then
	echo "[ee] invalid arguments; aborting!" >&2
	exit 1
fi

for _task in requisites prepare compile package publish ; do
	cat <<EOS

modaclouds-distribution@${_task} : \
		modaclouds-distribution@all@${_task}

modaclouds-distribution@all@${_task} : \
		modaclouds-distribution@node@${_task} \
		modaclouds-distribution@components@${_task} \
		modaclouds-distribution@services@${_task} \
		modaclouds-distribution@tools@${_task} \

modaclouds-distribution@node@${_task} : \
		mosaic-node@${_task} \
		mosaic-node-wui@${_task} \
		mosaic-node-boot@${_task} \

modaclouds-distribution@components@${_task} : \
		modaclouds-components-fg-analyzer@${_task} \
		modaclouds-components-fg-local-db@${_task} \
		modaclouds-components-fuseki@${_task} \
		modaclouds-components-load-balancer-controller@${_task} \
		modaclouds-components-load-balancer-reasoner@${_task} \
		modaclouds-components-metric-explorer@${_task} \
		modaclouds-components-metric-importer@${_task} \
		modaclouds-components-models-at-runtime@${_task} \
		modaclouds-components-monitoring-dda@${_task} \
		modaclouds-components-monitoring-history-db@${_task} \
		modaclouds-components-monitoring-manager@${_task} \
		modaclouds-components-monitoring-sda-matlab@${_task} \
		modaclouds-components-monitoring-sda-weka@${_task} \
		modaclouds-components-sla-core@${_task} \
		mosaic-components-mysql@${_task} \
		mosaic-components-rabbitmq@${_task} \
		mosaic-object-store@${_task} \

modaclouds-distribution@services@${_task} :

modaclouds-distribution@tools@${_task} :

EOS
done

exit 0
