import pg from "pg";
import express from "express";
import dotenv from "dotenv";
import cors from "cors";
import cookieParser from "cookie-parser";

const port = process.env.PORT || 3008;

const app = express();

dotenv.config();

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cookieParser());

const { Pool } = pg;
const pool = new Pool({ connectionString: process.env.DATABASE_URL });

app.get("/", (req, res) => {
  res.send("Hello World!");
});

app.get("/api/achievements/:productID", (req, res) => {
  pool
    .query("SELECT * from achievements WHERE product_id = $1", [
      req.params.productID,
    ])
    .then((result) => {
      if (result.rows.length == 0) {
        res.status(404).send("No Editions Found For This Product");
      } else {
        res.send(result.rows);
      }
    });
});

app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
