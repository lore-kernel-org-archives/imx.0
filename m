Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242D83EA971
	for <imx@lists.linux.dev>; Fri, 29 May 2026 14:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780066359; cv=none; b=dMRmUGoBQWnCQoundsCa8VhwcPYx/itn4Z6OPUpKLixEA8vAdxmq6aI28AsJHbTCDE4DGlZdeojgZ2zaZEUGHwWvfkb3X1eYP8yw9FfeOc8JnZbpj0JVSCKSk1hZ0XTBC2wn/rbRmVBWqoB0zqweBpb3SydxfMWcaE2B9tJToRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780066359; c=relaxed/simple;
	bh=MGHfaR8jlzUkkXidIGH4kSnaaY60wAaRTetyKjPVzYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nT/dSzqVh9+Zr040Ox0vhDfxcwqqGbUwH8UW1wrLZhBYG2X6vVjgs+o1D5/cyr4+heBTsxbe+srw8ejkVkfjMhfqJwQhIMnN2g2j/j4e1A4FNtwlycqQ24I7cfkU1zlGOrNUhIm3HsWquxXJdcAaaCd3gMXwqe4VvI4lqyZ8HGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WsnegsD/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gI8ZoVPq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WsnegsD/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gI8ZoVPq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDLhrD2748207
	for <imx@lists.linux.dev>; Fri, 29 May 2026 14:52:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7fDi3qZvLhAdC7/0jy+gsVwkzd9Lct8DJ2M+A7e3DX0=; b=WsnegsD/WRgT7zBp
	KZBLOe3RIyTM21H3gknjzlTo+0dXRAyfiCQQTVtGDsznzUIm6YH5vqc4ByboIQmp
	eMmW18qt9ncuqZ+mPB9WBd0MLqIkVfvWtaQRM8RJciofK8pHhC/ecd6O4NXuEarE
	YCJiL823SF8/MsQIuuzHJGpaERcYn6mDnlZWfQ00wNkyT7IF30sqJemQv2r4j4JA
	WuWWtvHZNOuEh8j5uCSTHmDMMrvF6UxOdtJbYHwPO/eXakd3YZUsU3U4n67m4K8k
	9RCjb6XhNP7JA9zBEKKNBGJ9qQMh+JJGbQVNtkhpnIstTuLfKltjCEsovzMocvtg
	d5yOTA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eevug44wy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 29 May 2026 14:52:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-369166fe5e3so12707864a91.3
        for <imx@lists.linux.dev>; Fri, 29 May 2026 07:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780066355; x=1780671155; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7fDi3qZvLhAdC7/0jy+gsVwkzd9Lct8DJ2M+A7e3DX0=;
        b=gI8ZoVPqnIUUJoQ4rWKi52G7iR+i4KAB2Jb7vJoYiILUoP4+aFMFxLK0ePzjE1nNXk
         pX4cA0rDiPvlPCZEmOFfSjjF6Faf76HeC29oOjtTMD2/K2clr5vmXggzbBwQRzDrYdpa
         f13EKVFIfNUtEqmLENpsw2SCZPnq70q7akO5a6+k+18nJSUO/hprkpkrjYm+8aqQmyHy
         Z6gik76adqXv5Lh+VG6oRNyFADFzQ5c0Xs4h2asmzNtcJu15dFQq+AYFu9aLeqx8/Hqr
         TTo2ShO0UELYUGAXpVnJjjDXseJWy5aY9wjPKqg1EbiNb73saYqmQwSFb/U+9q5LPQQ2
         v2aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066355; x=1780671155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7fDi3qZvLhAdC7/0jy+gsVwkzd9Lct8DJ2M+A7e3DX0=;
        b=Wc07wzSnx8B5UBnS78x9NrcEh9Cv01YKFJ1nwggoMsLh0JoaNKLUlCZySM2LfCut2F
         23wCsdppeiII8sEN73+sh+PhSfHwGk0Nx5UAK/CO6Tal3L+B9w8xpWYCT25SRIrqDY5r
         /yrxb/q418ZjOH0N7UNVcXhDlyUpouzW25GbOp+GPX4TW3GHy/+d4d/a6tUV52Rzzboa
         OFDYupd+blN4Y2sb1Lhru1twEBuZeMu8o+MZC7lsp88fOKs4wq4HJvHr6wWv1QGf4/wR
         mwANOfupTfawY7R/vcFKaEnhyh18k1SjdMaKGztOSYyhLm7xttq3ryBUUknGDAjrQgoD
         4Ktg==
X-Forwarded-Encrypted: i=1; AFNElJ8TRr3XxFAQ2xOmkmiXDaNgmxG/jfQbabmiuDdLZCbqrOI+OR4nUDWMRWEVwglDzJa+GPI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzWEYTjsI2oy390+nlGXaH99XkR2yMkvNFEH9b9kDA4HqgCsS8b
	QYhbvm/fPLuYSKqr7Rgb6NYXiznJH9Ax4rRH3OpUBUc9hHaZr/yVoj7iLFbRci6NV1htQ4tt3eX
	cz9o917aytzQjrdUJJj6qoINRvKCXEig1ehvRY8W/aqsBYU4VuHl31pI=
