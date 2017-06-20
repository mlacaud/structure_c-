#ifndef _VIDEO_H
#define _VIDEO_H

#include <iostream>
#include <list>
#include "../Quality/Quality.h"

class Video
{
  public:

  Video();
  std::string getName();
  void setName(std::string name);
  std::list<Quality*> getQuality();
  void addQuality(Quality* quality);
  ~Video();

  private:

  std::string m_name;
  std::list<Quality*> m_list;


};

#endif
