/* 
 * File:   
 * Author: 
 *
 * 
 */

#ifndef ClassName_H
#define	ClassName_H

#include <QtGui/QWidget>
#include <QtGui/QTextEdit>
#include <QtCore/QString>
#include <QtDesigner/QDesignerExportWidget>

class QDESIGNER_WIDGET_EXPORT ClassName : public QWidget
{
  Q_OBJECT
  Q_CLASSINFO("Author", "")

  public:
    ClassName(QWidget *parent = NULL);
    virtual ~ClassName();

  public slots:
    void setText(QString text);

  private:
    QTextEdit m_text_edit;
};

#endif	/* ClassName_H */

