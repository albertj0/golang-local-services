package main
import (
	"fmt"
	"net/http"
)
func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		text := r.URL.Query().Get("text")
		runes := []rune(text)
		for i, j := 0, len(runes)-1; i < j; i, j = i+1, j-1 {
			runes[i], runes[j] = runes[j], runes[i]
		}
		fmt.Fprintf(w, "--- String Reverser ---\nOriginal: %s\nReversed: %s", text, string(runes))
	})
	fmt.Println("String Reverser running on http://localhost:8085")
	http.ListenAndServe(":8085", nil)
}
