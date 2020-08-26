'''
html2ipynb converts an html file generated from a python ipynb notebook
back to the executable .ipynb format.
'''

from bs4 import BeautifulSoup
import lxml
import json
import sys
import os

def html2ipynb(input_html=None, output_ipynb=None):
          
    '''
    Conversion of ipynb-generated htnl back to the executable .ipynb format.

    Parameters
    ----------
    input_html : str
        The path to the input html to be converted to ipynb.
    output_ipynb : str
        The desired filename for the output ipynb file. If omitted, the basename of the input html will be used.
        
        
    NOTE:
    The function can be run from command line by providing only 1 argument, the input html file:
    python html2ipynb.py html2ipynb some.html
    '''

    if input_html==None:
        raise ValueError('No input html defined! Please define the path to the input html file you wish to convert to ipynb.')
    if output_ipynb==None:
        output_ipynb =  os.path.basename(input_html).replace('.html','.ipynb')
    print("[in]  Parsing {}".format(input_html))
    response = open(input_html)
    text = response.read()

    soup = BeautifulSoup(text, 'lxml')
    dictionary = {'nbformat': 4, 'nbformat_minor': 1, 'cells': [], 'metadata': {}}
    for d in soup.findAll("div"):
        if 'class' in d.attrs.keys():
            for clas in d.attrs["class"]:
                if clas in ["text_cell_render", "input_area"]:
                    # code cell
                    if clas == "input_area":
                        cell = {}
                        cell['metadata'] = {}
                        cell['outputs'] = []
                        cell['source'] = [d.get_text()]
                        cell['execution_count'] = None
                        cell['cell_type'] = 'code'
                        dictionary['cells'].append(cell)

                    else:
                        cell = {}
                        cell['metadata'] = {}

                        cell['source'] = [d.decode_contents()]
                        cell['cell_type'] = 'markdown'
                        dictionary['cells'].append(cell)
    print("[out] Writing {}".format(output_ipynb))
    open(output_ipynb, 'w').write(json.dumps(dictionary))
    return None

if __name__ == '__main__':
    globals()[sys.argv[1]](sys.argv[2])
