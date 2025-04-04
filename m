Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED70718B494
	for <imx@lists.linux.dev>; Fri,  4 Apr 2025 20:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743799306; cv=none; b=fsWsg9u0NmnST5yTa+Du04ANCEnRYrBqPUaMj5X9faYUPYyiavyuqI161xcMaelNzBts3qlDeR7RpH+Edv7iBR//lTchuQ1FYOVqzewvTM5M5t0uS9WB2iEJokKDYGtpBDaZ7YrqLFjwx+XC4fIBxlMb3DkFGAnVgHJHOI2nuys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743799306; c=relaxed/simple;
	bh=ccyZLANca6twdJkvuWEqH0rOcwC7Rm7pJo18tnXG1VM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vm0cgJ/zJNhVk9J4bGdBSLEXKNozb1sJy7G0+zQhqkeDyOFUyK0m37uhonfMG44sIff0AJNiGHl7B7oAuo8N4PMrRMqG/uVuTOzpb8keonUo8+jYK+7A6bEP+aDmYwatvZyJBMUwTEzC3SOjIbalH+zRvGPiq/Exf9E/mRYxOic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e006pJL3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e006pJL3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534JEcMg014090
	for <imx@lists.linux.dev>; Fri, 4 Apr 2025 20:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yhwB7sBtbDgAESOIuK+j/VpMVm+i7ozwb/nf6hzXHSI=; b=e006pJL3OxxAh8DY
	yw6pzBhVXjXPMKiJbem1EZ2wzfylcu7MoE8jlhD+yLNH/8wEqqVTrpIicznQ9JAj
	6L8OAq4Hv+XXOe0wHTxagPkOi4TuKwBLxCKJIUM8F13wbKZrGGEw1a7ewpS7h9Ol
	LlWJqc17vtQxsUc1Hd9cS1Irr7ooYRrNnfTwVm28GRqrJusgJ85frwJFvBdOGD8u
	d9yCx0PeWg02ITaLXRLspQw8ZoEwfmAr3aKscRUzaiPCkam6uTntdVgYNWJodDhY
	9AmbuNyq3qqO6CUw5UrwUR8ILDDbH6MAvfR6kg2EJscGkLCxou5n0Gk1kHGxaRKW
	82u7lQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2datwvy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 04 Apr 2025 20:41:43 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e8fb83e15fso5614226d6.0
        for <imx@lists.linux.dev>; Fri, 04 Apr 2025 13:41:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743799301; x=1744404101;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yhwB7sBtbDgAESOIuK+j/VpMVm+i7ozwb/nf6hzXHSI=;
        b=Vk8bUzK+Rck20/cVqZ4+pmugoMvxaynmJIpxY+MU4vCxa/pWZMdGZtkeAlgGLld0gV
         mnK/2gxQ+M2ZGvN0cSE1fT2HLsuY75PkA50xrtJ0DkYNnze0NwmS1yhD1cvGQ58fOZfB
         fIaSzcRRfnOpoHrONiHCJW/+CNVI8Fjs7biT09fRRJdg9fvvua+W6JEcqaUHdYvAqCCB
         9m/B8ZKHV8KFjFkiQtjz9T7Mr03nWOeiEcSz4fczEh/kVgOEbGf3MHWmmZlU72wGBPFN
         vcyrBQd+Dj8oTqdN+vFj/uultakUWOHe5Iwk1AqxEFXoDdLBIB3D4uWOmuNCwgBo93/x
         S59g==
X-Forwarded-Encrypted: i=1; AJvYcCW8I2Ond0sH/znIzMx2H9R3lF+YNw/mFqz8YC41Y3Kyapb8AeKxV+41FNrMPrc5SCOydOg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyxQSZYlt5DjivGVG+kdB5VFHQwo2UHPhJfMSp3aj1UZ0VBcjiF
	lC9NI24pKi7GF9x6IFYXQ0U1Slyxot67bA8T4b8mJ3EjUc2rj5UYbMpeEYANcQ/e0fDbQ52909D
	IWxLcUVz0Il21L4tlAxCal0mjsER6swXof0kukOsj6IwCmgfezsY=
X-Gm-Gg: ASbGncutJbefZ+UK3sMYvg7EcreFKbRtEkfyOtaALgUE2bduf/OhQUw4GUbz9dictA8
	waZsalidFoB1sCkJuWH3AredCNayTJyxHa1HeOAr+ypRTCd3YaJ0uk7QSdAe3P6UfFcTUVH3etg
	9/ta8OnHljgepYn4TA+75zl8c2nXBjMGSXyKj+Pn3bcNK5AHEjGrQJMUkQmgd+zjlyypjYp9rxw
	Z5EP3QupezcHuGe+G5dFSIKaTVSUBi1UUrRHEwqA1/bfershU6cOeZlPd+KAXA/ejrJgEr5En3V
	LAX1SaTO9g6lPx9rULEyYHEkKQAY3t0KWDdWqRT5uPsHjzEzEOpsWV5FPQMFcWdKiGZYvw==
X-Received: by 2002:ac8:4644:0:b0:475:820:9f6f with SMTP id d75a77b69052e-47924943de8mr21783851cf.9.1743799301638;
        Fri, 04 Apr 2025 13:41:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1R4hoCTSAc5GEHefyuqv2Og+2N0LdZwy28eI6DAzYwdiZd4PyFBY4gfZbXP5sqGwuyOlLqQ==
X-Received: by 2002:ac8:4644:0:b0:475:820:9f6f with SMTP id d75a77b69052e-47924943de8mr21783741cf.9.1743799301314;
        Fri, 04 Apr 2025 13:41:41 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087ed19e7sm2857643a12.20.2025.04.04.13.41.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 13:41:40 -0700 (PDT)
Message-ID: <03011a33-174b-4027-bdd2-043aa685380b@oss.qualcomm.com>
Date: Fri, 4 Apr 2025 22:41:34 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/19] arm: dts: qcom: sdx55/sdx65: Fix CPU
 power-domain-names
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
 <20250403-dt-cpu-schema-v1-9-076be7171a85@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250403-dt-cpu-schema-v1-9-076be7171a85@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mikTv67gCu8buG9pc5P8mLAYPyKIq9ZC
X-Authority-Analysis: v=2.4 cv=MqFS63ae c=1 sm=1 tr=0 ts=67f04407 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=xglDh1PETwH3DoLBRHwA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: mikTv67gCu8buG9pc5P8mLAYPyKIq9ZC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_09,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=927 clxscore=1015 mlxscore=0 adultscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040141

On 4/4/25 4:59 AM, Rob Herring (Arm) wrote:
> "rpmhpd" is not documented nor used anywhere. As the enable-method is
> "psci" use "psci" for the power-domain name.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

"psci" is what we want here, but these platforms require some more
massaging..

These SoCs don't seem to have any PSCI idle states (deeper than WFI)
described, which is no bueno, as they support some..

I'll try to improve this.

Konrad
