import express from "express";
import bodyParser from "body-parser";
import path from "path";
import pg from "pg";
import { fileURLToPath } from "url";
import session from "express-session";

const db = new pg.Client({
  user: "postgres",
  host: "localhost",
  database: "dbmsproject",
  password: "8897",
  port: 5433,
});

const app = express();
const port = 3000;

db.connect();

const __dirname = path.dirname(fileURLToPath(import.meta.url));
app.use(express.static(path.join(__dirname, "public")));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.use(
  session({
    secret: "secretkey123",
    saveUninitialized: false,
    cookie: { secure: false },
  })
);

app.get("/admin_home", (req, res) => {
  res.sendFile(path.join(__dirname, "public", "admin_home.html"));
});

app.get("/customer_home", (req, res) => {
  res.sendFile(path.join(__dirname, "public", "customer_home.html"));
});

app.get("/order_success", (req, res) => {
  res.sendFile(path.join(__dirname, "public", "order_success.html"));
});

app.get("/my_orders", (req, res) => {
  res.sendFile(path.join(__dirname, "public", "my_orders.html"));
});

app.get("/customer_add", (req, res) => {
  res.sendFile(path.join(__dirname, "public", "customer_add.html"));
});

app.get("/customer_update", (req, res) => {
  res.sendFile(path.join(__dirname, "public", "customer_update.html"));
});

app.get("/customer_delete", (req, res) => {
  res.sendFile(path.join(__dirname, "public", "customer_delete.html"));
});

app.get("/product_add", (req, res) => {
  res.sendFile(path.join(__dirname, "public", "product_add.html"));
});

app.get("/product_update", (req, res) => {
  res.sendFile(path.join(__dirname, "public", "product_update.html"));
});

app.get("/product_delete", (req, res) => {
  res.sendFile(path.join(__dirname, "public", "product_delete.html"));
});

app.get("/order_add", (req, res) => {
  res.sendFile(path.join(__dirname, "public", "order_add.html"));
});

app.get("/order_update", (req, res) => {
  res.sendFile(path.join(__dirname, "public", "order_update.html"));
});

app.get("/order_delete", (req, res) => {
  res.sendFile(path.join(__dirname, "public", "order_delete.html"));
});

app.get("/seller_add", (req, res) => {
  res.sendFile(path.join(__dirname, "public", "seller_add.html"));
});

app.get("/seller_update", (req, res) => {
    res.sendFile(path.join(__dirname, "public", "seller_update.html"));
});

app.get("/seller_delete", (req, res) => {
  res.sendFile(path.join(__dirname, "public", "seller_delete.html"));
});

app.get("/reviews_add", (req, res) => {
  res.sendFile(path.join(__dirname, "public", "reviews_add.html"));
});

app.get("/reviews_update", (req, res) => {
  res.sendFile(path.join(__dirname, "public", "reviews_update.html"));
});

app.get("/reviews_delete", (req, res) => {
  res.sendFile(path.join(__dirname, "public", "reviews_delete.html"));
});

app.listen(port, () => {
  console.log(`server is running on http://localhost:${port}`);
});

app.post("/customer/add", async (req, res) => {
  const { customer_id, name, email, contact, address_id } = req.body;
  const query =
    "INSERT INTO customers (customer_id, name, email, contact, address_id) VALUES ($1, $2, $3, $4, $5)";
  try {
    const result = await db.query(query, [
        customer_id,
      name,
      email,
      contact,
      address_id,
    ]);
    res.redirect("/admin_home");
  } catch (error) {
    console.error("Failed to add customer:", error);
    res.status(500).send("Error adding new customer");
  }
});

app.post("/customer/update", async (req, res) => {
  const { customer_id, name, email, contact, address_id } = req.body;
  const query =
    "UPDATE customers SET name = $2, email = $3, contact = $4, address_id = $5 WHERE customer_id = $1";
  try {
    const result = await db.query(query, [
      customer_id,
      name,
      email,
      contact,
      address_id,
    ]);
    res.redirect("/admin_home");
  } catch (error) {
    console.error("Failed to update customer:", error);
    res.status(500).send("Error updating customer");
  }
});

