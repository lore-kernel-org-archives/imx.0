Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BAB36C0DC
	for <imx@lists.linux.dev>; Fri,  3 Apr 2026 08:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775204154; cv=none; b=bkEeDvq2UrMG7P7ENIDIsbqxgc7ned35Q9BtiUbM00BHGgJycl5IhVLS+OhBasPa4ekfBxUeuqxPuD7y8qbnz98dOPXPeb0uV4nbT+lxU7iE2lAcNDpD+PFFqio4+K7cNZ6zrF44KHpQ4+T0MfDVR5573uqx0+5bzrqg9UIrzkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775204154; c=relaxed/simple;
	bh=Jbv6zoiP8qkzdSmUDK3AcT6SXXca47q5+ShRp3rjXKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DMkRVBj2AZ+Z+A1yYM4mhn98tqMC0NA+P9sUR6BE5H0Rp82M4WNjwfzoVnkqLivQHoRGttQFbu0uJCAtzQ6Mg17/3AfbrWFXcIqWVFSOdDq4yuHX31NKKvsSskW15XquckcX/bcdiavbA0b/4fBoBVA0wIE6HY5Rl6vXlmpQhSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jV+Sh1J5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X0SCqZao; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jV+Sh1J5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X0SCqZao"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6332b6Ng3804954
	for <imx@lists.linux.dev>; Fri, 3 Apr 2026 08:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YzGrFMu0BZf7JWMQGc9EJ82fJmsL7R6Vwii0vN67WpQ=; b=jV+Sh1J5V0kVjKbT
	yl+VjsHGdM3iW23UMkuNtWD1yzDBgR9h5dMCk+68AqKf4d6gLQjB4qgBNnOa0Pv5
	KTcrHI3sQjR7k7Dvvvj7HphMFqZNhcQFIPdv10BbRkPEM+JV67X0icCo/JL4kaEL
	ct/Jmm21rl+CdDMyhUNPJJGP4X22OVRYGUTRbc8tbru8Z8ykX6ykbWkTq19rLvGo
	HGCiiPU3vZsAcNcXaNz23JUJQgq1qRPYc8C2LB/uNoAY9XklN6FvDLJ3uYz8sMIl
	I+rJss0ekrGgBx84O33KJcfgT6DGMDkoScKIAdfxBGrlIYrGkmKfY7klql47GIlv
	W8ZGqQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9r0u3nm3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 03 Apr 2026 08:15:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b6f869676so38879211cf.2
        for <imx@lists.linux.dev>; Fri, 03 Apr 2026 01:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775204151; x=1775808951; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YzGrFMu0BZf7JWMQGc9EJ82fJmsL7R6Vwii0vN67WpQ=;
        b=X0SCqZaoRdmeZw78KQKlzxq6bvv3+KsNSoq34lwa6t+pt0C2p6rgYJ+7GDq4mFbVBo
         sSlCHqVEfWIOFPog8CqOVpyQndp5bIDgjhJN50XbQs4u4h4REMcMkMm85qOGrdgPK9SM
         uQ1W2eX+r+A/6vdRKxF2ooxGzWcBgMoOxOyHqAuSgW9jHUrt/xEty+ID6VtA3eCXazrK
         llJXaoOcmv7ZtrlvYUMwWSretDYebR/dXc14jmC8cMMuXAoWeyDn6KNdopuNtzkXpoyh
         P9q4FftpErb8UutFVBDc5wcxGES6K3VG2hcYLeKBTeHUMk1pwKe6vZuJiKtwkR7rvswq
         E+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775204151; x=1775808951;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YzGrFMu0BZf7JWMQGc9EJ82fJmsL7R6Vwii0vN67WpQ=;
        b=UiS+LcIG8GLNY8Hz/YPYRcb+RFjMUM1gUNVKC/dwI+sCMdti9yks72E4bHj25Gdaio
         rvv4amhpSu/gTbAZye2cDvh+YZvseyti7LHBChAppqcsA0wGbgy2uOrMkwUCU6ekvRh1
         zDA0JYNQlawwJmkEDTPu2DU+0r0yYCxz+uHrWzsPsUqKMHBOiKewE4gOgThOBC/BT4XL
         r3TiBVRreKjo5g+1vIY36Qh/4sCVTvA+c7iLwtKs9MpslqRrImDgCjJsugUyAJTAMjdb
         lXwr4PjCQzKKHbcgiZRi7E6eAtx2poe6I1H2RkhjGyz0PDz2aD5wYObUNg3KufzPCe0r
         isOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEvlvADtuxkO/CQmdKqoJEDPXDtxliHBU76n+LYPcW7qwbSLHBxa2l2qofCq0LAbTrrpY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxDWBwx0ceOGggjynKwkR4fu7b6XnvDgMnDRFez/quV8J3xfcZb
	5d//JIsFvzypIy5ltQcIzPWlf8PXaxfv3Wo/TIqvWPFRIqcIjQSQDJhG90T3AQfVfXbvwY4sJ5y
	ttjRr8n+7b/CHcunQzvTB5OCxa569QcglQ6tlA3mne55+Nf6DVm1muSE=
