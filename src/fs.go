package main

import (
	"flag"
	"log"
	"net"
	"net/http"
)

func localMachineIP() string {
	conn, err := net.Dial("udp", "8.8.8.8:80")
	if err != nil {
		log.Fatal(err)
	}
	defer conn.Close()

	localAddr := conn.LocalAddr().(*net.UDPAddr)

	return localAddr.IP.String()
}

func main() {
	port := flag.String("p", "8100", "port to serve on")
	directory := flag.String("d", ".", "the directory of static file to host")
	flag.Parse()

	http.Handle("/", http.FileServer(http.Dir(*directory)))

	localIP := localMachineIP()
	log.Printf("Serving %s on http://%s:%s", *directory, localIP, *port)
	log.Fatal(http.ListenAndServe(":"+*port, nil))
}
