require 'spec_helper'
require 'pry'

describe Classy do
  before do
    @keys = Classy::Configuration::VALID_CONFIG_KEYS
  end

  describe 'with module config' do
    before do
      Classy.configure do |conf|
        @keys.each do |k|
          conf.send("#{k}=", k)
        end
      end
    end

    after do
      Classy.reset
    end

    it 'should inherit the module config' do
      api = Classy::API.new
      @keys.each do |k|
        expect(api.send(k)).to eq(k)
      end
    end

    context 'class config' do
      before do
        @config = {
          cid: 1234,
          token: 'sometoken42',
          endpoint: 'https://classy.com/api/v2',
          format: 'json',
          user_agent: 'marvin99.99.99',
          adapter: :typhoeus
        }
      end

      context 'on init' do
        it 'should override module defaults' do
          api = Classy::API.new(@config)
          @keys.each do |k|
            expect(api.send(k)).to eq(@config[k])
          end
        end
      end

      context 'after init' do
        let(:api) { Classy::API.new }

        before do
          @config.each do |k,v|
            api.send("#{k}=", v)
          end
        end

        it 'should set options after init from config' do
          @keys.each do |k|
            expect(api.send(k)).to eq(@config[k])
          end
        end
      end
    end
  end


  it 'has a version number' do
    expect(Classy::VERSION).not_to be nil
  end

end
