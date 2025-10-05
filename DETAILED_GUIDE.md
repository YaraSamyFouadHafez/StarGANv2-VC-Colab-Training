# 🚀 Google Colab Training Guide
## Train Your Voice Model with FREE GPU (10-20x Faster!)

---

## 📋 What You'll Get

### Speed Comparison:
| Platform | Hardware | Training Time | Cost |
|----------|----------|---------------|------|
| **Your PC** | 4 CPU cores | ~150 hours (6 days) | Free |
| **Colab Free** | T4 GPU | ~15-20 hours (1 day) | Free |
| **Colab Pro** | V100/A100 GPU | ~8-12 hours | $10/month |

### Quality:
✅ **Identical results** - Same award-winning configuration
✅ **Better batch size** - 8 vs 2 on CPU = potentially better quality
✅ **Mixed precision** - Faster without quality loss

---

## 🎯 Complete Step-by-Step Guide

### Step 1️⃣: Download Files (Do This Now!)

**On your Codespace, download these files to your computer:**

1. **Training Data** (124MB):
   ```
   File: MyVoice.zip
   Location: /workspaces/codespaces-blank/StarGANv2-VC/MyVoice.zip
   ```
   - Right-click on `MyVoice.zip` in VS Code
   - Select "Download"

2. **Colab Notebook**:
   ```
   File: Train_StarGANv2_VC_Colab.ipynb
   Location: /workspaces/codespaces-blank/StarGANv2-VC/Train_StarGANv2_VC_Colab.ipynb
   ```
   - Right-click on the notebook
   - Select "Download"

---

### Step 2️⃣: Open in Google Colab

1. Go to: https://colab.research.google.com/
2. Click **"Upload"** or **"File → Upload notebook"**
3. Upload `Train_StarGANv2_VC_Colab.ipynb`
4. The notebook will open in Colab

---

### Step 3️⃣: Enable GPU

**CRITICAL: You MUST enable GPU!**

1. Click **"Runtime"** in the menu
2. Select **"Change runtime type"**
3. Under "Hardware accelerator", select **"GPU"**
4. Choose **"T4"** (free tier) or **"V100/A100"** (Pro)
5. Click **"Save"**

---

### Step 4️⃣: Run the Notebook

**Execute cells in order (top to bottom):**

#### Cell 1: Check GPU ✅
- Verifies GPU is available
- Shows GPU type and memory
- **If it says "No GPU", go back to Step 3!**

#### Cell 2: Install Dependencies (2-3 min)
- Installs PyTorch, librosa, parallel_wavegan, etc.
- Automatic, just wait

#### Cell 3: Clone Repository (30 sec)
- Downloads StarGANv2-VC code
- Automatic

#### Cell 4: Download Pretrained Models (5-10 min)
- Downloads 1.6GB of models:
  - epoch_00150.pth (1.5GB) - Award-winning VCTK20 model
  - Vocoder, ASR, F0 models
- **This is the longest setup step**

#### Cell 5: Upload Your Data (2-5 min)
- **Click the "Choose Files" button**
- **Select your `MyVoice.zip` file**
- Wait for upload (124MB)
- Automatic extraction and verification

#### Cell 6: Create Config (instant)
- Generates GPU-optimized configuration
- Automatic

#### Cell 7: Fix Compatibility (instant)
- Ensures PyTorch 2.x compatibility
- Automatic

#### Cell 8: **START TRAINING!** 🚀
- **This is where the magic happens!**
- Training runs for 15-20 hours
- Progress shown in real-time

---

### Step 5️⃣: Monitor Training

**While training runs, you can:**

1. **Watch progress bar**:
   ```
   [train]: 45%|████████████▌             | 65/143 [12:34<14:56, 11.23s/it]
   ```

2. **Check GPU usage** (Cell 9):
   - Should show ~80-100% GPU utilization
   - Memory usage: 8-12GB

3. **View training log** (Cell 9):
   ```
   Epoch 10/150
   Loss: 2.345
   ```

4. **List checkpoints** (Cell 9):
   ```
   epoch_00002.pth
   epoch_00004.pth
   ...
   ```

---

### Step 6️⃣: Keep Session Alive

**⚠️ IMPORTANT: Colab disconnects after inactivity!**

#### Free Tier:
- **Max runtime**: 12 hours
- **Idle timeout**: 90 minutes
- **Solution**: Keep tab open, interact every hour

#### Colab Pro ($10/month):
- **Max runtime**: 24 hours
- **Idle timeout**: Longer
- **Background execution**: Available

