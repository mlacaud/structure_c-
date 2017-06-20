#include <iostream>

#include "Quality.h"

Quality::Quality() {
  m_bitrate = 1000000;
  m_width = 1080;
  m_height = 720;

};
Quality::~Quality() {};

long Quality::getBitrate(){
  return m_bitrate;
};

void Quality::setBitrate(long bitrate) {
  m_bitrate = bitrate;
};

long Quality::getWidth() {
  return m_width;
};

void Quality::setWidth(int width) {
  m_width = width;
};

long Quality::getHeight() {
  return m_height;
};

void Quality::setHeight(int height) {
  m_height = height;
};
