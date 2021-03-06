# 腾讯云的Rust和WebAssembly函数即服务

## 先决条件

如果还没有前期的安装，按照下面的简要步骤在你的电脑上[安装 ssvmup](https://www.secondstate.io/articles/ssvmup/)。

## 创建 WASM bytecode

我们创建了 [Rust 函数即服务](src/main.rs)。它只是从 STDIN 获取函数输入，并将结果输出到 STDOUT 中。这使得它可以在各种不同的场合和有效载荷中使用。该函数使用‘ key1’和‘ key2’字段预测输入 JSON 字符串。正如我们将看到的，这就是腾讯云内置的 hello world 测试中使用的 JSON 格式。

要将 Rust 函数构建到 WebAssembly 字节码应用程序中，请从命令行执行以下操作。它可能需要几分钟时间来创建。

```
$ ssvmup build
```

## 部署包

```
$ cp pkg/hello_bg.wasm cloud/
$ cd cloud
$ zip hello.zip *
```

## 部署在腾讯云上

0 点击控制台 https://cloud.tencent.com/

1 点击 云产品 | 无服务云函数 | 函数服务 | 创建

2 运行环境, 从下拉列表选择 CustomRuntime

3 选择空白模板函数

4 点击下一步

![部署步骤 1](docs/deploy01_cn.png)

5 将执行处理程序设置为 `hello_bg.wasm`

6 为 Submitting Method 选择“ Local zip file” ，然后上传“ hello.zip”文件

7 点击完成

![部署步骤 2](docs/deploy02_cn.png)

## 测试

成功部署函数后，转到 函数代码 选项卡。

![部署成功](docs/deploy03_cn.png)

向下滚动并单击测试按钮。该函数将接收 hello world JSON 数据输入
```
{
  "key1": "test value 1",
  "key2": "test value 2"
}
```

![测试该函数](docs/test_cn.png)

并输出一个 hello 消息。

```
Hello! test value 1, test value 2
```

![测试执行结果](docs/result_cn.png)

就是这样! 您现在已经测试并部署了第一个服务器端 WebAssembly 函数！

## 下一步

下一步是 [创建一个完整的演示来运行，并可视化一个机器学习算法](https://github.com/second-state/wasm-learning/tree/master/tencentcloud/ssvm/pca).

