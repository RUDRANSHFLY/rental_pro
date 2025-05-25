import express from "express";
import "dotenv/config";
import { connection } from "./db.js";
import fs from "fs/promises";
import path from "path";
import cors from "cors";
import pdfDoc from "pdfkit";

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());

const getLands = async () => {
  await connection.connect();
  try {
    const [results] = await connection.query("SELECT * FROM LAND_RECORDS");
    console.log(results);
    return results;
  } catch (error) {
    console.log(error);
    throw new Error(error);
  }
};

const getLand = async (id) => {
  try {
    const [results] = await connection.query(
      "SELECT * FROM LAND_RECORDS WHERE PLOT_NUMBER = ?",
      [id]
    );
    console.log(results);
    return results;
  } catch (error) {
    console.log(error);
    throw new Error(error);
  }
};

app.get("/", (req, res) => {
  res.send("SERVER");
});

app.get("/api/land", async (req, res) => {
  try {
    const plot = req.query.plot;
    const land = await getLand(plot);
    if (land.length === 0) {
      res.status(404).json({
        success: false,
        message: "No record found for this plot number",
      });
    } else {
      console.log(`RECORD FOUND FOR ${plot}`);

      const doc = new pdfDoc();

      res.setHeader("Content-Type", "application/pdf");
      res.setHeader(
        "Content-Disposition",
        `attachment; filename=land_record_${plot}.pdf`
      );

      doc.pipe(res);
      doc.fontSize(10).text("Land Record Summary \n", {
        underline: true,
      });

      land.forEach((record, idx) => {
        doc.moveDown().fontSize(12).text(`Record #${record.ID}`);
        doc.text(`Parcel Id : ${record.PARCEL_ID}`);
        doc.text(`Plot Number : ${record.PLOT_NUMBER}`);
        doc.text(`Owner Name : ${record.OWNER_NAME}`);
        doc.text(`Area : ${record.AREA}`);
        doc.text(`Location : ${record.LOCATION}`);
        doc.text(
          `Registration Date : ${new Date(
            record.REGISTERATION_DATE
          ).toDateString()}`
        );
        doc.moveDown();
      });
      doc.end();
    }
  } catch (error) {
    res.status(500).json({
      success: false,
      message: error.message,
    });
  }
});

app.get("/api/lands", async (req, res) => {
  try {
    const lands = await getLands();
    res.status(200).json({
      success: true,
      data: lands,
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: error.message,
    });
  }
});

const ensureSchema = async () => {
  await connection.connect();
  const [rows] = await connection.query("SHOW TABLES LIKE 'LAND_RECORDS';");
  if (rows.length === 0) {
    // Table does not exist, run schema.sql
    const schemaPath = path.resolve("schema.sql");
    const schema = await fs.readFile(schemaPath, "utf8");
    await connection.query(schema);
    console.log("Database schema initialized.");
  } else {
    console.log("Database schema already exists.");
  }
};

const startSever = async () => {
  await ensureSchema();
  app.listen(PORT, () => {
    console.log("SERVER STARTED");
    console.log(`url : http://localhost:${PORT}/`);
  });
};

startSever();
