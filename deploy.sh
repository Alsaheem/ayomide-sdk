python3 -m build
python3 -m twine upload --repository testpypi dist/*  
twine upload dist/* 
python3 -m pip install --index-url https://test.pypi.org/simple/ --extra-index-url https://pypi.org/simple/ ayomide-sdk==0.0.2
twine upload dist/* 