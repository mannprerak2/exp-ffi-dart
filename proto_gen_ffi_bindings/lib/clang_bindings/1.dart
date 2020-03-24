// CXCursor_UnexposedDecl                 = 1,
//    /** A C or C++ struct. */
//    CXCursor_StructDecl                    = 2,
//    /** A C or C++ union. */
//    CXCursor_UnionDecl                     = 3,
//    /** A C++ class. */
//    CXCursor_ClassDecl                     = 4,
//    /** An enumeration. */
//    CXCursor_EnumDecl                      = 5,
//    /**
//     * A field (in C) or non-static data member (in C++) in a
//     * struct, union, or C++ class.
//     */
//    CXCursor_FieldDecl                     = 6,
//    /** An enumerator constant. */
//    CXCursor_EnumConstantDecl              = 7,
//    /** A function. */
//    CXCursor_FunctionDecl                  = 8,
//    /** A variable. */
//    CXCursor_VarDecl                       = 9,
//    /** A function or method parameter. */
//    CXCursor_ParmDecl                      = 10,
//    /** A typedef. */
//    CXCursor_TypedefDecl                   = 20,
//    /** A linkage specification, e.g. 'extern "C"'. */
//       CXCursor_LinkageSpec                   = 23,
//       /** The typedef is a declaration of size_type (CXCursor_TypedefDecl),
//     * while the type of the variable "size" is referenced. The cursor
//     * referenced by the type of size is the typedef for size_type.
//     */
//    CXCursor_TypeRef                       = 43,
//       /**
//     * A reference to a member of a struct, union, or class that occurs in
//     * some non-expression context, e.g., a designated initializer.
//     */
//    CXCursor_MemberRef                     = 47,
//    /**
//     * A reference to a labeled statement.
//     *
//     * This cursor kind is used to describe the jump to "start_over" in the
//     * goto statement in the following example:
//     *
//     * \code
//     *   start_over:
//     *     ++counter;
//     *
//     *     goto start_over;
//     * \endcode
//     *
//     * A label reference cursor refers to a label statement.
//     */
//    CXCursor_LabelRef                      = 48,