// pop up dialog
boolean popUpJPanel(String msg) {
  JPanel panel = new JPanel();
  BoxLayout layout = new BoxLayout(panel, BoxLayout.Y_AXIS);
  panel.setLayout(layout);
  panel.setPreferredSize(new Dimension(400, 50));
  boolean answer = false;
  panel.add(new JLabel(msg));

  int r = JOptionPane.showConfirmDialog(
    null, 
    panel, "COMFIRM", // title of dialog
    JOptionPane.YES_NO_OPTION, // option
    JOptionPane.QUESTION_MESSAGE);  // message type

  if (r == 0) answer = true;
  else answer = false;

  return answer;
}