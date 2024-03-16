# Deeper Chain跨链转账接口说明

本指南为开发人员提供Deeper Chain跨链转账系统的详细API接口说明及其使用教程。旨在指导开发人员如何实现从Deeper Chain到其他区块链网络，以及从其他区块链网络到Deeper Chain的资金转移功能。

## 1. 系统配置

### 1.1 初始化配置

#### 设置资金池地址

**接口名称**: `set_fund_pool_address`

**功能描述**: 该接口用于配置或修改资金池地址。它是初始化跨链转账功能的关键步骤，确保资金在正确的池中管理和分配。

**参数说明**:

- `origin`: OriginFor<T> - 调用此接口的账户必须具备BridgeAdmin权限。该参数用于识别并验证调用者身份。
- `funder`: T::AccountId - 指定的资金池地址。所有跨链转账的资金都将从此账户中划拨。

**返回值**: DispatchResultWithPostInfo - 操作成功或失败的结果，包括相关的后续信息。

**权限要求**: 仅限具有BridgeAdmin权限的账户可调用此接口。

**事件**: 此接口调用不会触发任何事件。

**示例代码**:

```rust
// 设置资金池地址示例
set_fund_pool_address(origin, funder_account_id);
```

## 2. 跨链转账

### 2.1 由Deeper Chain跨链到其他区块链网络

#### 2.1.1 申请跨链转账

**接口名称**: `apply_for_bridge_transfer`

**功能描述**: 用户通过调用此接口申请从Deeper Chain向其他区块链网络转账。此操作是用户发起跨链转账流程的第一步。

**参数说明**:

- `origin`: OriginFor<T> - 用户的账户地址，用于对交易进行签名。
- `to`: String - 目标区块链网络的地址，可以兼容任何类型的地址格式。
- `amount`: BalanceOf<T> - 用户希望转账的金额。
- `chain`: String - 目标区块链网络的名称，如"Solana"、"Ethereum"等。

**返回值**: DispatchResultWithPostInfo - 操作成功或失败的结果，包括相关的后续信息。

**权限要求**: 任何用户都可以调用此接口发起跨链转账申请。

**事件**: `ApplyForBridgeTransfer(from, to, amount, chain)` - 此事件记录了跨链转账申请的详细信息，供系统其他部分使用。

**示例代码**:

```rust
// 用户向Solana网络申请跨链转账
apply_for_bridge_transfer(user_origin, solana_address, transfer_amount, "Solana");
```

#### 2.1.2 执行跨链转账

**接口名称**: `bridge_deeper_to_other`

**功能描述**: 服务端调用此接口执行实际的跨链转账操作，将资金从Deeper Chain转移到指定的其他区块链网络地址上。

**参数说明**:

- `origin`: OriginFor<T> - 授权地址，需具有BridgeAdmin权限，用于对交易进行签名。
- `to`: String - 目标区块链网络的地址。
- `from`: T::AccountId - 申请提现的用户地址。
- `amount`: BalanceOf<T> - 跨链转账的金额。
- `chain`: String - 目标区块链网络的名称。
- `data`: String - 附加的备注信息。

**返回值**: DispatchResultWithPostInfo - 操作成功或失败的结果，包括相关的后续信息。

**权限要求**: 仅限具有BridgeAdmin权限的账户可执行此跨链转账操作。

**事件**: `BridgeDeeperToOther(to, from, amount, chain, data)` - 此事件记录了跨链转账的详细信息，包括参与方、金额、

目标链和备注。

**示例代码**:

```rust
// 执行从Deeper Chain向Solana网络的跨链转账
bridge_deeper_to_other(server_origin, solana_address, user_account_id, transfer_amount, "Solana", "备注信息");
```

### 2.2 由其他区块链网络跨链到Deeper Chain

#### 2.2.1 执行跨链转账

**接口名称**: `bridge_other_to_deeper`

**功能描述**: 服务端调用此接口执行从其他区块链网络向Deeper Chain的跨链转账操作。此操作支持将资金从任何支持的区块链网络安全转移到Deeper Chain指定的账户上。

**参数说明**:

- `origin`: OriginFor<T> - 授权地址，需具有BridgeAdmin权限，用于对交易进行签名。
- `to`: T::AccountId - Deeper Chain用户地址。
- `from`: String - 来源区块链网络的地址。
- `amount`: BalanceOf<T> - 跨链转账的金额。
- `chain`: String - 来源区块链网络的名称。
- `data`: String - 附加的备注信息。

**返回值**: DispatchResultWithPostInfo - 操作成功或失败的结果，包括相关的后续信息。

**权限要求**: 仅限具有BridgeAdmin权限的账户可执行此跨链转账操作。

**事件**: `BridgeOtherToDeeper(to, from, amount, chain, data)` - 此事件记录了从其他区块链网络到Deeper Chain的跨链转账详细信息。

**示例代码**:

```rust
// 执行从Solana网络向Deeper Chain的跨链转账
bridge_other_to_deeper(server_origin, deeper_account_id, solana_address, transfer_amount, "Solana", "备注信息");
```
