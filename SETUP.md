# Setup — abhinavgupta707/abhinavgupta707

## 1. Make the repo

GitHub treats a repo named exactly `<your-username>/<your-username>` as your profile README.

```bash
cd \\wsl.localhost\ubuntu\home\abhinav\code\abhinavgupta707
git init
git add .
git commit -m "init: profile"
git branch -M main
git remote add origin https://github.com/abhinavgupta707/abhinavgupta707.git
git push -u origin main
```

(Create the empty `abhinavgupta707/abhinavgupta707` repo on github.com first — public, no README.)

## 2. Create a Personal Access Token for `lowlighter/metrics`

The metrics action needs more scopes than the default `GITHUB_TOKEN`.

1. https://github.com/settings/tokens → **Generate new token (classic)**
2. Scopes: `public_repo`, `read:user`, `read:org` (add `repo` if you want private repo stats included)
3. Copy the token
4. In your `abhinavgupta707/abhinavgupta707` repo → Settings → Secrets and variables → Actions → New repository secret
   - Name: `METRICS_TOKEN`
   - Value: paste the token

## 3. Run the workflows once

- Actions tab → **Metrics** → Run workflow
- Actions tab → **3D contribution skyline** → Run workflow

After both finish (~1-2 min), the repo will contain `metrics.svg` and `profile-3d-contrib/profile-night-rainbow.svg`, and the README will render them.

## 4. Tweak

- **Change cycling subtitle text** → edit `assets/hero-dark.svg` + `assets/hero-light.svg` (3 `<tspan>` elements near the bottom).
- **Pick a different 3D skyline style** → swap `SETTING_JSON` in `.github/workflows/3d-contrib.yml`. Options at https://github.com/yoshi389111/github-profile-3d-contrib/tree/master/sample-settings — try `profile-season.json`, `profile-gitblock.json`, `profile-violet.json`.
- **Change metrics plugins** → edit `.github/workflows/metrics.yml`. Full plugin list: https://github.com/lowlighter/metrics/tree/master/source/plugins.
- **Don't like a section?** Delete its block in `README.md` and remove the matching workflow.

## 5. Optional add-ons (none are required)

- **Latest blog posts** (if you start one): add `gautamkrishnar/blog-post-workflow` and insert a `<!-- BLOG-POST-LIST:START --><!-- BLOG-POST-LIST:END -->` block in README.md.
- **WakaTime coding time** (if you wire up the editor plugin): add `athul/waka-readme`.
- **GitHub Sponsors button** (if you turn it on): add a `.github/FUNDING.yml`.

## Why these specific tools

- **`lowlighter/metrics`** — produces the exact heatmap + activity-radar combo you screenshotted, plus language breakdown and "habits" chart, all in one SVG. Self-host via Action because the SaaS instance was sunset.
- **`yoshi389111/github-profile-3d-contrib`** — only well-maintained 3D contribution renderer; runs entirely on `GITHUB_TOKEN`, no API key needed.
- **Custom hero SVG** — written by hand specifically for you. SMIL animations (orbiting agent-graph nodes, cycling subtitle, blinking cursor, drawn underline) all run natively in GitHub-rendered markdown, no JS required.
- **`<picture>` swap** — modern way to ship light/dark themed assets. Both hero SVGs match Tokyo Night in dark and a clean indigo palette in light.

## Why these tools were *not* used

- **`Platane/snk` (snake)** — now a "I copied a tutorial" tell.
- **`ryo-ma/github-profile-trophy`** — gamified filler.
- **`tandpfun/skill-icons` wall** — recruiter red flag.
- **Spotify "now playing"** — meme in 2026.
- **`readme-typing-svg`** — replaced with a real cycling subtitle in the custom hero, so the animation feels intentional, not template.
