cask "zigzag" do
  version "0.5.12"
  sha256 "66175b270460cd0ababbb1e3b8bed8bf549d02fe35a579b96e0a6bbb98092abe"

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

  caveats "Zigzag needs macOS 15.4 or later."
end
