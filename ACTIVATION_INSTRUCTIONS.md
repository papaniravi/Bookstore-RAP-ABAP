# Activation Instructions

## Problem
The SAP backend has cached the old CDS view definitions with field names `Pages` and `Number`, but the source code has been updated to use `Pages1` and `Number1`. The Eclipse cache has been updated, but the SAP backend still references the old compiled versions.

## Solution Options

### Option 1: Uninstall and Reinstall via abapGit (Recommended)

1. Open SAP GUI and run transaction `ZABAPGIT`
2. Navigate to the **Bookstore-RAP-ABAP** repository
3. Click **"Advanced"** → **"Uninstall"**
   - This will delete all active objects from the SAP backend
4. After uninstall completes, click **"Pull"** to reimport from GitHub
5. All objects will be imported fresh with the correct field names
6. Click **"Advanced"** → **"Activate Objects"**
7. Activation should now succeed

### Option 2: Delete Active Versions Manually in SE11

1. Open transaction **SE11** in SAP GUI
2. For each problematic view, delete the active version:
   - Enter `ZC_BOOK_BOOKS` → Display
   - Menu: **Utilities** → **Delete** → **Active Version Only**
   - Repeat for: `ZC_BOOK_CHAPTERS`, `ZI_BOOK_BOOKS`, `ZI_BOOK_CHAPTERS`
3. Return to Eclipse ADT
4. Right-click on **ZBOOK** package → **Activate** → **Activate All Inactive Objects**

### Option 3: Mass Deactivation via SE80

1. Open transaction **SE80** in SAP GUI
2. Navigate to package **ZBOOK**
3. Right-click on the package → **Mass Processing** → **Mass Deactivation**
4. Select all CDS views (ZI_* and ZC_*)
5. Execute to deactivate all
6. Return to Eclipse ADT and activate all objects fresh

## Why This Happened

The objects were initially imported from abapGit BEFORE the field name fixes were pushed to GitHub. The SAP backend activated them with the old field names (`Pages`, `Number`). When we later updated the source code to use `Pages1` and `Number1`, the Eclipse workspace files were updated, but the SAP backend's compiled/active versions were not automatically refreshed.

## Current Status

- ✅ Source files in GitHub: Correct (Pages1, Number1)
- ✅ Source files in Eclipse workspace: Correct (Pages1, Number1)
- ✅ Eclipse ADT cache files: Correct (Pages1, Number1)
- ❌ SAP backend active versions: Incorrect (Pages, Number) ← This is the problem

Once you complete Option 1, 2, or 3 above, all versions will be synchronized and activation will succeed.
