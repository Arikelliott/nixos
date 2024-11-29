So if Home-Manager doesn't symlink files into your home:

- Restart the home manager service (should hopefully just fix it. If it doesn't, do it again after other steps)
- There's cache files in ~/local/state, try deleting those?
