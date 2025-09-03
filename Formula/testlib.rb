class Testlib < Formula
    desc "Test Tap Activate"
    homepage "https://github.com/Sw4mpf0x/"
    url "https://github.com/Sw4mpf0x/homebrew-test/releases/download/v2.74.5/testlib-2.74.5.tar.gz"
    sha256 "c56ae9941e99d25c70ddcce925adef0c93fbd472dac4ac5fd7eb78c0824546fe"
    version "2.74.5"

    def install
        bin.install Dir["*"]
        Dir["#{bin}/*"].each do |f|
        system "codesign", "--force", "--sign", "-", f if File.file?(f)
        end
        system "python3 #{bin}/install.py"
      end

    def caveats
        <<~EOS
        To finish installation, add the following line to .zshrc or .bashrc  
  source #{bin}/completion.sh
Then reopen your terminal app
        EOS
    end
    end
