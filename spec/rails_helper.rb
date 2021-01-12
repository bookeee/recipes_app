# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
require 'pry'
require 'webmock/rspec'

ENV['RAILS_ENV'] ||= 'test'

if ENV['RAILS_ENV'] == 'test'
  require 'simplecov'
  SimpleCov.start 'rails'
end

require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
if Rails.env.production?
  abort('The Rails environment is running in production mode!')
end
require 'rspec/rails'

# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end

## access json fixtures
def json_data(filename:)
  file_content = file_fixture("#{filename}.json").read
  JSON.parse(file_content, symbolize_names: true)
end

def stub_client
  stub_request(:get, 'https://cdn.contentful.com/spaces/kk2bw5ojx476/environments/master/content_types?limit=1000')
    .with(
      headers: {
        'Accept-Encoding' => 'gzip',
        'Authorization' => 'Bearer 7ac531648a1b5e1dab6c18b0979f822a5aad0fe5f1109829b8a197eb2be4b84c',
        'Connection' => 'close',
        'Content-Type' => 'application/vnd.contentful.delivery.v1+json',
        'Host' => 'cdn.contentful.com',
        'User-Agent' => 'http.rb/4.4.1',
        'X-Contentful-User-Agent' => 'sdk contentful.rb/2.15.4; platform ruby/2.7.2; os Linux;'
      }
    )
    .to_return(status: 200, body: '', headers: {})
end

#
# module FixtureLoad
#   def load_fixture(file_path)
#     file_fixture(file_path).read
#   end
#
#   def json_file_fixture(file_path)
#     JSON.parse(load_fixture(file_path), symbolize_names: true)
#   end
# end
