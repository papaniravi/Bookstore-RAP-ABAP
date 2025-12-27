# Installation Guide - Bookstore RAP Application

## 🎯 Quick Installation Steps

### Step 1: Clone Repository via abapGit in Eclipse

1. **Open Eclipse ADT**
2. **Window** → **Show View** → **Other** → **abapGit Repositories**
3. Click **Clone Repository** (green + icon)
4. Enter:
   - **URL**: `/home/user/projects/Bookstore-RAP-ABAP` (or your GitHub URL after push)
   - **Package**: `ZDEV`
   - **Transport**: `DS4K905910`
5. Click **Finish**
6. **DO NOT PULL YET** - First create database tables!

---

### Step 2: Create Database Tables First!

**⚠️ IMPORTANT**: Create tables BEFORE pulling/activating CDS views!

Execute in SE11 or copy/paste in ADT SQL Console:

#### Table 1: ZBOOK_GENRES
```sql
@EndUserText.label : 'Bookstore - Genres'
@AbapCatalog.tableCategory : #TRANSPARENT
define table zbook_genres {
  key client : abap.clnt not null;
  key code : abap.char(20) not null;
  description : abap.char(100);
}
```

#### Table 2: ZBOOK_STATUS
```sql
@EndUserText.label : 'Bookstore - Book Status'
@AbapCatalog.tableCategory : #TRANSPARENT
define table zbook_status {
  key client : abap.clnt not null;
  key code : abap.char(1) not null;
  display_text : abap.char(40);
  criticality : abap.int4;
}
```

#### Table 3: ZBOOK_AUTHORS
```sql
@EndUserText.label : 'Bookstore - Authors'
@AbapCatalog.tableCategory : #TRANSPARENT
define table zbook_authors {
  key client : abap.clnt not null;
  key id : sysuuid_x16 not null;
  name : abap.char(100);
  created_at : timestampl;
  created_by : abap.char(12);
  modified_at : timestampl;
  modified_by : abap.char(12);
}
```

#### Table 4: ZBOOK_BOOKS
```sql
@EndUserText.label : 'Bookstore - Books'
@AbapCatalog.tableCategory : #TRANSPARENT
define table zbook_books {
  key client : abap.clnt not null;
  key id : sysuuid_x16 not null;
  title : abap.char(100);
  author_id : sysuuid_x16;
  genre_code : abap.char(20);
  published_at : abap.dats;
  pages : abap.int4;
  price : abap.dec(9,2);
  currency_code : abap.cuky;
  stock : abap.int4;
  status_code : abap.char(1);
  created_at : timestampl;
  created_by : abap.char(12);
  modified_at : timestampl;
  modified_by : abap.char(12);
}
```

#### Table 5: ZBOOK_CHAPTERS
```sql
@EndUserText.label : 'Bookstore - Chapters'
@AbapCatalog.tableCategory : #TRANSPARENT
define table zbook_chapters {
  key client : abap.clnt not null;
  key id : sysuuid_x16 not null;
  book_id : sysuuid_x16;
  number : abap.int4;
  title : abap.char(100);
  pages : abap.int4;
  created_at : timestampl;
  created_by : abap.char(12);
  modified_at : timestampl;
  modified_by : abap.char(12);
}
```

#### Table 6: ZBOOK_BOOKS_D (Draft Table)
```sql
@EndUserText.label : 'Draft table for ZBOOK_BOOKS'
@AbapCatalog.tableCategory : #TRANSPARENT
define table zbook_books_d {
  key mandt : abap.clnt not null;
  key id : sysuuid_x16 not null;
  title : abap.char(100);
  author_id : sysuuid_x16;
  genre_code : abap.char(20);
  published_at : abap.dats;
  pages : abap.int4;
  price : abap.dec(9,2);
  currency_code : abap.cuky;
  stock : abap.int4;
  status_code : abap.char(1);
  created_at : timestampl;
  created_by : abap.char(12);
  modified_at : timestampl;
  modified_by : abap.char(12);
  include sych_bdl_draft_admin_inc;
}
```

