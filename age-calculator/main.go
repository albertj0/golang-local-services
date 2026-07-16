package main
import (
	"fmt"
	"net/http"
	"strconv"
	"time"
)
func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		year, _ := strconv.Atoi(r.URL.Query().Get("year"))
		if year > 0 {
			fmt.Fprintf(w, "--- Age Service ---\nYou are roughly %d years old.", time.Now().Year()-year)
		} else {
			fmt.Fprint(w, "Usage: ?year=2004")
		}
	})
	fmt.Println("Age Calculator running on http://localhost:8083")
	http.ListenAndServe(":8083", nil)
}
