# Step 6: Create Metadata Extensions (UI Annotations)

Create these metadata extension files in ADT.

## 1. Metadata Extension: ZC_BOOK_BOOKS

**File**: ZC_BOOK_BOOKS.ddlx.asddlxs

```abap
@Metadata.layer: #CORE
@UI: {
  headerInfo: {
    typeName: 'Book',
    typeNamePlural: 'Books',
    title: {
      type: #STANDARD,
      value: 'Title'
    },
    description: {
      value: 'GenreCode'
    },
    imageUrl: 'sap-icon://course-book'
  },
  presentationVariant: [{
    sortOrder: [{
      by: 'Title',
      direction: #ASC
    }],
    visualizations: [{
      type: #AS_LINEITEM
    }]
  }]
}
annotate view ZC_BOOK_BOOKS with
{
  @UI.facet: [
    {
      id: 'GeneralInformation',
      type: #COLLECTION,
      label: 'General Information',
      position: 10
    },
    {
      id: 'BookDetails',
      type: #FIELDGROUP_REFERENCE,
      parentId: 'GeneralInformation',
      label: 'Book Details',
      targetQualifier: 'GeneratedGroup',
      position: 10
    },
    {
      id: 'EntryInformation',
      type: #FIELDGROUP_REFERENCE,
      parentId: 'GeneralInformation',
      label: 'Entry Information',
      targetQualifier: 'EntryInformation',
      position: 20
    },
    {
      id: 'Chapters',
      type: #LINEITEM_REFERENCE,
      label: 'Chapters',
      position: 20,
      targetElement: '_Chapters'
    }
  ]

  @UI.hidden: true
  Id;

  @UI: {
    lineItem: [{ position: 20, label: 'Book name' }],
    selectionField: [{ position: 20 }],
    fieldGroup: [{ position: 10, qualifier: 'GeneratedGroup', label: 'Title' }]
  }
  @Search.defaultSearchElement: true
  Title;

  @UI.hidden: true
  AuthorId;

  @UI: {
    lineItem: [{ position: 30, label: 'Genre' }],
    selectionField: [{ position: 10 }],
    fieldGroup: [{ position: 20, qualifier: 'GeneratedGroup', label: 'Genre' }]
  }
  GenreCode;

  @UI: {
    lineItem: [{ position: 40, label: 'Published At' }],
    fieldGroup: [{ position: 30, qualifier: 'GeneratedGroup', label: 'Published at' }]
  }
  PublishedAt;

  @UI: {
    lineItem: [{ position: 60, label: 'Pages' }],
    fieldGroup: [{ position: 40, qualifier: 'GeneratedGroup', label: 'Pages' }]
  }
  Pages;

  @UI: {
    lineItem: [{ position: 50, label: 'Price' }],
    fieldGroup: [{ position: 50, qualifier: 'GeneratedGroup', label: 'Price' }]
  }
  Price;

  @UI.hidden: true
  CurrencyCode;

  @UI: {
    lineItem: [{ position: 80, label: 'Stock' }],
    fieldGroup: [{ position: 80, qualifier: 'GeneratedGroup', label: 'Stock' }]
  }
  Stock;

  @UI: {
    lineItem: [{
      position: 10,
      label: 'Status',
      criticality: 'StatusCode',
      criticalityRepresentation: #WITH_ICON
    }],
    fieldGroup: [{
      position: 60,
      qualifier: 'GeneratedGroup',
      criticality: 'StatusCode'
    }],
    textArrangement: #TEXT_ONLY
  }
  @Consumption.valueHelpDefinition: [{
    entity: { name: 'ZI_BOOK_STATUS', element: 'Code' },
    useForValidation: true
  }]
  StatusCode;

  @UI.fieldGroup: [{ position: 10, qualifier: 'EntryInformation' }]
  CreatedAt;

  @UI.fieldGroup: [{ position: 20, qualifier: 'EntryInformation' }]
  CreatedBy;

  @UI: {
    lineItem: [{ position: 70 }],
    fieldGroup: [{ position: 30, qualifier: 'EntryInformation' }]
  }
  ModifiedAt;

  @UI.fieldGroup: [{ position: 40, qualifier: 'EntryInformation' }]
  ModifiedBy;
}
```

