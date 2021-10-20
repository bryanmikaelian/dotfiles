require 'rake'

task :install do
  linkables = Dir.glob('*/**{.symlink}')
  linkables.each do |linkable|
    root, sym = linkable.split('/')
    file = sym.split('.symlink').last

    if root == 'config'
      target = "#{ENV["HOME"]}/.config/#{file}"
    else
      target = "#{ENV["HOME"]}/.#{file}"
    end

    puts "symlinking #{linkable} to #{target}"
    `ln -sf "$PWD/#{linkable}" "#{target}"`
  end
end

task :uninstall do
  Dir.glob('**/*.symlink').each do |linkable|

    file = linkable.split('/').last.split('.symlink').last
    target = "#{ENV["HOME"]}/.#{file}"

    # Remove all symlinks created during installation
    if File.symlink?(target)
      FileUtils.rm(target)
    end

    # Replace any backups made during installation
    if File.exists?("#{ENV["HOME"]}/.#{file}.backup")
      `mv "$HOME/.#{file}.backup" "$HOME/.#{file}"`
    end

  end
end

task :default => :install
