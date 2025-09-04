class Testlib < Formula
    desc "Test Tap Activate"
    homepage "https://github.com/Sw4mpf0x/"
    url "https://github.com/Sw4mpf0x/homebrew-test/releases/download/v2.74.10/testlib-2.74.10.tar.gz"
    sha256 "8885c2a17e44ec6827c76246c555d064fd9475fda043de774236d153aa17c31e"
    version "2.74.10"

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
