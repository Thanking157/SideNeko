const statusElement = document.querySelector("#release-status");
const installButton = document.querySelector("#install-button");

fetch("release.json", { cache: "no-store" })
  .then((response) => {
    if (!response.ok) throw new Error("release metadata unavailable");
    return response.json();
  })
  .then((release) => {
    if (!release.available) {
      statusElement.textContent = "尚未發布：完成實機與安全驗證後才會開放。";
      return;
    }
    statusElement.textContent = `最新版本 ${release.version}・SHA-256 已公開`;
    installButton.textContent = `安裝 ${release.version}`;
    installButton.classList.remove("disabled");
    installButton.removeAttribute("aria-disabled");
    installButton.href = release.installURL;
  })
  .catch(() => { statusElement.textContent = "暫時無法取得版本資訊。"; });

const repository = document.querySelector("meta[name='sideneko-repository']")?.content;
if (repository) document.querySelector("#source-link").href = repository;
