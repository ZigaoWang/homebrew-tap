cask "zigzag" do
  version "0.8.1"
  sha256 "61e0c6edbf27883e5c8b81f158fb6bc7d4d1adb25ec2d41a700f8d15d58f3231"

  url "https://github.com/ZigaoWang/zigzag/releases/download/v#{version}/Zigzag-#{version}.dmg"
  name "Zigzag"
  desc "Web browser with a sidebar and spaces"
  homepage "https://zigzagbrowser.com/"

  livecheck do
    url "https://zigzagbrowser.com/updates/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sequoia

  app "Zigzag.app"

  zap trash: [
    "~/Library/Application Support/Zigzag",
    "~/Library/Caches/wang.zigao.zigzag",
    "~/Library/HTTPStorages/wang.zigao.zigzag",
    "~/Library/Preferences/wang.zigao.zigzag.plist",
    "~/Library/WebKit/wang.zigao.zigzag",
  ]

  caveats "Zigzag needs macOS 15.4 or later. It won’t open on macOS 15.0 to 15.3."
end
