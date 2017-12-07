class V2rayCore < Formula
  desc "A platform for building proxies to bypass network restrictions."
  homepage "https://www.v2ray.com/"
  url "https://github.com/v2ray/v2ray-core/releases/download/v3.0/v2ray-macos.zip"
  version "v3.0"
  sha256 "ce8a526b7c2b7855350bba0efb335061248be84b6de2201af10e1c95cadf27ec"

  def install
    bin.install "v2ray"

    etc.install "config.json"
  end

  plist_options :manual => "v2ray -config=#{HOMEBREW_PREFIX}/etc/config.json"

  def plist; <<-EOS.undent
  <?xml version="1.0" encoding="UTF-8"?>
  <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
  <plist version="1.0">
    <dict>
      <key>KeepAlive</key>
      <true/>
      <key>Label</key>
      <string>#{plist_name}</string>
      <key>ProgramArguments</key>
      <array>
        <string>#{bin}/v2ray</string>
        <string>-config</string>
        <string>#{etc}/config.json</string>
      </array>
      <key>RunAtLoad</key>
      <true/>
    </dict>
  </plist>
  EOS
end
  
  test do
    system "#{bin}/v2ray", "-version"
  end
end
