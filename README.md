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

Or just do this in an OS X terminal:
```
open public/index.html
```


## Production

To convert SCSS to CSS and deploy by scp:

```
script/deploy
```
