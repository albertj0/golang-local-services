package main
import (
	"fmt"
	"net/http"
	"strings"
)
func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		text := r.URL.Query().Get("text")
		fmt.Fprintf(w, "--- Word Counter ---\nWord Count: %d", len(strings.Fields(text)))
	})
	fmt.Println("Word Counter running on http://localhost:8087")
	http.ListenAndServe(":8087", nil)
}
