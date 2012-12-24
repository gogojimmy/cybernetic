class CreateTranslactionTables < ActiveRecord::Migration
  def up
    Category.create_translation_table!({
      title: :string
    }, {
      migrate_data: true
    })
    Faq.create_translation_table!({
      answer: :text,
      question: :text
    }, {
      migrate_data: true
    })
    Post.create_translation_table!({
      title: :string,
      content: :text
    }, {
      migrate_data: true
    })
    Product.create_translation_table!({
      description: :text,
      feature: :text,
      knowledge: :text,
      name: :string,
      spec: :text,
      test: :text
    }, {
      migrate_data: true
    })

  end

  def down
    Category.drop_translation_table! migrate_data: true
    Faq.drop_translation_table! migrate_data: true
    Post.drop_translation_table! migrate_data: true
    Product.drop_translation_table! migrate_data: true
  end
end
