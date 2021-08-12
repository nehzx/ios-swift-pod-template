pod-template
============

创建的模版内容包含一下

- 使用git 管理
- 许可证 MIT
- 使用系统自带的xctest 测试框架
- script 下面的 submit.sh 提交代码做版本控制

## 开始使用

```bash
pod lib create your_project_name --template-url=https://github.com/nehzx/ios-swift-pod-template.git
```

## 代码提交

在项目根目录执行  输入相应版本号

```bash
./script/submit.sh 0.1.1
```

## 要求:

- CocoaPods 1.0.0+
