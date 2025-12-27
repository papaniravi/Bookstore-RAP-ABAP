# Step 5: Create Service Definition and Binding

## 1. Service Definition: ZBOOK_UI_BOOKSTORE

**File**: ZBOOK_UI_BOOKSTORE.srvd

```abap
@EndUserText.label: 'Bookstore Service'
define service ZBOOK_UI_BOOKSTORE {
  expose ZC_BOOK_BOOKS as Books;
  expose ZC_BOOK_CHAPTERS as Chapters;
  expose ZC_BOOK_AUTHORS as Authors;
  expose ZC_BOOK_GENRES as GenresVH;
  expose ZC_BOOK_STATUS as BookStatus;
}
```

## 2. Service Binding

1. Right-click on the Service Definition `ZBOOK_UI_BOOKSTORE`
2. Select **New Service Binding**
3. Configure:
   - **Name**: `ZBOOK_UI_BOOKSTORE_O4`
   - **Description**: Bookstore Service - OData V4
   - **Binding Type**: `OData V4 - UI`
   - **Service Definition**: `ZBOOK_UI_BOOKSTORE`
4. Click **Next** and **Finish**
5. **Activate** the service binding
6. Click **Publish** to publish the service

The service will be available at:
```
/sap/opu/odata4/sap/zbook_ui_bookstore_o4/srvd/sap/zbook_ui_bookstore/0001/
```

---

**Next Step**: Create Metadata Extensions (UI Annotations) (see 06_METADATA_EXTENSIONS.md)
