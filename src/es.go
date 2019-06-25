package main

import (
	"flag"
	"fmt"
	"io"
	"net/http"
	"net/http/httputil"
	"os"
)

type Handler struct {
	w            io.Writer
	withResponse bool
}

func (h *Handler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	dump, err := httputil.DumpRequest(r, true)
	if err != nil {
		http.Error(w, fmt.Sprint(err), http.StatusInternalServerError)
		return
	}

	if h.withResponse {
		_, err = fmt.Fprintf(w, "%s", dump)
		if err != nil {
			http.Error(w, fmt.Sprint(err), http.StatusInternalServerError)
			return
		}
	}

	_, err = fmt.Fprintf(h.w, "%s", dump)
	if err != nil {
		http.Error(w, fmt.Sprint(err), http.StatusInternalServerError)
		return
	}
}

func main() {
	port := flag.Int("p", 8080, "Port")
	withResponse := flag.Bool("r", false, "Return requested data as response")
	flag.Parse()
	handler := Handler{
		w:            os.Stdout,
		withResponse: *withResponse,
	}

	fmt.Printf("Start server on %d port\n", *port)
	fmt.Print(http.ListenAndServe(fmt.Sprintf(":%d", *port), &handler))

}
