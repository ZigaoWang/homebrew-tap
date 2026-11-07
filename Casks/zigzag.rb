cask "zigzag" do
  version "0.5.15"
  sha256 "e00d494ca3c0401819edde83ab3de2b78c6837dd6ebf7ad97325adffedb898c2"

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
