import express from "express"
import 'dotenv/config'




const app = express()
const PORT = process.env.PORT || 3000


app.get('/',(req,res) => {
    res.send("SERVER")
})

app.listen(PORT,() => {
    console.log('SERVER STARTED')
    console.log(`url : http://localhost:${PORT}/`)
})