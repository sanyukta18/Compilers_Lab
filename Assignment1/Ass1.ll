; ModuleID = 'Ass1.c'
source_filename = "Ass1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [35 x i8] c"Enter how many elements you want:\0A\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [24 x i8] c"Enter the %d elements:\0A\00", align 1
@.str.3 = private unnamed_addr constant [27 x i8] c"\0AEnter the item to search\0A\00", align 1
@.str.4 = private unnamed_addr constant [27 x i8] c"\0A%d found in position: %d\0A\00", align 1
@.str.5 = private unnamed_addr constant [35 x i8] c"\0AItem is not present in the list.\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4  //
  %2 = alloca i32, align 4
  %3 = alloca [100 x i32], align 16 //%3 = a[]
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 0, i32* %1, align 4  // i = 0, %1 = i
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str, i64 0, i64 0)) // printf 
  %8 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32* %2)                                //  %2 = n 
  %9 = load i32, i32* %2, align 4   //%9 = %2 = n 
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2, i64 0, i64 0), i32 %9) //printf to enter the loop 
  store i32 0, i32* %5, align 4   //%5 = i = 0 
  br label %11    // go to lbl 11 

11:                                               ; preds = %20, %0
  %12 = load i32, i32* %5, align 4    //%12 = i 
  %13 = load i32, i32* %2, align 4    //%13 = n 
  %14 = icmp slt i32 %12, %13         // i < n
  br i1 %14, label %15, label %23     //if true go to lb15 else go to lb23

15:                                               ; preds = %11
  %16 = load i32, i32* %5, align 4      //%16 = i
  %17 = sext i32 %16 to i64            //%17 = i 
  %18 = getelementptr inbounds [100 x i32], [100 x i32]* %3, i64 0, i64 %17     //%18 = a[i]
  %19 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32* %18)  // scan a[i]
  br label %20  //go to lb20 

20:                                               ; preds = %15
  %21 = load i32, i32* %5, align 4  //%21 = i 
  %22 = add nsw i32 %21, 1          //%22 = i+1
  store i32 %22, i32* %5, align 4   // %5 = i = i+1
  br label %11                      // go back into loop 

23:                                               ; preds = %11
  %24 = getelementptr inbounds [100 x i32], [100 x i32]* %3, i64 0, i64 0   //%24 = a[]
  %25 = load i32, i32* %2, align 4        //%25 = n = %2
  call void @inst_sort(i32* %24, i32 %25)  // inst_sort(a[],n)
  %26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.3, i64 0, i64 0)) //printf(enter element to search)

  %27 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32* %4)  //take in item, %27 = item = %4
  %28 = getelementptr inbounds [100 x i32], [100 x i32]* %3, i64 0, i64 0   // %28 = a[]
  %29 = load i32, i32* %2, align 4    //%29 = n
  %30 = load i32, i32* %4, align 4    //%30 = %4 = item 
  %31 = call i32 @bsearch(i32* %28, i32 %29, i32 %30)     //%31 stores loc value of item returned by bsearch(a,n,item) 
  store i32 %31, i32* %6, align 4   // %6 stores the loc value 
  %32 = load i32, i32* %4, align 4    //%32 = item
  %33 = load i32, i32* %6, align 4    // %33 = loc value of bsearch
  %34 = sext i32 %33 to i64       // %34 = loc value of bsearch
  %35 = getelementptr inbounds [100 x i32], [100 x i32]* %3, i64 0, i64 %34   // %35 = a[loc]
  %36 = load i32, i32* %35, align 4
  %37 = icmp eq i32 %32, %36
  br i1 %37, label %38, label %43

38:                                               ; preds = %23
  %39 = load i32, i32* %4, align 4
  %40 = load i32, i32* %6, align 4
  %41 = add nsw i32 %40, 1
  %42 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.4, i64 0, i64 0), i32 %39, i32 %41)
  br label %45

43:                                               ; preds = %23
  %44 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.5, i64 0, i64 0))
  br label %45

45:                                               ; preds = %43, %38
  ret i32 0
}

declare dso_local i32 @printf(i8*, ...) #1

