if [[ "$HOSTTYPE" == "laptop" ]]; then
    # --- Build a cacert.pem trust store ---
    [[ ! -d ~/certificates ]] && mkdir -p ~/certificates
    [[ -f ~/certificates/LASTUPDATE ]] && LASTUPDATE=$(cat ~/certificates/LASTUPDATE) || LASTUPDATE=""
    TODAY=$(date +%Y-%m-%d)

    if [[ ${UPDATECABUNDLE} -eq 1 || "${LASTUPDATE}" != "${TODAY}" ]]; then
    echo "Generating a fresh ~/certificates/cacert.pem file..."
    SYSTEMROOTCERTS=$(security export -t certs -f pemseq -k /System/Library/Keychains/SystemRootCertificates.keychain)
    SYSTEMCERTS=$(security export -t certs -f pemseq -k /Library/Keychains/System.keychain)
    echo -e "${SYSTEMROOTCERTS}\n${SYSTEMCERTS}" > ~/certificates/cacert.pem
    echo "${TODAY}" > ~/certificates/LASTUPDATE
    fi

    # --- Export environment variables for the trust store ---
    CACERT=${HOME}/certificates/cacert.pem
    if [[ ${NOCABUNDLE} -eq 0 ]]; then
    export AWS_CA_BUNDLE=${CACERT}
    export REQUESTS_CA_BUNDLE=${CACERT}
    export NODE_EXTRA_CA_CERTS=${CACERT}
    export CURL_CA_BUNDLE=${CACERT}
    export SSL_CERT_FILE=${CACERT}
    export JAVA_TOOL_OPTIONS="-Djavax.net.ssl.trustStoreType=KeychainStore"
    fi

    # Display values of set environment variables
    [[ ${QUIET} -eq 0 ]] && for var in $(env | sort | grep -e proxy -e "${CACERT}" -e "JAVA_TOOL_OPTIONS" | cut -d= -f1); do printf "%-20s = $(printenv $var)\n" $var ; done
fi
