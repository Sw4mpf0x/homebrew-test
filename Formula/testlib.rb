class Testlib < Formula
    desc "Test Tap Activate"
    homepage "https://github.com/Sw4mpf0x/"
    url https://github.com/Sw4mpf0x/homebrew-test/releases/download/v2.74.3/testlib-2.74.3.tar.gz"
    sha256 "e17f678f3df14c24e4ef9115623fdb88cec13653adef1072bdb77f5c8cf37756"
    version "2.74.3"

    def install
        bin.install Dir["*"]
        Dir["#{bin}/*"].each do |f|
        system "codesign", "--force", "--sign", "-", f if File.file?(f)
        end
        system "python3 files/install.py"
  end

    def caveats
        <<~EOS
        To finish installation, add the following line to .zshrc or .bashrc  
  source #{bin}/completion.sh
Then reopen your terminal app
        EOS
    end
    end
