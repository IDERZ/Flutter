class Validation {
    List<String> msgList = new List<String>();

    Validation addMsg(String text) {
      if (text == null) {
        return this;
      }

      msgList.add(text);
      return this;
    }

    bool isEmpty() {
      return msgList == null || msgList.isEmpty;
    }

    String allMsg() {
      if (isEmpty()) {
        return '';
      }

      String _msg = '';
      for (String m in msgList) {
        if (_msg.isNotEmpty) {
          _msg = _msg + '\n';
        }
        _msg = _msg + m;
      }

      return _msg;
    }
}

