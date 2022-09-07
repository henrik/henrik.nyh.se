# henrik.nyh.se

Static HTML site.


## Development

Install dependencies (once):

```
bundle
```

CSS is being generated from SCSS (Sass). To automatically convert SCSS on edit, run this in a separate (tmux) window:

```
script/watch
```

If something doesn't appear to work, watch that window for errors and warnings.

The content is in a `public` directory to work with [Pow](http://pow.cx) for local development.

Or just do this in an macOS terminal:
```
open public/index.html
```


## Production

Push to deploy on Netlify.

This also converts SCSS to CSS, whether or not you've already done so locally.
