//
//  RDPHeader.h
//  RDPAlertView
//
//  Created by Allan Liu on 16/2/4.
//  Copyright © 2016年 TommyLiu. All rights reserved.
//

#ifndef RDPHeader_h
#define RDPHeader_h

#define HEXCOLOR(rgbValue) HEXACOLOR(rgbValue, 1.f)
#define HEXACOLOR(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

#endif /* RDPHeader_h */
