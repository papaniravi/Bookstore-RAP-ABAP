# Step 7: Deploy Sample Data and Test

## Part A: Deploy Initial Data

### 1. Insert Genres Data

Execute in SQL Console (SE16N or Data Preview in ADT):

```sql
INSERT INTO ZBOOK_GENRES VALUES ('100', 'Fiction', 'Fictional stories');
INSERT INTO ZBOOK_GENRES VALUES ('100', 'Science', 'Science and technology');
INSERT INTO ZBOOK_GENRES VALUES ('100', 'Cooking', 'Cooking and recipes');
INSERT INTO ZBOOK_GENRES VALUES ('100', 'Fantasy', 'Fantasy and magic');
INSERT INTO ZBOOK_GENRES VALUES ('100', 'Hobby', 'Hobbies and crafts');
INSERT INTO ZBOOK_GENRES VALUES ('100', 'Adventure', 'Adventure stories');
INSERT INTO ZBOOK_GENRES VALUES ('100', 'Self-Help', 'Self-help and motivation');
INSERT INTO ZBOOK_GENRES VALUES ('100', 'Non-Fiction', 'Non-fictional content');
INSERT INTO ZBOOK_GENRES VALUES ('100', 'Art', 'Visual and creative arts');
INSERT INTO ZBOOK_GENRES VALUES ('100', 'Children', 'Children books');
```

### 2. Insert Book Status Data

```sql
INSERT INTO ZBOOK_STATUS VALUES ('100', 'A', 'Available', 3);
INSERT INTO ZBOOK_STATUS VALUES ('100', 'L', 'Low Stock', 2);
INSERT INTO ZBOOK_STATUS VALUES ('100', 'U', 'Unavailable', 1);
```

### 3. Insert Sample Authors

```sql
-- Sample Authors (adjust UUIDs as needed for your system)
INSERT INTO ZBOOK_AUTHORS VALUES (
  '100',
  X'8F7CB3C19A524E638B7BFCF4E2A0D234',
  'John Smith',
  '20241231100000',
  'SYSTEM',
  '20241231100000',
  'SYSTEM'
);

INSERT INTO ZBOOK_AUTHORS VALUES (
  '100',
  X'C2EE8F8A07BB4272BC4B9F6A52FB114D',
  'Jane Williams',
  '20241231100500',
  'SYSTEM',
  '20241231100500',
  'SYSTEM'
);

INSERT INTO ZBOOK_AUTHORS VALUES (
  '100',
  X'A5D9EB734F7A49B29515FBC9F91CB9ED',
  'Robert Brown',
  '20241231101000',
  'SYSTEM',
  '20241231101000',
  'SYSTEM'
);

INSERT INTO ZBOOK_AUTHORS VALUES (
  '100',
  X'FA33A1E191414457 9B010F01DD7A2FF9',
  'Emily Davis',
  '20241231101500',
  'SYSTEM',
  '20241231101500',
  'SYSTEM'
);

INSERT INTO ZBOOK_AUTHORS VALUES (
  '100',
  X'4FBD2DF0EDF54DF0BC3727FB07C36A1A',
  'Michael Johnson',
  '20241231102000',
  'SYSTEM',
  '20241231102000',
  'SYSTEM'
);
```

### 4. Insert Sample Books

```sql
-- Book 1: The Silent Forest
INSERT INTO ZBOOK_BOOKS VALUES (
  '100',
  X'577679157D3643C3A8751D5E711D536B',
  'The Silent Forest',
  X'8F7CB3C19A524E638B7BFCF4E2A0D234',
  'Fiction',
  '20180412',
  340,
  49.99,
  'INR',
  25,
  'A',
  '20250101090000',
  'SYSTEM',
  '20250101090000',
  'SYSTEM'
);

-- Book 2: A Brief History of Space
INSERT INTO ZBOOK_BOOKS VALUES (
  '100',
  X'8B1D4B6D2C5F4C1CAC20E6A6E022F5B8',
  'A Brief History of Space',
  X'C2EE8F8A07BB4272BC4B9F6A52FB114D',
  'Science',
  '20210901',
  280,
  69.99,
  'INR',
  8,
  'L',
  '20250101090500',
  'SYSTEM',
  '20250101090500',
  'SYSTEM'
);

-- Book 3: Cooking with Fire
INSERT INTO ZBOOK_BOOKS VALUES (
  '100',
  X'B3C97C1F2E824C5D9F6345DE1C72BB7D',
  'Cooking with Fire',
  X'A5D9EB734F7A49B29515FBC9F91CB9ED',
  'Cooking',
  '20200217',
  220,
  39.99,
  'INR',
  0,
  'U',
  '20250101091000',
  'SYSTEM',
  '20250101091000',
  'SYSTEM'
);

-- Book 4: Winds of the North
INSERT INTO ZBOOK_BOOKS VALUES (
  '100',
  X'C4F874439B2D4B6EA1E1A65D6F47A6C5',
  'Winds of the North',
  X'FA33A1E191414457 9B010F01DD7A2FF9',
  'Fantasy',
  '20191103',
  410,
  59.90,
  'INR',
  15,
  'A',
  '20250101091500',
  'SYSTEM',
  '20250101091500',
  'SYSTEM'
);

-- Book 5: Gardening for Beginners
INSERT INTO ZBOOK_BOOKS VALUES (
  '100',
  X'2F0E3A28290240BF9A19E0BFF621ADFB',
  'Gardening for Beginners',
  X'4FBD2DF0EDF54DF0BC3727FB07C36A1A',
  'Hobby',
  '20220622',
  180,
  34.50,
  'INR',
  5,
  'L',
  '20250101092000',
  'SYSTEM',
  '20250101092000',
  'SYSTEM'
);
```

