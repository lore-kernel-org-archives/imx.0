Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA11554088
	for <imx@lists.linux.dev>; Tue, 22 Sep 2026 15:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092293; cv=none; b=GO4BYvQ/XaMaSoTwtOcZbc0oybptUbnV/hjvC9pAgDfXqvM5sr8WWagtJA9sIaQz/YB7XgjQ14tbZocNibI3WBCsiBZUshLlvfRUNAqfMyTnXinXP9LNq/SbA5gN/qFEKYzYYWj96d6JZnddsos/Tgp4o/WWNc4lQU9buaPp+Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092293; c=relaxed/simple;
	bh=CoyYTnZ8DJVM5eZTTyQQ88Q1PAuHVEJ7jE5IuXsp32A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A/KcUCVPG5gJkJBcffUP+YuCkf8TnT1tb++NLZHpLsIIKvA1Dw8XniRXoVo+R/0lQP3+7W6ChW2DmjoonGJHSMfNMukzK6UMcvSz0wuYXrN2afWbXvxObLj+kmdE6XxHYotAhBEjHE9bEjv6ui3Kk2CtL1iSFOM79ohxhQGH61Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VSgbiMZD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ulyd38MW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VSgbiMZD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ulyd38MW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjNGB3307568
	for <imx@lists.linux.dev>; Tue, 22 Sep 2026 15:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RnmPg50OEmv8rP96wxGaZ+xgbjo5u5huRl5f5KiIQ8I=; b=VSgbiMZDKXRJDmXc
	D4ULXJkDgfpS3i3YddwY4p1jbbc6884X4j2GHj7YPBxODjIiBJrn0cu+L4EiyN/f
	GIlqcZ1IOHG3KehVShBsBcnpTdfpvutqtWmajzgDYxMn/OwH97ROdZOaK1h2ZaFd
	UiX0PAPLu+ukh0Z8hwWvBZ0D/ms1BZkqXkxWmZiwMCso0HPEeumig+E/u+WHAIXb
	le0dz3LH44A65XNnt1HTosj/HvyG5JuHZ32SYtCem5V8H5RD43FX4ivkDFL3mG4z
	XnjvJ4GxGPoYjj9R7mhctNT54NsTfJ7+QAiO5jDyqAxiTrDJPIhZ57CdWQbn0tkA
	wSWeFQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guj112yc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 22 Sep 2026 15:51:30 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78fcc331099so150748137.0
        for <imx@lists.linux.dev>; Tue, 22 Sep 2026 08:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790092289; x=1790697089; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RnmPg50OEmv8rP96wxGaZ+xgbjo5u5huRl5f5KiIQ8I=;
        b=Ulyd38MW92LfGih4aIRNPrfieorXZn8+CNhmiHrogw2LboQ+rXfQuCRpetUNa9kVnK
         GpSfWP7b7mbEcsHqRUzr2E/1AfxZA0VizPHqzyUFQmqel6Llead9wkb1fbfbRIf0McY1
         BildDNLe3VTChaIQ0950C9y0aLnpLMwQ/GxOgzQHlXxzbXKKppgIQTwTkr5O9U0uvBvH
         0V/xTnmuwu2s57DjA48PR3eYmQTbX+6yT7msUNMbLtWiJHi2o7CwNGWrb+9hhz87XW1J
         GYi85eemjtwuGcnJ2ttO4lcqUBQR/8sv3tfZQ1w4jv5KURs3EWKGjdPT/FnFMyCLDx0a
         7VmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092289; x=1790697089;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RnmPg50OEmv8rP96wxGaZ+xgbjo5u5huRl5f5KiIQ8I=;
        b=JKmAPA4C4BzlropfZeHWBiqUuq7YdtTFx9GFk801UETHIMnMMUc3v2Zdhbuhs/9Ce1
         hpIQFfC0CU1wcI/K8ITHoKlPCwKFy+coymAY2GM/eg5h8jcVwkPzDSvvAb4BqYckCcOr
         /ZrXNzmF556DworA2DQ2Bdwv10cHivsSyfBEpQb96gM+7H8zSIISGc1WzAUIQzDmvBoM
         plv++YSwA71aVH5lCWgDykUt8MWbeIMA5UxYibm09cSK5yK3paiu7z0FgXlApD0ZWXrZ
         laaMKG/+bijVuxujSTc7Vhn62Q0gbCquCXVai0JKktV0YpbITisRn81PfHG8YWGw8kZD
         LFzA==
