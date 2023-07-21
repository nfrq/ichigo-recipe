$recipes = []

class Recipe

  attr_reader :name, :ingredients, :method_steps

  def self.clear
    $recipes.clear
  end

  def self.for(name)
    $recipes.find { |recipe| recipe.name.eql?(name) }
  end

  def initialize(name:, ingredients: [], steps: [])
    @name = name
    @ingredients  = ingredients
    @method_steps = steps
  end

  def save
    $recipes << self
  end

end