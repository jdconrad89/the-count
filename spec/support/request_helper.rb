module RequestHelper

  def user_hash
    {
      provider: 'facebook',
      uid: '1234567',
      info: {
        email: 'joe@bloggs.com',
        name: 'Joe Bloggs',
        first_name: 'Joe',
        last_name: 'Bloggs',
        image: 'http://graph.facebook.com/1234567/picture?type=square',
        verified: true
      },
      credentials: {
        token: 'EAADdyFE7tA4BAIlZA4c4kDTsn3P4lQfQIPfKggDs0rYfr4JXgz3LHVEZBNtgdwyzFxZCpMTQJVRXy7jBNZAmoY7NgKIKK77kK6MZBz0d4ty9XOxI59vb1GNmKNjfsL0gbeZAT2zZCriWAYiyrdEvYFWiTcnfL5SDyMnkZB1qaT7uK2KeEmZBMr2H8kZAjHbPclsZCZAonhPZBGMlCnTuGKmVnIe15',
        expires_at: 1321747205, # when the access token expires (it always will)
        expires: true # this will always be true
      },
      extra: {
        raw_info: {
          id: '1234567',
          name: 'Joe Bloggs',
          first_name: 'Joe',
          last_name: 'Bloggs',
          link: 'http://www.facebook.com/jbloggs',
          username: 'jbloggs',
          location: { id: '123456789', name: 'Palo Alto, California' },
          gender: 'male',
          email: 'joe@bloggs.com',
          timezone: -8,
          locale: 'en_US',
          verified: true,
          updated_time: '2011-11-11T06:21:03+0000'
        }
      }
    }
  end

  def oauth_setup
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(user_hash)
  end
end
