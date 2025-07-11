Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC9327FB02
	for <imx@lists.linux.dev>; Fri, 11 Jul 2025 10:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752228061; cv=none; b=j/uvRglzML5rIRhz/vKiOIa1O4WTdSxJSKfa7HOrxUQzU2o1oV5nDDHTPVIJh69ui+yGsn/1xAJsjDOuHLS4XMM2R6EBaGxd2AsySZqg0aaaLd90FOCSEzXtYwk0p6XPcYRY0SUBvLBfXXBa/hCnb9ptlR/4CLsOzsEQNrypwwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752228061; c=relaxed/simple;
	bh=zWLtanhvCIpSQaF+swneQUeYFWPTh5F4obnY4lrF7m0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SVMqjXFUCY8mQa5EmiZCcSh2PwJNaLa8mkGhMgtGfHP+vaaK1QkEC4NXv6BxvMUVEeq3EH7JeH7d8mNH8PJQtfJmHnDBP3pTt2JTT5Ur0kyPk9RRb1S0E06NWpNuY4h55e3y2HR14ZoohJIbzpuSHsROJNpscH59ctC/RFDwPM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NgVA7m81; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NgVA7m81"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B1XJcN030508
	for <imx@lists.linux.dev>; Fri, 11 Jul 2025 10:00:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S8yPPRkJL/ZzeV4qZbIKYir/HwBPXfbbXpIoKWUgSDE=; b=NgVA7m81R1L9A0Ki
	QNp4kFDi3N8DvO3qx9RAcYjs1jtC9/B+avlbDc1rtVhy9F3stierm1OKhJXjyvGW
	YdJRQ9sJZI2dq1voO32H+V90S5DBNkGEzMB+xaAjR/XUQqiqXKUbmfFIb4pfvmVg
	addsweOBBLqrhC+UeeNjdbg6BndSLotgYWOKAXr9XGGsXN938CxJNVJZZLif9/67
	bTDai8X5rgEivv0G/Ddbk30UzPRe6GPhQK07mI7NvCLN/vavWRbSaFIQIrbwsqW6
	eGBhsOpspzm7+h66u4RlX5bUzXbU/874gi2Q1I2OiV3jDc5IUlMIMm7Q1MkP6jwn
	rNhUlw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smber78k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 11 Jul 2025 10:00:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7de3c682919so17712085a.2
        for <imx@lists.linux.dev>; Fri, 11 Jul 2025 03:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752228058; x=1752832858;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S8yPPRkJL/ZzeV4qZbIKYir/HwBPXfbbXpIoKWUgSDE=;
        b=ufOSpnUPojjhBhPj7k4UY3SpSGBYIckINXz4sW3eEtOfabZ4/9jSP35XSrs8EqNE92
         4QvPeYheV/b78Aw5ZB1lozrQ0+qMAnsdD5NMFaVtWCEVnu1SWJst74KLHX8V8pOT90H1
         DKxeV3EE96wwZtGeiTmnHk5C5GIsk7+T4hAEl/FSzaCS5t27SOIzc6LYlNRUTov2j5eM
         VKYUIXFsF82ShGj7GvUPhKHEXftEg9KVWo0iUPJsIhjCIwldsfcS1Wbe5fglaxf9E5YP
         GcszldhbtnMel7VBRgSZPw2iJGcof2gv8F0dWFxO+L8T3hKmTT+rStDEopsXm+/gwy80
         YHWg==
X-Forwarded-Encrypted: i=1; AJvYcCUW6YbXLZPkKUNGgNMJ8I7o3DUdejzLNisMzndeE/mj0fM5fKivFZ5PTZQ+g6aIzDIpxAA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzHlHUDKnfkEpcoQPbZbf2UKmHsyryBVgFjIsAkGJ6NPxm/pA8v
	yxfRc7Dxn4NWzf0O0uezc3HXIYzwrD01crycjkb8fLjVsznZeKpVWRWB3kUrwVOlCXnL7kMqy/3
	TvNuU+Jvgo4mgSwSzeOIQYL6W/+yulpKUD7VsJFdvU/6QTIHbOdWQ4Eo=
