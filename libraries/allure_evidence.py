from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn


@keyword("Capture Evidence")
def capture_evidence(name):
    browser = BuiltIn().get_library_instance("Browser")

    screenshot_path = f"results/allure/{name}.png"

    browser.screenshot(
        filename=screenshot_path,
        fullPage=True
    )

    return screenshot_path