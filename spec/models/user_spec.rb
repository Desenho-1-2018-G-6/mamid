require "rails_helper"

RSpec.describe User, :type => :model do

    before(:each) do
        @user = User.new
        @user.first_name = "valid"
        @user.last_name = "name"
        @user.email = "valid@email.com"
        @user.email_confirmation = "valid@email.com"
        @user.cpf ="01234567890"
        @user.gender = "num interessa"
        @user.phone = "61 9827-8743"

    end

    context "user name validation" do
        it "should not save with no first name" do
            @user.first_name = "";
            expect(@user.save).not_to be(true)
            expect(@user.errors[:first_name]).to include("can't be blank")
            @user.first_name = "Valid"
            expect(@user.save).to be(true)
        end

        it "should not save with no last name" do
            @user.last_name = "";
            expect(@user.save).not_to be(true)
            expect(@user.errors[:last_name]).to include("can't be blank")
            @user.last_name = "Name"
            expect(@user.save).to be(true)
        end
    end

end