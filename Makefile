venv: venv/bin/activate

venv/bin/activate: requirements.txt
	if [ ! -d venv ]; then \
	    virtualenv --no-setuptools venv; \
	fi
	. venv/bin/activate; pip install -r requirements.txt

clean:
	$(RM) -rf venv
	find . -name "*.pyc" -exec $(RM) -rf {} \;

.PHONY:clean venv
