/* 
 * File:   
 * Author: 
 * 
 */

#include "ClassName.hpp"

ClassName::ClassName(QWidget *parent):
  QWidget(parent),
  m_text_edit(this)
{
  setWindowTitle(tr("ClassName"));
  resize(200,50);

  m_text_edit.move(10,10);
  m_text_edit.resize(180,30);
}

ClassName::~ClassName()
{

}

void ClassName::setText(QString string)
{
  m_text_edit.setText(string);
}

