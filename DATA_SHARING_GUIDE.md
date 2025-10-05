# 📦 How to Share Your Training Data for Colab

Your training data (`MyVoice.zip` - 124MB) is too large for GitHub's standard file size limit (100MB). Here are the best solutions:

---

## ✅ SOLUTION 1: Upload to Google Drive (RECOMMENDED)

This allows you to share your training data directly with your Colab notebook!

### Step 1: Upload to Google Drive

1. **Download MyVoice.zip** from Codespace:
   - Location: `/workspaces/codespaces-blank/StarGANv2-VC/MyVoice.zip`
   - Right-click in VS Code → Download

2. **Upload to Google Drive**:
   - Go to: https://drive.google.com
   - Create a folder: `StarGANv2-VC-Training`
   - Upload `MyVoice.zip` to this folder

3. **Get shareable link**:
   - Right-click on `MyVoice.zip` in Google Drive
   - Click "Share" → "Anyone with the link"
   - Copy the link

### Step 2: Use in Colab

Add this cell to your Colab notebook to download from Drive:

```python
# Download training data from Google Drive
import gdown

# Replace FILE_ID with your file ID from the Google Drive link
# If your link is: https://drive.google.com/file/d/1ABC123XYZ/view
# Your FILE_ID is: 1ABC123XYZ

file_id = "YOUR_FILE_ID_HERE"
output = "MyVoice.zip"

print("📥 Downloading training data from Google Drive...")
gdown.download(f"https://drive.google.com/uc?id={file_id}", output, quiet=False)

print("✅ Download complete!")
```

---

## ✅ SOLUTION 2: Use GitHub Releases (For Files <2GB)

GitHub Releases allow larger files than regular commits!

### Steps:

1. Go to your repository: https://github.com/YaraSamyFouadHafez/StarGANv2-VC-Colab-Training

2. Click **"Releases"** → **"Create a new release"**

3. Fill in:
   - Tag: `v1.0.0`
   - Title: `Initial Release with Sample Data`
   - Attach `MyVoice.zip` as a binary file

4. Click **"Publish release"**

5. Your file will be available at:
   ```
   https://github.com/YaraSamyFouadHafez/StarGANv2-VC-Colab-Training/releases/download/v1.0.0/MyVoice.zip
   ```

### Use in Colab:

```python
# Download from GitHub Release
!wget https://github.com/YaraSamyFouadHafez/StarGANv2-VC-Colab-Training/releases/download/v1.0.0/MyVoice.zip

# Extract
!unzip -q MyVoice.zip -d Data/
```

---

## ✅ SOLUTION 3: Direct Upload in Colab (Current Method)

This is what the notebooks already do - users upload their own data:

```python
from google.colab import files

print("📤 Please upload your MyVoice.zip file...")
uploaded = files.upload()

# Extract
import zipfile
for filename in uploaded.keys():
    if filename.endswith('.zip'):
        with zipfile.ZipFile(filename, 'r') as zip_ref:
            zip_ref.extractall('Data/')
```

**Pros**: No external storage needed  
**Cons**: Must upload every session (124MB)

---

## ✅ SOLUTION 4: Use Git LFS (For Large Files)

Git Large File Storage can handle large files in GitHub repos.

### Setup (Advanced):

```bash
cd /workspaces/codespaces-blank/StarGANv2-VC-Colab-Training

# Install Git LFS
git lfs install

# Track the ZIP file
git lfs track "*.zip"

# Add and commit
git add .gitattributes
git add /workspaces/codespaces-blank/StarGANv2-VC/MyVoice.zip
git commit -m "Add training data via Git LFS"
git push
```

**Note**: GitHub LFS has storage and bandwidth limits on free tier.

---

## 🎯 RECOMMENDED APPROACH

For your use case, I recommend **SOLUTION 1 (Google Drive)**:

### Why?
✅ Free unlimited storage (with Google account)  
✅ Easy to share publicly or privately  
✅ Fast download in Colab (same infrastructure)  
✅ No GitHub storage limits  
✅ Can update data without git commits  

### Quick Setup:

1. Upload `MyVoice.zip` to Google Drive
2. Share with "Anyone with the link"
3. Get the FILE_ID from the share link
4. Add download cell to Colab notebook (see code above)
5. Done! ✅

---

## 📝 Update Your Colab Notebook

I can update your `Train_StarGANv2_VC.ipynb` to include Google Drive download option!

Would you like me to:
1. ✅ Add Google Drive download cell to the notebook
2. ✅ Keep manual upload option as backup
3. ✅ Make it configurable (choose Drive or manual)

This way users (including you) can choose:
- Option A: Download from your shared Google Drive link
- Option B: Upload their own data manually

---

## 🚀 Next Steps

**For sharing YOUR specific training data**:

1. Download `MyVoice.zip` from Codespace
2. Upload to Google Drive
3. Get shareable link
4. Share the FILE_ID with users
5. They use it in Colab!

**For general users**:

Keep the current manual upload method - it works great and gives users full control over their data!

---

## 💡 Pro Tip

You can create a `data/` folder in your repository with:
- `README.md` - Instructions on preparing data
- `example_file_list.txt` - Sample of what train_list.txt looks like  
- Link to Google Drive with sample data

This helps users understand the data format without committing large files!

---

**📍 Your training data location**: `/workspaces/codespaces-blank/StarGANv2-VC/MyVoice.zip`

**🎯 Best solution**: Upload to Google Drive, share link, add download cell to Colab notebook!
