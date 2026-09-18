Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0E432B10F
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 09:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723834; cv=none; b=kvVKvldHAEOPj9LkMf9R75J3o9mrIyd2Bwhc3ITVEutTxag7OtytfEA7+gcgK26yg0lV92Dg4I1W/HNkT6gsbyxccw7cYX7RLTBBgaJ4TxJEc5rrq4RM41kMUCjDg73UNlOBTE02VvcOFTrrgSZg3ut1m706ClawksobZ0mcvy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723834; c=relaxed/simple;
	bh=xVvPBhcxFPbVB1dpikehNudtA6+pusoKbTL5cGXpAfM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LgU07QH/bAl2V3sEeikTqAxHzmJuhqfjpm7Gjc0Gce9sYdmTEaHP4B5H29it6KN9THcetGPQ7bW5jPYl9QGp6D8CHRrGwIy36lbqRa1ltLz9KL3fwBl2NTy9+CP3WHZlpM/WDI1jQ8u8cr4GCcifwMyHpTIs9iMnVx1OKfmWnIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YLPoiHxs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wu2Pvkqg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YLPoiHxs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wu2Pvkqg"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I5xssQ3423137
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 09:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sPt4UPchwds0HyAFeyAS2O3QFIIxm44YoVgrGfIwWCM=; b=YLPoiHxsIe8HtJiX
	oRFJRCjiOGzRoV9uipka15Bze9kbzS8DzAO2GzdTk7SGkPMz/qKuOT74bkrHyt6K
	rWWrh0X3aG6oRE9542rI9flAMwzY8xHW4ZPa/yYPwwmJQZojBBeH1DLbzMQPHF+6
	9FKrkHY/AeqYfFldo8GkzOvTpp8EquXjwbv8JQZjEtlmZHEEaanMTbaHt2ZCtUlM
	gYWcp7P7Dg9YNt4OTIumt21JY7BICjqNpWPn69RHGGq8JAFV+Z/xsOqTrzotEcQi
	JuYhYVpylKaFAIYS7LwfInhuNiU1pemnFoMSyuDAws5Ov1DJ5lI5F50FY06FzO18
	sYAdSQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrjdtf0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 09:30:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936aa34873bso92556685a.3
        for <imx@lists.linux.dev>; Fri, 18 Sep 2026 02:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789723831; x=1790328631; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sPt4UPchwds0HyAFeyAS2O3QFIIxm44YoVgrGfIwWCM=;
        b=Wu2PvkqgPK6Bav4OyiF0FVF/mfhwOvJH66TwaO3PGFO31ztQWIQd3hAhOSjCbN6Is0
         VUGVVoZ9Fo2IV55EtATlNcgFv14Dw0tca5sxkZGM5dRMgh0RaMlTs82naQkuWs2GPchU
         oMLfYkJG23bvOEOIxyAVjJxXKPKruvy8kkMHg9YCHfNZzpRYTRrWJa6KAGz4ym0VeJpz
         ZUazp9BBCoRoBQ6mgEsa1rj4HgdxB7sBf1nMkNd0lRa9XfDLFrG1ov7BfVEXoBEidq8Q
         8nw6dc1/WwWI0vJNw+s0ym8fegJ9dU2j7kD4zc3ZPipaWLdDs9jQUa1KW0L+md9pE8/b
         Jhyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723831; x=1790328631;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sPt4UPchwds0HyAFeyAS2O3QFIIxm44YoVgrGfIwWCM=;
        b=suhonQhDA7Oc7gLAL8z93ZBtZHF4QuV4PFJAEDCLOwR86DNGap4o3EO+mr9riV1tye
         alEI0PjjVx5Ama64yRVqoWFYXB16ZDU2MdytMVKff3GBYaapTYjKwSv4BuV13AElgCKp
         xlNp08QqQut3Z3TZ+MFjPoH6Y3Yqj/OojTqp57xyOig6CtNPIg04BSPYfeD8eBrOlG/w
         JchkoZJiLreiWs0V1Lcy1ek8nOAKA4DerYcSzKd3hy7hv9bnAUJJhtmGHvVpU2UCud8Y
         w+90km8NzPoqHoAi3ysjHXOe7HiOy0C6c9I2RK6hPdDMyVLbuZyMiTEJNMS+eLTAhgYi
         k5eA==
X-Forwarded-Encrypted: i=1; AKwUvBz5Eh+xe+43mVb+4mn4N4mNZaviDSQXc9EU18PkjGFBymyZAAWvLE3xkJlEPBQeCwuDEnQ=@lists.linux.dev
X-Gm-Message-State: AFuF++nAdSDYrujvJvpZOfA3Nkamlj7FuLdaDuJymmIp6JTWiA4C5Ge0
	2eevInSIUVTYLEmts2eVot1LYnV7EPw/TWQNQtZGWEnaHuTNh4L9Yogfc4bAhKX3wMF1giDeTN6
	3mhKgt5FwdduHzosEjAF5Lh2iUAZn+KXWNGSBRl3ly0bXCUcMg1dWkNQ=
