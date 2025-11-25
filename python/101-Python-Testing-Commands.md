# 101 Python Testing Commands

## Overview
Testing is essential for building reliable, maintainable Python applications. This cheat sheet covers essential testing commands, patterns, and tools including pytest, unittest, mocking, fixtures, coverage analysis, and best practices for writing effective tests. Master these commands to ensure code quality and catch bugs before they reach production.

## Target Audience
- Python developers at all levels
- QA engineers and test automation specialists
- DevOps engineers implementing CI/CD pipelines
- Data scientists ensuring model reliability
- Anyone committed to code quality and reliability

## Command Categories

### 1. Pytest Basics (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| pytest | Run all tests | Test execution | pytest |
| pytest test_file.py | Run specific file | Targeted testing | pytest tests/test_auth.py |
| pytest test_file.py::test_function | Run specific test | Individual test execution | pytest tests/test_auth.py::test_login |
| pytest -v | Verbose output | Detailed test results | pytest -v |
| pytest -q | Quiet output | Minimal output | pytest -q |
| pytest -s | Show print statements | Debugging | pytest -s |
| pytest -x | Stop on first failure | Fast failure detection | pytest -x |
| pytest --maxfail=2 | Stop after N failures | Limited failure runs | pytest --maxfail=3 |
| pytest -k pattern | Run tests matching pattern | Selective testing | pytest -k "login or signup" |
| pytest -m marker | Run tests with marker | Tagged test execution | pytest -m slow |
| pytest --collect-only | List tests without running | Test discovery | pytest --collect-only |
| pytest --setup-show | Show fixture setup | Fixture debugging | pytest --setup-show |

### 2. Pytest Fixtures (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| @pytest.fixture | Define fixture | Test setup/teardown | @pytest.fixture def db(): return Database() |
| @pytest.fixture(scope="function") | Function-scoped fixture | Per-test setup | @pytest.fixture(scope="function") |
| @pytest.fixture(scope="class") | Class-scoped fixture | Per-class setup | @pytest.fixture(scope="class") |
| @pytest.fixture(scope="module") | Module-scoped fixture | Per-module setup | @pytest.fixture(scope="module") |
| @pytest.fixture(scope="session") | Session-scoped fixture | Once per test run | @pytest.fixture(scope="session") |
| @pytest.fixture(autouse=True) | Auto-use fixture | Automatic setup | @pytest.fixture(autouse=True) |
| @pytest.fixture(params=[...]) | Parametrized fixture | Multiple test scenarios | @pytest.fixture(params=[1, 2, 3]) |
| request.param | Access fixture parameter | Using fixture params | def fixture(request): return request.param |
| yield in fixture | Setup/teardown pattern | Resource cleanup | yield resource; resource.close() |
| tmpdir fixture | Temporary directory | File testing | def test_file(tmpdir): ... |

### 3. Pytest Assertions (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| assert condition | Basic assertion | Truth testing | assert x == 5 |
| assert condition, message | Assertion with message | Custom error messages | assert x > 0, "x must be positive" |
| pytest.raises(Exception) | Assert exception raised | Exception testing | with pytest.raises(ValueError): func() |
| pytest.raises(Exception, match=pattern) | Assert exception message | Message validation | with pytest.raises(ValueError, match="invalid"): func() |
| pytest.warns(Warning) | Assert warning issued | Warning testing | with pytest.warns(UserWarning): func() |
| pytest.approx() | Floating point comparison | Numeric assertions | assert 0.1 + 0.2 == pytest.approx(0.3) |
| pytest.fail() | Force test failure | Explicit failures | pytest.fail("This should not happen") |
| pytest.skip() | Skip test | Conditional skipping | pytest.skip("Not implemented") |
| pytest.xfail() | Expected failure | Known issues | pytest.xfail("Bug #123") |
| assert expr in collection | Membership testing | Collection assertions | assert "key" in dictionary |

