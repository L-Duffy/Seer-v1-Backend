# Seer v1 (Backend)

Seer is a mobile-first photo library app with a tagging system for easy image access.

It utilizes a Ruby on Rails backend, React.js frontend, and Cloudinary for image hosting)

## Installation

```bash
bundle install
rails db:create db:migrate db:seed
```

You'll need to have the [frontend code](https://github.com/L-Duffy/Seer-v1-Frontend) running as well.

## Usage

```bash
rails server
```

You can test web requests as documented in the `requests.http` file.

## Roadmap

EXIF Metadata editing, dynamic Tailwind grid improvements, Tagging system overhaul, further CSS stylings.
