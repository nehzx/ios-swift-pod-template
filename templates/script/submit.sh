#! /bin/bash

PROJ=""
POD_SPEC="${PROJ}.podspec"
POD_REPO="unipets"
VERSION=$1
COMPANY="Shenzhen Xiaomeng Pet Technology Co., Ltd"


echo "==> 准备提交 $PROJ 工程, 版本号：$VERSION"

if [ ! -n $VERSION ]
then
	echo "$0 [ERROR] 缺少 version 参数"
	exit 0
fi

echo "==> 修改 $POD_SPEC 版本号: $VERSION"
sed -i '' "11,11s/'.*'/'$VERSION'/g" $POD_SPEC

echo "==> 提交 repo 修改"
git add .
git commit -m "commit $PROJ version $VERSION"
git push origin master

echo "==> 提交 tag $VERSION"
git tag -d $VERSION
git tag $VERSION -m "tag: $VERSION"
git push origin $VERSION -f

pod repo push $POD_REPO $POD_SPEC --allow-warnings --verbose --use–modular-headers --sources=$POD_REPO,trunk
