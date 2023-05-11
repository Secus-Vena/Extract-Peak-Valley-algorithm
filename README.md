# Extract-Peak-Valley-algorithm
提取峰值 谷值 算法 
给的都是function 函数
#AMPD 
Automatic multiscale-based peak detection (AMPD) 自动多尺度峰值查找算法

参考链接：
python :https://zhuanlan.zhihu.com/p/549588865
matlab :https://blog.csdn.net/qq_54875519/article/details/129112633

理解：

实际上算法分为两步：1 找出最长的那个尺度（窗） 2 对每个点这么长的窗里 找出最大值或者最小值 也就是峰谷值

# AMPD_update
升级版本的/适应本人应用的AMPD算法

附加打了一个补丁：应用于3 2 1 1 1 2 3 4 5 这样序列的最低值；

可以看到 该序列实际并没有“尖锐”的谷，反而最低点是平的，那么严格意义的比较就不适用

小改了一点点

# Method other
这个是其他方法 比较快的，然后适用于比较好的数据 （较严格地正增长或者负增长）

# other gossip
如果有其他比较好的方法或者对代码有什么改进意见，欢迎评论


# %附注（更新）
使用AMPD方法，当它处理的数据点比较多的时候，达到上万级别的时候，会使得程序运行时间过长；
即使拿去分析的数据是相对比较有规律的
