#ifndef _QUALITY_H
#define _QUALITY_H

#include <iostream>

class Quality
{
  public:

  Quality();
  ~Quality();

  long getBitrate();
  void setBitrate(long bitrate);
  long getHeight();
  void setHeight(int height);
  long getWidth();
  void setWidth(int width);

  private:

  long m_bitrate;
  int m_height;
  int m_width;

};

#endif
