package util

const (
	USD = "USD"
	EUR = "EUR"
	CNY = "CNY"
	CAD = "CAD"
)

func IsSupportedCurrency(currency string) bool {
	switch currency {
	case USD, EUR, CNY, CAD:
		return true
	}
	return false
}
