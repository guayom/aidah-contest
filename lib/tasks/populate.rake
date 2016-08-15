namespace :populate do
  desc "Populate categories with test data"
  task categories: :environment do
    @categories = ['Grupal', 'Contemporáneo', 'Categoría 3', 'Caegoría 4']
    @categories.each do |category|
      @category = Category.new
      @category.title = category
      if @category.save
        puts "Categoría #{category} creada con éxito"
      end
    end
  end

  desc "Destroy categories"
  task destroy_categories: :environment do
    if Category.destroy_all
      puts "Categorías eliminadas con éxito"
    end
  end

  desc "Pupolate participants with test data"
  task participants: :environment do
  end

end
