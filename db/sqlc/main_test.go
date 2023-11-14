package db

import (
	"database/sql"
	"log"
	"os"
	"testing"

	_ "github.com/lib/pq"
	"github.com/techschool/simplebank/util"
)

// const (
// 	dbDriver = "postgres"
// 	dbSource = "postgresql://root:15082003Pt@localhost:5432/simple_bank?sslmode=disable"
// )

var testQueries *Queries
var testDB *sql.DB

func TestMain(m *testing.M) {
	config, err := util.LoadConfig("../..")
	if err != nil {
		log.Fatal("cannot load config", err)
	}
	testDB, err = sql.Open(config.DBDriver, config.DBSource)
	if err != nil {
		log.Fatal("cannot connect to db")
	}
	testQueries = New(testDB)
	os.Exit(m.Run())
}
