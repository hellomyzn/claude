---
name: typescript-standards
description: TypeScript開発の規約とベストプラクティス。TypeScriptコード作成時、型定義時に使用。
allowed-tools: Read, Grep, Glob
---

# TypeScript開発規約

## 型定義のルール

### 新しい型を定義する前に

**必ず**Grepツールで既存の類似型を検索してください：

# 例：ユーザー関連の型を検索
Grep('User', 'src/types/')

見つかった既存の型定義を**Readツールで読み**、以下の点を確認してください：

- 命名規則（例：`UserProfile`、`UserSettings`）
- 必須プロパティとオプショナルプロパティの使い分け
- ジェネリクスの使用パターン

### 型の命名規則

型名は以下のパターンに従ってください：

// 良い例：エンティティ型
interface User {
　id: string;
　name: string;
}

// 良い例：プロパティ型
interface UserProfile {
　bio: string;
　avatar: string;
}

// 悪い例：曖昧な命名
interface Data {　// × 何のデータか不明確
　value: string;
}

### 非同期関数の型定義

非同期関数は、**必ず**`Promise`型を明示してください：

// 良い例
async function fetchUser(id: string): Promise<User> {
　const response = await api.get(`/users/${id}`);
　return response.data;
}

// 悪い例（禁止）
async function fetchUser(id: string) {　// × 戻り値の型が不明確
　const response = await api.get(`/users/${id}`);
　return response.data;
}

## 詳細情報

TypeScriptのベストプラクティス詳細については ./best-practices.md を参照してください。