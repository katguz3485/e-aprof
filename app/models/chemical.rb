# t.integer "cid", default: 0, null: false
# t.string "formula_url", default: "", null: false
# t.string "cas_number", default: "", null: false
# t.string "purity", default: "", null: false
#


class Chemical < Item

  validates :cid, presence: true
  validates :cas_number, presence: true
  validates :formula_url, presence: true
  validates :purity, presence: true


end