X-Forwarded-Encrypted: i=1; AKwUvByMBrAhGbM2TJdtTx0IfaGTM9HGWqBUGU3/7xT787ZuXXsWDQ7xEzgqUxGXrzSn/Xo0hFk=@lists.linux.dev
X-Gm-Message-State: AFuF++ktNSYGRyN/u0UVlI86l3ma34+NbFoc7sE1zHD1g4ozL+ACEtWS
	AiarGWF5FMLhOrN5XInUn39z0vqJV3jEVohaDl7kNRHh/JAsT954iAEdd/QC56m9JuNIcTZ5N5C
	eTsMnkGTHjRwT8ckgvL4+my1h5FveRmbsnT05LkbXCU9DVTo5KhLl3nI=
X-Gm-Gg: AYBFou2nG2MbKgyRdmVD6OnL4+4HTY6t9CVtNX1MPDTcjR41T3WA2Z0gek708lxjnjs
	ADnemiooLxMxBK4wi41Ye8V51/1RCADBZo7qw5SECnWRhb729jkNXCXvGGK5yna+YG2SEsjBHVS
	X6fXAeZAPKH9dy+jcPk4J3fJUChSOQbk+44XWAa98DVSuRgQqnH4pq+BFoh9OwmgwAua8rwYELN
	/ffJ1EIbzD70O6Ir4qaB+c1lZOPvqAEhkp99LF15cyUt/Ph3o5fsu1MXXk9wyY987P9EXC3UXYw
	YVgplaORl8idIFibnOtxIWj0njrsSr04R+OqFZEJM4c4ww0lr0bolGKOYvSWKBh+emUw6y0+VV0
	cUoJhh8ThDoGISFSP93coSA==
X-Received: by 2002:a05:6102:b0f:b0:791:33c:9d1 with SMTP id ada2fe7eead31-7a59d45b711mr8581231137.1.1790092289153;
        Tue, 22 Sep 2026 08:51:29 -0700 (PDT)
X-Received: by 2002:a05:6102:b0f:b0:791:33c:9d1 with SMTP id ada2fe7eead31-7a59d45b711mr8581185137.1.1790092288703;
        Tue, 22 Sep 2026 08:51:28 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c2a6336sm113065666b.0.2026.09.22.08.51.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 08:51:27 -0700 (PDT)
Message-ID: <27810459-c127-4b85-abcd-43d8f1e25c15@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 17:51:23 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/5] arm64: dts: qcom: shikra: Add CAMSS node for
 Shikra
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
 <20260917-shikra-camss-review-v8-1-9b9596221cfa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-shikra-camss-review-v8-1-9b9596221cfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: H2YZCLtcS1ujPZIJUWWEjvFu5XBPeDSN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIzMSBTYWx0ZWRfX5i0cbeDW8aqB
 q1maGYL3zteA6FvS/tPS46ZQ/bGoIml0IXGiK2nqLZSuaxtv0l/z2WVjNsXAcTVCMj3AFqqAg9v
 LuBL8f8T6BjASfq7ubrCzI4aQ5W7DWU=
X-Proofpoint-ORIG-GUID: H2YZCLtcS1ujPZIJUWWEjvFu5XBPeDSN
X-Authority-Analysis: v=2.4 cv=atQnmiZV c=1 sm=1 tr=0 ts=6ab2a402 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=XE-wypd_VeY0GsksmEIA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIzMSBTYWx0ZWRfX893FUcz2rduK
 bLH805PD5v8nh7ab05QzmlSjiTY/sf4/Z5mFaI45L50TtsAWAQopywD9zLJhytBIWluMNcmn4iD
 sAgm8fDLxXrWj5lLhq4ll4RYg97jryCCBCDuXMqcq19H+HmT8t3p+v75+QXu+4w+RtWhizkMqYB
 cipfOozta2iOT2oN6UKfEjRZEdSp1qAoi8DlZ4lQTX86cw3FTfzHW6j1RZWIII2fesYW4Ys1A9h
 B7h6he++oMbURI9K927HjyrpRYMWh263B0C6MVdywW/SfbnHzcJgzs7jK7DcHz0cXmYwnVuDxY3
 g56jW1kVqcaG0dWK1zK49Gu0/sM8DwEv/RJyqsTF0uTchsmnpWRgdsPSjetbgH/YykYCAyFxSfG
 z8WDOW2OBTYGdkecDzLvs/Pg5WqzuJjiESzrbxv6JlHsyTMYwwbPkIWRJF4FnIUgvvseFKRUmJZ
 KyWWTZdUUmvorf9dJfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220231

On 9/17/26 1:41 PM, Nihal Kumar Gupta wrote:
> Add the Camera Subsystem node. Shikra shares the same IP as QCM2290
> with two CSIPHYs, two CSIDs and two VFEs, but does not include CDM
> and OPE blocks, so only a single IOMMU context bank is needed.
> 
> Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
