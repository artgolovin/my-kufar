I18n.load_path += Dir[Rails.root.join('lib', 'locales', '**', '*.yml')]
 
I18n.available_locales = [:en, :ru]
 
I18n.default_locale = :en
