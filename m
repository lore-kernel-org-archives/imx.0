Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E703924E4B4
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 17:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772819376; cv=none; b=qxST4msMXYrtUXEV3Iwu1iC+x4FWOeWR/8VJ1mBssfDeq1b4Jwy4zHMU/C1CitO2sdi0ES8g6iI4avmKen5+L0/OLBNU/MQ+d2xOp8h1b25xyWSLio/0QnIQKxxm72g2SwGmsxm5zRayKHycv8nR6bQroXEZvtjVN21s/ha/g4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772819376; c=relaxed/simple;
	bh=StylOHeG4dKwtNO9a8/Wkfg+2eT+mXV3C4MSFPvNgd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YEvGU0vedw9APnkr3QUUzI0GgCHJb64CqX40YDE9DeQpj1Tc5atGjJq+UXP7x+f4FVUKrhC1njkCnJ6gU+1r1Msrh8s6tHgBHd0CThTRsHHE+u+V6yeBvdgjBJAVE/RTMlWmPpxK07CxXGC1qLMq21IuFz0h3/A3GleboW/1O98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eYp/qJk7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iT7X53dV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eYp/qJk7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iT7X53dV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626H1XMe1580444
	for <imx@lists.linux.dev>; Fri, 6 Mar 2026 17:49:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M7FsIvsL0LpSvN0/enWDcs5+VQLiU32R2Q3/L52hdmM=; b=eYp/qJk7w729bT++
	uPCybevD3QWI12anZfouOBmgDHoGm/IXoAh+OE4HkFS2eV93mRdZruxQkHlsf1+3
	mxjPZHZ7pa14fW9c5qRQT7cKLmwdQUkvz2DSSx9LtZ8FDP/OSHk/oRgNalz7Kewo
	mJQi4WAGuRvVHt/komoZZ8Ivo29dZkjaN8bJ8M2KdqzXFkvroqzFumIfxhDO3DJr
	jlFX8Y40uLCZdfx/AdBJNTMA61YubfmQoqcsh6w3u5/AK0wW0/MneARu3w5FDh8N
	GOQZjnfyTXlng0qTOT37bHhZf6+pBKAFmBwsKgcsTcZvX6yrcPCgLPsBgrhMLJs7
	2/SBOQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqrf5tg6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 06 Mar 2026 17:49:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb37db8b79so6817192885a.3
        for <imx@lists.linux.dev>; Fri, 06 Mar 2026 09:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772819373; x=1773424173; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M7FsIvsL0LpSvN0/enWDcs5+VQLiU32R2Q3/L52hdmM=;
        b=iT7X53dVwp8W1zTjqcg+3sdbyezBZi7kKm742JPCpYfQhro+87bNtvG3ewCU+q3/rU
         0Rigm6aeerQHxUHw77eaM5qoy5OCUCTeTdpCJ9wMks0zrFQ3eNtMsy5J79+wuravjAna
         kMzHYoartgdnv6wDrHPCrDEr/tgaaYvSP+TwirMxnVPeucmsozVrhKlCDfgwmVq4k+Z+
         Jg4DeLBXgWtIZkPj7kxTvcHHw4pvCm0HpKwXz7FZA5xC6LfZmzXus89FV3xG2RNOeJl8
         BIoY1ZeQcoFokezuXb1SfjvmrACH/J0CQeOW4k6MtcHiDDhlHg+f8RJZu1nGjTE6/pJJ
         /mPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772819373; x=1773424173;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M7FsIvsL0LpSvN0/enWDcs5+VQLiU32R2Q3/L52hdmM=;
        b=rD7LeZ1eHfw2S/dkLY1f2MZDvVH8zC35TIpHRx44pyk5gctE0LTrxLKoCp+vTE+26U
         Y0vepxDlsSkF34VQco+9ug9CdQxk0zaG/z2qpDwuOe1W6nCQIoCaSM/oW3l7LGIW3cvw
         spTdbInlsWC5H2myBlLm9+KvKl/30nWoEUftQjx4VX9RyK2L5bK0i/1gaU1de/ulnN2R
         hSVn8ihcJLg/wRHELfqlUZ/5leUNT0pamxYhauAr8xBeX22PCh7BHF8W32iwfk0sIg2e
         GeZZbQVN464OEwuo+spiqEnv/DmaNa9/Sc3fldmdwyP2Rh6nlS1YOy2wi0yBvakGCaow
         D+FA==
