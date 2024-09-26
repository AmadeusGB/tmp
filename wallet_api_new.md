### 1. 创建HD存储
- **接口**: `POST /api/deeperWallet/createHdStore`
- **描述**: 创建一个新的HD（层次确定性）钱包存储。后端将同时创建`Wallet Identifier（生成的Keystore文件名的哈希值）和Source信息（如："Created via HD store"）`。
- **输入参数**:
  - `password`: 加密后的密码
  - `walletName`: 钱包名称
- **输出参数**:
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

### 2. 导入助记词HD存储
- **接口**: `POST /api/deeperWallet/importHdStore`
- **描述**: 导入一个已存在的HD钱包存储。后端将同时创建`Wallet Identifier（导入的Keystore文件名的哈希值）和Source信息（如："Imported via mnemonic phrase"）`。
- **输入参数**:
  - `mnemonic`: 加密后的助记词
  - `overwrite`: 是否覆盖现有存储
  - `password`: 加密后的密码
  - `source`: 来源
  - `walletName`: 钱包名称
- **输出参数**:
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

### 3. 导入密钥库
- **接口**: `POST /api/deeperWallet/importKeyStore`
- **描述**: 导入一个密钥库文件。后端将同时创建`Wallet Identifier（导入的Keystore文件名的哈希值）和Source信息（如："Imported via keystore file"）`。
- **输入参数**:
  - `keystore`: 密钥库文件内容
  - `password`: 加密后的密码
  - `walletName`: 钱包名称
- **输出参数**:
  ```json
  {
    "success": true,
    "data": {
      "ids": ["98641afb-aee4-4f35-a72e-b1781d4741fd"]
    }
  }
  ```

### 4. 添加地址
- **接口**: `POST /api/deeperWallet/addAddress`
- **描述**: 为指定的密钥库添加一个新的地址。
- **输入参数**:
  - `id`: 密钥库ID
  - `password`: 加密后的密码
  - `chains`: 要添加地址的链数组，例如：`["Base", "Arbitrum", "Ethereum", "Bitcoin", "Tron"]`
- **输出参数**:
  ```json
  {
    "success": true,
    "data": {
      "address": "0xB9041f89c9399F3101e8E5456b90217d67f7252A",
      "name": "Account3"
    }
  }
  ```

### 5. 获取货币汇率
- **接口**: `GET /api/deeperWallet/getCurrencyExchangeRates`
- **描述**: 获取指定代币的当前汇率。
- **输入参数**:
  - `currency`: 货币名称（作为查询参数）
- **支持的货币**:
  USD, AED, AFN, ALL, AMD, ANG, AOA, ARS, AUD, AWG, AZN, BAM, BBD, BDT, BGN, BHD, BIF, BMD, BND, BOB, BRL, BSD, BTN, BWP, BYN, BZD, CAD, CDF, CHF, CLP, CNY, COP, CRC, CUP, CVE, CZK, DJF, DKK, DOP, DZD, EGP, ERN, ETB, EUR, FJD, FKP, FOK, GBP, GEL, GGP, GHS, GIP, GMD, GNF, GTQ, GYD, HKD, HNL, HRK, HTG, HUF, IDR, ILS, IMP, INR, IQD, IRR, ISK, JEP, JMD, JOD, JPY, KES, KGS, KHR, KID, KMF, KRW, KWD, KYD, KZT, LAK, LBP, LKR, LRD, LSL, LYD, MAD, MDL, MGA, MKD, MMK, MNT, MOP, MRU, MUR, MVR, MWK, MXN, MYR, MZN, NAD, NGN, NIO, NOK, NPR, NZD, OMR, PAB, PEN, PGK, PHP, PKR, PLN, PYG, QAR, RON, RSD, RUB, RWF, SAR, SBD, SCR, SDG, SEK, SGD, SHP, SLE, SLL, SOS, SRD, SSP, STN, SYP, SZL, THB, TJS, TMT, TND, TOP, TRY, TTD, TVD, TWD, TZS, UAH, UGX, UYU, UZS, VES, VND, VUV, WST, XAF, XCD, XDR, XOF, XPF, YER, ZAR, ZMW, ZWL
- **输出参数**:
  ```json
  {
    "success": true,
    "data": {
      "exchange_rate": 1.54
    }
  }
  ```

注意：
1. 返回的汇率值可能会根据市场实时变化。此处的 1.54 仅为示例值。
2. `currency` 参数应该是上述支持的货币之一。
3. 汇率可能是相对于某个基准货币（如 USD）的值，具体取决于 API 的实现。

### 6. 获取代币列表
- **接口**: `GET /api/deeperWallet/tokenList`
- **描述**: 获取指定网络的代币列表，包括余额和价格信息。
- **输入参数**:
  - `network`: 网络名称（作为查询参数）
  - `address`: 钱包地址（作为查询参数）
- **支持的网络**:
  - BITCOINCHAIN-MAINNET
  - BITCOINCHAIN-TESTNET
  - ETHEREUM
  - SEPOLIA
  - BNBSMARTCHAIN-MAINNET
  - BNBSMARTCHAIN-TESTNET
  - SOLANACHAIN-MAINNET
  - SOLANACHAIN-TESTNET
  - SOLANACHAIN-DEVNET
