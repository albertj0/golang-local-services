package main
import (
	"fmt"
	"net/http"
	"strconv"
)
func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		weight, _ := strconv.ParseFloat(r.URL.Query().Get("weight"), 64)
		height, _ := strconv.ParseFloat(r.URL.Query().Get("height"), 64)
		if height > 0 {
			fmt.Fprintf(w, "--- BMI Calculator ---\nYour BMI: %.2f", weight/(height*height))
		} else {
			fmt.Fprint(w, "Usage: ?weight=70&height=1.75")
		}
	})
	fmt.Println("BMI Calculator running on http://localhost:8082")
	http.ListenAndServe(":8082", nil)
}
