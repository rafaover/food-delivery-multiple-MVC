require "csv"

class BaseRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @elements = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
    @next_id = @elements.empty? ? 1 : @elements.last.id + 1
  end

  def all
    return @elements
  end

  def create(new_data)
    new_data.id = @next_id
    @elements << new_data
    @next_id += 1
    save_csv
  end

  def delete_repo(id)
    @elements.delete_if { |data| data.id == id }
    save_csv
  end

  def find(id)
    return @elements.find { |data| data.id == id }
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      @elements << construct_model(row)
    end
  end

  def save_csv
    return if @elements.empty?

    CSV.open(@csv_file, "wb") do |csv|
      csv << @elements[0].class.headers
      @elements.each do |hash_data|
        csv << hash_data.csv_data
      end
    end
  end
end
