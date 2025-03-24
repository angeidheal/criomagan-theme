# Criomagan Theme

A modern, responsive 3-column blog theme for Jekyll with PWA support and localization features.

## Features

- 🖥️ Responsive 3-column layout
- 🌐 Multi-language support
- 📱 PWA (Progressive Web App) support
- 🔍 SEO optimized with Jekyll SEO Tag
- 📰 RSS Feed support
- 🗺️ Sitemap generation
- 📊 Pagination
- 🔗 Social media integration:
  - GitHub
  - Mastodon
  - Pixelfed
  - Bluesky
  - Facebook
  - Instagram
  - LinkedIn
  - Threads
  - Twitter/X
  - YouTube
  - RSS
- 🏃 Fast loading and performance optimized
- 📖 Clean typography
- 🎨 Customizable theme settings

## Installation

1. Fork this repository
2. Clone your fork:
   ```bash
   git clone https://github.com/YOUR-USERNAME/criomagan-theme.git
   ```
3. Install dependencies:
   ```bash
   bundle install
   ```
4. Configure `_config.yml`:
   - Set your site title, description, and URL
   - Update author information
   - Configure social media links
   - Adjust pagination settings

5. Enable GitHub Pages:
   - Go to repository Settings > Pages
   - Set source to "GitHub Actions"

## Local Development

Run the site locally:
```bash
bundle exec jekyll serve
```
Visit `http://localhost:4000` in your browser.

## Creating Posts

1. Add new posts in `_posts` directory using the format:
   ```
   YYYY-MM-DD-title.md
   ```

2. Include front matter:
   ```yaml
   ---
   layout: post
   title: "Your Post Title"
   date: YYYY-MM-DD HH:MM:SS +/-TTTT
   categories: [category1, category2]
   lang: en  # or your language code
   ---
   ```

## Customization

### Theme Settings
Edit `_config.yml` to customize:
- Site metadata
- Author information
- Social media links
- PWA settings
- Pagination

### Localization
1. Add language files in `_data/locales/`
2. Set post language in front matter
3. Update `_config.yml` language settings

## License

MIT License - feel free to use this theme for your own site. 