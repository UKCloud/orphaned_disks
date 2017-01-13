require 'ruby_vcloud_sdk'

creds = {
  :user => 'xx.xxx.xxxx',
  :org => 'x-x-xxx-xxxx',
  :pass => '<password>',
  :url => '<vcd api url>',
  :vdc => '<vdc name>'
}

filename = 'disks.csv'
outfile = 'orphaned_disks.txt'


in_use = File.open(filename).read




@client = VCloudSdk::Client.new(creds[:url],"#{creds[:user]}@#{creds[:org]}",creds[:pass],{},Logger.new('rest.log'))

@vdc = @client.find_vdc_by_name(creds[:vdc])

all_disks = @vdc.list_disks
orphaned = []

all_disks.each do |disk|
  orphaned << disk  unless in_use.include?(disk.href.split('/').last)
end


puts "ORPHANED DISKS:\n"

output = File.open(outfile,'w')

orphaned.each do |disk|
  puts "Name: #{disk.name} CID: #{disk.href.split('/').last}"
  output.write("#{disk.name},#{disk.href.split('/').last}\n")
end

output.close

puts "#{orphaned.length} Orphaned Disks Found\nDELETE DISKS? (type yes or no)"

if STDIN.gets.match(/yes/) then
  puts "Deleting Disks..."

  orphaned.each do |disk|
    puts "Deleting Disk: #{disk.name}"
    @vdc.delete_disk_by_name(disk.name)
  end

else
  puts "Aborting"
end
