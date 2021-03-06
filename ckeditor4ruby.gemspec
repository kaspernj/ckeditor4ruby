# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ckeditor4ruby}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Kasper Johansen"]
  s.date = %q{2012-07-19}
  s.description = %q{CKEditor-port for Ruby.}
  s.email = %q{k@spernj.org}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "ckeditor/CHANGES.html",
    "ckeditor/INSTALL.html",
    "ckeditor/LICENSE.html",
    "ckeditor/adapters/jquery.js",
    "ckeditor/ckeditor.js",
    "ckeditor/ckeditor.pack",
    "ckeditor/ckeditor.rb",
    "ckeditor/ckeditor_basic.js",
    "ckeditor/ckeditor_basic_source.js",
    "ckeditor/ckeditor_source.js",
    "ckeditor/config.js",
    "ckeditor/contents.css",
    "ckeditor/images/spacer.gif",
    "ckeditor/lang/_languages.js",
    "ckeditor/lang/_translationstatus.txt",
    "ckeditor/lang/af.js",
    "ckeditor/lang/ar.js",
    "ckeditor/lang/bg.js",
    "ckeditor/lang/bn.js",
    "ckeditor/lang/bs.js",
    "ckeditor/lang/ca.js",
    "ckeditor/lang/cs.js",
    "ckeditor/lang/cy.js",
    "ckeditor/lang/da.js",
    "ckeditor/lang/de.js",
    "ckeditor/lang/el.js",
    "ckeditor/lang/en-au.js",
    "ckeditor/lang/en-ca.js",
    "ckeditor/lang/en-gb.js",
    "ckeditor/lang/en.js",
    "ckeditor/lang/eo.js",
    "ckeditor/lang/es.js",
    "ckeditor/lang/et.js",
    "ckeditor/lang/eu.js",
    "ckeditor/lang/fa.js",
    "ckeditor/lang/fi.js",
    "ckeditor/lang/fo.js",
    "ckeditor/lang/fr-ca.js",
    "ckeditor/lang/fr.js",
    "ckeditor/lang/gl.js",
    "ckeditor/lang/gu.js",
    "ckeditor/lang/he.js",
    "ckeditor/lang/hi.js",
    "ckeditor/lang/hr.js",
    "ckeditor/lang/hu.js",
    "ckeditor/lang/is.js",
    "ckeditor/lang/it.js",
    "ckeditor/lang/ja.js",
    "ckeditor/lang/ka.js",
    "ckeditor/lang/km.js",
    "ckeditor/lang/ko.js",
    "ckeditor/lang/lt.js",
    "ckeditor/lang/lv.js",
    "ckeditor/lang/mn.js",
    "ckeditor/lang/ms.js",
    "ckeditor/lang/nb.js",
    "ckeditor/lang/nl.js",
    "ckeditor/lang/no.js",
    "ckeditor/lang/pl.js",
    "ckeditor/lang/pt-br.js",
    "ckeditor/lang/pt.js",
    "ckeditor/lang/ro.js",
    "ckeditor/lang/ru.js",
    "ckeditor/lang/sk.js",
    "ckeditor/lang/sl.js",
    "ckeditor/lang/sr-latn.js",
    "ckeditor/lang/sr.js",
    "ckeditor/lang/sv.js",
    "ckeditor/lang/th.js",
    "ckeditor/lang/tr.js",
    "ckeditor/lang/uk.js",
    "ckeditor/lang/vi.js",
    "ckeditor/lang/zh-cn.js",
    "ckeditor/lang/zh.js",
    "ckeditor/plugins/a11yhelp/dialogs/a11yhelp.js",
    "ckeditor/plugins/a11yhelp/lang/en.js",
    "ckeditor/plugins/a11yhelp/lang/he.js",
    "ckeditor/plugins/about/dialogs/about.js",
    "ckeditor/plugins/about/dialogs/logo_ckeditor.png",
    "ckeditor/plugins/adobeair/plugin.js",
    "ckeditor/plugins/ajax/plugin.js",
    "ckeditor/plugins/autogrow/plugin.js",
    "ckeditor/plugins/bbcode/plugin.js",
    "ckeditor/plugins/clipboard/dialogs/paste.js",
    "ckeditor/plugins/colordialog/dialogs/colordialog.js",
    "ckeditor/plugins/devtools/lang/en.js",
    "ckeditor/plugins/devtools/plugin.js",
    "ckeditor/plugins/dialog/dialogDefinition.js",
    "ckeditor/plugins/div/dialogs/div.js",
    "ckeditor/plugins/docprops/dialogs/docprops.js",
    "ckeditor/plugins/docprops/plugin.js",
    "ckeditor/plugins/find/dialogs/find.js",
    "ckeditor/plugins/flash/dialogs/flash.js",
    "ckeditor/plugins/flash/images/placeholder.png",
    "ckeditor/plugins/forms/dialogs/button.js",
    "ckeditor/plugins/forms/dialogs/checkbox.js",
    "ckeditor/plugins/forms/dialogs/form.js",
    "ckeditor/plugins/forms/dialogs/hiddenfield.js",
    "ckeditor/plugins/forms/dialogs/radio.js",
    "ckeditor/plugins/forms/dialogs/select.js",
    "ckeditor/plugins/forms/dialogs/textarea.js",
    "ckeditor/plugins/forms/dialogs/textfield.js",
    "ckeditor/plugins/forms/images/hiddenfield.gif",
    "ckeditor/plugins/iframe/dialogs/iframe.js",
    "ckeditor/plugins/iframe/images/placeholder.png",
    "ckeditor/plugins/iframedialog/plugin.js",
    "ckeditor/plugins/image/dialogs/image.js",
    "ckeditor/plugins/link/dialogs/anchor.js",
    "ckeditor/plugins/link/dialogs/link.js",
    "ckeditor/plugins/link/images/anchor.gif",
    "ckeditor/plugins/liststyle/dialogs/liststyle.js",
    "ckeditor/plugins/pagebreak/images/pagebreak.gif",
    "ckeditor/plugins/pastefromword/filter/default.js",
    "ckeditor/plugins/pastetext/dialogs/pastetext.js",
    "ckeditor/plugins/placeholder/dialogs/placeholder.js",
    "ckeditor/plugins/placeholder/lang/en.js",
    "ckeditor/plugins/placeholder/lang/he.js",
    "ckeditor/plugins/placeholder/placeholder.gif",
    "ckeditor/plugins/placeholder/plugin.js",
    "ckeditor/plugins/scayt/dialogs/options.js",
    "ckeditor/plugins/scayt/dialogs/toolbar.css",
    "ckeditor/plugins/showblocks/images/block_address.png",
    "ckeditor/plugins/showblocks/images/block_blockquote.png",
    "ckeditor/plugins/showblocks/images/block_div.png",
    "ckeditor/plugins/showblocks/images/block_h1.png",
    "ckeditor/plugins/showblocks/images/block_h2.png",
    "ckeditor/plugins/showblocks/images/block_h3.png",
    "ckeditor/plugins/showblocks/images/block_h4.png",
    "ckeditor/plugins/showblocks/images/block_h5.png",
    "ckeditor/plugins/showblocks/images/block_h6.png",
    "ckeditor/plugins/showblocks/images/block_p.png",
    "ckeditor/plugins/showblocks/images/block_pre.png",
    "ckeditor/plugins/smiley/dialogs/smiley.js",
    "ckeditor/plugins/smiley/images/angel_smile.gif",
    "ckeditor/plugins/smiley/images/angry_smile.gif",
    "ckeditor/plugins/smiley/images/broken_heart.gif",
    "ckeditor/plugins/smiley/images/confused_smile.gif",
    "ckeditor/plugins/smiley/images/cry_smile.gif",
    "ckeditor/plugins/smiley/images/devil_smile.gif",
    "ckeditor/plugins/smiley/images/embaressed_smile.gif",
    "ckeditor/plugins/smiley/images/envelope.gif",
    "ckeditor/plugins/smiley/images/heart.gif",
    "ckeditor/plugins/smiley/images/kiss.gif",
    "ckeditor/plugins/smiley/images/lightbulb.gif",
    "ckeditor/plugins/smiley/images/omg_smile.gif",
    "ckeditor/plugins/smiley/images/regular_smile.gif",
    "ckeditor/plugins/smiley/images/sad_smile.gif",
    "ckeditor/plugins/smiley/images/shades_smile.gif",
    "ckeditor/plugins/smiley/images/teeth_smile.gif",
    "ckeditor/plugins/smiley/images/thumbs_down.gif",
    "ckeditor/plugins/smiley/images/thumbs_up.gif",
    "ckeditor/plugins/smiley/images/tounge_smile.gif",
    "ckeditor/plugins/smiley/images/whatchutalkingabout_smile.gif",
    "ckeditor/plugins/smiley/images/wink_smile.gif",
    "ckeditor/plugins/specialchar/dialogs/specialchar.js",
    "ckeditor/plugins/specialchar/lang/en.js",
    "ckeditor/plugins/styles/styles/default.js",
    "ckeditor/plugins/stylesheetparser/plugin.js",
    "ckeditor/plugins/table/dialogs/table.js",
    "ckeditor/plugins/tableresize/plugin.js",
    "ckeditor/plugins/tabletools/dialogs/tableCell.js",
    "ckeditor/plugins/templates/dialogs/templates.js",
    "ckeditor/plugins/templates/templates/default.js",
    "ckeditor/plugins/templates/templates/images/template1.gif",
    "ckeditor/plugins/templates/templates/images/template2.gif",
    "ckeditor/plugins/templates/templates/images/template3.gif",
    "ckeditor/plugins/uicolor/dialogs/uicolor.js",
    "ckeditor/plugins/uicolor/lang/en.js",
    "ckeditor/plugins/uicolor/lang/he.js",
    "ckeditor/plugins/uicolor/plugin.js",
    "ckeditor/plugins/uicolor/uicolor.gif",
    "ckeditor/plugins/uicolor/yui/assets/hue_bg.png",
    "ckeditor/plugins/uicolor/yui/assets/hue_thumb.png",
    "ckeditor/plugins/uicolor/yui/assets/picker_mask.png",
    "ckeditor/plugins/uicolor/yui/assets/picker_thumb.png",
    "ckeditor/plugins/uicolor/yui/assets/yui.css",
    "ckeditor/plugins/uicolor/yui/yui.js",
    "ckeditor/plugins/wsc/dialogs/ciframe.html",
    "ckeditor/plugins/wsc/dialogs/tmpFrameset.html",
    "ckeditor/plugins/wsc/dialogs/wsc.css",
    "ckeditor/plugins/wsc/dialogs/wsc.js",
    "ckeditor/plugins/xml/plugin.js",
    "ckeditor/skins/kama/dialog.css",
    "ckeditor/skins/kama/editor.css",
    "ckeditor/skins/kama/icons.png",
    "ckeditor/skins/kama/icons_rtl.png",
    "ckeditor/skins/kama/images/dialog_sides.gif",
    "ckeditor/skins/kama/images/dialog_sides.png",
    "ckeditor/skins/kama/images/dialog_sides_rtl.png",
    "ckeditor/skins/kama/images/mini.gif",
    "ckeditor/skins/kama/images/noimage.png",
    "ckeditor/skins/kama/images/sprites.png",
    "ckeditor/skins/kama/images/sprites_ie6.png",
    "ckeditor/skins/kama/images/toolbar_start.gif",
    "ckeditor/skins/kama/skin.js",
    "ckeditor/skins/kama/templates.css",
    "ckeditor/skins/office2003/dialog.css",
    "ckeditor/skins/office2003/editor.css",
    "ckeditor/skins/office2003/icons.png",
    "ckeditor/skins/office2003/icons_rtl.png",
    "ckeditor/skins/office2003/images/dialog_sides.gif",
    "ckeditor/skins/office2003/images/dialog_sides.png",
    "ckeditor/skins/office2003/images/dialog_sides_rtl.png",
    "ckeditor/skins/office2003/images/mini.gif",
    "ckeditor/skins/office2003/images/noimage.png",
    "ckeditor/skins/office2003/images/sprites.png",
    "ckeditor/skins/office2003/images/sprites_ie6.png",
    "ckeditor/skins/office2003/skin.js",
    "ckeditor/skins/office2003/templates.css",
    "ckeditor/skins/v2/dialog.css",
    "ckeditor/skins/v2/editor.css",
    "ckeditor/skins/v2/icons.png",
    "ckeditor/skins/v2/icons_rtl.png",
    "ckeditor/skins/v2/images/dialog_sides.gif",
    "ckeditor/skins/v2/images/dialog_sides.png",
    "ckeditor/skins/v2/images/dialog_sides_rtl.png",
    "ckeditor/skins/v2/images/mini.gif",
    "ckeditor/skins/v2/images/noimage.png",
    "ckeditor/skins/v2/images/sprites.png",
    "ckeditor/skins/v2/images/sprites_ie6.png",
    "ckeditor/skins/v2/images/toolbar_start.gif",
    "ckeditor/skins/v2/skin.js",
    "ckeditor/skins/v2/templates.css",
    "ckeditor/themes/default/theme.js",
    "ckeditor4ruby.gemspec",
    "dev/README",
    "dev/index.rhtml",
    "dev/knjappserver_start.rb",
    "lib/ckeditor4ruby.rb",
    "spec/ckeditor4ruby_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/kaspernj/ckeditor4ruby}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{CKEditor-port for Ruby.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<knjrbfw>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.8.0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.3"])
      s.add_development_dependency(%q<knjappserver>, [">= 0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
    else
      s.add_dependency(%q<knjrbfw>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.8.0"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.3"])
      s.add_dependency(%q<knjappserver>, [">= 0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
    end
  else
    s.add_dependency(%q<knjrbfw>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.8.0"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bundler>, [">= 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.3"])
    s.add_dependency(%q<knjappserver>, [">= 0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
  end
end

