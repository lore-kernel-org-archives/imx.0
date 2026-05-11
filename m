Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E9F3C345C
	for <imx@lists.linux.dev>; Mon, 11 May 2026 09:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778493533; cv=none; b=Nsf/1TbjoT/Nm29mybE4ZN6u+1GiYsirZtZgcqIeebyx4SIeSWFgFSAhyViMPoYBzZwf5hparO4KmBXQ+45R9iCm2v/Z1RwbiLAXhgxTbuzvbuTpMRsH++ZaswCOkLp1pqFolhhlpVTxMlaL6+7jzSmiluuKZTj6uuyJeTVIY4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778493533; c=relaxed/simple;
	bh=Y2OjlnCuQlb1NvQcRqlakOxq6WkVluCIr8bKCkZiNNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UNxXbLYfas3ZOlqW/pp0z1KOO+DSgl80Bix4ZFaBg3079RBMQwPVcEH3AG3oXGWw+RZ+rMgqlQV2DrXJMev0Czuirwhppd19LxidQZyN3lBYBunSIey0dSYZCEBhRlJsLjW/y++NUGDyDQqAsvarzxIyUqzKJJuGnjJc2c+XOio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WfTrO292; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jNZE5yDr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WfTrO292";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jNZE5yDr"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B7CvXa682408
	for <imx@lists.linux.dev>; Mon, 11 May 2026 09:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2GyxyJ8YMHXnlmbNNr4fpkzjHzr/ZBksEYUIqB1ntQ8=; b=WfTrO292h1oyY7SC
	H4ICKr8oF7tHCFWjcH+eL0ZiE49TmC0BQpNU5g3PJfoTG2u8zWPKPIf5EYwAUVVA
	nt0cGR1qtAyZLliu/wkNcKQKtOiukarUHvykj6oScQYBdJpf9Kf0nSQhFJGyBjXz
	V8G62bC7lIXU3a8bTu1GP12w4zahouKasI9ExRrRxzLzb7uguS346OyNx1SBHCoJ
	lw0W+9ipN6Ldwx1Hotglj+Do2Y1Atup88qBQfFI5gux9derobu0yK/QQxoxjP7Of
	DBFgXdE2tVU7jr78yLxEFtofZ5dDjvUwN7HO0106vlN4ruS7JtzVZ710hb5j9cG7
	4s/fTA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1wpedg3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 11 May 2026 09:58:51 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6313443ffa2so200068137.2
        for <imx@lists.linux.dev>; Mon, 11 May 2026 02:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778493531; x=1779098331; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2GyxyJ8YMHXnlmbNNr4fpkzjHzr/ZBksEYUIqB1ntQ8=;
        b=jNZE5yDrJybtgq9wfZaC5QZdRitdYxUHzWpMundfrhBKwvBBKt3sVxZK33JI+l82br
         krgMreIz5lSI5ZpteKdD9o8AX0F9NcT4qWlpq7cnRvrK+7H3lUmAC90dJY4RaWPMw0OM
         bTnybqDWG3RQdScxs4m750pMOINJoKRwK8A/OuxLNcVsNEmMGnVJQlLv4jKQVMQBwWfd
         W7X6dSTxyWUerUWCnviHp1qzB9qHCDYyDTTJEe5dreMUhruCnw+zgXOwm5xE+ikJrnSQ
         /nMz4D5k6hrOzK8h6JRe3Ml8L7trzIg/vZ/zsCIC2e3CIgJ31tCuVJjrPBINZwvAy4AG
         mYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778493531; x=1779098331;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2GyxyJ8YMHXnlmbNNr4fpkzjHzr/ZBksEYUIqB1ntQ8=;
        b=BkpQoHPGQMpOnxqRIVo/fJLuEZPeyGedFOEnCADzdHmw+3DhMnF4Np1Tl6bm0ZoqjK
         5qaisXRFuTBWccIwwT2FxtpDaBrg6r+MtRZsW46k13UNGsrmOZIP4SE2KcS/dA80vcKe
         rAn4PDPz7aexDUeFbv0tuF/FRnv3VdZLZjWjQT5thkr5fHInjpj/AQ4h3JTNLyvsrOxD
         A/Vw3o2PE8j3ThXYrpuR4CuBLHeWoqx0kM0zxzhVbrcEc5nktjDFMH8CvoFUuioZuxAn
         k3M8NEZJCyaEZcN1FcneBLgJ9M3SUDg4FvVkyK4RV2tpE8mTAE6gKtNe+MzS0qd8o4Ic
         G3cA==
