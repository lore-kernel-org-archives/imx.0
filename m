Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC781F09AD
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 09:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723601; cv=none; b=KEKKOcYWHL6sA69LYulJqUFZKgoj5C8k9mlQQLcyjuNL+L2WI8HG1gfc848W74tyKja2e+m5yI7ZpVJXhNF3cai7R+iEKdau1I2POMG+Gfg7o/DPHIHGbory/YTrImWBJexCNhvsJrKn4GkwqnMLxAArMayIKtLioO+Mf4Uc1mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723601; c=relaxed/simple;
	bh=gIL6hDWa60lnccTvkEgMeuR8E1aTzwkmdxPpMKIZ8xQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=FAkSnrEBdJYmaDBou/hrQvH4RV7hu/08vdjywjbBh814PgBREKbby1dSu8eY7hsX3xVWKudCIWHnU5x5l1QwN/3GUHjtP09VQ7uyJrmSnnjV6N/AYIzOoapAitPMyLYJ0z+/+6v4nikqUBXVNgXd7QQMi4R9zz7JUD51U00B+cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KTdV6ECt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b+hR4yg1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KTdV6ECt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b+hR4yg1"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I5xwI13834617
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 09:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OCfArd1fgKC44I5JZ5GUogTe93k25uI8hDyLvcW7e3U=; b=KTdV6ECtGkqjFMIM
	WXoXqJ/mkAnnVOVsr77WygbTheTO6/QOhdENm1trWkudebiTEuMbDGp9MKdVk7qR
	2gJ1jcv/8/zxAYi3iakUmPWQlKid00VAFCYbaKCg4worn0wrOnk5s1eQ56xSWnhi
	HU1i99bJU0CBq8RNI6P5SVxtfkIPEWVhhHIlq7EiozcJKp3ko08ChTNG8/Jgu262
	/29CrT8U3Kq+Za1iFZkgGqUnN4YoNLd4ggMe8SC3YgbdPz6eLV5IjMqpLnvaxT5g
	vYCMVFtkp2nJHTNIcXz90ayR1h8Lp8NIp5aWQscHW2zLCRSO1iEKlo4L4gxGUv4r
	k+OOiw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gry2bry66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 09:26:38 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91242b356cbso7343146d6.1
        for <imx@lists.linux.dev>; Fri, 18 Sep 2026 02:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789723598; x=1790328398; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OCfArd1fgKC44I5JZ5GUogTe93k25uI8hDyLvcW7e3U=;
        b=b+hR4yg1cuTGcm4wIk6UfYTiKGwlK5HNdSqX7CGW+AWNe15GOQnRqaQKfxsGhSMhob
         q0A9ECTcW87aLUk9VUOt5oc6NaBO0uWgFsgybehsP4QI2sfvvQczMnkl88ZVIzRNws2Y
         6LBwKgTKhbvwfxWqK19lzRSxmOPvQfDXGSTHG7RApoOnPEHqxQxV83rhdRcW47Q+3Oa/
         MoenK4OJzpSHjZPoDS9MUynJscbGQfkj3PUqJIOdUSGgDQfVXtoMvjBIkACDWzzoidfu
         KZQQYguVr/1N0nw8vEZqgY0N38geIERMxFfRI2UrJ+UOSDcJaXFyYbfddpMeJxBGDsxR
         dECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723598; x=1790328398;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OCfArd1fgKC44I5JZ5GUogTe93k25uI8hDyLvcW7e3U=;
        b=BvgjQ7f8DKvf2O/6tp10Ttp06hn9EigxroddLVRi/PrS6EQatEga64Tcn5s4696EY6
         LsEV9Hnkhpg4tzwFaoFdvD/y8nliOEYoGiXptACQguCNVA+wpixa0T0dfYK9NpfnBmC+
         MW2SfbXj/QzH3z1yUfcgR3VBRs+JQrKYoZFks3eLL1ttiG4IJmbkJTydrL+ki9zsjajQ
         kf/M7M9uKNeIVNyOkCtChjmrwxMr6EokxH/XCOm/mOEl5sOpBVpQQ8OKLnMUtLEX2yTS
         PQ0w0GRq9/lPkbi6QgTfULtZqBdAWZH9VN3519tndjGCyn1BfzTdHFdZUUpl3jG8E8z9
         QCFQ==
X-Forwarded-Encrypted: i=1; AKwUvBysIXsurLCzh0drLlqzC9x+VvhWj0rjsuv9Dokb2jTWO3YkWrz8g+1K5lXoLc1c0sqc5to=@lists.linux.dev
X-Gm-Message-State: AFuF++mBUyHaIS0LPtpIGulL34tRk312tydHPAq2q0P7DEZ9jjtEn85C
	k94KGRSeQldsPMuOnvDY3mFbjR09yS2Ty1EiqxKRAH1gBVyQsiHZRBAEKBTm0sUx23joLd52UTk
	uYt+t4x0Q2qQHDiY9YtAUCYXnvDRSmHK/rOe9i9+AkKA3JvIC7hJUA+U=
