require_relative '../spec_helper'

describe package('wpasupplicant') do
  it { should be_installed }
end

describe file('/etc/wpa_supplicant/wpa.conf') do
  it { should be_linked_to 'pingworks.conf' }
end

# describe interface('wlan0') do
#   it { should be_up }
# end
#
# describe default_gateway do
#   its(:ipaddress) { should eq '192.168.0.254' }
#   its(:interface) { should eq 'wlan0' }
# end
#
# describe command('iwconfig wlan0') do
#   its(:stdout) { should match /ESSID:"pingworks"/ }
# end
