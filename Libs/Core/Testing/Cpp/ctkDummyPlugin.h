/*=========================================================================

  Library:   CTK

  Copyright (c) Kitware Inc.

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0.txt

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.

=========================================================================*/

// Qt includes
#include <QObject>
#include "ctkDummyPluginExport.h"
/*
class ctkDummyInterface{
public:
  virtual ~ctkDummyInterface(){}
  virtual void dummyInterface() = 0;
};

Q_DECLARE_INTERFACE ( ctkDummyInterface, "dummy.plugin" )
*/
class CTK_DUMMY_EXPORT ctkDummyPlugin: public QObject//, public ctkDummyInterface
{
  Q_OBJECT
//  Q_INTERFACES(ctkDummyInterface)
  Q_PLUGIN_METADATA(IID "org.commontk.DummyPlugin")
public:
  ctkDummyPlugin(QObject* parent = 0);
  ~ctkDummyPlugin();

  virtual void dummyInterface();
};

