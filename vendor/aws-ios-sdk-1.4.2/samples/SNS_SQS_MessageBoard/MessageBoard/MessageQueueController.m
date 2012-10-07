/*
 * Copyright 2010-2012 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import "MessageQueueController.h"
#import "MessageBoard.h"
#import <AWSiOSSDK/SBJsonParser.h>

// View used to display the messages in the queue.
@implementation MessageQueueController


-(id)init
{
    self = [super init];
    if (self)
    {
        messages = [[[MessageBoard instance] getMessagesFromQueue] retain];
        self.title = @"Message Queue";
        self.navigationItem.rightBarButtonItem = self.editButtonItem;
    }
    return self;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [messages count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
    }

    // Configure the cell...
    SQSMessage *message = [messages objectAtIndex:indexPath.row];
    if (message != nil && message.body != nil) {
        cell.textLabel.text                      = [self extractMessageFromJson:message.body];
        cell.textLabel.adjustsFontSizeToFitWidth = YES;
    }

    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        SQSMessage *message = [messages objectAtIndex:indexPath.row];

        [[MessageBoard instance] deleteMessageFromQueue:message];
        [messages removeObjectAtIndex:indexPath.row];

        NSArray *indexPaths = [NSArray arrayWithObjects:indexPath, nil];
        [tableView beginUpdates];
        [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
        [tableView endUpdates];
    }
}

-(NSString *)extractMessageFromJson:(NSString *)json
{
    SBJsonParser *parser = [[SBJsonParser new] autorelease];
    NSDictionary *jsonDic = [parser objectWithString:json];
    
    return [jsonDic objectForKey:@"Message"];
}

-(void)dealloc
{
    [messages release];
    [super dealloc];
}

@end