### 4. Pytest Parametrization (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| @pytest.mark.parametrize() | Parametrize test | Multiple test cases | @pytest.mark.parametrize("input,expected", [(1,2), (3,4)]) |
| @pytest.mark.parametrize with ids | Named parameters | Readable test names | @pytest.mark.parametrize(..., ids=["case1", "case2"]) |
| Multiple parametrize decorators | Combinatorial testing | All combinations | @pytest.mark.parametrize("x", [1,2]) @pytest.mark.parametrize("y", [3,4]) |
| pytest.param() | Advanced parameter | Skip/xfail individual cases | pytest.param(1, 2, marks=pytest.mark.skip) |
| indirect parametrization | Fixture parametrization | Fixture-based testing | @pytest.mark.parametrize("fixture", [...], indirect=True) |
| parametrize with fixtures | Combining fixtures and params | Complex test setups | @pytest.mark.parametrize("db", [...], indirect=["db"]) |
| pytest_generate_tests hook | Dynamic parametrization | Runtime test generation | def pytest_generate_tests(metafunc): ... |
| parametrize with dict | Dictionary parameters | Named arguments | @pytest.mark.parametrize("params", [{"x": 1, "y": 2}]) |

### 5. Pytest Markers (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| @pytest.mark.skip | Skip test | Temporarily disable | @pytest.mark.skip(reason="Not ready") |
| @pytest.mark.skipif(condition) | Conditional skip | Platform-specific skips | @pytest.mark.skipif(sys.platform == "win32") |
| @pytest.mark.xfail | Expected failure | Known bugs | @pytest.mark.xfail(reason="Bug #123") |
| @pytest.mark.xfail(strict=True) | Strict expected failure | Must fail | @pytest.mark.xfail(strict=True) |
| @pytest.mark.slow | Custom marker | Test categorization | @pytest.mark.slow |
| @pytest.mark.integration | Integration test marker | Test types | @pytest.mark.integration |
| @pytest.mark.unit | Unit test marker | Test types | @pytest.mark.unit |
| pytest.ini markers registration | Register custom markers | Marker documentation | [pytest] markers = slow: marks slow tests |
| @pytest.mark.timeout(seconds) | Test timeout | Preventing hangs | @pytest.mark.timeout(10) |
| @pytest.mark.dependency() | Test dependencies | Ordered testing | @pytest.mark.dependency(depends=["test_setup"]) |

### 6. Unittest Basics (11)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| unittest.TestCase | Test case base class | Creating test classes | class TestAuth(unittest.TestCase): ... |
| setUp() method | Setup before each test | Test initialization | def setUp(self): self.app = create_app() |
| tearDown() method | Cleanup after each test | Resource cleanup | def tearDown(self): self.app.close() |
| setUpClass() classmethod | Setup before all tests | Class-level setup | @classmethod def setUpClass(cls): ... |
| tearDownClass() classmethod | Cleanup after all tests | Class-level cleanup | @classmethod def tearDownClass(cls): ... |
| test_* method | Test method | Individual tests | def test_login(self): ... |
| unittest.main() | Run tests | Test execution | if __name__ == "__main__": unittest.main() |
| python -m unittest | Run unittest module | Command-line testing | python -m unittest discover |
| python -m unittest test_module | Run specific module | Targeted testing | python -m unittest tests.test_auth |
| python -m unittest -v | Verbose output | Detailed results | python -m unittest -v |
| unittest.skip() decorator | Skip test | Test skipping | @unittest.skip("Not implemented") |

### 7. Unittest Assertions (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| assertEqual(a, b) | Assert equality | Value comparison | self.assertEqual(result, expected) |
| assertNotEqual(a, b) | Assert inequality | Value comparison | self.assertNotEqual(x, y) |
| assertTrue(x) | Assert true | Boolean testing | self.assertTrue(is_valid) |
| assertFalse(x) | Assert false | Boolean testing | self.assertFalse(is_invalid) |
| assertIs(a, b) | Assert identity | Object identity | self.assertIs(obj1, obj2) |
| assertIsNot(a, b) | Assert not identity | Object identity | self.assertIsNot(obj1, obj2) |
| assertIsNone(x) | Assert None | None testing | self.assertIsNone(result) |
| assertIsNotNone(x) | Assert not None | None testing | self.assertIsNotNone(result) |
| assertIn(a, b) | Assert membership | Collection testing | self.assertIn("key", dictionary) |
| assertNotIn(a, b) | Assert not membership | Collection testing | self.assertNotIn("key", dictionary) |
| assertIsInstance(a, b) | Assert instance type | Type testing | self.assertIsInstance(obj, MyClass) |
| assertNotIsInstance(a, b) | Assert not instance type | Type testing | self.assertNotIsInstance(obj, MyClass) |