app.post("/customer/delete", async (req, res) => {
  const { customer_id } = req.body;
  const query = "DELETE FROM customers WHERE customer_id = $1;";
  try {
    const result = await db.query(query, [customer_id]);
    res.redirect("/admin_home");
  } catch (error) {
    console.error("Failed to delete customer:", error);
    res.status(500).send("Error deleting customer");
  }
});

app.post("/order/add", async (req, res) => {
  const {
    order_id,
    customer_id,
    order_date,
    total,
    payment_id,
  } = req.body;
  const query = `
    INSERT INTO orders (order_id, customer_id, order_date, total, payment_id)
    VALUES ($1, $2, $3, $4, $5);
  `;
  try {
    const result = await db.query(query, [
      order_id,
      customer_id,
      order_date,
      total,
      payment_id,
    ]);
    res.redirect("/admin_home");
  } catch (error) {
    console.error("Failed to add order:", error);
    res.status(500).send("Error adding new order");
  }
});

// Update order
app.post("/order/update", async (req, res) => {
  const {
    order_id,
    customer_id,
    order_date,
    total,
    payment_id,
  } = req.body;
  
  const query = `
    UPDATE orders
    SET customer_id = $2, order_date = $3, total = $4, payment_id = $5
    WHERE order_id = $1;
  `;
  
  try {
    const result = await db.query(query, [
      order_id,
      customer_id,
      order_date,
      total,
      payment_id,
    ]);
    res.redirect("/admin_home");
  } catch (error) {
    console.error("Failed to update order:", error);
    res.status(500).send("Error updating order");
  }
});

app.post("/order/delete", async (req, res) => {
  const { order_id } = req.body;
  const query = "DELETE FROM orders WHERE order_id = $1;";
  try {
    const result = await db.query(query, [order_id]);
    res.redirect("/admin_home");
  } catch (error) {
    console.error("Failed to delete order:", error);
    res.status(500).send("Error deleting order");
  }
});

app.post("/product/add", async (req, res) => {
  const {
    product_id,
    name,
    category_id,
    price,
    dimensions,
  } = req.body;
  const query = `
    INSERT INTO products (product_id, name, category_id, price, dimensions)
    VALUES ($1, $2, $3, $4, $5);
  `;
  try {
    const result = await db.query(query, [
      product_id,
      name,
      category_id,
      price,
      dimensions,
    ]);
    res.redirect("/admin_home");
  } catch (error) {
    console.error("Failed to add product:", error);
    res.status(500).send("Error adding new product");
  }
});

app.post("/product/update", async (req, res) => {
  const {
    product_id,
    name,
    category_id,
    price,
    dimensions,
  } = req.body;
  
  const query = `
    UPDATE products
    SET name = $2, category_id = $3, price = $4, dimensions = $5
    WHERE product_id = $1;
  `;
  
  try {
    const result = await db.query(query, [
      product_id,
      name,
      category_id,
      price,
      dimensions,
    ]);
    res.redirect("/admin_home");
  } catch (error) {
    console.error("Failed to update product:", error);
    res.status(500).send("Error updating product");
  }
});

app.post("/product/delete", async (req, res) => {
  const { product_id } = req.body;
  const query = "DELETE FROM products WHERE product_id = $1;";
  try {
    const result = await db.query(query, [product_id]);
    res.redirect("/admin_home");
  } catch (error) {
    console.error("Failed to delete product:", error);
    res.status(500).send("Error deleting product");
  }
});

app.post("/seller/add", async (req, res) => {
  const { seller_id, name, contact, address_id } = req.body;
  const query =
    "INSERT INTO sellers (seller_id, name, contact, address_id) VALUES ($1, $2, $3, $4)";
  try {
    const result = await db.query(query, [
      seller_id,
      name,
      contact,
      address_id,
    ]);
    res.redirect("/admin_home");
  } catch (error) {
    console.error("Failed to add seller:", error);
    res.status(500).send("Error adding new seller");
  }
});

