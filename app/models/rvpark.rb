class Rvpark < ApplicationRecord
    scope :search, -> (search) {where(parkName: search)}

    def search(search)
        where("search LIKE ?", search)
    end
end
