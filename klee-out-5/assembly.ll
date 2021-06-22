; ModuleID = 'main_p.bc'
source_filename = "main_p.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"b\00", align 1
@.str.3 = private unnamed_addr constant [54 x i8] c"/tmp/klee_src/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @is_prime(i32 %n) #0 !dbg !10 {
entry:
  %retval = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !14, metadata !DIExpression()), !dbg !15
  %0 = load i32, i32* %n.addr, align 4, !dbg !16
  %cmp = icmp sle i32 %0, 1, !dbg !18
  br i1 %cmp, label %if.then, label %if.end, !dbg !19

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !20
  br label %return, !dbg !20

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !22, metadata !DIExpression()), !dbg !24
  store i32 2, i32* %i, align 4, !dbg !24
  br label %for.cond, !dbg !25

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i32, i32* %i, align 4, !dbg !26
  %2 = load i32, i32* %n.addr, align 4, !dbg !28
  %div = sdiv i32 %2, 2, !dbg !29
  %cmp1 = icmp sle i32 %1, %div, !dbg !30
  br i1 %cmp1, label %for.body, label %for.end, !dbg !31

for.body:                                         ; preds = %for.cond
  %3 = load i32, i32* %n.addr, align 4, !dbg !32
  %4 = load i32, i32* %i, align 4, !dbg !35
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !36
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !36
  %rem = srem i32 %3, %4, !dbg !36, !klee.check.div !37
  %cmp2 = icmp eq i32 %rem, 0, !dbg !38
  br i1 %cmp2, label %if.then3, label %for.inc, !dbg !39

if.then3:                                         ; preds = %for.body
  store i32 0, i32* %retval, align 4, !dbg !40
  br label %return, !dbg !40

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !42
  %inc = add nsw i32 %5, 1, !dbg !42
  store i32 %inc, i32* %i, align 4, !dbg !42
  br label %for.cond, !dbg !43, !llvm.loop !44

for.end:                                          ; preds = %for.cond
  store i32 1, i32* %retval, align 4, !dbg !46
  br label %return, !dbg !46

return:                                           ; preds = %for.end, %if.then3, %if.then
  %6 = load i32, i32* %retval, align 4, !dbg !47
  ret i32 %6, !dbg !47
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !48 {
entry:
  %retval = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %b, metadata !51, metadata !DIExpression()), !dbg !52
  %0 = bitcast i32* %b to i8*, !dbg !53
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0)), !dbg !54
  %1 = load i32, i32* %b, align 4, !dbg !55
  %call = call i32 @is_prime(i32 %1), !dbg !56
  ret i32 0, !dbg !57
}

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @klee_div_zero_check(i64) #0 !dbg !58 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  call void @llvm.dbg.declare(metadata i64* %2, metadata !63, metadata !DIExpression()), !dbg !64
  %3 = load i64, i64* %2, align 8, !dbg !65
  %4 = icmp eq i64 %3, 0, !dbg !67
  br i1 %4, label %5, label %6, !dbg !68

5:                                                ; preds = %1
  call void @klee_report_error(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.3, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i64 0, i64 0)) #4, !dbg !69
  unreachable, !dbg !69

6:                                                ; preds = %1
  ret void, !dbg !70
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }

