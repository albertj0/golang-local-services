package main
import (
	"fmt"
	"math/rand"
	"net/http"
	"time"
)
func main() {
	quotes := []string{"Talk is cheap. Show me the code.", "Go will be the server language of the future."}
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		rand.Seed(time.Now().UnixNano())
		fmt.Fprintf(w, "--- Quote Generator ---\n%s", quotes[rand.Intn(len(quotes))])
	})
	fmt.Println("Quote Generator running on http://localhost:8089")
	http.ListenAndServe(":8089", nil)
}
