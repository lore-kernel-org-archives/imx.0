Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A3A247DE1
	for <imx@lists.linux.dev>; Mon, 11 May 2026 02:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778466288; cv=none; b=UKFw+uUSgThQ3hP+4/WkPSNq5YbYg1xMWl9UGmB4GkCGN55T6EyR7yh3Dhr75n5F6qEhiGcWbwGnLZuYEl4cdophnR/WILUoMSP86h9THsFwwElgPJxRwQD0/OT3oQmINF96jvyG8BVq1PdysCMYyi7lm/h6TXSO8CbQedjkEcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778466288; c=relaxed/simple;
	bh=z/Oc9IGzqdgqt96PWJXKU1AhRYn4A/ccjjjMOkRN2Pk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aPBVoBwwXIJ3ZIhjTQ/RpetPKganbOPshDJ9+nr48WHPTTona0ejHE1HVzmIQ7SJN9352vn8jQsW5zPwNNLHHPyv1eTYWLaCEUUtYX6aOrVFtooc06gFO2KacvGVCna2OkCTfD1pj6AZRgq2quF1T11VwNDQ79EkWSv11ws58o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VXA8KIRd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fzTJv1Qd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VXA8KIRd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fzTJv1Qd"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ANHUYl028663
	for <imx@lists.linux.dev>; Mon, 11 May 2026 02:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NDiSg768CXBvGt79GGg+qABUaCPAYEyC3WguiTuB1ec=; b=VXA8KIRdowG6Ps/f
	8zv0HVMzFMIYzuxxUOkhukFSFNHVQn9Y+kXeWGGtumsMTHHwFO8xGMF2Z0vQRGfh
	Nw0OhfDZWAe/F/N3/a0auPLxWPJq0yy6pFojTg52SXyttklbyZNwOx35VvYw42zk
	atPXPg9O1GbNJt1diMqlv/cCIhkMbNBbIgg4yxaXus7cdAtsu8YIx0aZW7FaW1mL
	zznfWgwuJZ7BoIOr1vhRkb+6unfTHtDSb7zWeDSBnlfiDirQsxeQQEQ+m2iSfKrW
	rCVmnKVmDTPWU20Zafee8J758wnULpxJCUELtLCBiouS3tO3RcvP6uz7IgJORWWX
	IEQHxw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1wa9c16x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 11 May 2026 02:24:45 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8b5f089a5c3so65809026d6.3
        for <imx@lists.linux.dev>; Sun, 10 May 2026 19:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778466285; x=1779071085; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NDiSg768CXBvGt79GGg+qABUaCPAYEyC3WguiTuB1ec=;
        b=fzTJv1QdakEbc4VIQmUlN4tbiwpGM86J9p2yExB0TsPK3zx3UG1fuqaNQa2GbJptly
         hFCAe2KSo3Am1pbpXjE5mSkzTM10Uv9LKCFI+MTbof1Fa9xVZGOfyh3Ug+GjDmVLoHsk
         cMuo9CocH1UElRoEe39+bcZvj57BJfhptTa13urRfWuGVyP/Lz8L0A/ta4/+d1xnkEZP
         23uH4xtTGwh8Xc4UVaz/qi7jFhkIwiupSzC7JuMN1iQg9Crm8iRxszfE+/Cz9sFSrBfu
         yiWM3EdpJ2qRyphkM3dT3HsOGJRRvrdHKp/iqbxo35NdXbJkhQuJFwxNTCTYa9QX9F8W
         9ing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778466285; x=1779071085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NDiSg768CXBvGt79GGg+qABUaCPAYEyC3WguiTuB1ec=;
        b=X1MHjc9ix9wYaGDwd5A+qnydnfCsKVeWiEe/I6VVOP1LfzWyl+gmBTWDzyMGt1P/M9
         GxdIHTppBRiUIQQM9cKHtchi1iGvwCP85YRLMjxgd+mkZEZlI8e69I9BSfWPweT6sqsY
         7rU2AgT0TkWUrXJ6j2LtJUSuCGdT8652aUIJPHfn+nwyLpYUm3VKTaQNB0ZFzTCrc9oj
         dITIrmUAvoD1/Rdfvj7qdwzCMvv2QTHROrK6dE1HBMzsmbhW2vpNWBPFMn4A0hwC/Eh8
         hXzWnchZgviFPxj7ELXG92ZV7CSJFnUAdxJ5yXor1UU1Shwl2SU4+StZyXDbw0ArWUgL
         Ym5Q==
X-Forwarded-Encrypted: i=1; AFNElJ9jVE9IHBk6x5JP8XwFhR7IRtTVeB35YeAvJUulSQ+ThMIfa2Mmhnwp47n4YxkY3wb6qqQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwAdRVQf0wZ+KU+QDAYjyO5p6BKuNNpRNHnA6/aRlRndPLO4uGc
	ZnYwENKo7TTjI+gBa0tUXLs4BmK6OM7tgitGgKAuP6yJMbq+e21PR+sq+vR2viIPpvvmQkNcMtZ
	VAqs9xKNGXjr/kO11i/ugFrBPIJLQECCO+DDMbB0aIl5M7GnGDFjLAN0=