X-Gm-Gg: AYBFou27AWTgpYQ9kLKMmq0Xmq1HeQiT6KS9laMLEz6uVD1q1JuupoMOPtNLBGMNwMC
	yLbiAx1Rg4z4SO2EY/FRtPIoL4QgKANDWPMvpeo3uS/V5GPkbrOz2hkpUcYibdIL9XZpmxI02q7
	KxkB8PayE7xYN/Ohr4T3e05HVN9KGoX4SMuLcSN5fQnAESs+7SJS9+e3wJXhSB0r8MI34UgSeLO
	u5bt93vFBzoGtJzkG6L662zsc0ds7luFcml+rAVjH0NkXCpnOYJ6mVxesjqjqL/cvcVrLIdX+96
	ZgDL3M6CXHujhH07pwqzrPF7aOD+0xZWPyDIsKyZ9eriqrItoCUAIDEoVZtPpUbbOiAI/rxgTd0
	2q5KtHJF2Bw7w3dkgc8oVJgDathxV1OhCk9OdNyRBcdk50g9/MrIM6WgoXOYenAG9KaMd244LE+
	k+NbWJAnBJeegFJx5Sw/BAzVMN+1Sj3PoqNV7RR++nJf1nXf/ymG1n14AbFMTQo6zrRTM=
X-Received: by 2002:a05:620a:29c5:b0:93b:d7b4:bbf with SMTP id af79cd13be357-93bdca5ed54mr202484085a.76.1789723598308;
        Fri, 18 Sep 2026 02:26:38 -0700 (PDT)
X-Received: by 2002:a05:620a:29c5:b0:93b:d7b4:bbf with SMTP id af79cd13be357-93bdca5ed54mr202480685a.76.1789723597628;
        Fri, 18 Sep 2026 02:26:37 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bb0715esm35946966b.20.2026.09.18.02.26.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 02:26:36 -0700 (PDT)
Message-ID: <6d103565-42aa-4f02-91b8-bc7598830c8c@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 11:26:36 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v6 3/4] firmware: arm_scmi: Fix
 scmi_protocol_device_unrequest() race
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
 <20260911152329.5822-4-johannes.goede@oss.qualcomm.com>
 <20260915-messy-imposing-frog-ea9338@sudeepholla>
Content-Language: en-US, nl
In-Reply-To: <20260915-messy-imposing-frog-ea9338@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEzMCBTYWx0ZWRfX7uHEi2UK/L+9
 RodDOuxKzu2sYZu2b2zui8BYBLTOodHPH+rqSeHgZuXovFJlXcx8Sa4q2kpwakOSqcmBwC9KB5d
 NAmpb9OsRH03XW0qxwa9liKWjM3g/3amh7LqauKzQZkHq5kmU9hm1u+7ntmaVQ8Th0OyNSDLSia
 mhEIVkkHr/DrlhSA6g12oFEig9jyqwYclraewvAx3/yeWJ2HDQm8Crr7ghHLMYfifgovRTPLudX
 gkqPb1PIBD3eisJRtFP34T6dbbb26phFoc3Hf4FhpyMfVI3+/BeABiOJg23gUT/LJeN2J3xLq9o
 VDREaHY+QgoEehR3gVxLgreZuTDhS105eVb2c94NpwQnZWBM8EHwyk8M2ryAOMtlISsBKdbIeRv
 4gMrKCzmV8fqEwUwMwW+VBbnyvZFTFaU1s1ZgSYea6Grh2Ts4UgrNolY97qfu3Zi2+bbmrYW7w9
 jNfeGlOdkIHwhuV66Ig==
X-Proofpoint-GUID: mDt5hnoulITz9anMPHsZE2kmwZ_-OfJB
X-Authority-Analysis: v=2.4 cv=bYP+w+PB c=1 sm=1 tr=0 ts=6aad03ce cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=U7ZbcBUnRWPs88qqOtMA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEzMCBTYWx0ZWRfX1gtPRGG7HjZJ
 9pn7kY2YXHTzg+xR3YkFBmAyGLGpfrjkrJAILbDoOLtMK/ZrWVmMxlvf/zq4FFqS+HN3OaGG2Vu
 7MnVmZGw/7sAsyDfpB/WVS94w9Qh2Zs=
X-Proofpoint-ORIG-GUID: mDt5hnoulITz9anMPHsZE2kmwZ_-OfJB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180130

Hi,

On 15-Sep-26 16:21, Sudeep Holla wrote:
> On Fri, Sep 11, 2026 at 05:23:28PM +0200, Hans de Goede wrote:
>> scmi_protocol_device_unrequest() unlocks scmi_requested_devices_mtx during
>> the notifier call. During this window phead might have been deleted by
>> another racing scmi_protocol_device_unrequest().
>>
>> Re-acquire phead before cleaning it up to avoid this potential double
>> free problem.
>>
> 
> Does the below address this issue already ?
> Commit 2c4097e6c4ae ("firmware: arm_scmi: Fix requested device removal race")

Yes, the v6 series was based on v7.2 which did not have this yet.

I'll drop this for the upcoming v7.

Regards,

Hans