- **示例**: 
  对于 `network=BITCOINCHAIN-MAINNET`
- **输出参数**:
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
      {
        "contract_address": "0xC2C527C0CACF457746Bd31B2a698Fe89de2b6d44",
        "decimal": 6,
        "symbol": "BBB",
        "status": 1,
        "balance": "1000000",
        "price": "0.50"
      },
      {
        "contract_address": "0xC2C527C0CACF457746Bd31B2a698Fe89de2b6d49",
        "decimal": 6,
        "symbol": "USDT",
        "status": 1,
        "balance": "1000000",
        "price": "1.00"
      }
    ]
  }
  ```

注意：
1. `balance` 字段表示代币余额，需要根据 `decimal` 字段来解释实际数量。例如，对于 BTC，实际余额为 1 BTC。
2. `price` 字段表示每单位代币的美元价格。
3. 空的 `contract_address` 表示原生代币（如 BTC）。
4. `status` 字段可能表示代币的状态，1 可能表示活跃状态。
5. 返回的代币列表可能会根据不同的网络而变化。
6. 实际返回可能包含更多或更少的代币，取决于用户的钱包内容和网络状态。

### 7. 获取余额
- **接口**: `GET /api/deeperWallet/balance`
- **描述**: 获取特定地址在特定链上的余额。
- **输入参数**:
  - `address`: 钱包地址（字符串）
  - `chainType`: 链类型（字符串，如 'ETHEREUM', 'BITCOINCHAIN-MAINNET' 等）
- **输出参数**:
  ```json
  {
    "success": true,
    "data": {
      "balance": "1633670000000000000",
      "decimal": 18
    }
  }
  ```

注意：
1. `balance` 字段是字符串形式的原始余额，未经过小数点处理。
2. `decimal` 字段表示余额的小数位数，客户端应使用这个值来正确显示余额。
3. 输入参数 `address` 和 `chainType` 都是必需的。

### 8. 获取钱包信息
- **接口**: `GET /api/deeperWallet/getWalletInfo`
- **描述**: 获取钱包首次登录时的账户名称列表和每个账户下配置的区块链网络列表。
- **输入参数**: 无
- **输出参数**:
  ```json
  {
    "success": true,
    "data": {
      "accounts": [
        {
          "name": "Account 01",
          "supportedNetworks": ["Bitcoin", "ETHEREUM"]
        },
        {
          "name": "Account 02",
          "supportedNetworks": ["ETHEREUM", "SOLANA"]
        },
        {
          "name": "Account 03",
          "supportedNetworks": ["Bitcoin", "ETHEREUM", "SOLANA"]
        }
      ]
    }
  }
  ```

注意：
1. 此接口通常在首次登录时调用。
2. 如果进入页面时，缓存的 account 和 network 非空，则不需要调用这个接口。

### 9. 获取钱包名称
- **接口**: `GET /api/deeperWallet/getWalletName`
- **描述**: 获取钱包名称，用于在 dashboard 页面显示。
- **输入参数**: 无
- **输出参数**:
  ```json
  {
    "success": true,
    "data": {
      "name": "Ghost Assassin"
    }
  }
  ```

注意：
1. 此接口用于支持 V2 硬件钱包新增的编辑钱包名称功能。
2. 页面显示逻辑为：钱包名称 - 账户名称，例如：Ghost Assassin - Account 01。

### 10. 获取地址
- **接口**: `GET /api/deeperWallet/getAddress`
- **描述**: 获取当前账户和网络对应的地址。
- **输入参数**:
  - `account`: 账户名称（字符串）
  - `network`: 网络名称（字符串）
- **输出参数**:
  ```json
  {
    "success": true,
    "data": {
      "address": "0xA7a04258...9D04134D14"
    }
  }
  ```

注意：
1. 不同账户和网络对应的地址格式或类型可能完全不同。
2. 如果提供的账户或网络不存在，返回的地址将是空字符串。
3. 示例中的地址已经被截断，实际返回的地址将是完整的。

### 11. 重命名钱包
- **接口**: `POST /api/deeperWallet/renameWallet`
- **描述**: 重命名当前钱包。
- **输入参数**:
  ```json
  {
    "newName": "My Awesome Wallet"
  }
  ```
  - `newName` (string): 新的钱包名称
- **输出参数**:
  成功情况:
  ```json
  {
    "success": true,
    "data": {
      "name": "My Awesome Wallet"
    }
  }
  ```
  失败情况:
  ```json
  {
    "success": false
  }
  ```

注意：
1. 输入的 `newName` 不能为空字符串或仅包含空白字符。
2. 如果 `newName` 无效（为空、不是字符串等），接口将返回 `{ success: false }`。
3. 实际实现中需要添加额外的验证，比如最大长度限制、特殊字符限制等。
4. 此接口用于支持 V2 硬件钱包的编辑钱包名称功能。
5. 成功重命名后，新的钱包名称将在 walletDetail 页面显示。