#### Table 7: ZBOOK_CHAP_D (Draft Table)
```sql
@EndUserText.label : 'Draft table for ZBOOK_CHAPTERS'
@AbapCatalog.tableCategory : #TRANSPARENT
define table zbook_chap_d {
  key mandt : abap.clnt not null;
  key id : sysuuid_x16 not null;
  book_id : sysuuid_x16;
  number : abap.int4;
  title : abap.char(100);
  pages : abap.int4;
  created_at : timestampl;
  created_by : abap.char(12);
  modified_at : timestampl;
  modified_by : abap.char(12);
  include sych_bdl_draft_admin_inc;
}
```

---

### Step 3: Pull and Activate

1. In **abapGit Repositories** view
2. Right-click on your repository
3. Click **Pull**
4. Select all objects
5. Click **Pull**
6. Wait for objects to be imported
7. **Activate all objects**:
   - Right-click on package ZDEV
   - Select **Activate**

---

### Step 4: Create Service Binding

1. Navigate to Service Definition: `ZBOOK_UI_BOOKSTORE`
2. Right-click → **New Service Binding**
3. Configure:
   - Name: `ZBOOK_UI_BOOKSTORE_O4`
   - Description: `Bookstore Service - OData V4`
   - Binding Type: `OData V4 - UI`
4. Click **Next** and **Finish**
5. **Activate** the service binding
6. Click **Publish**

---

### Step 5: Insert Test Data

Execute in SQL Console or SE16N:

```sql
-- Genres
INSERT INTO ZBOOK_GENRES VALUES ('100', 'Fiction', 'Fictional stories');
INSERT INTO ZBOOK_GENRES VALUES ('100', 'Science', 'Science and technology');
INSERT INTO ZBOOK_GENRES VALUES ('100', 'Fantasy', 'Fantasy and magic');
INSERT INTO ZBOOK_GENRES VALUES ('100', 'Art', 'Visual and creative arts');

-- Book Status
INSERT INTO ZBOOK_STATUS VALUES ('100', 'A', 'Available', 3);
INSERT INTO ZBOOK_STATUS VALUES ('100', 'L', 'Low Stock', 2);
INSERT INTO ZBOOK_STATUS VALUES ('100', 'U', 'Unavailable', 1);
```

---

### Step 6: Test the Service

1. Open Service Binding `ZBOOK_UI_BOOKSTORE_O4`
2. Click **Preview** button
3. Select entity **Books**
4. Click **Go**
5. Create test book data

---

## ✅ Verification Checklist

- [ ] All 7 database tables created and activated
- [ ] Repository pulled successfully via abapGit
- [ ] All CDS views activated (green status)
- [ ] All behavior definitions activated
- [ ] All classes created and activated
- [ ] Service definition activated
- [ ] Service binding created, activated, and published
- [ ] Test data inserted (Genres, Status)
- [ ] Service preview works
- [ ] Can create/read/update/delete books

---

## 🐛 Common Issues

### Issue: CDS View activation fails
**Solution**: Ensure database tables exist first!

### Issue: "Include SYCH_BDL_DRAFT_ADMIN_INC not found"
**Solution**: Your system may not support draft. Remove draft tables or check RAP version.

### Issue: Service binding not publishing
**Solution**:
- Check all CDS views are activated
- Check behavior definitions are activated
- Verify no syntax errors

### Issue: Authorization error
**Solution**: Check you have developer authorization for package ZDEV

---

## 📞 Need Help?

1. Check `docs/` folder for detailed documentation
2. Review `README.md` for architecture overview
3. See `docs/07_DEPLOY_AND_TEST.md` for troubleshooting

---

**Total Installation Time: ~30 minutes**

Good luck! 🚀