X-Forwarded-Encrypted: i=1; AJvYcCVHXVhta3mqCTPQmFntT7QpNSps6DxEPJZ8h89MzZBooyWAkIylKYg1VS08nuXfk9KmpCs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxhVZXOzJt46Taykc58qEJKYv/+X0U4UQWuZLHte9MYZVaoT9Ge
	teiEuUDVzhnmPCEMFIkuYl+cN2vYczMGkQO2DxZNkdf/TtMnGNSM1rqylkA378j/yOWfMBt3ttN
	wMpi9Ezlz0FZU18BAdLoCYVSiZuQb19SJlXJp3rLQ8uulG8FrfpEvPZM=
X-Gm-Gg: ATEYQzwcUqBiuo8iS+D9cz+7nx22zGGuvS/Xt2FsHq23XkNCRbXsEECJ5x+kJMfr2wD
	defFpj1MQh570lm1y6f1Z9pEZeWvlVWN9quiODkyIhX+d0dPa/uMg8gq0aegLp+czui1tRFYpo8
	yuaEQdw3acytD5i+y2SZ6tfG6YDadiwOov7LuQHDO2lQ6IYWWrTZMKpdTn0UCyRw2xOF1CLwb2H
	x2o53LAhcpeuqAfvr1xvyBNwA0pDC57ZwZ520m626Q/4JqbP65qDBqu6cvHG8b0jsFwWSXS1Vbu
	ASL0SJtC+2+MahKFu68drjJgz1izD1MGzPpWx9cZiBDPzkJ1aKSryPbKwT/NdA+S7W45htfrkYy
	rTIoy/hubhqwDV5WWTdbvv69Zj/UOIXi2DWuQFTKN30W//usDCJY4JstgHADNDfjQI9gsMw==
X-Received: by 2002:a05:620a:7017:b0:8c6:af59:5e28 with SMTP id af79cd13be357-8cd6d411a4fmr397982685a.22.1772819373288;
        Fri, 06 Mar 2026 09:49:33 -0800 (PST)
X-Received: by 2002:a05:620a:7017:b0:8c6:af59:5e28 with SMTP id af79cd13be357-8cd6d411a4fmr397979185a.22.1772819372861;
        Fri, 06 Mar 2026 09:49:32 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:1265:158c:17d1:c76e? ([2a05:6e02:1041:c10:1265:158c:17d1:c76e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485276b0c38sm55370445e9.9.2026.03.06.09.49.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 09:49:31 -0800 (PST)
Message-ID: <a32c708f-b1f8-4928-9612-9b0d0e6c8d99@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 18:49:31 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] thermal/drivers/imx91: Add hwmon support
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260306133017.3189979-1-alexander.stein@ew.tq-group.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260306133017.3189979-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: X7xK6kPdKIKuF_BVpP_Ui98LvxlRbPNX
X-Proofpoint-GUID: X7xK6kPdKIKuF_BVpP_Ui98LvxlRbPNX
X-Authority-Analysis: v=2.4 cv=L+oQguT8 c=1 sm=1 tr=0 ts=69ab13ad cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=8f9FM25-AAAA:8
 a=65OyoGoUx_vi4H7YfAoA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=uSNRK0Bqq4PXrUp6LDpb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE2OCBTYWx0ZWRfX506O2hz3woP6
 JoNSyucifzX7Wv/ypvbceG/1KI/t4iXNgj4Shz7M6wrZs1sWiwR3HOyRbcyS57TfP3npFtpOzaS
 KjGD+DSSMPk0RHhnzmJKvRrk3uUp55b9lqTJUolbGTEelc0GWwOAqFGib/C3xTlnOqjCM84BbKH
 u8TuOROxpL2OQaBx5urNvqmO2XodHMWxZ9I6UwYVq5NLc3tR6UJN2dM4ezt1kzJYQOzk5qBrnkh
 zRYiS2cd4oNx7eQGE0PmG65LhQHdsiSHx7/zXweVWZ95G95X7u/k+u070O0LDwXT9FvpIUTagtz
 s+lqfLvBuyDpHtC7yQc0yECS1wyZzGwHn721aVRoaGtrFxeE479KncG9NbCfk9AXiLgdm4K6mgW
 n+8Y83wU1OdIjbREHXtYRwdtFGrHSApDya9UYbLS92XSJfux40iz37HWV1wNHOPg7x312tUwiqR
 RZAKXsKJmg/QzhfYdXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060168

On 3/6/26 14:30, Alexander Stein wrote:
> Expose thermal readings as a HWMON device, so that it could be
> accessed using lm-sensors.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---

Applied, thanks
