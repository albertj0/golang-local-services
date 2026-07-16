package main
import (
	"fmt"
	"net/http"
	"strconv"
)
func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		usd, _ := strconv.ParseFloat(r.URL.Query().Get("usd"), 64)
		fmt.Fprintf(w, "--- Currency Converter ---\n$%.2f USD is approx ₹%.2f INR", usd, usd*83.50)
	})
	fmt.Println("Currency Converter running on http://localhost:8088")
	http.ListenAndServe(":8088", nil)
}