### 8. Advanced Unittest Assertions (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| assertRaises(Exception) | Assert exception | Exception testing | with self.assertRaises(ValueError): func() |
| assertRaisesRegex(Exception, regex) | Assert exception message | Message testing | with self.assertRaisesRegex(ValueError, "invalid"): func() |
| assertWarns(Warning) | Assert warning | Warning testing | with self.assertWarns(UserWarning): func() |
| assertWarnsRegex(Warning, regex) | Assert warning message | Warning message testing | with self.assertWarnsRegex(UserWarning, "deprecated"): func() |
| assertAlmostEqual(a, b) | Assert float equality | Numeric testing | self.assertAlmostEqual(0.1 + 0.2, 0.3) |
| assertNotAlmostEqual(a, b) | Assert float inequality | Numeric testing | self.assertNotAlmostEqual(x, y) |
| assertGreater(a, b) | Assert greater than | Comparison testing | self.assertGreater(x, 0) |
| assertLess(a, b) | Assert less than | Comparison testing | self.assertLess(x, 100) |
| assertGreaterEqual(a, b) | Assert greater or equal | Comparison testing | self.assertGreaterEqual(x, 0) |
| assertLessEqual(a, b) | Assert less or equal | Comparison testing | self.assertLessEqual(x, 100) |

### 9. Mocking with unittest.mock (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| Mock() | Create mock object | Object mocking | mock_obj = Mock() |
| MagicMock() | Mock with magic methods | Comprehensive mocking | mock_obj = MagicMock() |
| mock.return_value | Set return value | Controlling return | mock_func.return_value = 42 |
| mock.side_effect | Set side effect | Multiple returns/exceptions | mock_func.side_effect = [1, 2, ValueError()] |
| mock.assert_called() | Assert called | Call verification | mock_func.assert_called() |
| mock.assert_called_once() | Assert called once | Single call verification | mock_func.assert_called_once() |
| mock.assert_called_with() | Assert called with args | Argument verification | mock_func.assert_called_with(1, 2) |
| mock.assert_called_once_with() | Assert single call with args | Precise verification | mock_func.assert_called_once_with(x=1) |
| mock.call_count | Get call count | Call counting | assert mock_func.call_count == 3 |
| mock.call_args | Get last call args | Argument inspection | args, kwargs = mock_func.call_args |
| mock.call_args_list | Get all call args | Full call history | calls = mock_func.call_args_list |
| mock.reset_mock() | Reset mock state | Mock reuse | mock_func.reset_mock() |

### 10. Patching (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| @patch() | Patch decorator | Replacing objects | @patch("module.function") def test(mock_func): ... |
| @patch.object() | Patch object attribute | Object mocking | @patch.object(MyClass, "method") |
| @patch.multiple() | Patch multiple targets | Multiple patches | @patch.multiple("module", func1=DEFAULT, func2=DEFAULT) |
| with patch() as mock | Context manager patching | Scoped patching | with patch("os.path.exists") as mock: ... |
| patch.dict() | Patch dictionary | Environment/config mocking | with patch.dict("os.environ", {"KEY": "value"}): ... |
| patch.stopall() | Stop all patches | Cleanup | patch.stopall() |
| patch(autospec=True) | Auto-spec patching | Type-safe mocking | @patch("module.Class", autospec=True) |
| patch(return_value=x) | Patch with return | Direct return mocking | @patch("func", return_value=42) |
| patch(side_effect=x) | Patch with side effect | Exception/sequence mocking | @patch("func", side_effect=ValueError()) |
| patch target string | Patch import path | Module patching | @patch("myapp.module.function") |

### 11. Test Coverage (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| coverage run | Run tests with coverage | Coverage collection | coverage run -m pytest |
| coverage report | Show coverage report | Terminal report | coverage report |
| coverage html | Generate HTML report | Visual coverage | coverage html |
| coverage xml | Generate XML report | CI integration | coverage xml |
| coverage erase | Clear coverage data | Reset coverage | coverage erase |
| coverage combine | Combine coverage data | Multi-process coverage | coverage combine |
| --cov flag (pytest-cov) | Pytest coverage | Integrated coverage | pytest --cov=myapp |
| --cov-report | Coverage report type | Report format | pytest --cov=myapp --cov-report=html |
| --cov-fail-under | Minimum coverage threshold | Coverage enforcement | pytest --cov=myapp --cov-fail-under=80 |
| .coveragerc file | Coverage configuration | Coverage settings | [run] source = myapp |