X-Gm-Gg: Acq92OHnILX5bQx8d71K3SowKs9iGsvqJkJbUlV1jUZzWuWY1oQvYgSfyv7NH36nnry
	VEphO2+lLsxhiZCobA+QgjLAhnvfVX2qVeZBulvCdWB7ojvHm+A3D21F7R8iZMs78XEpHzFOSTV
	1gwTVMD5UzOFubGsPvlp18xIrbYoJ5PI126dWXQVtJ6wzuL7PWnemswg3bPUJZa1DGqkIri4fpv
	KGPLT2NIea3XBGEWnqSaghiwfImBCFsahcLk7MdpW3cy2y0Mz3w0Yx3/TJaCusbGe+YZ0d7T79b
	RoZ5GA6nvrwjB9BhQ42T51jFvl6MEQ45sFDH4h7HG2bi7hq8nCN6fvYVhe9djZfTPN/WVc1lmdl
	eU+zIhSW8n8eg+187H0EvkR8/CrKUF70WtVTSDrumoIVHHCmMvYANRj6j1gS+NAE=
X-Received: by 2002:a17:90a:d40d:b0:35f:b572:ece9 with SMTP id 98e67ed59e1d1-36bbcad48acmr3569143a91.5.1780066355537;
        Fri, 29 May 2026 07:52:35 -0700 (PDT)
X-Received: by 2002:a17:90a:d40d:b0:35f:b572:ece9 with SMTP id 98e67ed59e1d1-36bbcad48acmr3569081a91.5.1780066354875;
        Fri, 29 May 2026 07:52:34 -0700 (PDT)
Received: from [10.204.67.150] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc9bff159sm845633a91.0.2026.05.29.07.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 07:52:34 -0700 (PDT)
Message-ID: <df00e8d8-21ab-415f-815e-608eb7ab0967@oss.qualcomm.com>
Date: Fri, 29 May 2026 20:22:25 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] arm64: dts: qcom: shikra: Add CAMSS node
To: bod@kernel.org, Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
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
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-4-645d2c8c75a7@qti.qualcomm.com>
 <178000689150.4557.11759359941436928903.b4-reply@b4>
Content-Language: en-US
From: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
In-Reply-To: <178000689150.4557.11759359941436928903.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0OSBTYWx0ZWRfXyS6YWp5up3ye
 nqISdWg9v+ZlMChqTjahoPXFEsHas0UZdtLwptzeDgSa+dGx7eFg0tQhsIwMERRWbar/JtqnX9c
 cbZbFjZfPk7sEHRTxOE36/ZHFZTuvvNXge3qbrXJUPPR2DA1dj06AlTkLDY4GnPaE2TEmIB8tWC
 dLEA1/kc1rgHQUOatH5HemdpvoPSY7c24buCePbwE692c4rjwfI2i6NPA8SRprm9ev4HAj8AVDu
 I9vOhDAcm17XXue6EIBO53An93wNl+aItTpQ1W3XDqK0hF4e4IHhvWtU/ca+U39peRS34nl6anR
 OGkSBbVQzLgw17BPl+UCGzuEelSjKn4PsBKlPuxeNYuq6d26mkY8nlin/8vVOxLFF5luYZxZ45Z
 Y38VqCfak6BPU30biAlnM6DAbacfy+rJzsUjqUsTiMsnMHSTLdFLGrIofwJZhvFYRJMw8XxAQ9B
 B7+tfPFk8yWSQXgxjqw==
X-Authority-Analysis: v=2.4 cv=SNBykuvH c=1 sm=1 tr=0 ts=6a19a834 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=i0fgkIc6DCDsPB5MfecA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: tL2TxHPyMhVJVjW7URmpu5MaF2pGnO7H
X-Proofpoint-GUID: tL2TxHPyMhVJVjW7URmpu5MaF2pGnO7H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1011 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290149


On 5/29/2026 3:51 AM, bod@kernel.org wrote:
>> +			iommus = <&apps_smmu 0x400 0x0>;
> So I'm suspicious of this IOMMU.
>
> We should list the full range of IFE SIDs here not a subset. Since we are
> register compatible with Agatti that implies to me we should also be IOMMU
> compatible.

Shikra and Agatti are not iommu compatible in terms of Stream ID. Only VFE SID is same
for both. Agatti is documenting iommu for VFE, CDM and OPE. OPE is not yet enabled for
Shikra and in my opinion it should be added as a separate yaml similar to Agatti.
"https://lore.kernel.org/all/20260508-camss-isp-ope-v3-9-bb1055274603@oss.qualcomm.com/"

Regarding cdm iommu we have excluded it as we do not use it to program registers as of now.

Loic/Bryan, Please share your thoughts on this?

> Please list in your next submission commit log the IOMMU SIDs - comment in
> the DTS is fine too.

Sure.

> Ideally list the IOMMus for Agatti/2290 and then explain why the singleton
> you have enumerated here is the only required one.
>
> Right now my suspicion radar is high that either the Agatti binding is
> wrong or the Shikra binding is.
>
> Possibly both.

Regards,

Vikram

