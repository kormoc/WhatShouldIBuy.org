# Adding a new entry

You can copy an existing yaml file in the category directory and update it's values.
We generally leave zero values as blank, with the exception of date values, which are
'0000-00-00'.

# Updating a category template

Once the \_template.yml is updated, refresh all the category yaml files via the
`_scripts/create_category_entry.sh` script. This script requires `yq` and bash.

Example
```
~/WhatShouldIBuy.org > for path in _data/category/hubs/[A-Z]*.yml; do ./_scripts/create_category_entry.sh hubs $path; done
```

# Adding a new category

Create a new directory in `_data/category` and create a template file called `_template.yml`.

`_template.yml` must contain the `Page` data, which contains the page title and the `Template`, which defines
the order of the table output.
