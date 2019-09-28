package grpc

import (
	"log"
	"testing"
)

func TestContains(t *testing.T) {
	polygon := [][]float32{
		{0, 0},
		{2, 0},
		{2, 4},
		{0, 4},
	}

	cs := Coordinates{
		Lon: 2,
		Lat: 1,
	}

	if !contains(cs, polygon) {
		log.Fatal("Error")
	}
}

func TestContinent(t *testing.T) {
	cs := Coordinates{
		Lon: 37.617633,
		Lat: 55.755786,
	}

	c, err := continent(cs)
	if err != nil || c != Europe {
		log.Fatalf("Expected: Europe, Actual: %s, Error: %v", c, err)
	}
}
