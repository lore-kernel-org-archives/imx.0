Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFBE21C9F9
	for <imx@lists.linux.dev>; Fri,  4 Apr 2025 20:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743798770; cv=none; b=KtMGuo1dMSJTmdDUctLNiw+MawPOw+GwsqR9Dgt89/7kyL13k1vxXkjoQUOlrSqVsWxzQo5Xhp1n5+DFFeg3+J2n4z8ovZSVpcIuvmSwDffJiOeoQwgpweRz4j2ORmMrgOfZ6sSb8MuwDAJ81wY3ZH64g6GyBA0NY2EO2LLjCN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743798770; c=relaxed/simple;
	bh=LElVHAM9xf/Dy7ylzvkbDBQA7o1vD7xD955A5P8xnEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZSLeKw7va9iay/nanbXVotN7CZKAlvHgAwl3MT2VcYUyV/BIxhIHJFZEl/GeM1YgihwoBjEq9h/kw6PZZVOoujLQBu/v6YYt0t/dBf/aD2kzp80zyYe/YblHF1ejbfqxHYCP22oJl0CIHdaXThCxI2DF9XDDFe6XN9p8InW6nxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iz052oQg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iz052oQg"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534JEhj5013320
	for <imx@lists.linux.dev>; Fri, 4 Apr 2025 20:32:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wOAnLBAJdmL2Wb3sULNUowgzyt+Uj1UkgtRMWgKYGwY=; b=iz052oQgLnMJGQPP
	CErBkb5+kMai2wmrL1VN6aYCv2tNSjmEdIrfLe2CSQfXGDiEFb4OXZOEkTaYZbPR
	s2oHMwQzXNhmk6SUZYgDGSHI+F+YBm/87r/DJurVf0ZzFNC4ot67mrIvW7zyGbGr
	tZrwmJjCSh2aBcHFo9OGDPtXHHuXRis1nGLi6+/UB7OHXPrcGPX//U63Ls94UkLt
	dND0Ti+J34F+JtMUGdIBWvVSCJdsUwwGmSZ9Vhqq7H6+HJDbJf5Oev3LOX3sgkS9
	B71WuA92ekAKJCQDQ2Sp7sD/yQWdIFKTjhAd6eBWWM+UflUROy303DyuHyl4dUJb
	sT2VVQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2d72wen-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 04 Apr 2025 20:32:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c545ac340aso51083385a.1
        for <imx@lists.linux.dev>; Fri, 04 Apr 2025 13:32:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743798765; x=1744403565;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wOAnLBAJdmL2Wb3sULNUowgzyt+Uj1UkgtRMWgKYGwY=;
        b=QYBwEoQNO6lLaEi3URiU3xlsxaULrMpzgtsTIZtaDkRbhW9OYnTdmBNrRkGYAcqhpB
         kdyymCbkZ8KBvVXKpKwOfJkvBUqu102MBV1DSF281byYCWC0k8yS5S7+gcOv0P8/24Dj
         qQ08RySODwMGm2iovoeZZ9gxhl0A9Hv26c21LMiYv9QQ32G7u9DtjtjrrSyMZHddY+vy
         KTFgT9YizeNHTnOy4v2V5nTBegmv/moS8Kr7pe8KXA5dbcGntsTWv4FR0avI8jHxQ1Wo
         PYX9tsVsnc9ul+49+ApxnYRiSCf9DRhwgIL9pEMXzG2w+MJ1kXIMq8TqoVyDVbN7wkF8
         k8UA==
X-Forwarded-Encrypted: i=1; AJvYcCWwuvDjLG7XtnGfGK2oZrH0qoeGZWH0P2MXzbCwv0un0Sk/8WK9tBVsX95wpE8rbxXL3l4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzmsX6X40W13uOM+oi4My5fCqTUVhG5DJRDENkIbROGOe0iCzIo
	yIERMUwBbuiGmhZEXht/7uYo9ufEXyNNIXemDEQyXPC+JhEyA6Hpxr1jsyq0PUOTiw8BocHMiso
	Mti7aARV/tfr0kVL0Zcz2fi6yAjnU3HuJji7HvplNr1SnhQ27MdA=
X-Gm-Gg: ASbGncvX4MN28i7Wl7kRexqJb2jUASQemynbcu/PCPNRIIcKOzV/o+J4QAPLvUickeU
	fqqhU5wdoDPBVZ0Kz3HrYtMgN7rShsGAw0CVyvs3ENkNwrjQNfBUEXSwJGFXhltTj0w6fZlowoT
	qbvb2aXMSg3vNB6JyboXnOpWrvxbUK2ps7qDXH26G92lBWaeTX6pdMyiAcyCetD0zyQN9Pu/dl9
	+ITpB8GWXKcbYx3BGAM8Kx9yzMRE0ukXBKrm1JafFkUz30UlPrgBlfPXaxjXJpKcrpynK9q28Cj
	/AFtBaLwXUDHZPhBqej7Sb3nUwGPu/9oZqzWeNicxsi8epvGCFOdQlG6qSPiEDOR/UKUJg==
X-Received: by 2002:a05:620a:40c5:b0:7c0:b3cd:9be0 with SMTP id af79cd13be357-7c774dc4185mr209776585a.10.1743798765335;
        Fri, 04 Apr 2025 13:32:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEszusUf9J+0IEkVjsuj8Y1FnlY8CMQ4G+oamdYonxr6PB4E4ScKqwKTkVXQqlueNvC6p0Aaw==
X-Received: by 2002:a05:620a:40c5:b0:7c0:b3cd:9be0 with SMTP id af79cd13be357-7c774dc4185mr209772185a.10.1743798764979;
        Fri, 04 Apr 2025 13:32:44 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a405fsm2902483a12.75.2025.04.04.13.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 13:32:42 -0700 (PDT)
Message-ID: <d3592f32-e29c-4b40-b045-7267795a9617@oss.qualcomm.com>
Date: Fri, 4 Apr 2025 22:32:35 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/19] arm64: dts: qcom: msm8992-lg-h815: Fix CPU node
 "enable-method" property dependencies
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Rob Herring (Arm)" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com,
        Conor Dooley <conor@kernel.org>,
        Nicolas Ferre
 <nicolas.ferre@microchip.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-rockchip@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        Alexander Reimelt <alexander.reimelt@posteo.de>
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-7-076be7171a85@kernel.org>
 <470e2155-7145-44ab-9d6d-117a2d98d7f8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <470e2155-7145-44ab-9d6d-117a2d98d7f8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CfwI5Krl c=1 sm=1 tr=0 ts=67f041ee cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=vHGDO5lFCXZzE5S5F1YA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: sORxje8i-6I4uSzKJuT9gCbTeJj9EKVP
X-Proofpoint-GUID: sORxje8i-6I4uSzKJuT9gCbTeJj9EKVP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_09,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 mlxscore=0 mlxlogscore=738 suspectscore=0 clxscore=1011 spamscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040140

On 4/4/25 10:30 PM, Konrad Dybcio wrote:
> On 4/4/25 4:59 AM, Rob Herring (Arm) wrote:
>> The "spin-table" enable-method requires "cpu-release-addr" property,
>> so add a dummy entry. It is assumed the bootloader will fill in the
>> correct values.
>>
>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>> ---
> 
> This looks good to me without knowing any better about the specifics
> of this device..
> 
> +Alexander - does the bootloader you use take care of this? Otherwise
> we can just do what Sony devices do and stop on removing the psci node

I failed to add Alexander to Cc, second time's the charm..

Konrad