app.post("/seller/update", async (req, res) => {
  const { seller_id, name, contact, address_id } = req.body;

  const query = `
    UPDATE sellers
    SET name = $2, contact = $3, address_id = $4
    WHERE seller_id = $1;
  `;

  try {
    const result = await db.query(query, [
      seller_id,
      name,
      contact,
      address_id,
    ]);
    res.redirect("/admin_home");
  } catch (error) {
    console.error("Failed to update seller:", error);
    res.status(500).send("Error updating seller");
  }
});

app.post("/seller/delete", async (req, res) => {
  const { seller_id } = req.body;
  const query = "DELETE FROM sellers WHERE seller_id = $1";
  try {
    const result = await db.query(query, [seller_id]);
    res.redirect("/admin_home");
  } catch (error) {
    console.error("Failed to delete seller:", error);
    res.status(500).send("Error deleting seller");
  }
});

app.post("/review/add", async (req, res) => {
  const { review_id, order_id, customer_id, rating, comment } = req.body;
  const query =
    "INSERT INTO reviews (review_id, order_id, customer_id, rating, comment) VALUES ($1, $2, $3, $4, $5)";
  try {
    const result = await db.query(query, [review_id, order_id, customer_id, rating, comment]);
    res.redirect("/admin_home");
  } catch (error) {
    console.error("Failed to add review:", error);
    res.status(500).send("Error adding new review");
  }
});

app.post("/review/update", async (req, res) => {
  const { review_id, order_id, customer_id, rating, comment } = req.body;

  const query = `
    UPDATE reviews
    SET order_id = $2, customer_id = $3, rating = $4, comment = $5
    WHERE review_id = $1;
  `;

  try {
    const result = await db.query(query, [
      review_id,
      order_id,
      customer_id,
      rating,
      comment,
    ]);
    res.redirect("/admin_home");
  } catch (error) {
    console.error("Failed to update review:", error);
    res.status(500).send("Error updating review");
  }
});

app.post("/review/delete", async (req, res) => {
  const { review_id } = req.body;
  const query = "DELETE FROM reviews WHERE review_id = $1";
  try {
    const result = await db.query(query, [review_id]);
    res.redirect("/admin_home");
  } catch (error) {
    console.error("Failed to delete review:", error);
    res.status(500).send("Error deleting review");
  }
});

app.get("/get/products", async (req, res) => {
  try {
    const query = `
    SELECT 
    product_id, 
    name, 
    category_id,
    price,
    dimensions
    FROM products;
    `;
    const result = await db.query(query);
    res.json(result.rows);
  } catch (error) {
    console.error("Error fetching products:", error);
    res.status(500).send("Error retrieving products");
  }
});

app.get("/order/view/customer", async (req, res) => {
  try {
    const result = await db.query(
      "SELECT  c.customer_id, c.name, o.total FROM orders o JOIN customers c ON o.customer_id=c.customer_id order by total DESC limit 3",
    );
    console.log("Query Result:", result.rows);
    res.json(result.rows);
  } catch (error) {
    console.error("Error fetching orders data:", error);
    res.status(500).send("Error retrieving orders data");
  }
});

app.get("/order/view/complex", async (req, res) => {
  try {
    const result = await db.query(
      "SELECT  c.customer_id, c.name, o.total FROM orders o JOIN customers c ON o.customer_id=c.customer_id order by total DESC limit 3",
    );
    console.log("Query Result:", result.rows);
    res.json(result.rows);
  } catch (error) {
    console.error("Error fetching orders data:", error);
    res.status(500).send("Error retrieving orders data");
  }
});

app.post("/submit-query", async (req, res) => {
  const { sqlQuery } = req.body;
  try {
    const queryResult = await db.query(sqlQuery);
    req.session.queryResults = queryResult.rows;
    res.redirect("/query_results.html");
  } catch (error) {
    console.error("Failed to execute query:", error);
    res.status(500).send("Failed to execute query");
  }
});

app.get("/get-query-results", (req, res) => {
  if (req.session.queryResults) {
    res.json(req.session.queryResults);
  } else {
    res.status(404).send("No query results area avilable");
  }
});
