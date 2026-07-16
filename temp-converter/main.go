package main
import (
	"fmt"
	"net/http"
	"strconv"
)
func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		celsius, _ := strconv.ParseFloat(r.URL.Query().Get("celsius"), 64)
		fmt.Fprintf(w, "--- Temp Converter ---\n%.2f°C = %.2f°F", celsius, (celsius*9/5)+32)
	})
	fmt.Println("Temp Converter running on http://localhost:8084")
	http.ListenAndServe(":8084", nil)
}
