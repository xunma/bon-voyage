### What is this for?
This is a web scraper that helps reserves a French visa appointment on TLS（刷位置）. It doesn't necessarily guarantee a slot, but it's worth a try when you are helpless. Note that your account may be banned. Bonne chance!

### To my only user Aggy

#### Keep in mind
- It only helps to refresh the slots page so you don't need to do it manually

- When I made the script, the first page of the slots page has only grayed out(unavailable) slots that's on earlier dates. So my script logic was based on this principle: if the grayed out slots on the first page become available, then that's the slot that I am looking for. Apparently, it's not the case anymore for Shanghai center now. But it usually is the case. Just wait.

- Sometimes it says that it finds slots but there's actually none, so just kill it.

- Webdriver cloese the window when the script ends. There's a way to detach it `options = Selenium::WebDriver::Options.chrome(detach: true)` but it didn't work for me for some reason.
