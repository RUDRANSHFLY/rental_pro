# Rental-Pro Backend

This is the backend for the Rental-Pro project. It uses Node.js, Express, and MySQL.

---

## Getting Started

### 1. Clone the repository

```sh
git clone https://github.com/RUDRANSHFLY/rental_pro
cd rental_pro/server
```

### 2. Install dependencies

```sh
npm install
```

### 3. Create `.env` file

Create a `.env` file in the `server` directory with the following content (edit values as needed):

```env
HOST=localhost
DB_USER=root
PASSWORD=your_mysql_password
DATABASE=datala
PORT=3000
```

### 4. Add your `schema.sql`

Place your `schema.sql` file in the `server` directory.  
Example:

```sql
CREATE TABLE IF NOT EXISTS LAND_RECORDS (
  PARCEL_ID VARCHAR(20) PRIMARY KEY,
  PLOT_NUMBER VARCHAR(20) NOT NULL,
  OWNER_NAME VARCHAR(100) NOT NULL,
  AREA VARCHAR(50),
  LOCATION VARCHAR(255),
  REGISTERATION_DATE DATETIME
);
```

### 5. Start the backend server

```sh
npm run dev
```

- On first run, the backend will create the database and tables if they do not exist.

---

## API

### GET `/api/lands`

Returns all land records.

**Example Response:**
```json
{
  "success": true,
  "data": [
    {
      "PARCEL_ID": "LPID001",
      "PLOT_NUMBER": "P-101",
      "OWNER_NAME": "Ravi Sharma",
      "AREA": "1200 sq.ft",
      "LOCATION": "123 Green Street, Delhi",
      "REGISTERATION_DATE": "2020-01-14T18:30:00.000Z"
    },
    {
      "PARCEL_ID": "LPID002",
      "PLOT_NUMBER": "P-102",
      "OWNER_NAME": "Sita Devi",
      "AREA": "1500 sq.ft",
      "LOCATION": "456 Blue Street, Mumbai",
      "REGISTERATION_DATE": "2019-06-09T18:30:00.000Z"
    }
  ]
}
```

---

### GET `/api/land?plot=P-101`

Returns the land record for a specific plot number as a **PDF file**.

**How to use:**
- Make a GET request to `/api/land?plot=<PLOT_NUMBER>`, replacing `<PLOT_NUMBER>` with the desired plot number.
- The response will be a downloadable PDF containing the land record details.

**Example:**
```
GET http://localhost:3000/api/land?plot=P-101
```
- This will download a PDF file with the details for plot number `P-101`.

---

## Notes

- Make sure your MySQL server is running.
- The backend will auto-create the database and tables on first run if they do not exist.
- Update your `.env` file with your actual MySQL credentials.
- CORS and JSON body parsing are enabled by default.