#
# Cookbook Name:: pw_wpasupplicant
# Recipe:: default
#
# Copyright (C) 2015 Christoph Lukas
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
package 'wpasupplicant'

template '/etc/wpa_supplicant/pingworks.conf' do
  source 'wpasupplicant-conf.erb'
  owner 'root'
  group 'root'
  mode 00644
  variables({
    :ssid => node['pw_wpasupplicant']['wlan_local_ssid'],
    :pw => node['pw_wpasupplicant']['wlan_local_pw']
  })
end

template '/etc/wpa_supplicant/aircard.conf' do
  source 'wpasupplicant-conf.erb'
  owner 'root'
  group 'root'
  mode 00644
  variables({
    :ssid => node['pw_wpasupplicant']['wlan_lte_ssid'],
    :pw => node['pw_wpasupplicant']['wlan_lte_pw']
  })
end

link '/etc/wpa_supplicant/wpa.conf' do
  to 'pingworks.conf'
end


bash 'ifup wlan' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
  ifup #{node['pw_wpasupplicant']['wlan_iface']}
  EOH
end
