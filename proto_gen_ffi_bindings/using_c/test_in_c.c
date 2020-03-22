#include <stdio.h>
#include <clang-c/Index.h>
void main(int argc, char *argv[])
{
    printf("==========================run==========================\n");
    CXIndex Index = clang_createIndex(0, 0);
    CXTranslationUnit TU = clang_parseTranslationUnit(Index,
                                                      NULL, argv, argc, NULL, 0, CXTranslationUnit_None);
    
    if(TU==NULL){
        printf("Error creating TU\n");
        return;
    }

    CXCursor root = clang_getTranslationUnitCursor(TU);

    int a = clang_getCursorKind(root);
    printf("%d\n",a);

    
    // for (unsigned I = 0, N = clang_getNumDiagnostics(TU); I != N; ++I)
    // {
    //     CXDiagnostic Diag = clang_getDiagnostic(TU, I);
    //     CXString String = clang_formatDiagnostic(Diag,
    //                                              clang_defaultDiagnosticDisplayOptions());
    //     fprintf(stderr, "%s\n", clang_getCString(String));
    //     clang_disposeString(String);
    // }
    clang_disposeTranslationUnit(TU);
    clang_disposeIndex(Index);
    printf("\n==========================end==========================\n");
    return;
}
