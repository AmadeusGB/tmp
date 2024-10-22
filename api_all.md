# Deeper Wallet API 文档

## 目录
1. [扫描密钥库](#扫描密钥库)
2. [导出助记词](#导出助记词)
3. [获取代币列表](#获取代币列表)
4. [获取地址](#获取地址)
5. [获取货币汇率](#获取货币汇率)
6. [添加账户](#添加账户)
7. [删除代币](#删除代币)
8. [获取默认代币列表](#获取默认代币列表)
9. [获取燃气价格](#获取燃气价格)
10. [获取比特币费用](#获取比特币费用)
11. [发送交易](#发送交易)
12. [创建HD存储](#创建hd存储)
13. [导入HD存储](#导入hd存储)
14. [导入密钥库](#导入密钥库)
15. [保存密码](#保存密码)
16. [获取ERC20元数据](#获取erc20元数据)
17. [添加代币](#添加代币)
18. [导出密钥库](#导出密钥库)
19. [导出私钥](#导出私钥)
20. [获取交易历史](#获取交易历史)
21. [获取交易详情](#获取交易详情)
22. [标记备份完成](#标记备份完成)
23. [检查是否需要备份](#检查是否需要备份)
24. [获取钱包信息](#获取钱包信息)
25. [获取钱包名称](#获取钱包名称)
26. [获取余额和代币价格](#获取余额和代币价格)
27. [重命名钱包](#重命名钱包)
28. [获取钱包备注](#获取钱包备注)
29. [重命名账户](#重命名账户)
30. [删除账户](#删除账户)

---

## 扫描密钥库
### 接口描述
扫描并检查是否存在可用的密钥库文件。

### 请求
- 方法: POST
- 路径: `/api/deeperWallet/scanKeystores`
- 参数: 无

### 响应
```json
{
  "success": true
}
```

### 字段说明
- `success`: 布尔值，表示是否存在密钥库文件
  - `true`: 存在密钥库文件
  - `false`: 不存在密钥库文件

### 注意事项
- 此接口不返回具体的密钥库ID列表
- `success` 为 `true` 表示系统中存在一个密钥库文件
- `success` 为 `false` 表示系统中没有找到任何密钥库文件

---

## 导出助记词
### 接口描述
导出指定ID的助记词。

### 请求
- 方法: POST
- 路径: `/api/deeperWallet/exportMnemonic`
- 参数:
  - `id`: 字符串，密钥库ID
  - `password`: 字符串，密码

### 响应
```json
{
  "success": true,
  "data": {
    "id": "73ad2099-664a-4874-9ca2-cd369998e0a1",
    "type": 0,
    "value": "JwGUZJYjyBZoG//XrWaO5WED4EO44H5D+r2+fWXxjTpyEcmgbI3DRMRjFEZciRidv9XPlfq7pUzb2l68QhVclg==,pl05m+uh3v7RC1Da3o9ZXb9/SNioa2EPhGVLWBFHyyijm+7l4FOZe058ug/Epn97Ez2FhY3HRbJKtst6fxBnqg==,S+UyqMUsX3RqomzD3JyyrwZB8u7y0ufNOd7ZGxMsPb6A3KEWgClpLW70TZeD2IbktP3aU9pbTeaWo9+WI723pg==,n+uMoCV6I/gWkFcvwu0aUr6ctRCKELgXZnR0E6oLpTR/3lJIPNEZAdLRgOz84ykcCTnhZEY4nfImf0JzPZxJ1w=="
  }
}
```

### 字段说明
- `success`: 布尔值，表示操作是否成功
- `data.id`: 字符串，密钥库ID
- `data.type`: 整数，助记词类型（0表示标准助记词）
- `data.value`: 字符串，加密后的助记词

### 注意事项
- 请确保在安全的环境中使用此接口，因为它涉及敏感信息
- 返回的助记词是加密的，需要在客户端进行解密

---

## 获取代币列表
### 接口描述
获取指定网络和地址的代币列表。

### 请求
- 方法: GET
- 路径: `/api/deeperWallet/tokenList`
- 参数:
  - `network`: 字符串，网络名称（如 "BITCOIN", "ETHEREUM" 等）
  - `address`: 字符串，钱包地址

### 响应
```json
{
  "data": [
    {
      "contract_address": "",
      "decimal": 8,
      "symbol": "BTC",
      "status": 1,
      "balance": "100000000",
      "price": "30000.00"
    },
    // ... 其他代币
  ]
}
```

### 字段说明
- `contract_address`: 字符串，代币合约地址（主币为空字符串）
- `decimal`: 整数，代币小数位数
- `symbol`: 字符串，代币符号
- `status`: 整数，代币状态（1表示正常）
- `balance`: 字符串，代币余额（原始值，需要根据 decimal 转换）
- `price`: 字符串，代币当前价格（美元）

### 注意事项
- 不同网络返回的代币列表可能不同
- 余额和价格需要根据 decimal 进行转换才能显示
- 主币（如BTC、ETH）的 `contract_address` 为空字符串

---

## 获取地址
### 接口描述
获取指定索引和网络的钱包地址。

### 请求
- 方法: GET
- 路径: `/api/deeperWallet/fetchAddress`
- 参数:
  - `index`: 整数，账户索引
  - `network`: 字符串，网络名称

### 响应
```json
{
  "success": true,
  "data": {
    "address": "bc1qxy2kgdygjrsqtzq2n0yrf2493p83kkfjhx0wlh"
  }
}
```

### 字段说明
- `success`: 布尔值，表示操作是否成功
- `data.address`: 字符串，对应的钱包地址

### 注意事项
- 地址格式会根据不同的网络而变化
- 确保提供有效的账户索引，否则可能返回错误

---

## 获取货币汇率
### 接口描述
获取指定货币对美元的汇率。

### 请求
- 方法: GET
- 路径: `/api/deeperWallet/currencyExchangeRates`
- 参数:
  - `currency`: 字符串，货币代码（如 "USD", "EUR" 等）

### 响应
```json
{
  "success": true,
  "data": {
    "exchange_rate": 0.91
  }
}
```

### 字段说明
- `success`: 布尔值，表示操作是否成功
- `data.exchange_rate`: 数字，指定货币对美元的汇率

### 注意事项
- 汇率为实时数据，可能会有轻微延迟
- 如果提供的货币代码无效，将返回错误信息

---

## 添加账户
### 接口描述
向现有的密钥库添加新的账户。

### 请求
- 方法: POST
- 路径: `/api/deeperWallet/addAccount`
- 参数:
  - `id`: 字符串，密钥库ID
  - `password`: 字符串，加密后的密码
  - `chains`: 字符串数组，支持的区块链网络列表

### 响应
```json
{
  "success": true
}
```

### 字段说明
- `success`: 布尔值，表示操作是否成功

### 注意事项
- 密码应该在客户端加密后再传输
- 确保提供有效的密钥库ID和支持的区块链网络

---

## 删除代币
### 接口描述
从用户的代币列表中删除指定的代币。

### 请求
- 方法: POST
- 路径: `/api/deeperWallet/deleteToken`
- 参数:
  - `tokens`: 对象数组，包含要删除的代币信息
    - `network`: 字符串，网络名称
    - `address`: 字符串，用户地址
    - `contractAddress`: 字符串，代币合约地址

### 响应
```json
{
  "success": true
}
```

### 字段说明
- `success`: 布尔值，表示操作是否成功

### 注意事项
- 此操作不会影响区块链上的实际代币，只是从用户的可见列表中移除
- 确保提供正确的网络、地址和合约地址信息

---

## 获取默认代币列表
### 接口描述
获取指定网络和地址的默认代币列表。

### 请求
- 方法: GET
- 路径: `/api/deeperWallet/defaultTokenList`
- 参数:
  - `address`: 字符串，用户地址
  - `network`: 字符串，网络名称

### 响应
```json
{
  "data": [
    {
      "contract_address": "",
      "name": "Bitcoin",
      "decimal": 8,
      "symbol": "BTC",
      "balance": "1.23456789",
      "price": "30000.00"
    },
    // ... 其他默认代币
  ]
}
```

### 字段说明
- `contract_address`: 字符��，代币合约地址（主币为空字符串）
- `name`: 字符串，代币名称
- `decimal`: 整数，代币小数位数
- `symbol`: 字符串，代币符号
- `balance`: 字符串，代币余额
- `price`: 字符串，代币当前价格（美元）

### 注意事项
- 默认代币列表可能因网络而异
- 余额和价格是模拟数据，实际使用时应该从区块链获取实时数据

---

## 获取燃气价格
### 接口描述
获取当前网络的燃气价格。

### 请求
- 方法: GET
- 路径: `/api/deeperWallet/gasPrice`
- 参数:
  - `network`: 字符串，网络名称

### 响应
```json
{
  "success": true,
  "data": {
    "gas_price": "1000009739"
  }
}
```

### 字段说明
- `success`: 布尔值，表示操作是否成功
- `data.gas_price`: 字符串，当前燃气价格（单位：wei）

### 注意事项
- 燃气价格可能会频繁变动，建议在交易前实时获取
- 不同网络的燃气价格单位可能不同，使用时需要注意转换

---

## 获取比特币费用
### 接口描述
获取比特币网络的当前交易费用估算。

### 请求
- 方法: GET
- 路径: `/api/deeperWallet/btcFee`
- 参数:
  - `network`: 字符串，网络名称（如 "BITCOIN" 或 "BITCOIN-TESTNET"）

### 响应
```json
{
  "success": true,
  "data": {
    "fastestFee": 6,
    "halfHourFee": 6,
    "hourFee": 6,
    "economyFee": 6,
    "minimumFee": 3
  }
}
```

### 字段说明
- `success`: 布尔值，表示操作是否成功
- `data.fastestFee`: 整数，最快确认的费用（sat/vByte）
- `data.halfHourFee`: 整数，半小时内确认的费用（sat/vByte）
- `data.hourFee`: 整数，一小时内确认的费用（sat/vByte）
- `data.economyFee`: 整数，经济型费用（sat/vByte）
- `data.minimumFee`: 整数，最低可接受的费用（sat/vByte）

### 注意事项
- 费用单位为 sat/vByte（聪/虚拟字节）
- 实际使用时，用户可以根据需求选择不同级别的费用
- 费用估算可能会随网络拥堵情况而变化

---

## 发送交易
### 接口描述
发送加密货币交易，支持比特币、以太坊及ERC20代币。

### 请求
- 方法: POST
- 路径: 
  - 比特币: `/api/deeperWallet/transferBtc`
  - 以太坊/ERC20: `/api/deeperWallet/transferEthErc20`
  - 以太坊主币: `/api/deeperWallet/transferEth`
- 参数:
  - `password`: 字符串，用户密码
  - `fromAddress`: 字符串，发送地址
  - `toAddress`: 字符串，接收地址
  - `amount`: 字符串，发送金额
  - `network`: 字符串，网络名称
  - `contractAddress`: 字符串，（仅ERC20代币）合约地���
  - `feeRate`: 数字，（仅比特币）费用率

### 响应
```json
{
  "success": true,
  "data": {
    "transaction_hash": "0x53dd2cff59c1a49abcedb73bb99390f93cad38f9c25638c203759d71db590c97"
  }
}
```

### 字段说明
- `success`: 布尔值，表示交易是否成功发送
- `data.transaction_hash`: 字符串，交易哈希

### 注意事项
- 密码应在客户端加密后传输
- 比特币交易需要额外的 `feeRate` 参数
- ERC20代币交易需要提供 `contractAddress`
- 交易哈希可用于后续查询交易状态

---

## 创建HD存储
### 接口描述
创建一个新的分层确定性（HD）钱包存储。

### 请求
- 方法: POST
- 路径: `/api/deeperWallet/createHdStore`
- 参数:
  - `password`: 字符串，加密后的密码
  - `walletName`: 字符串，钱包名称

### 响应
```json
{
  "success": true,
  "data": {
    "id": "53a62ceb-c009-4573-9da2-86c171964028",
    "name": "deeper",
    "source": "MNEMONIC",
    "accounts": [],
    "created_at": 1702350503
  }
}
```

### 字段说明
- `success`: 布尔值，表示操作是否成功
- `data.id`: 字符串，新创建的HD存储ID
- `data.name`: 字符串，钱包名称
- `data.source`: 字符串，钱包来源（这里是 "MNEMONIC"）
- `data.accounts`: 数组，初始为��，表示还没有添加账户
- `data.created_at`: 整数，创建时间戳（秒）

### 注意事项
- 密码应在客户端加密后传输
- 创建后的HD存储初始没有账户，需要后续添加
- `id` 很重要，后续操作可能会用到

---

## 导入HD存储
### 接口描述
通过助记词导入现有的分层确定性（HD）钱包存储。

### 请求
- 方法: POST
- 路径: `/api/deeperWallet/importHdStore`
- 参数:
  - `mnemonic`: 字符串，加密后的助记词
  - `overwrite`: 布尔值，是否覆盖现有存储
  - `password`: 字符串，加密后的密码
  - `source`: 字符串，助记词来源
  - `walletName`: 字符串，钱包名称

### 响应
```json
{
  "success": true,
  "data": {
    "id": "86423bc4-2408-4de4-8b4f-61870d1bd53a",
    "name": "deeper",
    "source": "MNEMONIC",
    "accounts": [],
    "created_at": 1702348225
  }
}
```

### 字段说明
- `success`: 布尔值，表示操作是否成功
- `data.id`: 字符串，导入的HD存储ID
- `data.name`: 字符串，钱包名称
- `data.source`: 字符串，钱包来源（这里是 "MNEMONIC"）
- `data.accounts`: 数组，初始为空，表示还没有添加账户
- `data.created_at`: 整数，创建时间戳（秒）

### 注意事项
- 助记词和密码都应该在客户端加���后传输
- `overwrite` 参数决定是否覆盖同名的现有存储
- 导入后可能需要手动添加账户

---

## 导入密钥库
### 接口描述
导入现有的密钥库文件。

### 请求
- 方法: POST
- 路径: `/api/deeperWallet/importKeyStore`
- 参数:
  - `keystore`: 字符串，密钥库文件内容
  - `password`: 字符串，加密后的密码
  - `walletName`: 字符串，钱包名称

### 响应
```json
{
  "success": true,
  "data": {
    "ids": ["98641afb-aee4-4f35-a72e-b1781d4741fd"]
  }
}
```

### 字段说明
- `success`: 布尔值，表示操作是否成功
- `data.ids`: 字符串数组，包含导入的密钥库ID

### 注意事项
- 密钥库文件内容和密码都应该在客户端加密后传输
- 返回的ID数组可能包含多个ID，如果密钥库包含多个账户
- 导入后，这些账户将可以在钱包中使用

---

## 保存密码
### 接口描述
在会话存储中保存加密的密码和密码哈希。

### 请求
- 方法: 函数调用（客户端）
- 函数名: `savePassword`
- 参数:
  - `encryptedPassword`: 字符串，加密后的密码
  - `hashedPassword`: 字符串，密码的哈希值

### 响应
无直接响应，函数在客户端执行。

### 注意事项
- 此函数在客户端执行，不涉及服务器交互
- 密码和哈希值存储在 `sessionStorage` 中，页面关闭后会自动清除
- 使用特定的键名存储：
  - 加密密码: `_0xdtg2ug`
  - 密码哈希: `_0xvn1iyq`
- 出于安全考虑，不应在生产环境中明文存储密码

---

## 获取ERC20元数据
### 接口描述
获取指定ERC20代币的元数据信息。

### 请求
- 方法: GET
- 路径: `/api/deeperWallet/erc20Meta`
- 参数:
  - `network`: 字符串，网络名称
  - `address`: 字符串，用户地址
  - `contractAddress`: 字符串，代币合约地址

### 响应
```json
{
  "success": true,
  "data": {
    "symbol": "USDT",
    "decimals": 6,
    "name": "USDT"
  }
}
```

### 字段说明
- `success`: 布尔值，表示操作是否成功
- `data.symbol`: 字符串，代币符号
- `data.decimals`: 整数，代币小数位数
- `data.name`: 字符串，代币名称

### 注意事项
- 确保提供正确的网络名称和合约地址
- 此接口对于识别和显示未知ERC20代币很有用

---

## 添加代币
### 接口描述
向用户的代币列表中添加新的代币。

### 请求
- 方法: POST
- 路径: `/api/deeperWallet/addToken`
- 参数:
  - `tokens`: 对象数组，包含要添加的代币信息
    - `network`: 字符串，网络名称
    - `address`: 字符串，用户地址
    - `contractAddress`: 字符串，代币合约地址
    - `symbol`: 字符串，代币符号
    - `decimal`: 整数，代币小数位数
    - `name`: 字符串，代币名称

### 响应
```json
{
  "success": true
}
```

### 字段说明
- `success`: 布尔值，表示操作是否成功

### 注意事项
- 可以一次添加多个代币
- 添加前应先检查代币是否已存在，避免重复
- 添加自定义代币时，确保提供准确的合约地址和其他信息

---

## 导出密钥库
### 接口描述
导出用户的密钥库文件。

### 请求
- 方法: GET
- 路径: `/api/deeperWallet/exportKeystore`
- 参数: 无

### 响应
```json
{
  "success": true,
  "data": {
    "id": "some-id",
    "name": "deeper",
    "source": "MNEMONIC",
    "accounts": [],
    "created_at": 1234567890
  }
}
```

### 字段说明
- `success`: 布尔值，表示操作是否成功
- `data`: 对象，包含密钥库信息
  - `id`: 字符串，密钥库ID
  - `name`: 字符串，钱包名称
  - `source`: 字符串，密钥库来源
  - `accounts`: 数组，账户信息（示例中为空）
  - `created_at`: 整数，创建时间戳

### 注意事项
- 导出的密钥库文件包含敏感信息，应妥善保管
- 客户端应提供将导出数据保存为文件的功能
- 实际使用时，`accounts` 数组可能包含多个账户信息

---

## 导出私钥
### 接口描述
导出指定网络和地址的私钥。

### 请求
- 方法: POST
- 路径: `/api/deeperWallet/exportPrivateKey`
- 参数:
  - `password`: 字符串，用户密码
  - `network`: 字符串，网络名称
  - `address`: 字符串，要导出私钥的地址

### 响应
```json
{
  "success": true,
  "data": {
    "id": "038e53b5-06a0-4835-943c-ec4195f2beed",
    "type": 1,
    "value": "BgNiwxqgPoTZPVsli44egte+HnCmK5rdp0W9xioI0I9qf/UsH5/+9yvjwNHWtDoQJ93YDmIBqY/m0p04hVyA7g==,f+DrgtTnw1HdV92S92XmpKI5FxGJau2XjhWNYxL0uNlpzGem1+SPMIcoI8W6uNltptKH9a1JZA3MFWf5hK9Pfw==,flLYe7pxdZpSWpln1/lsJ/DZuuNk3Mh2nWoSk40mQ86JZAygIQEd1WlEd9DInqrB/VgwP/YIStdC5PU+hx2FsA=="
  }
}
```

### 字段说明
- `success`: 布尔值，表示操作是否成功
- `data.id`: 字符串，操作ID
- `data.type`: 整数，私钥类型（1可能表示加密的私钥）
- `data.value`: 字符串，加密后的私钥

### 注意事项
- 密码应在客户端加密后传输
- 返回的私钥是加密的，需要在客户端解密
- 私钥是极其敏感的信息，应谨慎处理，避免泄露

---

## 获取交易历史
### 接口描述
获取指定网络和地址的交易历史记录。

### 请求
- 方法: GET
- 路径: `/api/deeperWallet/txHistory`
- 参数:
  - `network`: 字符串，网络名称
  - `address`: 字符串，钱包地址
  - `contractAddress`: 字符串，（可选）代币合约地址

### 响应
```json
{
  "success": true,
  "data": [
    {
      "type": "Send",
      "amount": "120000000",
      "tx_id": "0x...",
      "timestamp": 1702262400000,
      "block_number": 770003
    },
    // ... 更多交易记录
  ]
}
```

### 字段说明
- `success`: 布尔值，表示操作是否成功
- `data`: 数组，包含交易记录
  - `type`: 字符串，交易类型（"Send" 或 "Receive"）
  - `amount`: 字符串，交易金额（原始值，需根据代币小数位转换）
  - `tx_id`: 字符串，交易哈希
  - `timestamp`: 整数，交易时间戳（毫秒）
  - `block_number`: 整数，交易所在区块号

### 注意事项
- 交易历史可能因网络而异
- 金额需要根据代币的小数位进行转换
- 可能需要分页机制来处理大量交易记录

---

## 获取交易详情
### 接口描述
获取指定交易的详细信息。

### 请求
- 方法: GET
- 路径: `/api/deeperWallet/tx`
- 参数:
  - `txId`: 字符串，交易哈希

### 响应
```json
{
  "data": {
    "from_address": "0x90df5a3ede13ee1d090573460e13b0bfd8aa9708",
    "to_address": "0x78e9c138e3493db11a44469204a8f7986de05db1",
    "fee": "18491200539000",
    "status": 0
  }
}
```

### 字段说明
- `data.from_address`: 字符串，发送方地址
- `data.to_address`: 字符串，接收方地址
- `data.fee`: 字符串，交易费用（单位取决于网络）
- `data.status`: 整数，交易状态（0可能表示待确认，具体含义需要与后端确认）

### 注意事项
- 交易详情可能因网络而异，某些字段可能只在特定网络中出现
- 交易状态的具体含义应该与后端开发人员确认
- 费用单位可能需要根据不同网络进行转换

---

## 标记备份完成
### 接口描述
标记用户已完成钱包备份。

### 请求
- 方法: POST
- 路径: `/api/deeperWallet/markBackupDone`
- 参数: 无

### 响应
```json
{
  "success": true
}
```

### 字段说明
- `success`: 布尔值，表示操作是否成功

### 注意事项
- 此接口通常在用户确认已安全备份钱包信息后调用
- 可能需要用户认证来确保操作的安全性

---

## 检查是否需要备份
### 接口描述
检查用户是否需要备份钱包。

### 请求
- 方法: GET
- 路径: `/api/deeperWallet/isBackupNeeded`
- 参数: 无

### 响应
```json
{
  "needed": true
}
```

### 字段说明
- `needed`: 布尔值，表示是否需要备份

### 注意事项
- 如果返回 `true`，应提示用户进行钱包备份
- 可以与 `markBackupDone` 接口配合使用，以跟踪用户的备份状态

---

## 获取钱包信息
### 接口描述
获取当前钱包的详细信息，包括账户列表。

### 请求
- 方法: GET
- 路径: `/api/deeperWallet/walletInfo`
- 参数: 无

### 响应
```json
{
  "success": true,
  "data": {
    "accounts": [
      {
        "name": "Account 01",
        "index": 1,
        "supportedNetworks": ["BITCOIN", "ETHEREUM"]
      },
      {
        "name": "Account 02",
        "index": 2,
        "supportedNetworks": ["ETHEREUM", "SOLANA"]
      },
      {
        "name": "Account 03",
        "index": 3,
        "supportedNetworks": ["SOLANA", "BITCOIN", "ETHEREUM"]
      }
    ]
  }
}
```

### 字段说明
- `success`: 布尔值，表示操作是否成功
- `data.accounts`: 数组，包含钱包中的所有账户信息
  - `name`: 字符串，账户名称
  - `index`: 整数，账户索引
  - `supportedNetworks`: 字符串数组，该账户支持的网络���表

### 注意事项
- 账户索引通常从1开始
- 支持的网络列表可能因账户类型而异
- 此信息可用于显示用户的账户概览和进行账户管理

---

## 获取钱包名称
### 接口描述
获取当前钱��的名称。

### 请求
- 方法: GET
- 路径: `/api/deeperWallet/walletName`
- 参数: 无

### 响应
```json
{
  "success": true,
  "data": {
    "name": "Ghost Assassin123"
  }
}
```

### 字段说明
- `success`: 布尔值，表示操作是否成功
- `data.name`: 字符串，钱包名称

### 注意事项
- 钱包名称可能是用户自定义的
- 可以用于显示在UI上，增强用户体验

---

## 获取余额和代币价格
### 接口描述
同时获取指定网络和代币的余额及其当前价格。

### 请求
- 方法: GET
- 路径: 
  - 余额: `/api/deeperWallet/balance`
  - 价格: `/api/deeperWallet/price`
- 参数:
  - 余额:
    - `address`: 字符串，钱包地址
    - `network`: 字符串，网络名称
  - 价格:
    - `tokenName`: 字符串，代币名称

### 响应
```json
{
  "balanceData": {
    "success": true,
    "data": {
      "balance": "1000000000000000000",
      "decimal": 18
    }
  },
  "priceData": {
    "success": true,
    "data": {
      "token_price": "2000.00"
    }
  }
}
```

### 字段说明
- `balanceData`: 对象，包含余额信息
  - `success`: 布尔值，表示余额查询是否成功
  - `data.balance`: 字符串，代币余额（原始值）
  - `data.decimal`: 整数，代币小数位数
- `priceData`: 对象，包含价格信息
  - `success`: 布尔值，表示价格查询是否成功
  - `data.token_price`: 字符串，代币当前价格（美元）

### 注意事项
- 余额需要根据 `decimal` 进行转换才能正确显示
- 价格信息可能会频繁变动，应考虑适当的刷新机制
- 此接口合并了两个请求，可以提高前端效率

---

## 重命名钱包
### 接口描述
更改当前钱包的名称。

### 请求
- 方法: POST
- 路径: `/api/deeperWallet/renameWallet`
- 参数:
  - `newName`: 字符串，新的钱包名称

### 响应
```json
{
  "success": true,
  "data": {
    "name": "新钱包名称"
  }
}
```

### 字段说明
- `success`: 布尔值，表示操作是否成功
- `data.name`: 字符串，更新后的钱包名称

### 注意事项
- 新名称不应为空或仅包含空白字符
- 可能需要对名称长度进行限制（例如，不超过50个字符）
- 重命名操作可能需要用户认证

---

## 获取钱包备注
### 接口描述
获取当前钱包的备注信息。

### 请求
- 方法: GET
- 路径: `/api/deeperWallet/walletNote`
- 参数: 无

### 响应
```json
{
  "success": true,
  "data": {
    "identifier": "Im14x5C7fgFVHAEtDHAGaFMDgT9htCBCFd6AfW5",
    "source": "Import via mnemonic phrase"
  }
}
```

### 字段说明
- `success`: 布尔值，表示操作是否成功
- `data.identifier`: 字符串，钱包的唯一标识符
- `data.source`: 字符串，钱包的来源或创建方式

### 注意事项
- 标识符应该是唯一的，可用于区分不同的钱包
- 来源信息可以帮助用户回忆钱包的创建方式
- 这些信息通常用于显示目的，不应包含敏感数据

---

## 重命名账户
### 接口描述
更改指定账户的名称。

### 请求
- 方法: POST
- 路径: `/api/deeperWallet/renameAccount`
- 参数:
  - `index`: 整数，账户索引
  - `newName`: 字符串，新的账户名称

### 响应
```json
{
  "success": true,
  "data": {
    "name": "新账户名称"
  }
}
```

### 字段说明
- `success`: 布尔值，表示操作是否成功
- `data.name`: 字符串，更新后的账户名称

### 注意事项
- 账户索引应该是有效的（通常从1开始）
- 新名称不应为空，且长度应在合理范围内（如不超过50个字符）
- 重命名操作可能需要用户认证

---

## 删除账户
### 接口描述
从钱包中删除指定的账户。

### 请求
- 方法: POST
- 路径: `/api/deeperWallet/deleteAccount`
- 参数:
  - `index`: 整数，要删除的账户索引
  - `password`: 字符串，用户密码

### 响应
```json
{
  "success": true
}
```

### 字段说明
- `success`: 布尔值，表示操作是否���功

### 注意事项
- 删除账户是一个敏感操作，需要密码验证
- 应该警告用户删除账户的潜在风险，如资金丢失
- 建议在删除前提示用户备份相关信息
- 某些类型的账户（如主账户）可能不允许删除，需要进行相应的检查