X-Forwarded-Encrypted: i=1; AFNElJ/fF7L4erGP1e6gmRsx9AGTmj1bUVEwnWM8aEIKVPv8R9dwAT1ysBO50A0imW2j8afNgOU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzbxENECza8khuVqbVdZrgaqAAL+p/twjQNpd9lkOJS0crGO9MU
	sCIVp4oWvbt4y9yyrry1074h3iGBq/w4x2Q3HTf77EKEzkhUAq3BfV3+FoFCP3LLtZZcfRidUmc
	SVv+mSZo/iQiiLgkT8hLnjjA9oqAWSc/3C4PmupU6RmRQpEO63PewA4k=
X-Gm-Gg: Acq92OFxsstbZQfEpP81AscbN7HWvZv3wmeCbQGk74jpGI3zrffpgzpkX2pAxnwlHfi
	F8tk/SGrpVhAzPRrbCxQFiYRXnwtg0fCZrSifaWkfU4b18IWvF9GP22IuvkcVrNi8yTi1XHyjsQ
	NnLAIcUs507mThWKroh51JBaLeGfOe2zTSI9Zju/Wb0ajkh/udRPUA5gx6tX4ByExv+m34q6rS2
	T8Wyko6LE290NanL0ttfbWBQ7HcjhTS5IhngHAHwDl8g20mYlTPqATUm/3UlyaM8hJHp8oBqBpE
	4hgYpAvDrzAInaP1petfLd7nROTbDDNObYeSlQv5GuJjYTce6eBgcbCfSQ2fjoeFG/9wwW34s9l
	zmSGGrbmwSo04aOYVJgdU+3JwkwXgVtrrvmzEfbfzVwYuF0hSAV+kOz0F89d6ExhWD7FrfrPeOe
	+Yxi4=
X-Received: by 2002:a05:6102:31b5:b0:631:437d:be97 with SMTP id ada2fe7eead31-631437dbf33mr1451655137.8.1778493530177;
        Mon, 11 May 2026 02:58:50 -0700 (PDT)
X-Received: by 2002:a05:6102:31b5:b0:631:437d:be97 with SMTP id ada2fe7eead31-631437dbf33mr1451644137.8.1778493529767;
        Mon, 11 May 2026 02:58:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac11b7084sm468659866b.28.2026.05.11.02.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 02:58:48 -0700 (PDT)
Message-ID: <1b32c112-916c-4e7e-9600-e2d95bbeca7c@oss.qualcomm.com>
Date: Mon, 11 May 2026 11:58:46 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: hamoa-iot-som: Add pm8010 L4M
 regulator
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
 <20260508-hamoa_evk-v2-6-3ebdca3e4ae2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260508-hamoa_evk-v2-6-3ebdca3e4ae2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cdpcGYC40DUTgfU1_Gqn1uDDE_W4KbDK
X-Proofpoint-ORIG-GUID: cdpcGYC40DUTgfU1_Gqn1uDDE_W4KbDK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEwOSBTYWx0ZWRfX4W91I/RztzqK
 /89qcOH6PeTzE4sG7BVBRuphdo745A1KzCXfXTsGwSM5PJO7TRCcmrKDnz1MMGEmq5gcWYZHUYV
 g3A3+Vxyk+mAraa7tH0SYMkvrSLyohve/b7cu+/tH5lSGheHB6gJ+1mxPXrM3iqbpbvIbJjrplg
 rkHv6clR4AM9QsKCBa0oFWU6haDyjQ0DUps6SY9UEoEGI0A0k+rlA4JrFTV2mklkq+f1wvq21+o
 zbyrCQJXQ20D9aCXGOIRJDhTjCuGIB/Qj+o8zZC73wnEGdbgcdlEdjZXbJ8yqEH24JXIcmlVbJq
 kznLbrKIo2ZtcfWBo4147kIuGZrm52QFisc6WFGrx/2HKYBdEWG3YYY7zeZ9ekLVvyPMM0QNsCz
 Q4Nej15jB8HCAasX1Vt2BIm7JOf8y2/0nKsUp9lmNt9BzZIm+ts4dL9bLdujAg1iLZmKqNo7Rlw
 jgykokVV14whtbX7ucQ==
X-Authority-Analysis: v=2.4 cv=EeD4hvmC c=1 sm=1 tr=0 ts=6a01a85c cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=GLZNN3U5Jx1TMTuK2tQA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110109

On 5/8/26 1:40 PM, Wenmeng Liu wrote:
> From: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
> 
> Add pm8010 L4M regulator which is used by Camera I2C pull-up.

What about other regulators on that PMIC?

Konrad
