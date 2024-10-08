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

### 4. 获取货币汇率
- **接口**: `GET /api/deeperWallet/currencyExchangeRates`
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

### 5. 获取代币列表
- **接口**: `GET /api/deeperWallet/tokenList`
- **描述**: 获取指定网络的代币列表，包括余额和价格信息。
- **输入参数**:
  - `network`: 网络名称（作为查询参数）
  - `address`: 钱包地址（作为查询参数）
- **支持的网络**:
  - BITCOIN
  - BITCOIN-TESTNET
  - ETHEREUM
  - ETHEREUM-SEPOLIA
  - BNBSMARTCHAIN
  - BNBSMARTCHAIN-TESTNET
  - SOLANA
  - SOLANA-TESTNET
  - SOLANA-DEVNET
- **示例**: 
  对于 `network=BITCOIN`
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

### 6. 获取余额
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

### 7. 获取钱包信息
- **接口**: `GET /api/deeperWallet/walletInfo`
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
          "index": 1,
          "supportedNetworks": ["Bitcoin", "ETHEREUM"]
        },
        {
          "name": "Account 02",
          "index": 2,
          "supportedNetworks": ["ETHEREUM", "SOLANA"]
        },
        {
          "name": "Account 03",
          "index": 3,
          "supportedNetworks": ["Bitcoin", "ETHEREUM", "SOLANA"]
        }
      ]
    }
  }
  ```

注意：
1. 此接口通常在首次登录时调用。
2. 如果进入页面时，缓存的 account 和 network 非空，则不需要调用这个接口。

### 8. 获取钱包名称
- **接口**: `GET /api/deeperWallet/walletName`
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

### 9. 获取地址
- **接口**: `GET /api/deeperWallet/fetchAddress`
- **描述**: 获取指定账户索引下所有支持网络的地址。
- **输入参数**:
  - `index`: 账户索引
- **输出参数**:
  ```json
  {
    "success": true,
    "data": {
      "BITCOIN": "bc1qxy2kgdygjrsqtzq2n0yrf2493p83kkfjhx0wlh",
      "ETHEREUM": "0xA7a04258...9D04134D14",
      "SOLANA": "5FHneW46xGXgs5mUiveU4sbTyGBzmstUspZC92UhjJM694ty"
    }
  }
  ```

注意：
1. 返回的 `data` 对象包含了该账户索引下所有支持网络的地址。
2. 不同网络对应的地址��式或类型可能完全不同。
3. 如果某个网络不在于指定的账户索引下，该网络将不会出现在返回的数据中。
4. 账户索引是字符串类型，例如 "1", "2", "3" 等。
5. 网络名称作为键，是大写的，如 "BITCOIN", "ETHEREUM", "SOLANA" 等。
6. 示例中的以太坊地址已被截断，实际返回的地址将是完整的。

### 10. 重命名钱包
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

### 11. 获取钱包注释信息
- **接口**: `GET /api/deeperWallet/walletNote`
- **描述**: 获取钱包的标识符和来源信息。
- **输入参数**: 无
- **输出参数**:
  ```json
  {
    "success": true,
    "data": {
      "identifier": "Im14x5C7fgFVHAEtDHAGaFMDgT9htCBCFd6AfW5",
      "source": "Import via mnemonic phrase"
    }
  }
  ```

### 12. 添加账户
- **接口**: `POST /api/deeperWallet/addAccount`
- **描述**: 为指定的密钥库添加一个新的地址。
- **输入参数**:
  - `id`: 密钥库ID
  - `password`: 加密后的密码
  - `chains`: 要添加地址的链数组，例如：`["Base", "Arbitrum", "Ethereum", "Bitcoin", "Tron"]`
- **输出参数**:
  ```json
  {
    "success": true
  }
  ```

注意：
1. `identifier` 字段是钱包的唯一标识符，可能是生成或导入的 Keystore 文件名的哈希值。
2. `source` 字段描述了钱包的创建或导入方式，例如 "Import via mnemonic phrase"（通过助记词导入）。
3. 这个接口可以用于显示钱包的额外信息，如在设置或详情页面中。
4. 实际的 `identifier` 和 `source` 值可能会根据钱包的创建或导入方式而变化。

### 13. 重命名账户
- **接口**: `POST /api/deeperWallet/renameAccount`
- **描述**: 重命名指定索引的账户。此操作将更改账户的显示名称，但不会影响账户的其他属性或关联的地址。
- **输入参数**:
  - `index`: 要重命名的账户索引
  - `newName`: 新的账户名称
- **输出参数**:
  成功情况:
  ```json
  {
    "success": true,
    "data": {
      "name": "My Savings Account"
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
1. 账户索引从1开始计数。
2. 新名称不能为空，且应该有合理的长度限制（例如，不超过50个字符）。
3. `password` 用于验证用户身份，确保只有授权用户可以进行重命名操作。
4. 如果指定索引的账户不存在，密码验证失败，或重命名操作失败，将返回 `{ "success": false }`。
5. 重命名操作不会改变账户的索引或关联的加密货币地址。
6. 客户端应在重命名后刷新账户列表以显示更新后的名称。

### 14. 删除账户
- **接口**: `POST /api/deeperWallet/deleteAccount`
- **描述**: 删除指定索引的账户。此操作将从钱包中移除该账户，但不会影响区块链上的任何资产。
- **输入参数**:
  - `index`: 要删除的账户索引
  - `password`: 加密后的密码
- **输出参数**:
  成功情况:
  ```json
  {
    "success": true
  }
  ```
  失败情况:
  ```json
  {
    "success": false
  }
  ```

注意：
1. 账户索引从1开始计数。
2. `password` 用于验证用户身份，确保只有授权用户可以进行删除操作。
3. 如果尝试删除不存在的账户，密码验证失败，或删除操作失败，将返回 `{ "success": false }`。
4. 删除账户不会影响该账户在区块链上的任何资产或交易历史。用户应在删除前确保已备份私钥或助记词。
5. 建议在用户界面中清晰地说明删除账户的影响和不可逆性。

### 15. 导出Keystore
- **接口**: `GET /api/deeperWallet/exportKeystore`
- **描述**: 导出当前钱包的keystore信息。这个keystore包含了钱包的基本信息，但不包含私钥。
- **输入参数**: 无
- **输出参数**:
  成功情况:
  ```json
  {
    "success": true,
    "data": {
      "id": "some-id",
      "name": "deeper",
      "source": "MNEMONIC",
      "accounts": [],
      "created_at": 1634567890123
    }
  }
  ```
  失败情况:
  ```json
  {
    "success": false,
    "error": "Failed to export keystore"
  }
  ```

注意：
1. 这个接口不需要输入参数，直接返回当前钱包的keystore信息。
2. 返回的keystore不包含私钥信息，只包含钱包的基本元数据。
3. `created_at` 字段是一个Unix时间戳，表示钱包创建的时间。
4. `accounts` 数组在这个示例中是空的，实际使用时可能包含账户信息。

### 16. 导出私钥
- **接口**: `POST /api/deeperWallet/exportPrivateKey`
- **描述**: 导出指定账户的加密私钥。
- **输入参数**:
  - `password`: 加密后的用户密码（用于解密私钥）
- **输出参数**:
  成功情况:
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
  失败情况:
  ```json
  {
    "success": false,
    "error": "Invalid password or failed to export private key"
  }
  ```

注意：
1. 这个接口需要用户提供密码作为输入参数，用于验证用户身份和解密私钥。
2. 返回的私钥是加密的，`value` 字段包含了加密后的私钥数据。
3. `type` 字段可能表示私钥的类型或加密方式。
4. 导出私钥是一个敏感操作，应该警告用户保护好导出的私钥信息。
5. 在实际应用中，建议对密码进行加密后再传输，以增加安全性。