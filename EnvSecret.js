function mySecrets(){
    // change raspberry ip address base on current wifi
    // hostname -I
    return({
        raspberry: "http://192.168.100.133:3002",
        api: "http://127.0.0.1:8002",
        secret: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9-doqbpqixCA7QSr8kYsGmWCz-fX0b1gt2oTMlGwTl_w"
    })
}