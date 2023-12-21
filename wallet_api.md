# Deeper Wallet API 文档

## 接口列表

### 1. 扫描密钥库
- **接口**: `POST /api/deeperWallet/scanKeystores`
- **描述**: 扫描并返回密钥库ID列表。
- **输入参数**: 无
- **输出参数**:
  ```json
  {
    "success": true,
    "data": {
      "ids": ["98641afb-aee4-4f35-a72e-b1781d4741fd"]
    }
  }
  ```

### 2. 创建HD存储
- **接口**: `POST /api/deeperWallet/hdStoreCreate`
- **描述**: 创建一个HD（层次确定性）钱包存储。
- **输入参数**: 无
- **输出参数**:
  ```json
  {
    "success": true,
    "data": {
      "id": "53a62ceb-c009-4573-9da2-86c171964028",
      "name": "mytest2",
      "source": "MNEMONIC",
      "accounts": [],
      "created_at": 1702350503
    }
  }
  ```

### 3. 导入HD存储
- **接口**: `POST /api/deeperWallet/hdStoreImport`
- **描述**: 导入一个HD存储。
- **输入参数**: 无
- **输出参数**:
  ```json
  {
    "success": true,
    "data": {
      "id": "86423bc4-2408-4de4-8b4f-61870d1bd53a",
      "name": "mytest",
      "source": "MNEMONIC",
      "accounts": [],
      "created_at": 1702348225
    }
  }
  ```

### 4. 导入私钥存储
- **接口**: `POST /api/deeperWallet/privateKeyStoreImport`
- **描述**: 导入一个私钥存储。
- **输入参数**: 无
- **输出参数**:
  ```json
  {
    "success": true,
    "data": {
      "id": "e27edcdd-ce11-4cb0-9e26-d071739c761d",
      "name": "mytest4",
      "source": "MNEMONIC",
      "accounts": [],
      "created_at": 1702356649
    }
  }
  ```

### 5. 导出助记词
- **接口**: `POST /api/deeperWallet/exportMnemonic`
- **描述**: 导出钱包的助记词。
- **输入参数**: 无
- **输出参数**:
  ```json
  {
    "success": true,
    "data": {
      "id": "8f0bab1e-f1c3-42f7-9c6a-cb753533832e",
      "type": 0,
      "value": "city practice material drastic category ordinary mango limb consider lounge happy cluster"
    }
  }
  ```

### 6. 获取通用账户列表
- **接口**: `POST /api/deeperWallet/keystoreCommonAccounts`
- **描述**: 获取钱包中的通用账户列表。
- **输入参数**: 无
- **输出参数**:
  ```json
  {
    "success": true,
    "data": {
      "accounts": [
        {
          "chain_type": "goerli",
          "address": "0x78e9c138e3493dB11a44469204A8F7986De05dB1",
          "path": "",
          "extended_xpub_key": ""
        },
        {
          "chain_type": "BITCOIN",
          "address": "mzdyjFZinyBYELFHKrspD7xNfMEuFHbNgS",
          "path": "",
          "extended_xpub_key": ""
        },
        {
          "chain_type": "mainnet",
          "address": "0xd934AaFeDEfd2041d7dC0972A5B96fa5f03DB72F",
          "path": "",
          "extended_xpub_key": ""
        }
      ]
    }
  }
  ```

### 7. 获取代币列表
- **接口**: `POST /api/deeperWallet/getTokenList`
- **描述**:

 根据指定条件获取代币列表。
- **输入参数**: `{coin: 'ETH', network: 'Goerli', address}`
- **输出参数**:
  ```json
  {
    "success": true,
    "data": {
      "tokens": [
        {
          "coin": "ETH",
          "amount": "13",
          "address": "0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee"
        },
        {
          "coin": "USDT",
          "amount": "1200",
          "address": "0xdac17f958d2ee523a2206206994597c13d831ec7"
        }
      ]
    }
  }
  ```

