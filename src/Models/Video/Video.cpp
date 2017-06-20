#include <iostream>
#include <list>

#include "Video.h"

Video::Video() {
  m_name = "";
  m_list = {};

};


Video::~Video() {

};

std::string Video::getName(){
  return m_name;
};

void Video::setName(std::string name) {
  m_name = name;
};

std::list<Quality*> Video::getQuality() {
  return m_list;
};

void Video::addQuality(Quality* quality) {
  m_list.push_back(quality);
};
