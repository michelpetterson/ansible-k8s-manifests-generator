#!/bin/bash
set -x
userId=$(echo ${ownerName,,} | sed 's/ /-/g')

ansible-playbook ~/ansible-k8s-manifests/k8s_manifests_generator.yaml \
   -e _APP_="${JOB_NAME}" -e _ImageName_="${imageName}" -e _VOLUME_="${persistentVolume}" \
   -e _MOUNT_PATH_="${mountPath}" -e _PORT_="${servicePort}" -e _OWNER_=\""${ownerName}"\" \
   -e _USERID_="${userId}" -e _SERVICE_="${serviceType}" -e _PHONE_NUMBER_=\""${telephoneNumber}"\" \
&& kubectl apply -k ~/ansible-k8s-manifests/manifests/"${JOB_NAME}" && rm -rf ~/manifests/"${JOB_NAME}"/*.yaml
