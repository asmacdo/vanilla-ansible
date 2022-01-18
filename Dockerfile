FROM quay.io/operator-framework/ansible-operator-2.11-preview:v1.16
COPY requirements.yml ${HOME}/requirements.yml

USER root

RUN dnf install -y git

USER ${USER_UID}


RUN ansible-galaxy --version
RUN ansible --version

RUN chmod -R ug+rwx ${HOME}/.ansible
RUN ansible-galaxy collection install -r ${HOME}/requirements.yml -vvv

COPY watches.yaml ${HOME}/watches.yaml
COPY roles/ ${HOME}/roles/ 
COPY playbooks/ ${HOME}/playbooks/
