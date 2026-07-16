package main
import (
	"fmt"
	"net/http"
	"strconv"
)
func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		a, _ := strconv.ParseFloat(r.URL.Query().Get("a"), 64)
		b, _ := strconv.ParseFloat(r.URL.Query().Get("b"), 64)
		fmt.Fprintf(w, "--- Calculator ---\nAdd: %.2f\nSub: %.2f", a+b, a-b)
	})
	fmt.Println("Calculator running on http://localhost:8081")
	http.ListenAndServe(":8081", nil)
}
