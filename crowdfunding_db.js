const express = require("express");
const app = express();
const mysql = require("mysql");
const cors = require("cors");
const db = mysql.createPool({
  host: "127.0.0.1",
  database: "crowdfunding_db",
  user: "crowd",
  password: "123456",
  timeout: 5000,
  timezone: "utf-8",
});

app.use(cors());

app.get("/api/getfundraiserList", (req, res) => {
  try {
    db.query(
      `SELECT fundraiser.*,category.NAME FROM fundraiser,category where fundraiser.CATEGORY_ID=category.CATEGORY_ID and fundraiser.active=1`,
      (err, result) => {
        res.send({
          code: 200,
          msg: "Get Success",
          data: result,
        });
      }
    );
  } catch (err) {
    console.log(err);
  }
});

app.get("/api/getCategoryList", (req, res) => {
  try {
    db.query(`SELECT * FROM category `, (err, result) => {
      res.send({
        code: 200,
        msg: "Get Success",
        data: result,
      });
    });
  } catch (err) {
    console.log(err);
  }
});

app.get("/api/getfundraiserList1/:organizer?/:city?/:category?", (req, res) => {
  let { organizer, city, category } = req.query;
  console.log(req.params);
  if (req.params)
    try {
      let sql = `SELECT fundraiser.*,category.NAME FROM fundraiser,category where fundraiser.CATEGORY_ID=category.CATEGORY_ID and fundraiser.active=1 and `;
      let str = ``;
      if (organizer) {
        str += `fundraiser.ORGANIZER='${organizer}'`;
      }
      if (city) {
        str += `fundraiser.CITY='${city}'`;
      }
      if (category) {
        str += `fundraiser.CATEGORY='${category}'`;
      }
      console.log(`${sql}${str}`);
      db.query(`${sql}${str}`, (err, result) => {
        res.send({
          code: 200,
          msg: "Get Success",
          data: result,
        });
      });
    } catch (err) {
      console.log(err);
    }
});

app.get("/api/getfundraiserList2/:id", (req, res) => {
  let { id } = req.params;
  try {
    db.query(
      `SELECT fundraiser.*,category.NAME FROM fundraiser,category where fundraiser.CATEGORY_ID=category.CATEGORY_ID and fundraiser.active=1 and fundraiser.FUNDRAISER_ID=${id}`,
      (err, result) => {
        res.send({
          code: 200,
          msg: "Get Success",
          data: result,
        });
      }
    );
  } catch (err) {
    console.log(err);
  }
});

app.listen(8085, () => {
  console.log("server is running");
});
