#!/bin/bash

echo "Creating 10 local Go services..."

# 1. Calculator Service (Port 8081)
mkdir calculator && cd calculator && go mod init calculator
cat << 'EOF' > main.go
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
EOF
cd ..

# 2. BMI Calculator Service (Port 8082)
mkdir bmi-calculator && cd bmi-calculator && go mod init bmi-calculator
cat << 'EOF' > main.go
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
EOF
cd ..

# 3. Age Calculator Service (Port 8083)
mkdir age-calculator && cd age-calculator && go mod init age-calculator
cat << 'EOF' > main.go
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
EOF
cd ..

# 4. Temperature Converter Service (Port 8084)
mkdir temp-converter && cd temp-converter && go mod init temp-converter
cat << 'EOF' > main.go
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
EOF
cd ..

# 5. String Reverser Service (Port 8085)
mkdir string-reverser && cd string-reverser && go mod init string-reverser
cat << 'EOF' > main.go
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
EOF
cd ..

# 6. Dice Roller Service (Port 8086)
mkdir dice-roller && cd dice-roller && go mod init dice-roller
cat << 'EOF' > main.go
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
EOF
cd ..

# 7. Word Counter Service (Port 8087)
mkdir word-counter && cd word-counter && go mod init word-counter
cat << 'EOF' > main.go
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
EOF
cd ..

# 8. Currency Converter Service (Port 8088)
mkdir currency-converter && cd currency-converter && go mod init currency-converter
cat << 'EOF' > main.go
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
EOF
cd ..

# 9. Quote Generator Service (Port 8089)
mkdir quote-generator && cd quote-generator && go mod init quote-generator
cat << 'EOF' > main.go
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
EOF
cd ..

# 10. Timestamp Service (Port 8090)
mkdir timestamp-server && cd timestamp-server && go mod init timestamp-server
cat << 'EOF' > main.go
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
EOF
cd ..

echo "All 10 local services created successfully!"