## 2. Metadata Extension: ZC_BOOK_CHAPTERS

**File**: ZC_BOOK_CHAPTERS.ddlx.asddlxs

```abap
@Metadata.layer: #CORE
@UI: {
  headerInfo: {
    typeName: 'Chapter',
    typeNamePlural: 'Chapters',
    title: {
      type: #STANDARD,
      value: 'Title'
    },
    description: {
      value: 'Number'
    }
  }
}
annotate view ZC_BOOK_CHAPTERS with
{
  @UI.facet: [
    {
      id: 'ChapterDetails',
      type: #FIELDGROUP_REFERENCE,
      label: 'Chapter Details',
      targetQualifier: 'ChapterDetails',
      position: 10
    }
  ]

  @UI.hidden: true
  Id;

  @UI.hidden: true
  BookId;

  @UI: {
    lineItem: [{ position: 30, label: 'Number' }],
    fieldGroup: [{ position: 20, qualifier: 'ChapterDetails', label: 'Chapter Number' }]
  }
  Number;

  @UI: {
    lineItem: [{ position: 10, label: 'Title' }],
    fieldGroup: [{ position: 10, qualifier: 'ChapterDetails', label: 'Title' }]
  }
  Title;

  @UI: {
    lineItem: [{ position: 20, label: 'Pages' }],
    fieldGroup: [{ position: 30, qualifier: 'ChapterDetails', label: 'Pages' }]
  }
  Pages;

  @UI.hidden: true
  CreatedAt;

  @UI.hidden: true
  CreatedBy;

  @UI.hidden: true
  ModifiedAt;

  @UI.hidden: true
  ModifiedBy;
}
```

## 3. Metadata Extension: ZC_BOOK_AUTHORS

**File**: ZC_BOOK_AUTHORS.ddlx.asddlxs

```abap
@Metadata.layer: #CORE
@UI: {
  headerInfo: {
    typeName: 'Author',
    typeNamePlural: 'Authors',
    title: {
      type: #STANDARD,
      value: 'Name'
    }
  }
}
annotate view ZC_BOOK_AUTHORS with
{
  @UI.facet: [
    {
      id: 'AuthorDetails',
      type: #FIELDGROUP_REFERENCE,
      label: 'Author Details',
      targetQualifier: 'AuthorDetails',
      position: 10
    }
  ]

  @UI.hidden: true
  Id;

  @UI: {
    lineItem: [{ position: 10, label: 'Author Name' }],
    fieldGroup: [{ position: 10, qualifier: 'AuthorDetails', label: 'Name' }]
  }
  Name;

  @UI: {
    lineItem: [{ position: 20 }],
    fieldGroup: [{ position: 20, qualifier: 'AuthorDetails' }]
  }
  CreatedAt;

  @UI: {
    lineItem: [{ position: 30 }],
    fieldGroup: [{ position: 30, qualifier: 'AuthorDetails' }]
  }
  CreatedBy;

  @UI: {
    lineItem: [{ position: 40 }],
    fieldGroup: [{ position: 40, qualifier: 'AuthorDetails' }]
  }
  ModifiedAt;

  @UI: {
    lineItem: [{ position: 50 }],
    fieldGroup: [{ position: 50, qualifier: 'AuthorDetails' }]
  }
  ModifiedBy;
}
```

## 4. Metadata Extension: ZC_BOOK_GENRES

**File**: ZC_BOOK_GENRES.ddlx.asddlxs

```abap
@Metadata.layer: #CORE
annotate view ZC_BOOK_GENRES with
{
  @UI.lineItem: [{ position: 10 }]
  @UI.textArrangement: #TEXT_ONLY
  Code;

  @UI.lineItem: [{ position: 20 }]
  Description;
}
```

## 5. Metadata Extension: ZC_BOOK_STATUS

**File**: ZC_BOOK_STATUS.ddlx.asddlxs

```abap
@Metadata.layer: #CORE
annotate view ZC_BOOK_STATUS with
{
  @UI.lineItem: [{ position: 10 }]
  @UI.textArrangement: #TEXT_ONLY
  Code;

  @UI.lineItem: [{ position: 20 }]
  DisplayText;

  @UI.hidden: true
  Criticality;
}
```

---

**Next Step**: Deploy Sample Data (see 07_DEPLOY_DATA.md)
