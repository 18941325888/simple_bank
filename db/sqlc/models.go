// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.14.0

package db

import (
	"time"
)

type Account struct {
	ID int64 `json:"id"`
	// 用户
	Owner string `json:"owner"`
	// 余额
	Balance int64 `json:"balance"`
	// 币种
	Currency string `json:"currency"`
	// 创建时间
	CreatedAt time.Time `json:"created_at"`
}

type Entry struct {
	ID int64 `json:"id"`
	// 用户id
	AccountID int64 `json:"account_id"`
	// 交易金额
	Amount int64 `json:"amount"`
	// 创建时间
	CreatedAt time.Time `json:"created_at"`
}

type Transfer struct {
	ID int64 `json:"id"`
	// 转出用户id
	FromAccountID int64 `json:"from_account_id"`
	// 转入账户id
	ToAccountID int64 `json:"to_account_id"`
	// 转账金额
	Amount int64 `json:"amount"`
	// 创建时间
	CreatedAt time.Time `json:"created_at"`
}

type User struct {
	// owner
	Username string `json:"username"`
	// 密码
	HashedPassword string `json:"hashed_password"`
	// 全名
	FullName string `json:"full_name"`
	// 电子邮件
	Email string `json:"email"`
	// 上次修改密码时间
	PasswordChangeAt time.Time `json:"password_change_at"`
	// 创建时间
	CreatedAt time.Time `json:"created_at"`
}
