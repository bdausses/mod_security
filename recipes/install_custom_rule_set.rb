# Install custom rule files
node[:mod_security][:custom][:rules].each do |set, lines|
  template "#{node[:mod_security][:custom][:root_dir]}/#{set}.conf" do
    source "custom_file.erb"
    owner  "root" unless platform? 'windows'
    group  "root" unless platform? 'windows'
    mode   00644 unless platform? 'windows'
    notifies :run, "ruby_block[webreset]", :delayed
    variables(:lines => lines)
  end
end

# Install custom data files
node[:mod_security][:custom][:datafiles].each do |set, lines|
  template "#{node[:mod_security][:custom][:root_dir]}/#{set}.data" do
    source "custom_file.erb"
    owner  "root" unless platform? 'windows'
    group  "root" unless platform? 'windows'
    mode   00644 unless platform? 'windows'
    notifies :run, "ruby_block[webreset]", :delayed
    variables(:lines => lines)
  end
end
