#!/bin/sh
set -e
set -x

rm -rf tmp

if [ `node -p process.platform` = "linux" ]; then
  mkdir -p tmp && cd tmp && \
    wget "https://mciuploads.s3.amazonaws.com/mongodb-mongo-master/mongo_csfle/enterprise-rhel-80-64-bit-dynamic-required/237b218974e4fc09104c81fe0bb1ba83688d8035/mongo_csfle_v1_dev-6.0.0-alpha-529-g237b218.tgz" && \
    tar xvzf mongo_csfle_v1_dev-6.0.0-alpha-529-g237b218.tgz && \
    ../bin/mongodb-csfle-library-version.js lib/mongo_csfle_v1.so > version && \
    cat version && \
    grep -Fq 'mongo_csfle_v1-dev-6.0.0-alpha-529-g237b218 (0x0000000006000000)' version && \
  cd .. && rm -rf tmp

  mkdir -p tmp && cd tmp && \
    wget "https://downloads.mongodb.com/linux/mongo_csfle_v1-linux-x86_64-enterprise-ubuntu2004-5.3.0-rc3.tgz" && \
    tar xvzf mongo_csfle_v1-linux-x86_64-enterprise-ubuntu2004-5.3.0-rc3.tgz && \
    ../bin/mongodb-csfle-library-version.js lib/mongo_csfle_v1.so > version && \
    cat version && \
    grep -Fq 'mongo_csfle_v1-unknown (0x0000000000000000)' version && \
  cd .. && rm -rf tmp
fi

if [ `node -p process.platform` = "darwin" ]; then
  mkdir -p tmp && cd tmp && \
    wget "https://mciuploads.s3.amazonaws.com/mongodb-mongo-master/mongo_csfle/enterprise-macos/237b218974e4fc09104c81fe0bb1ba83688d8035/mongo_csfle_v1-6.0.0-alpha-529-g237b218.tgz" && \
    tar xvzf mongo_csfle_v1-6.0.0-alpha-529-g237b218.tgz && \
    ../bin/mongodb-csfle-library-version.js lib/mongo_csfle_v1.dylib > version && \
    cat version && \
    grep -Fq 'mongo_csfle_v1-dev-6.0.0-alpha-529-g237b218 (0x0000000006000000)' version && \
  cd .. && rm -rf tmp

  mkdir -p tmp && cd tmp && \
    wget "https://downloads.mongodb.com/osx/mongo_csfle_v1-macos-x86_64-enterprise-5.3.0-rc3.tgz" && \
    tar xvzf mongo_csfle_v1-macos-x86_64-enterprise-5.3.0-rc3.tgz && \
    ../bin/mongodb-csfle-library-version.js lib/mongo_csfle_v1.dylib > version && \
    cat version && \
    grep -Fq 'mongo_csfle_v1-unknown (0x0000000000000000)' version && \
  cd .. && rm -rf tmp
fi

if [ `node -p process.platform` = "win32" ]; then
  mkdir -p tmp && cd tmp && \
    wget "https://mciuploads.s3.amazonaws.com/mongodb-mongo-master/mongo_csfle/enterprise-windows-required/237b218974e4fc09104c81fe0bb1ba83688d8035/mongo_csfle_v1-6.0.0-alpha-529-g237b218.zip" && \
    unzip mongo_csfle_v1-6.0.0-alpha-529-g237b218.zip && \
    ../bin/mongodb-csfle-library-version.js lib/mongo_csfle_v1.dll > version && \
    cat version && \
    grep -Fq 'mongo_csfle_v1-dev-6.0.0-alpha-529-g237b218 (0x0000000006000000)' version && \
  cd .. && rm -rf tmp

  mkdir -p tmp && cd tmp && \
    wget "https://downloads.mongodb.com/windows/mongo_csfle_v1-windows-x86_64-enterprise-5.3.0-rc3.zip" && \
    unzip mongo_csfle_v1-windows-x86_64-enterprise-5.3.0-rc3.zip && \
    ../bin/mongodb-csfle-library-version.js lib/mongo_csfle_v1.dll > version && \
    cat version && \
    grep -Fq 'mongo_csfle_v1-unknown (0x0000000000000000)' version && \
  cd .. && rm -rf tmp
fi

echo "Success"
