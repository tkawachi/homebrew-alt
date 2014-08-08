require "formula"

class Skinny < Formula
    homepage "http://skinny-framework.org/"
  url "https://github.com/skinny-framework/skinny-framework/releases/download/1.2.8/skinny-1.2.8.tar.gz"
  version "1.2.8"
  sha1 "433af72d6b93fee160ef900e05167ad6f1a6d82c"
  depends_on "npm"

  def install
    # A symbolic link doesn't work, because skinny command uses
    # sbt and sbt-debug script in the same directory.
    (bin/"skinny").write <<-EOS.undent
      #!/bin/sh
      exec #{libexec}/skinny "$@"
    EOS

    libexec.install Dir['*']
  end
end