X-Gm-Gg: ASbGncuVOEvXXbk7UvsHOLiC4YGaAhSU8wMZB6aggUXXCfEKjScpTQ506U7Lu1Yc0st
	QXkHVCz/D89t55fJidjmx5YUVgFFku183diXZUF+CUcbSfssM9tPfIfeHxiU2mqcyChDPcTBJNZ
	vrF7XWQ7KK0u0RCWlKIroH2TSzG6Tul8HK7PpfAyylaJwgrC6Jx5uxjRAtMr4cnikS+wa5/YRyI
	cHs3raJdKabgQ2KN5bA87/qw6VItcN4G6wmM6TSkAMVbWNeaV9QvtBhF6Oc0SD6pahLsOQB00S2
	6LBU7pCYVDiphO35j8t1AU8Hcdi7z4LaWM+Pl+PfBhcDNFcUxU13QFOedoMHQXXwdOSeduRMPfQ
	t8BzxqUnlog3ePuHjwRw+
X-Received: by 2002:a05:620a:198d:b0:7d3:c69e:e3b with SMTP id af79cd13be357-7ddec077b97mr142428385a.12.1752228058074;
        Fri, 11 Jul 2025 03:00:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLY0/uyOhHuHX1X9pWT4ZRBIdqoYlueRYMn0zZIdfXxI0Ouch9sgLT86MrHZruF7j7b5jRXQ==
X-Received: by 2002:a05:620a:198d:b0:7d3:c69e:e3b with SMTP id af79cd13be357-7ddec077b97mr142425885a.12.1752228057424;
        Fri, 11 Jul 2025 03:00:57 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82645c3sm274825766b.99.2025.07.11.03.00.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 03:00:43 -0700 (PDT)
Message-ID: <ee4fb01e-4fc4-4082-be96-3be22e1769e3@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 12:00:37 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] drm/msm/hdmi_pll_8960: convert from round_rate() to
 determine_rate()
To: Brian Masney <bmasney@redhat.com>, Philipp Zabel
 <p.zabel@pengutronix.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Linus Walleij
 <linus.walleij@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai
 <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
 <20250710-drm-clk-round-rate-v1-4-601b9ea384c3@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250710-drm-clk-round-rate-v1-4-601b9ea384c3@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA3MCBTYWx0ZWRfX8F9uuxm3vwA5
 g52NJwIjjNcOUOYVa8BoSd5f7rmnc1qFzfSJNMJbl5/IubS17DHWbqCJDv1C0bMI7Cw6gM68+lV
 z4x1MyIGzOWdIvgeltU2jNMuhpqHCt3Y/SfdLW3myUTTtOR4WnN32D/5+rNzcxKiJyJ7QvR9cCD
 w+/5CaNn8d1ei+4AMeXwBhtH6EjzwhcZ0iZxiGwWmH3CnlzLLaVKN4KF3OHDJpAYGJde6NQx/PW
 Zo3yWmuVCz/FZXKKGpgCQStO3A3kPwDa1ljKszQo/DB8SnxJajizL5DsTUh5H/6MITFsOmDBmxd
 /5tFLIxoXkPo+lkKDZlE42tCIMmlmIqzW+ZZTN0a38he2mUlRrwQZVTdEjgPe0nQuOLMmgvo34E
 EzYkJUUjGtGI0GlaObwtvQo0H3R6GEXHxRgAHy1RjNnqvlkv7FPKNx7Gh6MPPwJJSslOW05B
X-Proofpoint-GUID: 5GolZ5ctJDq5xIe5gbURJVgLINRqY40F
X-Proofpoint-ORIG-GUID: 5GolZ5ctJDq5xIe5gbURJVgLINRqY40F
X-Authority-Analysis: v=2.4 cv=VpQjA/2n c=1 sm=1 tr=0 ts=6870e0db cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=Lh8LEGs6nEvmLzq652MA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 phishscore=0 mlxlogscore=765 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507110070

On 7/10/25 7:43 PM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
