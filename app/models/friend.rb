class Friend < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true
    validates :phone, presence: true
    validates :twitter, presence: true

    belongs_to :user



    def self.to_csv
        CSV.generate do |csv|
           csv << column_names
               all.each do |recipy|
               csv << recipy.attributes.values_at(*column_names)
            end
        end
    end

    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
          recipy = find_by_id(row["id"]) || new
          recipy.attributes = row.to_hash
          recipy.save!
        end
    end


end
