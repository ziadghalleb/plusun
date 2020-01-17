class AddRelationsToModels < ActiveRecord::Migration[5.2]
  def change
    add_reference :services, :user, index: true
    add_reference :bookings, :user, index: true
    add_reference :bookings, :service, index: true
  end
end
