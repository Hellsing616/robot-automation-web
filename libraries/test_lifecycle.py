from robot.api.deco import keyword, library
from Browser import Browser


@library
class TestLifecycle:

    def __init__(self):
        self.browser = Browser()

    @keyword("Start Test Session")
    def start_test_session(self, browser, headless, base_url):
        self.browser.new_browser(
            browser=browser,
            headless=headless
        )
        self.browser.new_context()
        self.browser.new_page(base_url)

    @keyword("Finish Test Session")
    def finish_test_session(self):
        self.browser.close_browser()