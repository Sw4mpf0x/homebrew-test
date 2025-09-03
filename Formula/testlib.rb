class Testlib < Formula
    desc "Test Tap Activate"
    homepage "https://github.com/Sw4mpf0x/"
    url "https://github.com/Sw4mpf0x/homebrew-test/releases/download/v2.74.2/testlib-2.74.2.tar.gz"
    sha256 "8c67478e4eb8c983970c7425e510b8eab447cf5d980c0a86df3aba9843d10630"
    version "2.74.2"

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
