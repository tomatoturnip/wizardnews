class WizardArticle

  attr_reader :name, :url, :description

  def initialize(name, url, description)
    @name = name
    @url = url
    @description = description
  end

  def write_to_csv(file)
    CSV.open(file, 'a+') do |csv|
      csv << [@name, @url, @description]
    end
  end

  def load_data
    CSV.foreach('articles.csv', headers: true) do |row|
      @name = row[0]
      @url = row[1]
      @description = row[2]
    end
  end

end
