#include <algorithm>
#include <iostream>
#include <list>
#include "Services/print/print.h"
#include "Models/Video/Video.h"
#include "Models/Quality/Quality.h"

int main()
{
    // Init variables
    Quality q1;
    Quality q2;
    Quality q3;
    Video vid1;
    std::list<Video*> l = {};

    // Init infos
    l.push_front(&vid1);

    vid1.setName("video1");
    vid1.addQuality(&q1);
    vid1.addQuality(&q2);
    vid1.addQuality(&q3);

    // Change q1 via object
    q1.setBitrate(7000000);

    // Change q1 via ref in the lists
    l.front()->getQuality().back()->setBitrate(3000000);

    //print results
    print(std::to_string(l.front()->getQuality().front()->getBitrate()));
    print(std::to_string(l.front()->getQuality().back()->getBitrate()));

    return 0;
}
