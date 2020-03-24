#include <clang-c/Index.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define aloc(T) ((T *)malloc(sizeof(T)))

enum CXChildVisitResult visitor(CXCursor cursor, CXCursor parent, CXClientData clientData)
{
    printf("Cursor- kind: %d, name: %s\n", clang_getCursorKind(cursor), clang_getCString(clang_getCursorSpelling(cursor)));
    return CXChildVisit_Continue;
}

int test_in_c()
{
    printf("==========================run==========================\n");
    CXIndex Index = clang_createIndex(0, 0);
    CXTranslationUnit TU = clang_parseTranslationUnit(Index,
                                                      "./test.h", 0, 0, NULL, 0, CXTranslationUnit_None);

    if (TU == NULL)
    {
        printf("Error creating TU\n");
        return 0;
    }

    CXCursor root = clang_getTranslationUnitCursor(TU);

    
    unsigned a = clang_visitChildren(root, visitor, NULL);

    clang_disposeTranslationUnit(TU);
    clang_disposeIndex(Index);
    printf("\n==========================end==========================\n");
    return 0;
}

const char *clang_getCString_wrap(CXString *string)
{
    const char *a = clang_getCString(*string);

    return a;
}

void clang_disposeString_wrap(CXString *string)
{
    return clang_disposeString(*string);
}

enum CXCursorKind clang_getCursorKind_wrap(CXCursor *cursor)
{
    return clang_getCursorKind(*cursor);
}

CXString *clang_getCursorSpelling_wrap(CXCursor *cursor)
{
    CXString *s = aloc(CXString);
    *s = clang_getCursorSpelling(*cursor);
    return s;
}

CXCursor *clang_getTranslationUnitCursor_wrap(CXTranslationUnit tu)
{
    CXCursor *c = aloc(CXCursor);
    *c = clang_getTranslationUnitCursor(tu);
    return c;
}

CXString *clang_formatDiagnostic_wrap(CXDiagnostic diag, int opts)
{
    CXString *s = aloc(CXString);
    *s = clang_formatDiagnostic(diag, opts);
    return s;
}