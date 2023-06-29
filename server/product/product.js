import pg from "pg";
import express from "express";
import dotenv from "dotenv";
import cors from "cors";


const app = express();
dotenv.config();
app.use(cors());

const { Pool } = pg;
const pool = new Pool({ connectionString: process.env.DATABASE_URL });

const port = process.env.PORT || 3003;

app.get("/", (req, res) => {
  res.send("Hello World!");
});

app.get("/api/product", async (req, res) => {
  try {
    let result = await pool.query("SELECT * FROM product");
    res.json(result.rows);
  } catch (err) {
    res.status(500).json({ message: `Something went wrong: ${err}` });
  }
});

app.get("/api/product/:id", async (req, res) => {
  let id = req.params.id;
  try {
    let result = await pool.query(`SELECT * FROM product WHERE id = $1`, [id]);
    res.json(result.rows);
  } catch (err) {
    res.status(500).json({ message: `Something went wrong: ${err}` });
  }
});

app.listen(port, () => {
  console.log(`Server listening to port: ${port}`);
});