X-Gm-Gg: AYBFou1YlUO0qohdfyEO1c1Oah/D/nimssxft0FXoFK0FFG04wqlpimVLTniOQUxUA0
	A7C1HMvYJIX4dynBerzlj9Q2ZFX/hlU/u4P6LYAAl3L99WgB8E4ykio721Qss/ZEYf9riDsgyvR
	iJb2Rm3n+A6HOCKi9+cTdshofM6CJ80XFoYH5d9tUrUKhuS112Br431DiixeGNkIxx5RQEBhWGU
	VINlD3/1CqJjmKEkjRUmvarFIvLWmeq5jy5X/wVbKPePxT+DQsYryMKNflcXRFmD7EApRL5nsOm
	9O+AHuPxcX+0h2E9ppNx7Xez8loQA4/dqFK7HBphFWH9mgctGLuYjnApscFeFi6eDaGO6uBzeCM
	D87QLQTzyayFmjGb8qJmR8muiXVb2n0+4s53aZwL9IWzb/6XRXRUyjFS0UFP6e4dSe3hdY773j7
	0Hbnh/RP0cXSNrtnwV7bConNN2OZ+Rea9R4a7FbI4f2RB2bbHjWq8F1kxZnlIk5ztLEg==
X-Received: by 2002:a05:620a:4385:b0:93b:d7a2:83d7 with SMTP id af79cd13be357-93bdca24e18mr230312785a.70.1789723831379;
        Fri, 18 Sep 2026 02:30:31 -0700 (PDT)
X-Received: by 2002:a05:620a:4385:b0:93b:d7a2:83d7 with SMTP id af79cd13be357-93bdca24e18mr230308885a.70.1789723830923;
        Fri, 18 Sep 2026 02:30:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bbc6a06sm36747966b.53.2026.09.18.02.30.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 02:30:30 -0700 (PDT)
Message-ID: <6f1870b3-c01d-4434-a7e7-64c82cb8db41@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 11:30:29 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v6 0/4] firmware: arm_scmi: fix module auto-loading
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
 <20260915-origami-ibis-of-love-adaac1@sudeepholla>
Content-Language: en-US, nl
In-Reply-To: <20260915-origami-ibis-of-love-adaac1@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEzMSBTYWx0ZWRfXxfxtyfSOWHHY
 OxsMjrRPWAG2CkhsKuFKUNMGKtLWdHboQuD4Cn6sM6vxJlERDpeB8WcLHrjrXl6JSDAgFblINAR
 iYNgPZjxHaEDqLZHcjZxOwM7exPtxXqAGiRTcwrWXgjwLaob+hSAf4S5/lXQvc6NlBM+pLUVbrB
 cAxggpN1ovHt+hZctaj3u9aT7q3rBLnoA0VRUDbxNRRFQ6v+VbcPuhZTu+6m1XQz6PvEVVHLyWA
 11MVsYHT+RjuDcXb9mcnVRJ69Fp+lah+CtCQYv1j+pKZGXedY9baYtNvF0GEboWg0fQd/THN27t
 nn+L4xiGYMD1AGnOWC1vRAgfrcc18jfPwmnG8DEh4xA0DGthpMh1j+z6op33zYfNOsXDa140aV7
 C3oO1TPJU2KX1u2j9ZD31abwh9TfTm2WjUw1yjRrKNez3T7+gMIekuSma6qjPM+A83XjaOzrn/T
 Gi96EnCQOhBU80ZqS4Q==
X-Proofpoint-ORIG-GUID: WibqO9deS9rX4s6FskVwQIkAumlzWi3J
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEzMSBTYWx0ZWRfX59zBmrq1BiWp
 +MJXJnIXup2D3EBr503Y76u8yxwMRCXv8nOwCKMqOJ8NUk74SSOgrubM2owYLFg/qWMC/tk96AU
 Pd9mjFi5Fi2fc1rulHmdHUU7thMzLT8=
X-Authority-Analysis: v=2.4 cv=J9Q/fwnS c=1 sm=1 tr=0 ts=6aad04b8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=hAX5TG2nhHmSM0hg0PEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: WibqO9deS9rX4s6FskVwQIkAumlzWi3J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180131

Hi Sudeep,

On 15-Sep-26 16:24, Sudeep Holla wrote:
> On Fri, Sep 11, 2026 at 05:23:25PM +0200, Hans de Goede wrote:
>> Hi All,
>>
>> Here is v6 of the patch series fixing arm_scmi module autoloading this
>> combines:
>>
>> 1. Patch 1/4 from Bjorn to add support for scmi bus modaliases to modpost:
>> https://lore.kernel.org/all/20260618-scmi-modalias-v2-1-8c7547c1be21@oss.qualcomm.com/
>>
>> 2. 2 SCMI bus code bug-fixes.
>>
> 
> I had a bunch of SCMI bus/core driver fixes merged into v7.3, please
> rebase these changes on v7.3-rc2 or above and post.

Ack, I've just send out a v7 series which is based on v7.3-rc3.

Regards,

Hans