declare dso_local i32 @__isoc99_scanf(i8*, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @inst_sort(i32* %0(num[]), i32 %1 (n)) #0 {
  %3 = alloca i32*, align 8  //num
  %4 = alloca i32, align 4    // %4 = n
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32* %0, i32** %3, align 8  // %3 = num[]
  store i32 %1, i32* %4, align 4  //%4 = n
  store i32 1, i32* %6, align 4   // j = %6 = 1
  br label %8 // go to label %8

8:                                                ; preds = %54, %2
  %9 = load i32, i32* %6, align 4  // %9 = j 
  %10 = load i32, i32* %4, align 4  //%10 = n
  %11 = icmp slt i32 %9, %10    // j<n
  br i1 %11, label %12, label %57  // go to label 12 or 57 

12:                        //if condition is true                        ; preds = %8
  %13 = load i32*, i32** %3, align 8    //%13 = num[]
  %14 = load i32, i32* %6, align 4      //%14 = j
  %15 = sext i32 %14 to i64         //%15 = j
  %16 = getelementptr inbounds i32, i32* %13, i64 %15   // %16 = num[j]
  %17 = load i32, i32* %16, align 4       //%17 =num[j]
  store i32 %17, i32* %7, align 4         //%7 = num[j]
  %18 = load i32, i32* %6, align 4        //%18 = j
  %19 = sub nsw i32 %18, 1          //%19 = j-1
  store i32 %19, i32* %5, align 4   //%5 = %19 = j-1
  br label %20   //go to label 20

20:                                               ; preds = %44, %12
  %21 = load i32, i32* %5, align 4  //%21 = j-1
  %22 = icmp sge i32 %21, 0       // j-1 >= 0 
  br i1 %22, label %23, label %31   //if condition is true

23:                                               ; preds = %20
  %24 = load i32, i32* %7, align 4      //%24 = num[j]
  %25 = load i32*, i32** %3, align 8    //%25 = num[]
  %26 = load i32, i32* %5, align 4      //%26 = j-1
  %27 = sext i32 %26 to i64       //%27 = j-1
  %28 = getelementptr inbounds i32, i32* %25, i64 %27  //%28 = num[j-1]
  %29 = load i32, i32* %28, align 4    //%29 = num[j-1]
  %30 = icmp slt i32 %24, %29         // k < num[i]
  br label %31        //go to %31

31:                                               ; preds = %23, %20
  %32 = phi i1 [ false, %20 ], [ %30, %23 ]   //%32 if condition is true or false
  br i1 %32, label %33, label %47  // if true go to 33 else 47

33:                                               ; preds = %31
  %34 = load i32*, i32** %3, align 8   // %34 = num[]
  %35 = load i32, i32* %5, align 4    //%35 = i
  %36 = sext i32 %35 to i64   // %36 = i
  %37 = getelementptr inbounds i32, i32* %34, i64 %36     //%37 = num[i]
  %38 = load i32, i32* %37, align 4       //%38 = num[i]
  %39 = load i32*, i32** %3, align 8      //%39 = num[]
  %40 = load i32, i32* %5, align 4        //%40 = i
  %41 = add nsw i32 %40, 1    // #41 = i+1
  %42 = sext i32 %41 to i64   //%42 = i+1
  %43 = getelementptr inbounds i32, i32* %39, i64 %42  //%43 = num[i+1]
  store i32 %38, i32* %43, align 4    //%38 = num[i+1]
  br label %44    //go to label 44

44:                                               ; preds = %33
  %45 = load i32, i32* %5, align 4      //%45 = i
  %46 = add nsw i32 %45, -1           //%46 = i-1
  store i32 %46, i32* %5, align 4     //i = i-1
  br label %20  //go to label 20 i.e loop 

47:                                               ; preds = %31
  %48 = load i32, i32* %7, align 4     //
  %49 = load i32*, i32** %3, align 8    // %49 = num[]
  %50 = load i32, i32* %5, align 4  //%50 = i
  %51 = add nsw i32 %50, 1          //%51 = i+1
  %52 = sext i32 %51 to i64         //%52 = i+1
  %53 = getelementptr inbounds i32, i32* %49, i64 %52   //%53 = num[i+1]
  store i32 %48, i32* %53, align 4        //%48 = num[i+1]
  br label %54      // go to label 54

54:                                               ; preds = %47
  %55 = load i32, i32* %6, align 4  // %55 = j
  %56 = add nsw i32 %55, 1          //%56 = j+1
  store i32 %56, i32* %6, align 4   //j = j+1 
  br label %8 // go to label 8 loop cond*-

57:                                               ; preds = %8
  ret void  // returns void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @bsearch(array a[] i32* %0, n i32 %1, item i32 %2) #0 {
  %4 = alloca i32*, align 8
  %5 = alloca i32, align 4 //top 
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4  //bottom
  store i32* %0, i32** %4, align 8 // %4 has address of a[]
  store i32 %1, i32* %5, align 4 //setting top to n 
  store i32 %2, i32* %6, align 4  // setting %6 to item
  store i32 1, i32* %9, align 4  // setting bottom to 1 
  %10 = load i32, i32* %5, align 4 //%10 = top
  store i32 %10, i32* %8, align 4 //%8 stores %10 ot top
  br label %11

11:                                               ; preds = %51, %3
  %12 = load i32, i32* %9, align 4   //%12 has bottom
  %13 = load i32, i32* %8, align 4   //%13 = top
  %14 = add nsw i32 %12, %13            //bottom+top
  %15 = sdiv i32 %14, 2                 //mid=(bottom+top)/2
  store i32 %15, i32* %7, align 4       //storing mid in %7
  %16 = load i32, i32* %6, align 4      //item in %16
  %17 = load i32*, i32** %4, align 8    //%17 has address of a[]
  %18 = load i32, i32* %7, align 4   //mid in %18
  %19 = sext i32 %18 to i64   //mid in %19
  %20 = getelementptr inbounds i32, i32* %17, i64 %19  //
  %21 = load i32, i32* %20, align 4 // a[mid]
  %22 = icmp slt i32 %16, %21 // if condition comparison 
  br i1 %22, label %23, label %26 //the two branches for if statement

23:                                               ; preds = %11 // condition one true then
  %24 = load i32, i32* %7, align 4  //mid in %24
  %25 = sub nsw i32 %24, 1  //top = mid-1 and top stored in %25
  store i32 %25, i32* %8, align 4 //change original %8 top
  br label %38    //go to label 38 

26:                                               ; preds = %11
  %27 = load i32, i32* %6, align 4           // %27 has item 
  %28 = load i32*, i32** %4, align 8        //%28 has a[]
  %29 = load i32, i32* %7, align 4        //mid in %7
  %30 = sext i32 %29 to i64           //%30 in mid 
  %31 = getelementptr inbounds i32, i32* %28, i64 %30  //a[mid] in %31
  %32 = load i32, i32* %31, align 4  //%32 loads %31 i.e a[mid] 
  %33 = icmp sgt i32 %27, %32       //compare item and a[mid]
  br i1 %33, label %34, label %37   //branch to lb34 and lb37

34:                                               ; preds = %26
  %35 = load i32, i32* %7, align 4  //%35 in %7: %35-mid
  %36 = add nsw i32 %35, 1    //%36=%35+1 , %36 = mid+1
  store i32 %36, i32* %9, align 4  //bottom = mid+1 , %9 = bottom
  br label %37 // go to label 37

37:                                               ; preds = %34, %26
  br label %38 //go to label 38

38:                                               ; preds = %37, %23
  br label %39  //go to label 39

39:                                               ; preds = %38
  %40 = load i32, i32* %6, align 4    //%40 has item
  %41 = load i32*, i32** %4, align 8  //%41 has a[]
  %42 = load i32, i32* %7, align 4  //%42 has mid 
  %43 = sext i32 %42 to i64         //%43 has %42 i.e mid
  %44 = getelementptr inbounds i32, i32* %41, i64 %43     //%44 = a[mid]
  %45 = load i32, i32* %44, align 4     //%45 = a[mid]
  %46 = icmp ne i32 %40, %45           //cmps item and a[mid] not equals
  br i1 %46, label %47, label %51   //branches to %47 and %51

47:                                               ; preds = %39
  %48 = load i32, i32* %9, align 4    // %48 = bottom
  %49 = load i32, i32* %8, align 4    //%49 = top
  %50 = icmp sle i32 %48, %49         // bottom<=top
  br label %51                  //go to label 51

51:                                               ; preds = %47, %39  // 
  %52 = phi i1 [ false, %39 ], [ %50, %47 ]      
  br i1 %52, label %11, label %53  //go into loop(label 11) or stop at end (label53)

53:           //  if item == mid+1 or bottom > top                    ; preds = %51
  %54 = load i32, i32* %7, align 4   // mid in %54
  ret i32 %54       //return mid
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}
