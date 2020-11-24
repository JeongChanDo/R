#!/usr/bin/env python
# coding: utf-8

def fit_clasifiers(gs_clfs, X, y):
    for clf in gs_clfs:
        print(X.shape)
        clf.fit(X, y)
        

        
        

def show_upper_outlier(df, stdev=3, show_total=False):

    # lower bound outliers
    cols = df.columns
    print(df.shape)
    for col in cols:
        mean = df[col].mean()
        std = df[col].std()
        threshold = mean + stdev * std
        n_outlier = np.sum(df[col] > threshold)
        print(col + ".  threshold "+str(round(threshold,2))+" num of outlier : "+str(n_outlier))
        if (show_total == True) & (n_outlier != 0):
            print(df.loc[(df[col] > threshold),col])


        
    
def show_gridsearch_result(gs_clfs):
    estimators = []
    scores = []
    params = []
    for clf in gs_clfs:
        estimators.append(str(clf.estimator))
        scores.append(clf.best_score_)
        params.append(clf.best_params_)


    for i, val in enumerate(estimators):
        print(val)
        print(scores[i])
        print(params[i])






def show_metrics(y_test, y_pred):
    confusion = confusion_matrix(y_test, y_pred)
    accuracy = accuracy_score(y_test, y_pred)
    precision = precision_score(y_test, y_pred)
    recall = recall_score(y_test, y_pred)
    print(confusion)
    print("Acc : {}".format(accuracy))
    print("precision : {}".format(precision))
    print("recall : {}".format(recall))

    
    
    
    
def show_precision_recall_curve(y_test,prob_positive_pred):
    precisions, recalls, thresholds = precision_recall_curve(y_test, prob_positive_pred)
    print("th val : {}".format(thresholds[:4]))
    print("precision val : {}".format(precisions[:4]))
    print("recalls val : {}".format(recalls[:4]))

    df = {
        "thresholds":thresholds, 
          "precisions":precisions[:-1], 
          "recalls":recalls[:-1]
    }
    df = pd.DataFrame.from_dict(df)

    sns.lineplot(x="thresholds", y="precisions", data=df)
    sns.lineplot(x="thresholds", y="recalls", data=df)




def show_roc_curve(y_test,prob_positive_pred):
    fpr, tpr, thresholds = roc_curve(y_test,prob_positive_pred)

    print("fpr val : {}".format(fpr[:4]))
    print("tpr val : {}".format(tpr[:4]))
    print("thresholds val : {}".format(thresholds[:4]))

    df = {"threshold":thresholds, "fpr":fpr, "tpr":tpr}
    df = pd.DataFrame.from_dict(df)
    sns.lineplot(x="fpr", y="tpr", data=df)

    roc_score = roc_auc_score(y_test, prob_positive_pred)
    print(roc_score)
    

    
    
    
    
def show_lower_outlier(df, stdev=3, show_total=False):

    # lower bound outliers
    cols = df.columns
    print(df.shape)
    for col in cols:
        #std
        mean = df[col].mean()
        std = df[col].std()
        threshold = mean - stdev * std
        n_outlier = np.sum((df[col] < threshold) & (df[col] > 0))
        print(col + ". mean : "+str(round(mean,3))+", num of outlier : "+str(n_outlier))
        if (show_total == True) & (n_outlier != 0):
            print(df.loc[(df[col] < threshold) & (df[col] > 0),col][:5])
        
        print("   -> cnt of zero : " + str(np.sum(df[col] == 0))+"\n")


        
        
        
def lower_outlier_transform(df, stdev=3):
    cols = df.columns

    for col in cols:
        mean = df[col].mean()
        std = df[col].std()
        threshold = mean - stdev * std
        df.loc[(df[col] < threshold) & (df[col] > 0), col] = mean
    return df        
        
        
def upper_outlier_transform(df, stdev=3):

    cols = df.columns
    print("before drop outlier : {}".format(df.shape))
    for col in cols:
        mean = df[col].mean()
        std = df[col].std()
        threshold = mean + stdev * std
        n_outlier = np.sum(df[col] > threshold)
        #print(df[df[col] > threshold])
        df.drop(df[df[col] > threshold].index[:], inplace=True)

    df.dropna()
    print("after drop outlier : {}".format(df.shape))
    
    
def zero_to_mean(df, cols):

    for col in enumerate(cols):
        df.loc[ df.loc[:, col] == 0 , col] = df[col].mean()



