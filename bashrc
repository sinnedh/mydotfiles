## Utility functions used to include other configuration files:
try_to_source() {
    local file="${1}"

    [[ -f "${file}" && -r "${file}" ]] && . "${file}"
}

source_everything_in() {
    local dir="${1}"

    if [[ -d "${dir}" && -r "${dir}" && -x "${dir}" ]]; then
        for file in "${dir}"/*; do
           try_to_source "${file}"
        done
    fi
}

has() {
    hash "$@" &>/dev/null
}

# Include individual bash configuration files.
source_everything_in ~/.bashrc.d

export PATH=/Applications/Postgres.app/Contents/Versions/9.4/bin:/usr/lib:/usr/local/bin:/usr/local/sbin:$PATH
export PATH=/Users/dennishellmich/bin:$PATH
source /usr/local/bin/virtualenvwrapper.sh

export MY_OB_DEV_SETTINGS='myorderbird.conf.development'
export MY_OB_PROJECT_ROOT='/Users/dennishellmich/work/orderbird/dev/my.orderbird/django_project'
export MY_OB_VENV_NAME='my.orderbird'