X-Gm-Gg: ATEYQzwzVDinZUzwYh7hTE8bdC8xuuX3pvbBJ76tdB3jHsvSOKwItWEzky0o/AkZkVx
	CKef+58ZDcCQLtO17h1sDXw0Bx0EXbxkAHFrE4lOcr9TIjTSJ+wi3zFcjhKnTzABVJIXb/V65ng
	JeiWhLdePVyYiIzefk+Xfy7Cf5jhnUZfWEE2SyJYXLX/VQK0ltEEVx4atYtt/drwnD20GVtSeWK
	LkZamngcu/6CxuV2Gmszdsv1umtmQAFH92p4+SNujt2aucynj3TbzrbVxcQkPMr+J9krQ7n1c2E
	1DCxywLmMbgVsYwcj2/z6QrdgZjIKOy96iLddjHnZYJx+1h0etk38Nlhu/ll6RnDQa1wMapOuHE
	38AvFbh0FZEFnVMM97uFuIcb1ChL57UgC2rOIBKOgLr4FYDn3a+oHroOGqPWcosjZUg0f5c2xYr
	Tjoe6Gb7H2
X-Received: by 2002:a05:622a:6a90:b0:50b:26b4:7501 with SMTP id d75a77b69052e-50d62614c49mr24019481cf.7.1775204151475;
        Fri, 03 Apr 2026 01:15:51 -0700 (PDT)
X-Received: by 2002:a05:622a:6a90:b0:50b:26b4:7501 with SMTP id d75a77b69052e-50d62614c49mr24019241cf.7.1775204151088;
        Fri, 03 Apr 2026 01:15:51 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e832585sm468214155e9.6.2026.04.03.01.15.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 01:15:50 -0700 (PDT)
Message-ID: <77a77b79-a489-41a8-98c0-00242cbdf24f@oss.qualcomm.com>
Date: Fri, 3 Apr 2026 10:15:49 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] dt-bindings: timer: fsl,imxgpt: add compatible string
 fsl,imx25-epit
To: Frank Li <Frank.li@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "open list:CLOCKSOURCE, CLOCKEVENT DRIVERS" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
        "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
References: <20260211214947.3705328-1-Frank.Li@nxp.com>
 <aaiIdS0zRPBY81aE@mai.linaro.org>
 <ac9ztfwZMrZZgTeP@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <ac9ztfwZMrZZgTeP@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA3MiBTYWx0ZWRfX5GvqQPiCy/fA
 CMmUj9Eg69i4ftWkfu4SncU14W49G/hckoBjCPxOWHBiGFgi1hk06fh9FPLSJmj5f8Iwy0BBp3O
 JqvkD+KgUr9jttFIEfAL+ZKDop/8UoQkxTFRyEsa7pVysyPakgcwDn1qNGtaakf8cAqRTNMiHsq
 YRhFgQgSiIYfzYOptbxwbYFtDK/wPhMYbUX7ZhkyShkxqYACuZuHqQnoJWmrF2JGdPgltr+DnZz
 PFH6pgC9jzRXvA8OHVz5dM1+779ZbodyCgzoNIeDb/qAvxwpLlp+JGMrz27/jv7dIbJXV3tgY2f
 1mJeN7vJyDz4K0ZOVTCOAeoFQwMz6uj+YCTVREbABBGmYnPlu1O8g+6FMyA3SOBNiavI0nOO/EE
 9MniNK6GN5VRQNpegHQwMWxYE42052mmQGPEEPzlw1gOT3JL6yrVe4CyX1+TBkozuPfw3eMvsgp
 N5aIYftQJQnrYI5DRNQ==
X-Authority-Analysis: v=2.4 cv=D5xK6/Rj c=1 sm=1 tr=0 ts=69cf7738 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=8AirrxEcAAAA:8
 a=hZvao0TmnZhtY6t4GmUA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: 5WsFVyQiRctY7uJWfNoemm_4kUA2Oj9P
X-Proofpoint-ORIG-GUID: 5WsFVyQiRctY7uJWfNoemm_4kUA2Oj9P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030072

On 4/3/26 10:00, Frank Li wrote:
> On Wed, Mar 04, 2026 at 08:31:01PM +0100, Daniel Lezcano wrote:
>> On Wed, Feb 11, 2026 at 04:49:47PM -0500, Frank Li wrote:
>>> Add compatible string fsl,imx25-epit to fix below CHECK_DTBS warnings:
>>> arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dtb: /soc/bus@53f00000/timer@53f94000: failed to match any schema with compatible: ['fsl,imx25-epit']
>>>
>>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>>
>> Applied, thanks
> Daniel Lezcano:
> 
> Can't find it at linux-next master branch, anything wrong!

The patch is in timer/next but may be linux-next disabled my branch



