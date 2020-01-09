/*
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import <React/RCTSinglelineTextInputViewManager.h>

#import <React/RCTBaseTextInputShadowView.h>
#import <React/RCTSinglelineTextInputView.h>

@implementation RCTSinglelineTextInputViewManager

RCT_EXPORT_MODULE()

RCT_CUSTOM_SHADOW_PROPERTY(fontCondensed, BOOL, RCTSinglelineTextInputView) {
  view.textAttributes.fontCondensed = [NSNumber numberWithBool: [RCTConvert BOOL:json]];
}

- (RCTShadowView *)shadowView
{
  RCTBaseTextInputShadowView *shadowView =
    (RCTBaseTextInputShadowView *)[super shadowView];

  shadowView.maximumNumberOfLines = 1;

  return shadowView;
}

- (UIView *)view
{
  return [[RCTSinglelineTextInputView alloc] initWithBridge:self.bridge];
}

@end