### 12. Test Organization (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| tests/ directory | Standard test location | Test organization | mkdir tests |
| conftest.py | Pytest configuration | Shared fixtures | tests/conftest.py |
| __init__.py | Python package marker | Package structure | tests/__init__.py |
| test_*.py naming | Test file convention | File naming | test_auth.py |
| Test* class naming | Test class convention | Class naming | class TestAuth: ... |
| test_* method naming | Test method convention | Method naming | def test_login(): ... |
| pytest.ini | Pytest configuration | Test settings | [pytest] testpaths = tests |
| setup.cfg | Project configuration | Test configuration | [tool:pytest] addopts = -v |

### 13. Pytest Plugins (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| pytest-cov | Coverage plugin | Coverage analysis | pip install pytest-cov |
| pytest-xdist | Parallel testing | Speed up tests | pytest -n auto |
| pytest-timeout | Test timeout | Prevent hanging | pip install pytest-timeout |
| pytest-mock | Mocking plugin | Enhanced mocking | pip install pytest-mock |
| pytest-django | Django testing | Django integration | pip install pytest-django |
| pytest-asyncio | Async testing | Asyncio support | pip install pytest-asyncio |
| pytest-benchmark | Performance testing | Benchmarking | pip install pytest-benchmark |
| pytest-html | HTML reports | Test reporting | pytest --html=report.html |

### 14. Advanced Testing Patterns (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| @pytest.fixture(scope="session") with cleanup | Session fixture cleanup | Global setup/teardown | yield resource; resource.cleanup() |
| Fixture factories | Dynamic fixture creation | Reusable fixtures | @pytest.fixture def make_user(): return lambda: User() |
| Monkeypatch fixture | Runtime patching | Test-specific patches | def test(monkeypatch): monkeypatch.setattr(...) |
| capsys fixture | Capture stdout/stderr | Output testing | def test(capsys): print("x"); assert "x" in capsys.readouterr().out |
| tmp_path fixture | Temporary path | File system testing | def test(tmp_path): file = tmp_path / "test.txt" |
| request fixture | Test request object | Accessing test context | def test(request): request.node.name |
| pytestconfig fixture | Configuration access | Config-based testing | def test(pytestconfig): pytestconfig.getini("markers") |
| Mock property | Mock object properties | Property mocking | type(mock).prop = PropertyMock(return_value=42) |
| Call objects | Verify call details | Precise call verification | mock.assert_has_calls([call(1), call(2)]) |
| Spy pattern with wraps | Spy on real objects | Behavior verification | mock = Mock(wraps=real_object) |

## Tips and Best Practices
* Follow AAA pattern: Arrange, Act, Assert
* Keep tests independent and isolated
* Use descriptive test names that describe behavior
* One assertion per test when possible
* Use fixtures for shared setup
* Mock external dependencies
* Test edge cases and error conditions
* Maintain high test coverage (aim for 80%+)
* Run tests frequently during development
* Use parametrization to reduce code duplication
* Keep tests fast by mocking I/O operations
* Organize tests to mirror source code structure
* Use continuous integration to run tests automatically
* Write tests before fixing bugs
* Refactor tests along with production code

