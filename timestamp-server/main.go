package main
import (
	"fmt"
	"net/http"
	"time"
)
func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "--- Timestamp Service ---\nCurrent Time: %s", time.Now().Format(time.RFC1123))
	})
	fmt.Println("Timestamp Server running on http://localhost:8090")
	http.ListenAndServe(":8090", nil)
}
