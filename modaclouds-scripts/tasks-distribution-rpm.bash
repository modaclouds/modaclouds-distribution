#!/dev/null

if ! test "${#}" -eq 0 ; then
	echo "[ee] invalid arguments; aborting!" >&2
	exit 1
fi

for _task in requisites prepare package publish ; do
	cat <<EOS

modaclouds-distribution@${_task} : \
		modaclouds-distribution@all-rpm@${_task}

modaclouds-distribution@all-rpm@${_task} : \
		modaclouds-distribution@node-rpm@${_task} \
		modaclouds-distribution@components-rpm@${_task} \
		modaclouds-distribution@services-rpm@${_task} \
		modaclouds-distribution@tools-rpm@${_task} \

modaclouds-distribution@node-rpm@${_task} : \
		mosaic-node-rpm@${_task} \
		mosaic-node-wui-rpm@${_task} \

modaclouds-distribution@components-rpm@${_task} : \
		modaclouds-platform-components-rpm@${_task} \
		modaclouds-components-fuseki-rpm@${_task} \
		modaclouds-components-load-balancer-controller-rpm@${_task} \
		modaclouds-components-load-balancer-reasoner-rpm@${_task} \
		modaclouds-components-metric-explorer-rpm@${_task} \
		modaclouds-components-metric-importer-rpm@${_task} \
		modaclouds-components-monitoring-sda-matlab-rpm@${_task} \
		modaclouds-components-monitoring-sda-weka-rpm@${_task} \
		mosaic-components-couchdb-rpm@${_task} \
		mosaic-components-me2cp-rpm@${_task} \
		mosaic-components-mysql-rpm@${_task} \
		mosaic-components-rabbitmq-rpm@${_task} \
		mosaic-components-riak-kv-rpm@${_task} \
		mosaic-object-store-rpm@${_task} \

modaclouds-distribution@services-rpm@${_task} : \
		modaclouds-platform-services-rpm@${_task} \
		modaclouds-services-fg-analyzer-rpm@${_task} \
		modaclouds-services-fg-local-db-rpm@${_task} \
		modaclouds-services-fuseki-rpm@${_task} \
		modaclouds-services-load-balancer-controller-rpm@${_task} \
		modaclouds-services-load-balancer-reasoner-rpm@${_task} \
		modaclouds-services-metric-explorer-rpm@${_task} \
		modaclouds-services-metric-importer-rpm@${_task} \
		modaclouds-services-models-at-runtime-rpm@${_task} \
		modaclouds-services-monitoring-sda-matlab-rpm@${_task} \
		modaclouds-services-monitoring-sda-weka-rpm@${_task} \
		modaclouds-services-sla-core-rpm@${_task} \
		mosaic-object-store-rpm@${_task} \

modaclouds-distribution@tools-rpm@${_task} : \
		modaclouds-platform-tools-rpm@${_task} \
		modaclouds-tools-mdload-rpm@${_task} \

modaclouds-rpm@${_task} : \
		modaclouds-distribution@services-rpm@${_task} \
		modaclouds-distribution@tools-rpm@${_task} \

EOS
done

exit 0
