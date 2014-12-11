#
# Cookbook Name:: block_device
#
# Copyright RightScale, Inc. All rights reserved.
# All access and use subject to the RightScale Terms of Service available at
# http://www.rightscale.com/terms.php and, if applicable, other agreements
# such as a RightScale Master Subscription Agreement.

rightscale_marker

class Chef::Recipe
  include RightScale::BlockDeviceHelper
end

class Chef::Resource::BlockDevice
  include RightScale::BlockDeviceHelper
end

# Discover and use attached block devices.
# See libraries/block_device.rb for the definition of "do_for_block_devices"
# and "get_device_or_default" methods. See providers/default.rb for "action :discover" implementation.

do_for_block_devices node[:block_device] do |device|
  block_device get_device_or_default(node, device, :nickname) do
    mount_point get_device_or_default(node, device, :mount_point)
    action :discover
  end
end
