class Testlib < Formula
    desc "Test Tap Activate"
    homepage "https://github.com/Sw4mpf0x/"
    url "https://github.com/Sw4mpf0x/homebrew-test/releases/download/v2.74.7/testlib-2.74.7.tar.gz"
    sha256 "7fdf945b43a5aeaf886db3bb9dd766cc47721a457b37e873551273f6d05e7862"
    version "2.74.7"

    def install
        bin.install Dir["*"]
        Dir["#{bin}/*"].each do |f|
        system "codesign", "--force", "--sign", "-", f if File.file?(f)
        end
        system "python3 #{bin}/UpdateCS.py"
      end

    def caveats
        <<~EOS
        To finish installation, add the following line to .zshrc or .bashrc  
  source #{bin}/completion.sh
Then reopen your terminal app
        EOS
    end
    end
