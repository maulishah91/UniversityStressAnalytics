# UCIPT-CNN

HOW TO RUN THE CODE

    1. Download the pre-trained twitter word embeddings file
       - https://drive.google.com/file/d/0B8_YWpspMEQKeTNZWFRpdHo4OUU/view?usp=sharing
       (this is currently uploaded & stored in Jin's Google Drive, so it's suggested that you find another place to store
       this file once you download this file since Jin's Google Drive storage may expire)
    2. preprocess twitter data
        - execute python twitter_process_data.py
        - it will create tweet.p
    3. train the model with the preprocessed twitter data
        - execute
            with GPU: THEANO_FLAGS=mode=FAST_RUN,device=gpu,floatX=float32 python conv_net_model.py --train
            with CPU: python conv_net_model.py --train
        - it will create model.p, which will store trained parameters of the model
    4. make predictions
        with GPU: THEANO_FLAGS=mode=FAST_RUN,device=gpu,floatX=float32 python conv_net_model.py input_path output_path
        with CPU: python conv_net_model.py input_path output_path

        ex) THEANO_FLAGS=mode=FAST_RUN,device=gpu,floatX=float32 python conv_net_model.py /home/guest2/workspace/UCIPT-CNN/input.csv /home/guest2/workspace/UCIPT-CNN/output.csv


RESOURCES
    
    To learn basics of Convolutional Neural Network (CNN):
        - http://neuralnetworksanddeeplearning.com/chap6.html
        - http://cs231n.github.io/convolutional-networks/

    The model is based on this published work:
        - http://www.people.fas.harvard.edu/~yoonkim/data/emnlp_2014.pdf
        - http://disi.unitn.it/~severyn/papers/sigir-2015-short.pdf


CODE DESCRIPTION
    
    conv_net_classes.py: contains definitions of neural net layers
    conv_net_model.py: contains our model architecture, training/storing/loading/using the model
    twitter_process_data.py: contains the pre-processing step


Dependencies
    
    theano (http://deeplearning.net/software/theano), numpy