#### Tips to Avoid Disconnection:
1. **Keep the tab active** (don't close it)
2. **Disable sleep mode** on your computer
3. **Use anti-sleep script** (optional):
   ```javascript
   // Run in browser console (F12)
   function KeepAlive() {
       document.querySelector("colab-connect-button").click();
   }
   setInterval(KeepAlive, 60000); // Every 60 seconds
   ```

---

### Step 7️⃣: Download Trained Model

**After training completes (or reaches desired epoch):**

1. **Run Cell 10** (Download section)
2. A ZIP file will be created: `MyVoice_Trained_Models.zip`
3. **Browser will auto-download** the ZIP
4. **Extract the ZIP** on your computer
5. **Find your model**: `epoch_00150.pth` (or latest epoch)

---

### Step 8️⃣: Use Your Trained Model

**Back on your Codespace:**

1. **Upload the trained model**:
   ```bash
   # Upload epoch_00150.pth to:
   /workspaces/codespaces-blank/StarGANv2-VC/Models/MyVoice_BestQuality/
   ```

2. **Test voice conversion**:
   ```bash
   cd /workspaces/codespaces-blank/StarGANv2-VC
   python webui.py
   ```

3. **Use the WebUI**:
   - Upload source audio
   - Select your trained model
   - Convert voice!

---

## 🔄 If Training Gets Interrupted

**Don't panic! You can resume!**

### What to Do:

1. **Download checkpoints before disconnection** (if possible):
   - Run Cell 10 to download current progress
   
2. **When you restart**:
   - Re-run all setup cells (1-7)
   - Use "Resume Training" cell
   - Upload your checkpoint ZIP
   - Training continues from last saved epoch!

### Checkpoints are Saved Every 2 Epochs:
```
epoch_00002.pth  ← After epoch 2
epoch_00004.pth  ← After epoch 4
epoch_00006.pth  ← After epoch 6
...
epoch_00150.pth  ← Final model
```

---

## 📊 Expected Training Timeline

### With T4 GPU (Colab Free):

| Epoch | Time Elapsed | Total Time | Quality Level |
|-------|--------------|------------|---------------|
| 0 | Start | 0h | - |
| 10 | ~1.5h | 1.5h | Initial adaptation |
| 30 | ~4.5h | 4.5h | Good quality |
| 50 | ~7.5h | 7.5h | Very good quality |
| 75 | ~11h | 11h | Excellent quality |
| 100 | ~15h | 15h | Near-perfect |
| **150** | **~22h** | **~22h** | **🏆 Best quality** |

**Note**: With Colab Free's 12h limit, you'll need 2 sessions

### Strategy for Free Tier (12h limit):

**Session 1** (12 hours):
- Train epochs 0-75 (~11 hours)
- Download checkpoint
- Sleep/take a break

**Session 2** (12 hours):
- Resume from epoch 76
- Train to epoch 150 (~11 hours)
- Download final model
- Done! 🎉

---

## 💰 Colab Pro vs Free

### Free Tier:
✅ **Cost**: $0
✅ **GPU**: T4 (good)
⚠️ **Runtime**: 12 hours max
⚠️ **Availability**: Sometimes limited
⚠️ **Queue**: May wait for GPU

### Colab Pro ($10/month):
✅ **Cost**: $10/month (cancel anytime)
✅ **GPU**: V100 or A100 (2-3x faster)
✅ **Runtime**: 24 hours max
✅ **Priority**: Skip GPU queue
✅ **Background**: Can close tab

### Recommendation:
- **Try Free first** - It works great!
- **Upgrade to Pro** if:
  - You want to finish in one session
  - You want better GPUs
  - You value your time

---

## 🆚 Comparison: PC vs Colab

### Your Current PC Training:
```
Device: CPU (4 cores)
Batch Size: 4
Speed: ~20 seconds/step
Time per Epoch: ~45-60 minutes
Total Time: ~110-150 hours (5-6 days)
Cost: $0
Availability: Always
Can disconnect: ❌ (loses progress)
```

### Google Colab (Free T4):
```
Device: GPU (T4)
Batch Size: 8
Speed: ~1-2 seconds/step
Time per Epoch: ~8-10 minutes
Total Time: ~20-25 hours (1-2 days)
Cost: $0
Availability: Usually available
Can disconnect: ✅ (saves checkpoints)
```

### Winner: **Colab is 10-15x faster!** 🚀

---

## ⚠️ Important Warnings

### 1. Don't Close the Tab
- Colab runs in browser
- Closing tab = disconnection
- Keep it open or use Colab Pro

### 2. Download Checkpoints Regularly
- Every 10-20 epochs, run download cell
- Backup your progress
- Insurance against disconnection

### 3. Check GPU Status
- First cell should show GPU
- If it says CPU, you forgot to enable GPU!
- Stop and enable GPU immediately

### 4. Upload Correct ZIP
- Must be MyVoice.zip (124MB)
- Contains train_list.txt, val_list.txt, .wav files
- Wrong structure = training fails

### 5. Wait for Downloads
- Pretrained models: 1.6GB (takes 5-10 min)
- Don't skip this step!
- Check that all files downloaded

---

## ✅ Checklist Before Starting

**Setup (5 minutes):**
- [ ] MyVoice.zip downloaded to your computer
- [ ] Train_StarGANv2_VC_Colab.ipynb downloaded
- [ ] Notebook uploaded to Colab
- [ ] GPU enabled (Runtime → Change runtime type → GPU)

**Training (automated):**
- [ ] Cell 1: GPU detected ✅
- [ ] Cell 2-3: Dependencies installed ✅
- [ ] Cell 4: Pretrained models downloaded (1.6GB) ✅
- [ ] Cell 5: MyVoice.zip uploaded and extracted ✅
- [ ] Cell 6-7: Config created ✅
- [ ] Cell 8: Training started! 🚀

**During Training:**
- [ ] Progress bar moving
- [ ] GPU usage 80-100%
- [ ] Tab stays open
- [ ] Computer doesn't sleep

**After Training:**
- [ ] Cell 10: Download final model
- [ ] Extract ZIP
- [ ] Upload to your PC
- [ ] Test with WebUI

---

## 🎯 Quick Start (TL;DR)

**For impatient people:**

1. Download `MyVoice.zip` and `Train_StarGANv2_VC_Colab.ipynb`
2. Upload notebook to colab.research.google.com
3. Runtime → Change runtime → GPU → T4
4. Run all cells (click ▶️ on each, top to bottom)
5. Upload MyVoice.zip when prompted
6. Wait ~20 hours
7. Download trained model
8. Done!

---

## 🆘 Troubleshooting

### "No GPU detected"
**Solution**: Runtime → Change runtime type → Select GPU

### "Out of memory"
**Solution**: Reduce batch_size in config (8 → 4)

### "Disconnected during training"
**Solution**: 
1. Don't close tab
2. Use Colab Pro for 24h sessions
3. Download checkpoints regularly
4. Use resume cell if needed

### "Upload failed"
**Solution**: 
1. Check file is MyVoice.zip (not .rar or other)
2. Check size is ~124MB
3. Try uploading again

### "Pretrained model download failed"
**Solution**: 
1. Check internet connection
2. Run cell again
3. Models total 1.6GB - takes time!

---

## 🎊 Success Tips

### For Best Results:
1. **Use GPU**: Mandatory for speed
2. **Keep tab open**: Avoid disconnection
3. **Download often**: Backup checkpoints
4. **Monitor progress**: Watch GPU usage
5. **Be patient**: Quality takes time

### Expected Quality Milestones:
- **Epoch 30**: Can understand it works
- **Epoch 50**: Sounds pretty good
- **Epoch 75**: Sounds excellent
- **Epoch 100**: Nearly perfect
- **Epoch 150**: Award-winning quality! 🏆

---

## 📚 Files You'll Have

### Before Training:
```
MyVoice.zip (124MB)                    ← Your data
Train_StarGANv2_VC_Colab.ipynb        ← Colab notebook
```

### After Training:
```
MyVoice_Trained_Models.zip            ← Contains:
  ├── epoch_00002.pth
  ├── epoch_00004.pth
  ├── ...
  ├── epoch_00150.pth                 ← Your final model!
  └── train.log                        ← Training history
```

---

## 🚀 Ready to Start?

**Your training data is ready:**
- ✅ 574 training samples
- ✅ 64 validation samples  
- ✅ 124MB ZIP file created
- ✅ Colab notebook ready

**Next action:**
1. **Download** `MyVoice.zip` (right-click in VS Code)
2. **Download** `Train_StarGANv2_VC_Colab.ipynb`
3. **Open** https://colab.research.google.com
4. **Upload** the notebook
5. **Click** Runtime → Change runtime → GPU
6. **Run** all cells!

**Expected result:**
- 🚀 10-20x faster training
- 🏆 Same award-winning quality
- 💰 Completely FREE
- ⏱️ Finished in ~1-2 days instead of 6!

---

**🎤 Let's train your voice model with GPU power! 🚀✨**