### 8. 获取交易列表
- **接口**: `POST /api/deeperWallet/getTxList`
- **描述**: 根据指定条件获取交易列表。
- **输入参数**: `{coin, network, address}`
- **输出参数**:
  ```json
  {
    "success": true,
    "data": {
      "transactions": [
        {
          "type": "send",
          "amount": "0.019123",
          "txid": "0x89edef1234567890abcdef1234567890abcdef1234567890abcdef1234568970",
          "timestamp": "1702858700" // 2023-12-18
        },
        {
          "type": "receive",
          "amount": "0.009123",
          "txid": "0x1234567890abcdef1234567890abcdef1234567890abcdef1234567890ab1234",
          "timestamp": "1702858100" // 2023-12-18
        },
        {
          "type": "send",
          "amount": "0.006123",
          "txid": "0xaaaaefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdef",
          "timestamp": "1702771700" // 2023-12-17
        }
      ]
    }
  }
  ```

### 9. 获取单个交易详情
- **接口**: `POST /api/deeperWallet/getTx`
- **描述**: 根据交易ID获取交易的详细信息。
- **输入参数**: `{txid}`
- **输出参数**:
  ```json
  {
    "success": true,
    "data": {
      "tx_hash": "0xabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdef",
      "from_address": "0x78e9c138e3493dB11a44469204A8F7986De05dB1",
      "to_address": "0xabcdef1234567890abcdef1234567890abcdef12",
      "fee": "0.00021"
    }
  }
  ```

### 10. 获取余额
- **接口**: `POST /api/deeperWallet/getBalance`
- **描述**: 获取钱包余额。
- **输入参数**: 无
- **输出参数**:
  ```json
  {
    "success": true,
    "data": {
      "balance": "1630000000000000000"
    }
  }
  ```

### 11. 获取代币价格
- **接口**: `POST /api/deeperWallet/getPrice`
- **描述**: 获取指定代币的当前市场价格。
- **输入参数**: 无
- **输出参数**:
  ```json
  {
    "success": true,
    "data": {
      "token_price": "2176.48"
    }
  }
  ```

### 12. 获取Gas价格
- **接口**: `POST /api/deeperWallet/getGasPrice`
- **描述**: 获取当前的Gas价格。
- **输入参数**: 无
- **输出参数**:
  ```json
  {
    "success": true,
    "data": {
      "gas_price": "120"
    }
  }
  ```

### 13. 获取交易费用
- **接口**: `POST /api/deeperWallet/getTransactionFee`
- **描述**: 获取交易的费用。
- **输入参数**: 无
- **输出参数**:
  ```json
  {
    "success": true,
    "data": {
      "transaction_fee": "17000000000000000"
    }
  }
  ```

### 14. 发送交易
- **接口**: `POST /api/deeperWallet/sendTransaction`
- **描述**: 发送交易。
- **输入参数**: 无
- **输出参数**:
  ```json
  {
    "success": true,
    "data": {
      "transaction_hash": "2100"
    }
  }
  ```

### 15. 写入备份状态
- **接口**: `POST /api/deeperWallet/writeBackupStatus`
- **描述**: 记录钱包的备份状态。
- **输入参数**: 无
- **输出参数**:
  ```json
  {
    "success": true,
    "data": {
      "status": true
    }
  }
  ```

### 16. 读取备份状态
- **接口**: `POST /api/deeperWallet/readBackupStatus`
- **描述**: 读取钱包的备份状态。
- **输入参数**: 无
- **输出参数**:
  ```json
  {
    "success": true,
    "data": {
      "status": true
    }
  }
  ```

### 17. 删除密钥库ID
- **接口**: `POST /api/deeperWallet/deleteKeyStoreId`
- **描述**: 删除特定的密钥库ID。
- **输入参数**: 无
- **输出参数**:
  ```json
  {
    "success": true,
    "data": {
      "status": true
    }
  }
  ```
