package main

import (
	"fmt"
	"io"
	"log"
	"net/http"
	"os"
)

func main() {
	fs := http.FileServer(http.Dir("files"))
	http.Handle("/", fs)

	http.HandleFunc("/products", Prods)

	log.Println("Executando...")
	log.Fatal(http.ListenAndServe(":2020", nil))
}

func Prods(w http.ResponseWriter, r *http.Request) {
	b, err := os.ReadFile("products.json")
	if err != nil {
		fmt.Print(err)
	}

	str := string(b)

	w.Header().Set("Content-Type", "application/json")
	io.WriteString(w, str)
}
