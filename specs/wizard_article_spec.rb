require 'rspec'
require_relative '../lib/wizard_article'

describe WizardArticle do

  let(:article_example) { WizardArticle.new("pottermore", "www.msn.com", "potter heads unite!") }

  it 'has a name field for form submission' do
    expect(article_example.name).to eq("pottermore")
  end

  it 'has a url field for form submission' do
    expect(article_example.url).to eq("www.msn.com")
  end

  it 'has a description field for form submission' do
    expect(article_example.description).to eq("potter heads unite!")
  end

end


