const root = document.documentElement;
const themeButton = document.querySelector("#theme-toggle");
const savedTheme = localStorage.getItem("sideneko-theme");
const preferredDark = matchMedia("(prefers-color-scheme: dark)").matches;

function applyTheme(theme) {
  root.dataset.theme = theme;
  themeButton.textContent = theme === "dark" ? "☀️" : "🌙";
  themeButton.setAttribute("aria-label", theme === "dark" ? "切換淺色模式" : "切換深色模式");
}

applyTheme(savedTheme || (preferredDark ? "dark" : "light"));
themeButton.addEventListener("click", () => {
  const next = root.dataset.theme === "dark" ? "light" : "dark";
  localStorage.setItem("sideneko-theme", next);
  applyTheme(next);
});

const statusElement = document.querySelector("#release-status");
const installButton = document.querySelector("#install-button");
fetch("release.json", { cache: "no-store" })
  .then((response) => response.ok ? response.json() : Promise.reject())
  .then((release) => {
    if (release.available && release.installURL) {
      installButton.href = release.installURL;
      installButton.textContent = `開始安裝 SideNeko ${release.version}`;
      statusElement.textContent = `目前是 ${release.version} 測試版；會直接簽署並安裝 SideNeko w`;
    } else {
      statusElement.textContent = "v1.0.0 Beta 準備中：目前可先看原始碼與安裝流程 awa";
    }
  })
  .catch(() => { statusElement.textContent = "版本狀態暫時讀不到 @@"; });
