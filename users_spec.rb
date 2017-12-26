require_relative '../parties/users'

RSpec.describe "Users" do

    context "Login" do

      it "should returns 200 with a valid password" do
        response = Users.login("paulo7@mail.com", "123456")
        expect(response.code).to eq(200)
      end

      it "should returns 401 with an invalid password" do
        response = Users.login("paulo7@mail.com", "1234568")
        expect(response.code).to eq(401)
      end

    end

    context "Get All Users" do

        it "should returns 200 with a valid cookie" do
            response = Users.login("paulo7@mail.com", "123456")
            cookie = Users.get_cookie(response)
            expect(Users.get_users(cookie).code).to eq(200)
        end

        it "should returns 401 with an invalid cookie" do
            cookie = { 'Authorization' => 'JWT sdasd' }
            expect(Users.get_users(cookie).code).to eq(401)
        end

        it "should returns 401 with no cookie" do
            expect(Users.get_users().code).to eq(401)
        end

    end

end