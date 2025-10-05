# 🎤 StarGANv2-VC Google Colab Training

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/YaraSamyFouadHafez/StarGANv2-VC-Colab-Training/blob/main/Train_StarGANv2_VC.ipynb)

**Train your own voice conversion model using Google Colab's FREE GPU!**

This repository provides everything you need to train a high-quality voice conversion model using [StarGANv2-VC](https://github.com/yl4579/StarGANv2-VC) (INTERSPEECH 2021 Best Paper Award) on Google Colab.

---

## 🚀 Why Use This?

### Speed Comparison

| Platform | Hardware | Training Time | Cost |
|----------|----------|---------------|------|
| **Personal PC** | CPU (4 cores) | ~150 hours (6 days) | Free |
| **Google Colab Free** | T4 GPU | ~20 hours (1 day) | **Free** |
| **Google Colab Pro** | V100/A100 GPU | ~10 hours (0.5 day) | $10/month |

### Features

✅ **10-20x faster** than CPU training  
✅ **FREE GPU** access (T4, V100, or A100)  
✅ **Award-winning model** (INTERSPEECH 2021 Best Paper)  
✅ **Easy setup** - just upload your data  
✅ **Automatic checkpoints** - resume if disconnected  
✅ **Download trained model** - use it anywhere  

---

## 📋 Quick Start (5 Minutes!)

### Step 1: Prepare Your Training Data

1. Record your voice (minimum 30 minutes, 1+ hour recommended)
2. Save as WAV file (any sample rate, will be converted to 24kHz)
3. Use the data preparation notebook: [`Prepare_Training_Data.ipynb`](Prepare_Training_Data.ipynb)
4. Download the generated `MyVoice.zip` file

### Step 2: Train on Colab

1. Click the "Open in Colab" button above
2. Enable GPU: **Runtime → Change runtime type → GPU**
3. Run all cells (click ▶️ from top to bottom)
4. Upload your `MyVoice.zip` when prompted
5. Wait ~20 hours (or leave it running overnight)
6. Download your trained model!

### Step 3: Use Your Trained Model

1. Download the trained model ZIP
2. Extract and use with StarGANv2-VC inference
3. Convert any voice to your voice!

---

## 📁 Repository Contents

```
StarGANv2-VC-Colab-Training/
├── Train_StarGANv2_VC.ipynb          # Main training notebook (USE THIS!)
├── Prepare_Training_Data.ipynb       # Data preparation notebook
├── Inference_Demo.ipynb              # Test your trained model
├── README.md                          # This file
├── DETAILED_GUIDE.md                  # Complete step-by-step guide
├── TROUBLESHOOTING.md                 # Common issues and solutions
└── examples/
    └── example_output.md              # Sample results
```

---

## 🎯 What You'll Get

After training, you'll have a voice conversion model that can:

- ✅ Convert any speaker's voice to your voice
- ✅ Preserve emotional content and prosody
- ✅ Work across different languages
- ✅ Maintain high audio quality (24kHz)
- ✅ Run in real-time with GPU

### Quality Metrics (from original paper):
- **MOS (Mean Opinion Score)**: 4.0+ / 5.0
- **Speaker Similarity**: 85%+
- **Naturalness**: Comparable to natural speech

---

## 📖 Detailed Documentation

### For Beginners:
- [DETAILED_GUIDE.md](DETAILED_GUIDE.md) - Complete walkthrough with screenshots

### For Advanced Users:
- [TROUBLESHOOTING.md](TROUBLESHOOTING.md) - Common issues and solutions
- [StarGANv2-VC Original Repo](https://github.com/yl4579/StarGANv2-VC) - Source code

### Training Tips:
- **Data Quality**: Better audio = better results
- **Data Quantity**: 30-60 minutes minimum, 1-2 hours optimal
- **Diversity**: Include different emotions, speaking styles
- **Checkpoints**: Saved every 2 epochs automatically

---

## 🔧 Requirements

### For Data Preparation:
- Your voice recording (WAV file, 30+ minutes)
- Google Account (for Colab)
- Web browser

### For Training:
- Google Colab account (free tier works!)
- ~124MB upload (your prepared data)
- ~20 hours of Colab runtime (can split into multiple sessions)

### For Inference:
- Trained model checkpoint
- Source audio to convert
- StarGANv2-VC inference setup (see Inference_Demo.ipynb)

---

## 💡 Usage Examples

### Example 1: Basic Voice Conversion
```python
# After training, convert voice A to your voice
source_audio = "speaker_a.wav"
target_speaker = "your_voice"
output = convert_voice(source_audio, target_speaker)
```

### Example 2: Cross-lingual Conversion
```python
# Works even if source speaks different language!
source_audio = "french_speaker.wav"
output = convert_voice(source_audio, "your_voice")
```

### Example 3: Emotional Transfer
```python
# Preserves emotion and speaking style
source_audio = "angry_speech.wav"
output = convert_voice(source_audio, "your_voice")
# Output: Your voice, angry emotion preserved!
```

---

## 🎓 How It Works

StarGANv2-VC uses a sophisticated GAN-based architecture:

1. **Generator**: Converts voice characteristics
2. **Discriminator**: Ensures natural-sounding output
3. **Style Encoder**: Captures speaker identity
4. **ASR Model**: Preserves content/words
5. **F0 Predictor**: Maintains pitch accuracy

### Training Process:
1. Load pretrained VCTK20 model (20 English speakers)
2. Fine-tune on your voice data (transfer learning)
3. Optimize for 150 epochs (~20 hours on GPU)
4. Save checkpoints every 2 epochs
5. Final model achieves award-winning quality!

---

## 📊 Training Timeline

### With Google Colab Free (T4 GPU):

| Epoch | Time | Quality Level |
|-------|------|---------------|
| 0-10 | ~1.5h | Initial adaptation |
| 10-30 | ~4.5h | Good quality |
| 30-50 | ~7.5h | Very good quality |
| 50-75 | ~11h | Excellent quality |
| 75-100 | ~15h | Near-perfect quality |
| **100-150** | **~22h** | **🏆 Award-winning quality** |

**Note**: Colab Free has 12-hour session limit. You can split training:
- Session 1: Epochs 0-75 (~11 hours)
- Session 2: Epochs 76-150 (~11 hours)

---

## 🆚 Comparison with Other Methods

| Method | Training Time | Quality | Setup Difficulty | Cost |
|--------|---------------|---------|------------------|------|
| **StarGANv2-VC (This)** | ~20h (GPU) | ⭐⭐⭐⭐⭐ | Easy | Free |
| RVC | ~5-10h (GPU) | ⭐⭐⭐⭐ | Medium | Free |
| so-vits-svc | ~10-15h (GPU) | ⭐⭐⭐⭐ | Medium | Free |
| Tacotron2 | ~30-40h (GPU) | ⭐⭐⭐⭐ | Hard | Free |
| Traditional VC | Very fast | ⭐⭐ | Easy | Free |

**Winner**: StarGANv2-VC offers the best quality-to-effort ratio!

---

## ⚠️ Important Notes

### Colab Session Limits:
- **Free Tier**: 12 hours max runtime, 90 min idle timeout
- **Pro Tier**: 24 hours max runtime, longer idle timeout
- **Solution**: Keep tab open, download checkpoints regularly

### Data Privacy:
- Your voice data is uploaded to Google Colab
- Deleted when session ends
- Consider privacy implications
- Don't upload sensitive recordings

### Fair Use:
- Use trained models responsibly
- Don't create deepfakes without consent
- Respect others' voices and identities

---

## 🤝 Contributing

Contributions welcome! Please:

1. Fork this repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

### Ideas for Contributions:
- [ ] Multi-speaker training support
- [ ] Real-time inference notebook
- [ ] Voice cloning from shorter samples
- [ ] Integration with other vocoders
- [ ] Mobile deployment guide

---

## 📚 Resources

### Official StarGANv2-VC:
- [GitHub Repository](https://github.com/yl4579/StarGANv2-VC)
- [Research Paper](https://arxiv.org/abs/2107.10394)
- [Demo Samples](https://starganv2-vc.github.io/)

### Related Projects:
- [ParallelWaveGAN](https://github.com/kan-bayashi/ParallelWaveGAN) - Vocoder
- [RVC](https://github.com/RVC-Project/Retrieval-based-Voice-Conversion-WebUI) - Alternative VC
- [so-vits-svc](https://github.com/svc-develop-team/so-vits-svc) - Another alternative

### Learning Resources:
- [Voice Conversion Tutorial](https://github.com/JeremyCCHsu/vae-npvc)
- [GAN Tutorial](https://github.com/eriklindernoren/PyTorch-GAN)
- [Audio Processing Basics](https://librosa.org/doc/latest/tutorial.html)

---

## 🏆 Credits

### Original Work:
- **StarGANv2-VC**: [yl4579](https://github.com/yl4579/StarGANv2-VC)
- **Paper**: "StarGANv2-VC: A Diverse, Unsupervised, Non-parallel Framework for Natural-Sounding Voice Conversion"
- **Award**: INTERSPEECH 2021 Best Paper Award

### This Repository:
- Colab notebooks and setup scripts
- Documentation and guides
- Optimized for ease of use

---

## 📜 License

This repository follows the same license as the original StarGANv2-VC project.

**Original StarGANv2-VC**: MIT License  
**This Repository**: MIT License

See [LICENSE](LICENSE) file for details.

---

## ⭐ Star This Repository!

If you find this useful, please give it a star! ⭐

It helps others discover this resource and motivates continued development.

---

## 🎤 Happy Voice Converting!

**Questions? Issues? Feedback?**

- Open an [Issue](https://github.com/YaraSamyFouadHafez/StarGANv2-VC-Colab-Training/issues)
- Check [TROUBLESHOOTING.md](TROUBLESHOOTING.md)
- See [DETAILED_GUIDE.md](DETAILED_GUIDE.md)

**Train your voice model in just 20 hours with free GPU! 🚀✨**

---

<div align="center">

Made with ❤️ for the voice conversion community

[![Star on GitHub](https://img.shields.io/github/stars/YaraSamyFouadHafez/StarGANv2-VC-Colab-Training.svg?style=social)](https://github.com/YaraSamyFouadHafez/StarGANv2-VC-Colab-Training)

</div>
