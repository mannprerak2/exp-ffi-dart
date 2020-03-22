// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

#include <stdio.h>
#include "hello.h"

int main()
{
    return 0;
}

void printData(struct Data data)
{
    printf("%d", data.i);
}

struct Data createData(int i)
{
    struct Data data;
    data.i = i;
    return data;
}