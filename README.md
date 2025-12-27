# Bookstore RAP Application

Complete RAP (ABAP RESTful Application Programming) implementation of a Bookstore application for SAP on-premise systems.

## 📋 Overview

This repository contains all ABAP artifacts needed to implement a complete Bookstore application using RAP on your SAP on-premise system.

### Features
- ✅ **Books Management** with draft support
- ✅ **Authors Management**
- ✅ **Chapters** (composition of Books)
- ✅ **Value Helps** (Genres, Book Status)
- ✅ **Actions**: Add Stock, Change Publish Date, Change Status
- ✅ **OData V4** Service
- ✅ **Full CRUD** operations
- ✅ **Draft** functionality

## 🚀 Quick Start

### Prerequisites
- SAP S/4HANA or NetWeaver system with RAP support
- ABAP Development Tools (ADT) in Eclipse
- abapGit plugin installed in Eclipse

### Installation Steps

#### 1. Clone Repository using abapGit

1. Open Eclipse ADT
2. Open abapGit Repositories view
3. Click **Clone Repository**
4. Enter this repository URL
5. Select Package: **ZDEV**
6. Select Transport: **DS4K905910**
7. Click **Pull**

#### 2. Create Database Tables

Before activating the CDS views, create these database tables in SE11:

**Required Tables:**
- `ZBOOK_BOOKS` - Books master data
- `ZBOOK_AUTHORS` - Authors master data
- `ZBOOK_CHAPTERS` - Book chapters
- `ZBOOK_GENRES` - Genre value help
- `ZBOOK_STATUS` - Status value help
- `ZBOOK_BOOKS_D` - Draft table for books
- `ZBOOK_CHAP_D` - Draft table for chapters

**Table Definitions:** See [docs/01_DATABASE_TABLES.md](docs/01_DATABASE_TABLES.md)

#### 3. Activate All Objects

1. In Project Explorer, select all objects
2. Right-click → **Activate**
3. Wait for activation to complete

#### 4. Create Service Binding

1. Right-click on `ZBOOK_UI_BOOKSTORE`
2. Select **New Service Binding**
3. Name: `ZBOOK_UI_BOOKSTORE_O4`
4. Binding Type: **OData V4 - UI**
5. Activate and Publish

#### 5. Insert Sample Data

Execute SQL scripts from [docs/07_DEPLOY_AND_TEST.md](docs/07_DEPLOY_AND_TEST.md):
- Genres data
- Book Status data
- Sample Authors
- Sample Books
- Sample Chapters

#### 6. Test the Service

1. Open Service Binding `ZBOOK_UI_BOOKSTORE_O4`
2. Click **Preview**
3. Select **Books** entity
4. Test CRUD operations

## 📦 Repository Structure

```
Bookstore-RAP-ABAP/
├── src/
│   ├── zi_book_*.ddls.asddls          # Interface CDS Views
│   ├── zc_book_*.ddls.asddls          # Consumption CDS Views
│   ├── zi_book_*.bdef.asbdef          # Interface Behavior Definitions
│   ├── zc_book_*.bdef.asbdef          # Consumption Behavior Definitions
│   ├── zbp_i_book_*.clas.abap         # Behavior Implementation Classes
│   ├── zd_change_*.ddls.asddls        # Abstract Entities (Action Parameters)
│   └── zbook_ui_bookstore.srvd.srvdsrv # Service Definition
├── docs/                               # Detailed Documentation
├── .abapgit.xml                        # abapGit configuration
└── README.md                           # This file
```

## 📚 Documentation

Detailed documentation available in `/docs` folder:

