# frozen_string_literal: true

class SpringShellSamples < Formula
  desc 'Spring Shell Samples'
  homepage 'https://github.com/timothysparg/spring-shell'
  url 'https://maven.pkg.github.com/timothysparg/spring-shell/coza/sparg/spring-shell-samples/1.0.1/spring-shell-samples-1.0.1.jar'
  sha256 '60d61d6899757ae96c6fb2f1f711466983943292214d0667a2ee2d798a715d79'
  version '1.0.1'

  bottle :unneeded

  depends_on 'java == "1.8'

  def install
    libexec.install "spring-shell-samples-#{version}.jar"
    (bin / 'spring-shell-samples').write <<~EOS
      #!/bin/bash
      exec "#{JavaRequirement.jdk_home}" -jar "#{libexec}/spring-shell-samples-#{version}.jar" "$@"
    EOS
  end

  test do
    system "#{bin}/spring-shell-samples"
  end
  end
