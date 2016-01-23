namespace :thorshi do
  desc "Available items get deleted if they become current."
  task delete_availables: :environment do
    Available.where("slot < ?", DateTime.now).destroy_all
  end

end