!llvm.dbg.cu = !{!0, !3}
!llvm.module.flags = !{!5, !6, !7}
!llvm.ident = !{!8, !9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 9.0.1 (https://github.com/llvm/llvm-project.git c1a0a213378a458fbea1a5c77b315c7dce08fd05)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, nameTableKind: None)
!1 = !DIFile(filename: "main_p.c", directory: "/home/klee/code")
!2 = !{}
!3 = distinct !DICompileUnit(language: DW_LANG_C89, file: !4, producer: "clang version 9.0.0-2~ubuntu18.04.2 (tags/RELEASE_900/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, nameTableKind: None)
!4 = !DIFile(filename: "/tmp/klee_src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/tmp/klee_build90stp_z3/runtime/Intrinsic")
!5 = !{i32 2, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{!"clang version 9.0.1 (https://github.com/llvm/llvm-project.git c1a0a213378a458fbea1a5c77b315c7dce08fd05)"}
!9 = !{!"clang version 9.0.0-2~ubuntu18.04.2 (tags/RELEASE_900/final)"}
!10 = distinct !DISubprogram(name: "is_prime", scope: !1, file: !1, line: 4, type: !11, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "n", arg: 1, scope: !10, file: !1, line: 4, type: !13)
!15 = !DILocation(line: 4, column: 18, scope: !10)
!16 = !DILocation(line: 5, column: 5, scope: !17)
!17 = distinct !DILexicalBlock(scope: !10, file: !1, line: 5, column: 5)
!18 = !DILocation(line: 5, column: 7, scope: !17)
!19 = !DILocation(line: 5, column: 5, scope: !10)
!20 = !DILocation(line: 6, column: 3, scope: !21)
!21 = distinct !DILexicalBlock(scope: !17, file: !1, line: 5, column: 13)
!22 = !DILocalVariable(name: "i", scope: !23, file: !1, line: 8, type: !13)
!23 = distinct !DILexicalBlock(scope: !10, file: !1, line: 8, column: 2)
!24 = !DILocation(line: 8, column: 10, scope: !23)
!25 = !DILocation(line: 8, column: 6, scope: !23)
!26 = !DILocation(line: 8, column: 17, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !1, line: 8, column: 2)
!28 = !DILocation(line: 8, column: 22, scope: !27)
!29 = !DILocation(line: 8, column: 24, scope: !27)
!30 = !DILocation(line: 8, column: 19, scope: !27)
!31 = !DILocation(line: 8, column: 2, scope: !23)
!32 = !DILocation(line: 9, column: 13, scope: !33)
!33 = distinct !DILexicalBlock(scope: !34, file: !1, line: 9, column: 12)
!34 = distinct !DILexicalBlock(scope: !27, file: !1, line: 8, column: 34)
!35 = !DILocation(line: 9, column: 17, scope: !33)
!36 = !DILocation(line: 9, column: 15, scope: !33)
!37 = !{!"True"}
!38 = !DILocation(line: 9, column: 20, scope: !33)
!39 = !DILocation(line: 9, column: 12, scope: !34)
!40 = !DILocation(line: 10, column: 13, scope: !41)
!41 = distinct !DILexicalBlock(scope: !33, file: !1, line: 9, column: 26)
!42 = !DILocation(line: 8, column: 30, scope: !27)
!43 = !DILocation(line: 8, column: 2, scope: !27)
!44 = distinct !{!44, !31, !45}
!45 = !DILocation(line: 12, column: 5, scope: !23)
!46 = !DILocation(line: 13, column: 5, scope: !10)
!47 = !DILocation(line: 14, column: 1, scope: !10)
!48 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 18, type: !49, scopeLine: 18, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DISubroutineType(types: !50)
!50 = !{!13}
!51 = !DILocalVariable(name: "b", scope: !48, file: !1, line: 19, type: !13)
!52 = !DILocation(line: 19, column: 9, scope: !48)
!53 = !DILocation(line: 21, column: 24, scope: !48)
!54 = !DILocation(line: 21, column: 5, scope: !48)
!55 = !DILocation(line: 22, column: 14, scope: !48)
!56 = !DILocation(line: 22, column: 5, scope: !48)
!57 = !DILocation(line: 23, column: 5, scope: !48)
!58 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !59, file: !59, line: 12, type: !60, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !3, retainedNodes: !2)
!59 = !DIFile(filename: "klee_src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/tmp")
!60 = !DISubroutineType(types: !61)
!61 = !{null, !62}
!62 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!63 = !DILocalVariable(name: "z", arg: 1, scope: !58, file: !59, line: 12, type: !62)
!64 = !DILocation(line: 12, column: 36, scope: !58)
!65 = !DILocation(line: 13, column: 7, scope: !66)
!66 = distinct !DILexicalBlock(scope: !58, file: !59, line: 13, column: 7)
!67 = !DILocation(line: 13, column: 9, scope: !66)
!68 = !DILocation(line: 13, column: 7, scope: !58)
!69 = !DILocation(line: 14, column: 5, scope: !66)
!70 = !DILocation(line: 15, column: 1, scope: !58)
