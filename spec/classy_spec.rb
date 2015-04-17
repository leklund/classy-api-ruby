require 'spec_helper'

describe Classy do
  after do
    Classy.reset
  end

  describe '.client' do
    it 'should be a Class::Client' do
      expect(Classy.client).to be_a(Classy::Client)
    end
  end

  describe 'endpoint' do
    it 'should return the default endpoint' do
      expect(Classy.endpoint).to eq(Classy::Configuration::DEFAULT_ENDPOINT)
    end
    it 'should set the endpoint' do
      Classy.endpoint = 'http://foo.bar/'
      expect(Classy.endpoint).to eq('http://foo.bar/')
    end
  end
  describe 'user_agent' do
    it 'should return the default user_agent' do
      expect(Classy.user_agent).to eq(Classy::Configuration::DEFAULT_USER_AGENT)
    end
    it 'should set the user_agent' do
      Classy.user_agent = 'zaphod2.0'
      expect(Classy.user_agent).to eq('zaphod2.0')
    end
  end
  describe 'format' do
    it 'should return the default format' do
      expect(Classy.format).to eq(Classy::Configuration::DEFAULT_FORMAT)
    end
    it 'should set the format' do
      Classy.format = 'xml'
      expect(Classy.format).to eq('xml')
    end
  end
  describe 'adapter' do
    it 'should return the default adapter' do
      expect(Classy.adapter).to eq(Classy::Configuration::DEFAULT_ADAPTER)
    end
    it 'should set the adapter' do
      Classy.adapter = :patron
      expect(Classy.adapter).to eq(:patron)
    end
  end

  describe 'configure' do
    Classy::Configuration::VALID_CONFIG_KEYS.each do |k|
      it "should set the value of #{k}" do
        Classy.configure do |conf|
          conf.send("#{k}=", k)
          expect(Classy.send(k)).to eq(k)
        end
      end
    end
  end

end