### 5. Insert Sample Chapters

```sql
-- Chapters for Book 1 (The Silent Forest)
INSERT INTO ZBOOK_CHAPTERS VALUES (
  '100',
  X'1A2B3C4D5E6F7A8B9C0D1E2F3A4B5C6D',
  X'577679157D3643C3A8751D5E711D536B',
  1,
  'The Beginning',
  25,
  '20250101100000',
  'SYSTEM',
  '20250101100000',
  'SYSTEM'
);

INSERT INTO ZBOOK_CHAPTERS VALUES (
  '100',
  X'2B3C4D5E6F7A8B9C0D1E2F3A4B5C6D7E',
  X'577679157D3643C3A8751D5E711D536B',
  2,
  'Into the Woods',
  30,
  '20250101100100',
  'SYSTEM',
  '20250101100100',
  'SYSTEM'
);

-- Chapters for Book 2 (A Brief History of Space)
INSERT INTO ZBOOK_CHAPTERS VALUES (
  '100',
  X'3C4D5E6F7A8B9C0D1E2F3A4B5C6D7E8F',
  X'8B1D4B6D2C5F4C1CAC20E6A6E022F5B8',
  1,
  'The Cosmos Begins',
  28,
  '20250101100200',
  'SYSTEM',
  '20250101100200',
  'SYSTEM'
);
```

---

## Part B: Test the OData Service

### 1. Open Service Binding

1. Navigate to Service Binding `ZBOOK_UI_BOOKSTORE_O4`
2. Click **Preview** button
3. Select entity **Books**

### 2. Test CRUD Operations

#### Create a New Book:
- Click **Create**
- Fill in the fields
- Click **Save**

#### Update a Book:
- Select a book
- Click **Edit**
- Change fields
- Click **Save**

#### Delete a Book:
- Select a book
- Click **Delete**
- Confirm deletion

### 3. Test Actions

#### Test Add Stock Action:
1. Select a book
2. Click on **Add stock** action
3. Verify stock increases by 10

#### Test Change Publish Date:
1. Select a book
2. Click on **Change publish date**
3. Enter new date
4. Click **Execute**

#### Test Change Status:
1. Select a book
2. Click on **Change status**
3. Select new status from dropdown
4. Click **Execute**

---

## Part C: Update UI5 App Manifest

Update the manifest.json of your UI5 app to point to the RAP service:

```json
"dataSources": {
  "mainService": {
    "uri": "/sap/opu/odata4/sap/zbook_ui_bookstore_o4/srvd/sap/zbook_ui_bookstore/0001/",
    "type": "OData",
    "settings": {
      "annotations": [],
      "odataVersion": "4.0"
    }
  }
}
```

---

## Part D: Deploy UI5 App

### Update ui5-deploy.yaml:

The ui5-deploy.yaml should already be configured from the previous deployment.

### Rebuild and Deploy:

```bash
cd app/bookstore-listview
npm run build
npm run deploy
```

The UI5 app will now connect to your RAP OData service instead of mock data!

---

## Part E: Verification Checklist

- [ ] All database tables created
- [ ] All CDS views activated
- [ ] Behavior definitions activated
- [ ] Behavior implementation classes created
- [ ] Service definition created
- [ ] Service binding created and published
- [ ] Metadata extensions activated
- [ ] Sample data inserted
- [ ] OData service tested in preview
- [ ] CRUD operations working
- [ ] Actions working (addStock, changePublishDate, changeStatus)
- [ ] UI5 app manifest updated
- [ ] UI5 app redeployed to ABAP
- [ ] UI5 app loads with real data from RAP

---

## Troubleshooting

### Issue: Service Not Found
- Check service binding is activated and published
- Verify service path in manifest.json matches published service

### Issue: Authorization Errors
- Check user has required authorizations
- Implement proper authorization checks in behavior definition

### Issue: Data Not Showing
- Verify data is inserted in database tables
- Check CDS view projections are correct
- Test service in service binding preview

### Issue: Draft Not Working
- Ensure draft tables are created
- Check draft action implementations
- Verify etag fields are mapped correctly

---

**Congratulations!** You now have a complete RAP Bookstore application running on your on-premise ABAP system with UI5 frontend!
