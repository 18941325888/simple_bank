package util

import (
	"fmt"
	"math/rand"
	"strings"
	"time"
)

const alphbet = "abcdefghijklmnopqrstuvwxyz"

func init() {
	rand.Seed(time.Now().Unix())
}

func RandomInt(min, max int64) int64 {
	return min + rand.Int63n(max-min+1)
}

func RandomString(n int) string {
	var sb strings.Builder
	k := len(alphbet)
	for i := 0; i < n; i++ {
		c := alphbet[rand.Intn(k)]
		sb.WriteByte(c)
	}
	return sb.String()
}

func RandomOwner() string {
	return RandomString(6)
}

func RandomMoney() int64 {
	return RandomInt(10, 9999)
}

func RandomCurrency() string {
	currencies := []string{USD, EUR, CAD, CNY}
	n := len(currencies)
	return currencies[rand.Intn(n)]
}
func RandomEmail() string {
	return fmt.Sprintf("%s@email.com", RandomString(8))
}
