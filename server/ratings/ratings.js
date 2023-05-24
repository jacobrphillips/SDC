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

const port = process.env.PORT || 3004;

app.get("/", (req, res) => {
  res.send("Hello World!");
});

app.get("/api/epicratings", (req, res) => {
  res.status(404).json({ message: "Route not supported" });
});

app.get("/api/epicratings/:id", async (req, res) => {
  try {
    const results = await pool.query(
      "SELECT * FROM epicratings WHERE product_id = $1",
      [req.params.id]
    );

    res.json(results.rows);
  } catch (error) {
    res.json({ message: error });
    console.log(error);
  }
});

app.get("/api/ratings", (req, res) => {
  res.status(404).json({ message: "Route not supported" });
});

app.get("/api/ratings/:id", async (req, res) => {
  try {
    const results = await pool.query(
      "SELECT * FROM ratings WHERE product_id = $1",
      [req.params.id]
    );

    res.json(results.rows);
  } catch (error) {
    res.json({ message: error });
    console.log(error);
  }
});

app.get("/api/critics", (req, res) => {
  res.status(404).json({ message: "Route not supported" });
});

app.get("/api/critics/:id", async (req, res) => {
  try {
    const results = await pool.query(
      "SELECT * FROM critics WHERE product_id = $1",
      [req.params.id]
    );

    res.json(results.rows);
  } catch (error) {
    res.json({ message: error });
    console.log(error);
  }
});

app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