1. **[01_DATABASE_TABLES.md](docs/01_DATABASE_TABLES.md)** - Database table definitions
2. **[02_CDS_VIEWS.md](docs/02_CDS_VIEWS.md)** - CDS view explanations
3. **[03_BEHAVIOR_DEFINITIONS.md](docs/03_BEHAVIOR_DEFINITIONS.md)** - RAP behavior details
4. **[04_BEHAVIOR_IMPLEMENTATION.md](docs/04_BEHAVIOR_IMPLEMENTATION.md)** - ABAP implementation
5. **[05_SERVICE_DEFINITION.md](docs/05_SERVICE_DEFINITION.md)** - Service configuration
6. **[06_METADATA_EXTENSIONS.md](docs/06_METADATA_EXTENSIONS.md)** - UI annotations
7. **[07_DEPLOY_AND_TEST.md](docs/07_DEPLOY_AND_TEST.md)** - Deployment guide

## 🏗️ Architecture

```
UI5 App (ZBOOKSTORE)
         ↓
Service Binding (OData V4)
         ↓
Service Definition
         ↓
Consumption Views (ZC_*)
         ↓
Behavior Definitions
         ↓
Interface Views (ZI_*)
         ↓
Database Tables (ZBOOK_*)
```

## 🔧 Configuration

### Package Information
- **Package**: ZDEV
- **Transport**: DS4K905910
- **Prefix**: ZBOOK

### Service URLs
After publishing the service binding, access at:
```
/sap/opu/odata4/sap/zbook_ui_bookstore_o4/srvd/sap/zbook_ui_bookstore/0001/
```

## 📊 Data Model

### Main Entities

**Books** (Root Entity)
- Fields: ID, Title, Author, Genre, PublishedAt, Pages, Price, Currency, Stock, Status
- Composition: Chapters
- Associations: Author, Genre, Status, Currency
- Actions: addStock, changePublishDate, changeStatus

**Authors**
- Fields: ID, Name
- Association: Books (1:n)

**Chapters**
- Fields: ID, BookID, Number, Title, Pages
- Parent: Books (composition child)

**Genres** (Value Help)
- Fields: Code, Description

**BookStatus** (Value Help)
- Fields: Code, DisplayText, Criticality

## 🎯 Actions

### addStock
Increases book stock by 10 units.

### changePublishDate
Updates the publication date of a book.
- Parameter: newDate (Date)

### changeStatus
Changes the availability status of a book.
- Parameter: newStatus (Code from BookStatus)

## 🧪 Testing

### Test CRUD Operations
1. Create a new book
2. Update book details
3. Add chapters to a book
4. Delete a book

### Test Actions
1. Select a book with low stock
2. Execute "Add Stock" action
3. Verify stock increased by 10

### Test Draft
1. Edit a book
2. Make changes
3. Save draft (intermediate save)
4. Activate draft (final save)

## 🔒 Authorization

Current implementation uses global authorization (all allowed).

To implement authorization:
1. Modify behavior definitions
2. Implement authorization checks in behavior implementation
3. Create authorization objects

## 🐛 Troubleshooting

### Service Not Found
- Check service binding is activated and published
- Verify all CDS views are activated
- Check behavior definitions are activated

### Draft Not Working
- Ensure draft tables exist (ZBOOK_BOOKS_D, ZBOOK_CHAP_D)
- Check draft table structure includes `%admin` fields
- Verify `with draft` in behavior definition

### Data Not Showing
- Check database tables have data
- Verify CDS view field mappings
- Test individual CDS views in data preview

## 📝 License

This is a sample/tutorial project. Use at your own discretion.

## 🤝 Contributing

This is a tutorial project. Feel free to fork and modify for your needs.

## 📧 Support

For issues:
1. Check documentation in `/docs` folder
2. Review SAP RAP documentation
3. Test in Service Binding preview
4. Check SAP Community forums

## 🎓 Learning Resources

- [SAP RAP Documentation](https://help.sap.com/docs/btp/sap-abap-restful-application-programming-model/abap-restful-application-programming-model)
- [ABAP Development Tools](https://tools.hana.ondemand.com/)
- [abapGit](https://docs.abapgit.org/)

---

**Ready to start?** Clone this repository and follow the Quick Start guide above!

Good luck with your RAP development! 🚀
