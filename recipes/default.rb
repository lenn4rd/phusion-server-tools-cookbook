#
# Cookbook Name:: phusion-server-tools
# Recipe:: default
#
# Copyright 2014, handwerk*neu
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

# Clone repository into /usr/local/share
git '/usr/local/share/phusion-server-tools' do
  repository 'https://github.com/phusion/phusion-server-tools.git'
  revision 'master'
  action :sync
end

# Copy example configuration file to /etc
execute '/etc/phusion-server-tools.yml' do
  command "cp /usr/local/share/phusion-server-tools/config.yml.example #{name}"
end

# Define binaries to be symlinked to /usr/local/bin
node['phusion-server-tools']['binaries'].each do |binary|
  link binary do
    target_file "/usr/local/bin/#{binary}"
    to "/usr/local/share/phusion-server-tools/#{binary}"
  end
end
