class Estado < ActiveRecord::Base

  def next
    Estado.where("estados.id > ?", self.id).order("estados.id ASC").limit(1)
  end

end