## Additional Resources
* [Pytest Documentation](https://docs.pytest.org/)
* [Python unittest Documentation](https://docs.python.org/3/library/unittest.html)
* [Real Python Testing Guide](https://realpython.com/python-testing/)
* [Python Testing with pytest (Book)](https://pragprog.com/titles/bopytest/python-testing-with-pytest/)
* [Mock Documentation](https://docs.python.org/3/library/unittest.mock.html)
* [Coverage.py Documentation](https://coverage.readthedocs.io/)
* [Test Driven Development (TDD)](https://testdriven.io/)

## Mini-Glossary

This glossary explains common terms, acronyms, and concepts related to Python testing.

### Common Terms

| Term | Description |
|------|-------------|
| test case | Single unit of testing checking specific behavior |
| test suite | Collection of test cases |
| fixture | Setup/teardown code providing test prerequisites |
| assertion | Statement verifying expected behavior |
| mock | Fake object simulating real object behavior |
| stub | Minimal implementation for testing |
| spy | Wrapper recording calls to real objects |
| fake | Working implementation with shortcuts |
| test double | Generic term for mocks, stubs, spies, fakes |
| parametrization | Running same test with different inputs |

### Testing Concepts

| Concept | Description |
|---------|-------------|
| unit test | Test for smallest testable parts of code |
| integration test | Test for interactions between components |
| functional test | Test for complete feature workflows |
| regression test | Test ensuring bugs stay fixed |
| smoke test | Basic tests ensuring system operates |
| acceptance test | Test from user perspective |
| property-based test | Test with generated inputs |
| mutation testing | Testing test quality by modifying code |
| test coverage | Percentage of code executed by tests |
| test isolation | Tests independent of each other |

### Common Acronyms

| Acronym | Stands For | Related To |
|---------|------------|------------|
| TDD | Test Driven Development | Writing tests first |
| BDD | Behavior Driven Development | Testing business behavior |
| AAA | Arrange Act Assert | Test structure pattern |
| FIRST | Fast Independent Repeatable Self-validating Timely | Test quality principles |
| CI/CD | Continuous Integration/Deployment | Automated testing |
| SUT | System Under Test | Code being tested |
| DOC | Depended-On Component | External dependencies |
| LoC | Lines of Code | Code metrics |
| DRY | Don't Repeat Yourself | Code reuse principle |

### Test Markers and Categories

| Marker | Purpose | Usage |
|--------|---------|-------|
| @pytest.mark.unit | Unit test marker | Fast isolated tests |
| @pytest.mark.integration | Integration test marker | Component interaction tests |
| @pytest.mark.slow | Slow test marker | Time-consuming tests |
| @pytest.mark.fast | Fast test marker | Quick feedback tests |
| @pytest.mark.smoke | Smoke test marker | Basic functionality tests |
| @pytest.mark.regression | Regression test marker | Bug fix verification |
| @pytest.mark.security | Security test marker | Security-related tests |
| @pytest.mark.performance | Performance test marker | Performance validation |

### Assertion Patterns

| Pattern | Usage | Example |
|---------|-------|---------|
| Value assertions | Direct value checks | assert result == expected |
| Exception assertions | Verify exceptions raised | with pytest.raises(ValueError): ... |
| Collection assertions | Test collection contents | assert item in collection |
| Approximate assertions | Float comparisons | assert value == pytest.approx(expected) |
| Boolean assertions | True/False checks | assert condition is True |
| Identity assertions | Object identity | assert obj1 is obj2 |
| Type assertions | Type checking | assert isinstance(obj, MyClass) |
| Regex assertions | Pattern matching | assert re.match(pattern, string) |

### Coverage Metrics

| Metric | Description | Good Target |
|--------|-------------|-------------|
| Line coverage | Percentage of lines executed | 80-90% |
| Branch coverage | Percentage of branches taken | 75-85% |
| Function coverage | Percentage of functions called | 90-100% |
| Statement coverage | Percentage of statements executed | 80-90% |
| Condition coverage | Boolean expression evaluation | 70-80% |

### Mock Types

| Type | Purpose | When to Use |
|------|---------|-------------|
| Mock | Generic mock object | Any mocking need |
| MagicMock | Mock with magic methods | Mocking operators, context managers |
| PropertyMock | Mock properties | Class property mocking |
| AsyncMock | Async function mocking | Coroutine mocking |
| NonCallableMock | Non-callable mock | Preventing accidental calls |
| patch | Temporary replacement | Scoped mocking |
| patch.object | Object attribute patch | Specific attribute mocking |
| patch.dict | Dictionary patching | Environment/config mocking |

### Test Organization Best Practices

| Practice | Benefit | Example |
|----------|---------|---------|
| Mirror source structure | Easy navigation | src/auth.py → tests/test_auth.py |
| Use conftest.py | Shared fixtures | Common setup in conftest.py |
| Group related tests | Logical organization | Class-based grouping |
| Separate test types | Selective running | tests/unit/ tests/integration/ |
| Use descriptive names | Clear purpose | test_user_cannot_login_with_wrong_password |
| Keep tests DRY | Maintainability | Use fixtures and helpers |
| Isolate test data | Reproducibility | Separate test data files/fixtures |
