# -*- coding: utf-8 -*-
require File.dirname(__FILE__) + '/../spec_helper'

describe User do

  context 'on validations' do

    before(:each) do
      @user = User.create!(
        :email => 'testuser@example.com',
        :name => 'testuser',
        :login => 'testuser',
        :password => 'testpassword',
        :password_confirmation => 'testpassword' )
    end

    after do
      User.destroy_all
    end

    it { should validate_presence_of(:login) }
    it { should validate_presence_of(:email) }

    it { should validate_uniqueness_of(:email) }
    it { should validate_uniqueness_of(:login) }

    it { should have_many(:entries) }

    it { should_not allow_value('no-email#mail').for(:email).with_message(/should look like an email address/) }
    it { should_not allow_mass_assignment_of(:crypted_password) }
    it { should_not allow_mass_assignment_of(:salt) }

  end

end