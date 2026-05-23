#!/usr/bin/env bash
set -e

cd ~/code/abhinavgupta707

echo "=== git config check ==="
git config --global user.name  >/dev/null 2>&1 || git config --global user.name  "Abhinav Gupta"
git config --global user.email >/dev/null 2>&1 || git config --global user.email "abhinavgupta707@users.noreply.github.com"
echo "name:  $(git config --global user.name)"
echo "email: $(git config --global user.email)"

echo ""
echo "=== git init + commit ==="
if [ ! -d .git ]; then
  git init -b main
fi
# clean up any temp files from earlier
rm -f .tmp_check.sh .deploy.sh.bak 2>/dev/null || true
git add -A
git commit -m "init: profile" || echo "(nothing new to commit)"

echo ""
echo "=== create repo + push ==="
if gh repo view abhinavgupta707/abhinavgupta707 >/dev/null 2>&1; then
  echo "repo already exists, just pushing"
  git remote get-url origin >/dev/null 2>&1 || git remote add origin "https://github.com/abhinavgupta707/abhinavgupta707.git"
  git push -u origin main
else
  gh repo create abhinavgupta707 --public --source=. --push --description "Profile — built around deterministic AI agents"
fi

echo ""
echo "=== set METRICS_TOKEN secret ==="
gh secret set METRICS_TOKEN --body "$(gh auth token)" --repo abhinavgupta707/abhinavgupta707

echo ""
echo "=== run workflows ==="
gh workflow run "Metrics" --repo abhinavgupta707/abhinavgupta707 || echo "(metrics workflow run failed — may need a moment to be discovered)"
gh workflow run "3D contribution skyline" --repo abhinavgupta707/abhinavgupta707 || echo "(3d workflow run failed — may need a moment)"

echo ""
echo "=== done ==="
echo "Repo:  https://github.com/abhinavgupta707/abhinavgupta707"
echo "Actions: https://github.com/abhinavgupta707/abhinavgupta707/actions"
echo "Profile: https://github.com/abhinavgupta707"
