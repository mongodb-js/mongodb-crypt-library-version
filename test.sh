#!/bin/sh
set -e
set -x

rm -rf tmp
FAILED=''

if [ `node -p process.platform` = "linux" ]; then
  mkdir -p tmp && cd tmp && \
    curl -O "https://downloads.mongodb.com/linux/mongo_crypt_shared_v1-linux-x86_64-enterprise-rhel80-7.0.9.tgz" && \
    tar xvzf mongo_crypt_shared_v1-linux-x86_64-enterprise-rhel80-7.0.9.tgz && \
    ../bin/mongodb-crypt-library-version.js lib/mongo_crypt_v1.so > version && \
    cat version && \
    grep -Fq 'mongo_crypt_v1-dev-7.0.9 (0x0007000000090000)' version && \
  cd .. && rm -rf tmp || FAILED=1

  mkdir -p tmp && cd tmp && \
    curl -O "https://downloads.mongodb.com/linux/mongo_csfle_v1-linux-x86_64-enterprise-ubuntu2004-5.3.0-rc3.tgz" && \
    tar xvzf mongo_csfle_v1-linux-x86_64-enterprise-ubuntu2004-5.3.0-rc3.tgz && \
    ../bin/mongodb-crypt-library-version.js lib/mongo_csfle_v1.so > version && \
    cat version && \
    grep -Fq 'mongo_crypt_v1-unknown (0x0000000000000000)' version && \
  cd .. && rm -rf tmp || FAILED=1
fi

if [ `node -p process.platform` = "darwin" ]; then
  mkdir -p tmp && cd tmp && \
    curl -O "https://downloads.mongodb.com/osx/mongo_crypt_shared_v1-macos-x86_64-enterprise-7.0.9.tgz" && \
    tar xvzf mongo_crypt_shared_v1-macos-x86_64-enterprise-7.0.9.tgz && \
    ../bin/mongodb-crypt-library-version.js lib/mongo_crypt_v1.dylib > version && \
    cat version && \
    grep -Fq 'mongo_crypt_v1-dev-7.0.9 (0x0007000000090000)' version && \
  cd .. && rm -rf tmp || FAILED=1

  mkdir -p tmp && cd tmp && \
    curl -O "https://downloads.mongodb.com/osx/mongo_csfle_v1-macos-x86_64-enterprise-5.3.0-rc3.tgz" && \
    tar xvzf mongo_csfle_v1-macos-x86_64-enterprise-5.3.0-rc3.tgz && \
    ../bin/mongodb-crypt-library-version.js lib/mongo_csfle_v1.dylib > version && \
    cat version && \
    grep -Fq 'mongo_crypt_v1-unknown (0x0000000000000000)' version && \
  cd .. && rm -rf tmp || FAILED=1
fi

if [ `node -p process.platform` = "win32" ]; then
  mkdir -p tmp && cd tmp && \
    curl -O "https://downloads.mongodb.com/windows/mongo_crypt_shared_v1-windows-x86_64-enterprise-7.0.9.zip" && \
    unzip mongo_crypt_shared_v1-windows-x86_64-enterprise-7.0.9.zip && \
    ../bin/mongodb-crypt-library-version.js bin/mongo_crypt_v1.dll > version && \
    cat version && \
    grep -Fq 'mongo_crypt_v1-dev-7.0.9 (0x0007000000090000)' version && \
  cd .. && rm -rf tmp || FAILED=1

  mkdir -p tmp && cd tmp && \
    curl -O "https://downloads.mongodb.com/windows/mongo_csfle_v1-windows-x86_64-enterprise-5.3.0-rc3.zip" && \
    unzip mongo_csfle_v1-windows-x86_64-enterprise-5.3.0-rc3.zip && \
    ../bin/mongodb-crypt-library-version.js bin/mongo_csfle_v1.dll > version && \
    cat version && \
    grep -Fq 'mongo_crypt_v1-unknown (0x0000000000000000)' version && \
  cd .. && rm -rf tmp || FAILED=1
fi

if [ x"$FAILED" = x"1" ]; then
  echo "Failed!"
  exit 1
else
  echo "Success"
  exit 0
fi
