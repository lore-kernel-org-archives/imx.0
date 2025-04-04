Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9F221C9F9
	for <imx@lists.linux.dev>; Fri,  4 Apr 2025 20:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743798654; cv=none; b=ncL0+F0eH1fwz7yarLimBaMbyb1ZDuy6uAiBr/ZY5t9/f+1CKJrI493BIDYtkgFJrwjKzWkh+KD+RBkv6cqSJYcUvHswxiHUrjRf+gnFIvZlRoXbSmek/YM1QZmYXqw0uruCNWEbeE66I+r8wcFjNJ/OCEKV1fr5OOceMLD+0dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743798654; c=relaxed/simple;
	bh=oBT4dqU35i3jNYaDg/R08akXO2az0Oc76Luk1EkR+II=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ijcd4UW0dB1+aDRC9djSYPyJr4C8OgkCmoNm/ftY/Edxxm8MAYcIUEMXcOKYf6OlCtR42l3f3QhJo7OJnSiPEdmUxjS89pQK+G8aOsfmYE9A0Af33723gYei/TvWO6kruF5fukNqRAVaKThRnc+oMwHA7HO/sGtBu0Jn8C3Dn3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VEtxvX0y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VEtxvX0y"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534JEgq8014168
	for <imx@lists.linux.dev>; Fri, 4 Apr 2025 20:30:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7hWRzIPdUXdKBlWVaK7wwLn27NVVJ/zKlX8uz3CkEsU=; b=VEtxvX0y4phHJf4s
	ehGLNsWkMXWxhM24EkpJXM1djb9W9Wd/DqXBlImXSexeCSqf0aHinkAWtpXeOUhm
	T+bWRnySeVvjcmTbRvIJomfylivgX/XwN/q3x4eAIK9k4UaX83gwQivU0WML71ri
	uFCGE35Hcpe1+xzY3YzLhY2hpPMu3O7nqNlV4ZL258Gxr+ppYvexR29GlatgQ0sD
	7hYD1Gz4H4T4IIH/iI7zM9TDUKiPJxWmkmlOgCw/HyhoKDcF2jHiWzj94JFbf2dG
	q5YHPB+Jn3QTgI3w5YXw0TPSfNoPfRjQr/xuuyhR2pi32nZy1WHUqP8XyES3Pwhj
	MYhTyA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2datw9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 04 Apr 2025 20:30:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-477608e8e4aso995211cf.1
        for <imx@lists.linux.dev>; Fri, 04 Apr 2025 13:30:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743798650; x=1744403450;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7hWRzIPdUXdKBlWVaK7wwLn27NVVJ/zKlX8uz3CkEsU=;
        b=FENSFFiKTtYkrhox8GuYJ1lM4cHkwrkuNs6F6Amk1Jv0HJhXIq4/joEVU9XRCy4Nud
         J+VT+n01PHYsn6gUYd7WrEfGSULPeC4l7SE/YKCqwmrkqXca3lMDDUksr6CB88S7NdDF
         XGKNDnUSj3O1+bW0dDrYKLjYEjWqC0IL0qgvZF5irL3472MaYatkahQduMhEBSDvE5gg
         KmM+8NeufDhv6l/kXleZVlen43UzRYUv2YBd+LXu8TO8KhWr0I2UFYMJaXBgsMkuFdzV
         /rfio/bU0HTS3I4FyqOOe4L5mpYK862Jhb072umrIUJWfq5TR59TNEvxC1gM+qXp2IJD
         LItA==
X-Forwarded-Encrypted: i=1; AJvYcCXTiKievsLX4S2Bso6MtCvBWqbRsyr7tLnhud/IbuhpUYypJMhwB8Puef6pWZMGsSI/odE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyLc4UfMRgpbEQQExUeQMWk75LHYu9ZzLLNwwtt784jld+FK10V
	JhdUG+Vt3Bv7HMeUkk3fjTNRCKgH8RbOuVDpGUGm0LAK6JeY7sXULsG8f1sa/apwvcrG7gaqgi1
	Wy9b/cCS7JhxJZGqPUKnHJCz7dNnQSBBKrA2WGkYC0XJGxEIYnBM=
X-Gm-Gg: ASbGncvUSiIodMLQNRyaVA9F9G91ivAx1F+ZSDiSP25YNAztc02yg0IZPAu7QAdj4dl
	WnpTxShqvbsxQyWWFmvorNhg/4VFG8E7ruC5VeXrx/wCZeFCzzYDI79YWktalbLowCYH8k+0TiT
	Ij5GPLY+5T/C754fSDrwKSXY6HISlZZfFsNvfKq7Kr6AeCUTSHsNT+Vk5MZTNILgOHNC16FUWkT
	FzqGC9ucxgD39e90BsB6SphMxJDP/G62jueG0/dY+EJ/eB0nWrSeI0vFSGb5PQneBffKccYvEkE
	FD25DvTgr78ut0jpk76pzxjXC0t46bKDgKMnTXnwWeGL6AIBmITgADYZZCxEykStq7TvdA==
X-Received: by 2002:a05:622a:2c3:b0:474:e4bd:834 with SMTP id d75a77b69052e-4792490427fmr26497661cf.2.1743798650372;
        Fri, 04 Apr 2025 13:30:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuSVd6Czwiac8qs9SQtzY9AT0v4N+1AWxlKTXMwazPDheG9mDDd7uUgjlpULwCLJqJUrfzww==
X-Received: by 2002:a05:622a:2c3:b0:474:e4bd:834 with SMTP id d75a77b69052e-4792490427fmr26497151cf.2.1743798649900;
        Fri, 04 Apr 2025 13:30:49 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a4027sm2911588a12.73.2025.04.04.13.30.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 13:30:48 -0700 (PDT)
Message-ID: <470e2155-7145-44ab-9d6d-117a2d98d7f8@oss.qualcomm.com>
Date: Fri, 4 Apr 2025 22:30:43 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/19] arm64: dts: qcom: msm8992-lg-h815: Fix CPU node
 "enable-method" property dependencies
To: "Rob Herring (Arm)" <robh@kernel.org>,
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
        linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-7-076be7171a85@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250403-dt-cpu-schema-v1-7-076be7171a85@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NvYQAYev4ACBYN2Yzrx9r2umQcCnIdj2
X-Authority-Analysis: v=2.4 cv=MqFS63ae c=1 sm=1 tr=0 ts=67f0417b cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=HGLQH7UMpQlDbUUNBC0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: NvYQAYev4ACBYN2Yzrx9r2umQcCnIdj2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_09,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=796 clxscore=1011 mlxscore=0 adultscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040140

On 4/4/25 4:59 AM, Rob Herring (Arm) wrote:
> The "spin-table" enable-method requires "cpu-release-addr" property,
> so add a dummy entry. It is assumed the bootloader will fill in the
> correct values.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

This looks good to me without knowing any better about the specifics
of this device..

+Alexander - does the bootloader you use take care of this? Otherwise
we can just do what Sony devices do and stop on removing the psci node

Konrad
