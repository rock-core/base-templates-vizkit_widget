#include <QtCore/QtPlugin>
#include "ClassNamePluginInterface.hpp"
#include "ClassName.hpp"

Q_EXPORT_PLUGIN2(ClassNamePluginInterface, ClassNamePluginInterface)

ClassNamePluginInterface::ClassNamePluginInterface(QObject *parent)
: QObject(parent),initialized(false)
{
}

ClassNamePluginInterface::~ClassNamePluginInterface()
{
}

void ClassNamePluginInterface::initialize(QDesignerFormEditorInterface *formEditor)
{
  if (initialized)
    return;
  initialized = true;
}

bool ClassNamePluginInterface::isInitialized() const
{
  return initialized;
}

QWidget *ClassNamePluginInterface::createWidget(QWidget *parent)
{
  return new ClassName(parent);
}

QString ClassNamePluginInterface::name() const
{
  return "ClassName";
}

QString ClassNamePluginInterface::group() const
{
  return "Rock-Robotics";
}

QIcon ClassNamePluginInterface::icon() const
{
  return QIcon("");
}

QString ClassNamePluginInterface::toolTip() const
{
  return "Widget for ...";
}

QString ClassNamePluginInterface::whatsThis() const
{
  return "Widgte for ...";
}

bool ClassNamePluginInterface::isContainer() const
{
  return false;
}

QString ClassNamePluginInterface::domXml() const
{
  return "<widget class=\"ClassName\" name=\"ClassName\">\n"
    " <property name=\"geometry\">\n"
    "  <rect>\n"
    "   <x>0</x>\n"
    "   <y>0</y>\n"
    "   <width>320</width>\n"
    "   <height>240</height>\n"
    "  </rect>\n"
    " </property>\n"
    " <property name=\"toolTip\" >\n"
    "  <string></string>\n"
    " </property>\n"
    " <property name=\"whatsThis\" >\n"
    "  <string></string>\n"
    " </property>\n"
    "</widget>\n";
}

QString ClassNamePluginInterface::includeFile() const
{
  return "ProjectName/ClassName.h";
}

