pushd ~/devel/operator-sdk

make image-base/ansible-operator-2.11-preview BUILD_IMAGE_REPO=quay.io/amacdona
docker push quay.io/amacdona/ansible-operator-2.11-preview-base:dev
#
make image/ansible-operator-2.11-preview BUILD_IMAGE_REPO=quay.io/amacdona
docker push quay.io/amacdona/ansible-operator-2.11-preview:dev
popd
