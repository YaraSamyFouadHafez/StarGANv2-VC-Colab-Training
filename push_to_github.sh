#!/bin/bash

# 🚀 Push Your Files to GitHub Repository
# Run this script to update your repository with the latest changes

echo "════════════════════════════════════════════════════════════════════════════"
echo "                    📤 PUSHING TO GITHUB REPOSITORY                          "
echo "════════════════════════════════════════════════════════════════════════════"
echo ""

cd /workspaces/codespaces-blank/StarGANv2-VC-Colab-Training

echo "📊 Current Status:"
echo ""
git status
echo ""
echo "════════════════════════════════════════════════════════════════════════════"
echo ""

# Check if there are changes to push
if git log origin/main..HEAD &>/dev/null; then
    echo "📝 Changes to push:"
    git log origin/main..HEAD --oneline
    echo ""
    echo "════════════════════════════════════════════════════════════════════════════"
    echo ""
    
    echo "🔑 Authenticating with GitHub..."
    echo ""
    echo "If you see a permission error, you need to authenticate:"
    echo ""
    echo "Option 1: Use GitHub CLI (Recommended):"
    echo "  gh auth login"
    echo ""
    echo "Option 2: Use Personal Access Token:"
    echo "  1. Go to: https://github.com/settings/tokens"
    echo "  2. Generate new token (classic) with 'repo' scope"
    echo "  3. Copy the token"
    echo "  4. Run: git push"
    echo "  5. When prompted for password, paste your token"
    echo ""
    echo "════════════════════════════════════════════════════════════════════════════"
    echo ""
    
    # Try to push
    echo "🚀 Attempting to push..."
    if git push origin main; then
        echo ""
        echo "════════════════════════════════════════════════════════════════════════════"
        echo "                        ✅ PUSH SUCCESSFUL! ✅                               "
        echo "════════════════════════════════════════════════════════════════════════════"
        echo ""
        echo "🎉 Your repository has been updated!"
        echo ""
        echo "📍 View your repository:"
        echo "   https://github.com/YaraSamyFouadHafez/StarGANv2-VC-Colab-Training"
        echo ""
        echo "🚀 Start training in Colab:"
        echo "   https://colab.research.google.com/github/YaraSamyFouadHafez/StarGANv2-VC-Colab-Training/blob/main/Train_StarGANv2_VC.ipynb"
        echo ""
    else
        echo ""
        echo "════════════════════════════════════════════════════════════════════════════"
        echo "                         ⚠️  PUSH FAILED  ⚠️                                "
        echo "════════════════════════════════════════════════════════════════════════════"
        echo ""
        echo "🔧 To fix this, authenticate with GitHub:"
        echo ""
        echo "EASIEST METHOD:"
        echo "  gh auth login --web"
        echo ""
        echo "Then run this script again!"
        echo ""
    fi
else
    echo "✅ All changes already pushed to GitHub!"
    echo ""
    echo "📍 Your repository:"
    echo "   https://github.com/YaraSamyFouadHafez/StarGANv2-VC-Colab-Training"
    echo ""
fi

echo "════════════════════════════════════════════════════════════════════════════"
