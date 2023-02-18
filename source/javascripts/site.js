function setSleepyAvatarAtNight() {
  const img = document.images.avatar
  const timeZone = "Europe/London"

  try {
    const hourString = new Date().toLocaleString("en-GB", { timeZone, hour: "numeric" })
    const hour = parseInt(hourString, 10)
    if (hour >= 23 || hour < 7) img.src = "/images/me-sleeping.png"
  } catch {
    // Silently handle old browsers, browser not supporting TZ etc.
  }
}

setSleepyAvatarAtNight()
