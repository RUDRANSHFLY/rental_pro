import mysql from "mysql2"
import 'dotenv/config'


export const connection = mysql.createConnection({
    host : process.env.HOST,
    user : process.env.DB_USER,
    password : process.env.PASSWORD,
    database : process.env.DATABASE,
    multipleStatements : true
}).promise()