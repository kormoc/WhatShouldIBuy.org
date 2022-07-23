# https://jekyllrb.com/docs/plugins/generators/

module CategoryPlugin
  class CategoryPageGenerator < Jekyll::Generator
    safe true

    def generate(site)
      site.data.category.each_key do |category|
        site.pages << CategoryPage.new(site, category)
      end
    end
  end

  # Subclass of `Jekyll::Page` with custom method definitions.
  class CategoryPage < Jekyll::Page
    def initialize(site, category)
      @site = site             # the current site instance.
      @base = site.source      # path to the source directory.
      @dir  = category         # the directory the page will reside in.

      # All pages have the same filename, so define attributes straight away.
      @basename = 'index'      # filename without the extension.
      @ext      = '.html'      # the extension.
      @name     = 'index.html' # basically @basename + @ext.

      @data = {}

      # Look up front matter defaults scoped to type `categories`, if given key
      # doesn't exist in the `data` hash.
      data.default_proc = proc do |_, key|
        site.frontmatter_defaults.find(relative_path, :categories, key)
      end
    end

    # Placeholders that are used in constructing page URL.
    def url_placeholders
      {
        :category   => @dir,
        :basename   => basename,
        :output_ext => output_ext,
      }
    end
  end
end
