import pg from "pg";
import express from "express";
import dotenv from "dotenv";
import cors from "cors";
import cookieParser from "cookie-parser";

const app = express();

dotenv.config();

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cookieParser());

const { Pool } = pg;
const pool = new Pool({ connectionString: process.env.DATABASE_URL });

const port = process.env.PORT || 3007;

app.get("/", (req, res) => {
  res.send("Hello World!");
});

app.get("/api/socials/:product_id", async (req, res) => {
  try {
    let result = await pool.query(
      `SELECT * FROM socials WHERE product_id = $1`,
      [req.params.product_id]
    );
    res.json(result.rows);
  } catch (err) {
    res.status(500).json({ message: `Something went wrong: ${err}` });
  }
});

app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
