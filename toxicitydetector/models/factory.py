from toxicitydetector.models.supervised_bilstm import BiLstmModel
from toxicitydetector.models.supervised_cnn import CnnModel
from toxicitydetector.models.supervised_cnn_lstm import CnnLstmModel
from toxicitydetector.models.supervised_fasttext import FastTextModel
from toxicitydetector.models.supervised_lstm import LstmModel
from toxicitydetector.models.supervised_logistic import LogisticModel


def get_model(task):
    if task.args.model == 'lr':
        return LogisticModel(task)
    if task.args.model == 'fasttext':
        return FastTextModel(task)
    if task.args.model == 'cnn':
        return CnnModel(task)
    if task.args.model == 'lstm':
        return LstmModel(task)
    if task.args.model == 'bilstm':
        return BiLstmModel(task)
    if task.args.model == 'cnnlstm':
        return CnnLstmModel(task)
    raise NotImplementedError('model not implemented')
