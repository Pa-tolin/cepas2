# require 'rails_helper'

# RSpec.describe Strain, type: :model do
#   context "All Strain´s name can´t to be blank" do
#     it 'is not permit strain whit the same name' do
#       strain = Strain.create(name: '', available: false)
#       expect(strain).to_not be_valid
#     end
#   end
# end
#repasar porque no estoy segura que sea así, de qué forma puedo poner los otros ejemplos.

require 'rails_helper'

RSpec.describe Strain, type: :model do
    it 'is not valid without a name' do
        strain = Strain.create
        expect(strain).to_not be_valid
    end
    it 'is not valid without a name' do
        strain = Strain.create(name: nil)
        expect(strain).to_not be_valid
    end
    it 'is not valid without a name' do
        strain = Strain.create(name: "")
        expect(strain).to_not be_valid
    end
    it 'is valid valid with a name' do
        strain = Strain.create(name: "Carmenere")
        expect(strain).to be_valid
    end
    it 'is not valid with the same name' do
        strain = Strain.create(name: "Merlot", available: true)
        strain2 = Strain.create(name: "Merlot", available: true)
        expect(strain2).to_not be_valid
    end
end