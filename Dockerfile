FROM quay.io/amacdona/ansible-operator-2.11-preview:dev
COPY requirements.yml ${HOME}/requirements.yml


RUN ansible-galaxy --version
RUN ansible --version

RUN ansible-galaxy collection install -r ${HOME}/requirements.yml -vvv\
 && chmod -R ug+rwx ${HOME}/.ansible

COPY watches.yaml ${HOME}/watches.yaml
COPY roles/ ${HOME}/roles/
COPY playbooks/ ${HOME}/playbooks/
