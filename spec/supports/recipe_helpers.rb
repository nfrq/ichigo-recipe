require 'forwardable'

module RecipeHelpers

  def recipe(name, &block)
    InsertData.new(name, &block).save
  end

  class InsertData
    extend Forwardable

    attr_reader :recipe
    def_delegator :recipe, :save

    def initialize(name, &block)
      @recipe = Recipe.new(name: name)
      instance_eval(&block) if block_given?
    end

    def ingredient(ingredient_name)
      recipe.ingredients << ingredient_name
    end

    def method
      block_given? ? yield : super
    end

    def step(method_step)
      recipe.method_steps << method_step
    end

  end

end
