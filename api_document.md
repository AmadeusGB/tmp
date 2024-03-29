## 接口文档：跨链申请查询 & 新事件检查 & 跨链查询接口

### 1. 概述

这份接口文档旨在描述两个主要功能：查询跨链申请和检查是否存在新的跨链申请事件。接口设计支持根据区块号进行筛选，以及通过一个轻量级接口快速判断是否有新的跨链事件，帮助客户端及时处理跨链申请。

### 1.1 跨链申请查询接口

- **URL**: `/api/v1/deeper/cross_chain_requests`
- **方法**: `GET`
- **认证**: 无

#### 请求参数

| 参数名    | 类型 | 描述             | 必须 | 示例值    |
|-----------|------|-----------------|------|-----------|
| `block_id`| 整数 | 查询的起始区块号 | 是   | `16052979`|

#### 响应结构

响应数据为一个JSON数组，每个元素包含以下字段：

| 字段名          | 类型   | 描述                      |
|----------------|--------|---------------------------|
| `block_id`     | 整数   | 区块号                    |
| `from_address` | 字符串 | 发送方地址                |
| `to_address`   | 字符串 | 接收方地址                |
| `amount`       | 字符串 | 跨链金额                  |
| `chain`        | 字符串 | 链名称                    |
| `block_datetime` | 字符串 | 区块时间（格式："YYYY-MM-DD HH:MM:SS"）|

#### 请求示例

```
GET https://dev.deeperscan.io/api/v1/deeper/cross_chain_requests?block_id=16052979
```

### 1.2 新事件检查接口

- **URL**: `/api/v1/deeper/has_new_cross_chain`
- **方法**: `GET`
- **认证**: 无

#### 请求参数

| 参数名    | 类型 | 描述             | 必须 | 示例值    |
|-----------|------|-----------------|------|-----------|
| `block_id`| 整数 | 查询的起始区块号 | 是   | `16052979`|

#### 响应结构

响应数据为一个JSON对象，包含以下字段：

| 字段名             | 类型    | 描述                      |
|-------------------|---------|---------------------------|
| `new_event_exists`| 布尔值  | 自指定区块号以来是否存在新的跨链申请事件 |

#### 请求示例

```
GET https://dev.deeperscan.io/api/v1/deeper/has_new_cross_chain?block_id=16052979
```

基于提供的信息，我们将增加两个接口的描述到接口文档中，保持格式和内容的一致性。

### 1.3 跨链查询接口：Deeper到其他区块链

- **URL**: `/api/v1/deeper/bridge_deeper_to_other`
- **方法**: `GET`
- **认证**: 无

#### 请求参数

| 参数名         | 类型   | 描述                 | 必须 | 示例值                             |
|----------------|--------|----------------------|------|------------------------------------|
| `block_id`     | 整数   | 查询的起始区块号     | 是   | `16183661`                         |
| `from_address` | 字符串 | 发送方地址（可选）   | 否   | `668e8A0DB87FA6ce64B2e13eD12a3981f59ef418` |
| `to_address`   | 字符串 | 接收方地址（可选）   | 否   | `0xaa67d3f2ab38a208fef6d5d6f9dd3fc463859acfe4b64f5b442b1d275ff7c75e` |
| `chain`        | 字符串 | 链名称（可选）       | 否   | `SOL`                              |

#### 响应结构

响应数据为一个JSON数组，每个元素包含以下字段：

| 字段名            | 类型   | 描述                          |
|-------------------|--------|-------------------------------|
| `block_id`        | 整数   | 区块号                        |
| `from_address`    | 字符串 | 发送方地址                    |
| `to_address`      | 字符串 | 接收方地址                    |
| `amount`          | 字符串 | 跨链金额                      |
| `chain`           | 字符串 | 链名称                        |
| `block_datetime`  | 字符串 | 区块时间（格式："YYYY-MM-DD HH:MM:SS"）|

#### 请求示例

```
GET https://dev.deeperscan.io/api/v1/deeper/bridge_deeper_to_other?block_id=16183661&from_address=668e8A0DB87FA6ce64B2e13eD12a3981f59ef418
```

### 1.4 跨链查询接口：其他区块链到Deeper

- **URL**: `/api/v1/deeper/bridge_other_to_deeper`
- **方法**: `GET`
- **认证**: 无

#### 请求参数

| 参数名         | 类型   | 描述                 | 必须 | 示例值                             |
|----------------|--------|----------------------|------|------------------------------------|
| `block_id`     | 整数   | 查询的起始区块号     | 是   | `16183711`                         |
| `from_address` | 字符串 | 发送方地址（可选）   | 否   | `0xaa67d3f2ab38a208fef6d5d6f9dd3fc463859acfe4b64f5b442b1d275ff7c75e` |
| `to_address`   | 字符串 | 接收方地址（可选）   | 否   | `65zqkiMs4vmZvhKNnSreedHXGDEqf6zCH2dpuVDbpqmF` |
| `chain`        | 字符串 | 链名称（可选）       | 否   | `SOL`                              |

#### 响应结构

响应数据为一个JSON数组，每个元素包含以下字段：

| 字段名            | 类型   | 描述                          |
|-------------------|--------|-------------------------------|
| `block_id`        | 整数   | 区块号                        |
| `from_address`    | 字符串 | 发送方地址                    |
| `to_address`      | 字符串 | 接收方地址                    |
| `amount`          | 字符串 | 跨链金额                      |
| `chain`           | 字符串 | 链名称                        |
| `block_datetime`  | 字符串 | 区块时间（格式："YYYY-MM-DD HH:MM:SS"）|

#### 请求示例

```
GET https://dev.deeperscan.io/api/v1/deeper/bridge_other_to_deeper?block_id=16183711&to_address=65zqkiMs4vmZvhKNnSreedHXGDEqf6zCH2dpuVDbpqmF
```

### 注意事项

- **接口调用频率**：请合理安排调用频率，避免对服务器造成不必要的负担。
- **区块号更新**：客户端需要根据查询结果更新维护的区块号，以便于下次查询。
- **数据延迟**：由于区块链数据可能存在网络延迟，最新的跨链申请可能不会立即反映在接口数据中。
