### 方案设计概述

本方案旨在提供实时访问和处理区块链上的跨链申请事件。主要包括两个API接口：

1. **查询跨链申请接口**：允许客户端根据指定的区块号（`block_id`）查询该区块号之后所有的跨链申请事件。
2. **轻量级检查接口**：提供一种高效的方式来检查自上一次查询以来是否存在新的跨链申请事件。

### 接口和参数设计

#### 1. 查询跨链申请接口

- **路径**：`/deeper/cross_chain_requests`
- **方法**：`GET`
- **输入参数**：
  - `block_id`：客户端上次查询的最后一个区块号。类型为整数。
- **输出参数**：一个JSON列表，每个条目包含以下字段：
  - `block_id`：跨链申请所在的区块号。
  - `from_address`：跨链发起方的地址。
  - `to_address`：跨链接收方的地址（如果适用）。
  - `amount`：跨链金额。
  - `chain`：区块链标识（如ETH, BTC, SOL等）。

**示例响应**：
```json
[
  {
    "block_id": 100001,
    "from_address": "0x123...",
    "to_address": "0x456...",
    "amount": "100",
    "chain": "ETH"
  },
  {
    "block_id": 100002,
    "from_address": "0x789...",
    "to_address": "0xabc...",
    "amount": "50",
    "chain": "SOL"
  }
]
```

#### 2. 轻量级检查接口

- **路径**：`/api/has_new_cross_chain`
- **方法**：`GET`
- **输入参数**：
  - `block_id`：客户端上次查询的最后一个区块号。类型为整数。
- **输出参数**：一个布尔值，表示自`block_id`以来是否有新的跨链申请事件。

**示例响应**：
```json
{
  "has_new_cross_chain_events": true
}
```

### 错误处理

接口应能够处理各种错误情况，并返回适当的HTTP状态码和错误信息。例如：

- 400 Bad Request：输入参数不正确。
- 401 Unauthorized：缺少有效的认证信息。
- 404 Not Found：请求的资源不存在。
- 500 Internal Server Error：服务器内部错误。
