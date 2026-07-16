package main
import (
	"fmt"
	"math/rand"
	"net/http"
	"time"
)
func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		rand.Seed(time.Now().UnixNano())
		fmt.Fprintf(w, "--- Dice Roller ---\nYou rolled a: %d", rand.Intn(6)+1)
	})
	fmt.Println("Dice Roller running on http://localhost:8086")
	http.ListenAndServe(":8086", nil)
}
