//
//  HomeRecommentTable.m
//  chuanke
//
//  Created by zhouMR on 16/7/19.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "HomeLikeTable.h"
#import "HomeTableHeader.h"
#import "CellHomeLike.h"

@interface HomeLikeTable()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) HomeTableHeader *header;
@property (nonatomic, strong) UITableView *table;
@end
@implementation HomeLikeTable

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _header = [[HomeTableHeader alloc]initWithFrame:CGRectMake(0, 0, self.width, 35)];
        _header.name.text = @"猜你喜欢";
        [_header hiddenMore];
        [self addSubview:_header];
        
        _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 35, DEVICEWIDTH, 305)];
        _table.backgroundColor = [UIColor clearColor];
        _table.delegate = self;
        _table.dataSource = self;
        _table.scrollEnabled = FALSE;
        _table.rowHeight = 85;
        _table.showsVerticalScrollIndicator = NO;
        _table.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:_table];
    }
    return self;
}

- (CGFloat)calHeight:(NSArray*)arr{
    CGFloat height = 35 + [arr count]*85;
    return height;
}

- (void)reload{
    [self.table reloadData];
}

- (void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    self.table.height = frame.size.height-35;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"CellHomeLike";
    CellHomeLike *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[CellHomeLike alloc]init];
    }
    [cell updateData:[self.dataSource objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectHomeLike:)]) {
        [self.delegate selectHomeLike:[self.dataSource objectAtIndex:indexPath.row]];
    }
}

@end
