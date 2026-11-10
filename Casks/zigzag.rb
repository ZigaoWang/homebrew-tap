cask "zigzag" do
  version "0.7.7"
  sha256 "bd94bdc74fbe31174d577041381d0666032b26a48a196e2bd5820f2f7d6d0c9c"

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