X-Gm-Gg: Acq92OGA2bXFn+w597vwdpXK7aKqT8SOHSdm7rvjI34tFwXBavz6pGsCqJ8n8tIrb+b
	E6nyXsYuGVmK7+XwIBANi0nSnNEx3nctBzx+ABj1ImqRBY5eiXfPzexsumej7TvVL0JUNL2WmeO
	LiBw3rgmraT9ibyWkvNJwciGKIz1UCh1MRVdS05I9ncTv6Cpnw6yTsaW8DUWucOGGaCatDjTWvL
	wSjZKjV3cV2ydDKSL0mF7Pv1acTT3jR1exGS9Kj6UhZr/SFdUJUF4I4Hteup5N6Xg/QsZhQtxch
	UvKNeq0Yv10/jec5B8wdAQNQVbxnQqy5CLrpdtrcYJtVmYZrpBqWeCT5aRvvJSwsU3gEAuGEUYd
	Ctwy75F+wfQM07fGtd+7oA55dTNTbH72c2RhCRrq/X91kfnV5zNjGZKA/rNRbUVSg7iguLBNVc7
	T8CNxKAPA=
X-Received: by 2002:a05:6214:469b:b0:89e:a170:6af2 with SMTP id 6a1803df08f44-8c1afabc2c5mr138776806d6.41.1778466284600;
        Sun, 10 May 2026 19:24:44 -0700 (PDT)
X-Received: by 2002:a05:6214:469b:b0:89e:a170:6af2 with SMTP id 6a1803df08f44-8c1afabc2c5mr138776556d6.41.1778466284094;
        Sun, 10 May 2026 19:24:44 -0700 (PDT)
Received: from [10.38.243.40] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53ce7e73dsm300484716d6.42.2026.05.10.19.24.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 19:24:43 -0700 (PDT)
Message-ID: <1d6b4182-7cef-4c00-a655-095c0388a038@oss.qualcomm.com>
Date: Mon, 11 May 2026 10:24:34 +0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] Add dtsi to describe the xe180100 CAMSS block
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
 <20260508-hamoa_evk-v2-4-3ebdca3e4ae2@oss.qualcomm.com>
 <328860b4-1d4b-4a90-9d10-cb70207aaa5c@linaro.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <328860b4-1d4b-4a90-9d10-cb70207aaa5c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDAyMSBTYWx0ZWRfX9i0Qj63L42/I
 EZHCDfMyXetUVfXeuZoy5Ab9kx/LdYSkfaJ53KOYBxMT1HJCEN/AtxwKkfX15FJAx5g4XTQtG/A
 NOnV4m6flcTUx4dzNYJ2Q5lWljpkXsJEKmsMQW8DEapb+ytzU9Zwd7ChTYLoJUmof1aqTbc0guV
 I7wU04P23Dfbz2bZtdxZdJMYALMindDZmxirtR6qOd1zQbp77eWNB6Oqf3LjH4gYra+2QqunbVM
 t8vPam5HTrOQ1FgLZLqv3RVzpX99RSpQa+qdaEzEMXH2iUr1LilL4KRQnfWWyYPwEDtdwI/IdFK
 1mMpxS11uqFW/59gWvihS1Pban/NDOEyuyOt4IL8a4R+m0TYXQ3kLqQ/l/ccNIfErW+E/4CELcd
 B8+H0VfKVqOGHz1n+ZQo+ye9RWEb2Hs884B2l3fanNhzE1Q3ZKTvodUtZH5Zd8OqlyZ5YsCSJh/
 vmMxNGEbyxwCix6WKoA==
X-Authority-Analysis: v=2.4 cv=HO7z0Itv c=1 sm=1 tr=0 ts=6a013ded cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=SmDLwImcmQvp-VwJOJ8A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: PmO8gHQjKy8utRFBSbNxjdGGbDcicI0_
X-Proofpoint-ORIG-GUID: PmO8gHQjKy8utRFBSbNxjdGGbDcicI0_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110021



On 5/8/2026 10:23 PM, Bryan O'Donoghue wrote:
> On 08/05/2026 12:40, Wenmeng Liu wrote:
>> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>
>> 4 x CSIPHY
>> 2 x CSID
>> 2 x CSID Lite
>> 2 x IFE
>> 2 x IFE Lite
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> I'll repost my working version with the PHY stuff so I'd kind of 
> appreciate you not posting an old version here, just wait for it to land.
> 
> ---
> bod

If we are able to designate the old version as a candidate, and should 
the new version continue to encounter substantial resistance, we can 
provide a functional version.

Thanks,
Wenmeng
