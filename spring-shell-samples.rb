# frozen_string_literal: true

class SpringShellSamples < Formula
  desc 'Spring Shell Samples'
  homepage 'https://github.com/timothysparg/spring-shell'
  url 'https://repo1.maven.org/maven2/com/google/guava/guava/29.0-jre/guava-29.0-jre.jar'
  sha256 'b22c5fb66d61e7b9522531d04b2f915b5158e80aa0b40ee7282c8bfb07b0da25'
  # url 'https://maven.pkg.github.com/timothysparg/spring-shell/coza/sparg/spring-shell-samples/1.0.1/spring-shell-samples-1.0.1.jar'
  # sha256 '60d61d6899757ae96c6fb2f1f711466983943292214d0667a2ee2d798a715d79'
  version '1.0.1'

  bottle :unneeded

  def install
    ohai Caskroom.casks

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
