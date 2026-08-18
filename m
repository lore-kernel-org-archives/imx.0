Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC88D46D2AA
	for <imx@lists.linux.dev>; Tue, 18 Aug 2026 12:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787056888; cv=none; b=XiUufEwiAAMnFcUuTFC16csrycJAOFaqtc1ilrCy3ZS3lWszLTYewe39/5ImeZyws42HOixEYZj2s/kiTBTQqPEBplRyg2vRqseRgq2/2uEY6t8pcj0dTZ0s7YCzOKJTdT2PSMSjllCjsUKP7ZLH/6oa1cLuZXXJfdtkb2M9YfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787056888; c=relaxed/simple;
	bh=6QSkho6K6D4RepOlHx3goC1YGgDnUBI/Uahfbn4C2C4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Usqj3ghddeItXRh/hRdOlK99XdxGXQplOZ58kYSfBVcwZsMlAyoexqvKtpBcXhr3ikvjiFPPLHzNlflSAhwPu+ab33CyduwA5GB3vC3AyvfWFLo/ZW4+4pzV4JZs/C2mW03tJLO35t/oW4PZ1OUNcHfh9hKKWBU65qAMZgPtZf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KhvHLXgn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kdh3zZie; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KhvHLXgn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kdh3zZie"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABZNO3979120
	for <imx@lists.linux.dev>; Tue, 18 Aug 2026 12:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lfFYp5KxQ32tNseOFClbJYn6i0Vk+UFQrS6NM45qp7Y=; b=KhvHLXgneagenG7a
	TJl2JpqPHsu5Z/eDKgyCRQbfOeg12kT/Twe9rQZNkq0LmAvE1MumCePkthFm3joP
	UWYMd7x5bMKH0gYSDBUl2aB0s4rpvV1g/6ObFBjlA0xXR7LzeNx5wGTK7VRzAGre
	bAynitKFD11n8EKTmlr7gFlTQBap31wCvuua6f8HPxoilviRQJwa7DyRXZyyvIbS
	XJLduckqkE2daAJfZh+rpZB+EjoKiP2J9UqLwVCYRIN707KlGZ0xLr4nHz77vIdG
	/YyPgOpwpUtQToYmndD/NtDBBI6hnhfs/jDIYP9VQfnqS+WyWwUBtiSzKmZ3JgyP
	JxlmLQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4ebptf4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 18 Aug 2026 12:41:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9310484c005so5593885a.3
        for <imx@lists.linux.dev>; Tue, 18 Aug 2026 05:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787056885; x=1787661685; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lfFYp5KxQ32tNseOFClbJYn6i0Vk+UFQrS6NM45qp7Y=;
        b=kdh3zZiepYSNWoFcqxEFj57wIYWUlQPTAGhntEMJZQumsrBOrCe0wuF3ViuLQp2GwB
         OzZKaTE1wtb5Md3NGsX8lQtZxNugKpm+5X4GJs7HmG51WSFEbcABJ9ivuqsq1I0Uwd2w
         2WD7zaEkerVTtfxnyJs3jvP6LAEcwvsZXS9ZMX3tVVmQJdMEWJ2zUEJ/X6FPcUQgMC6Z
         3qSM9h+IwMyIOvSeYdI+QrHly6kI7+w1PoOEcaheRlvwsHbJ9WmZqtjh5Z55ZUT9GrjU
         e36nI8Bin/EqBBsMZ1U1qkqVlOjsbZLB764oFMDG+NqiTbwbIpnzUSBeiZz5PVSRQBoH
         IgLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787056885; x=1787661685;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lfFYp5KxQ32tNseOFClbJYn6i0Vk+UFQrS6NM45qp7Y=;
        b=jmCcdjO49cRu2SP06vDIVnGYvPJvoUXHZtO5c3Ugfdm+tNzWsyhSJtsKB7f4wDnJLU
         5rLW1abCKMKy+xT2k/qePYAe9GLuSg2s67KO2WLwEgN5dpp25yNoeSLbrdymYrkMn/UJ
         r6XuSad7XP2nMrqQSpx6A1QeAXVs6deO9Ho+KMoK2X7ZoZ624R/PRIXabja2eh5mfNHZ
         tWMAQ5WnlFq6stoQXXuccRIlNVVSLBVgNHi64q0netSKxWmD2RoL7uxbnLDp+H/QqUqa
         4DSRT+TSZDEEoWVE6+XkiUTVN+BZ8wHHpHqQqSYKbURC/no2/fTjpt7zimaPGqnhueS1
         7V6Q==
X-Forwarded-Encrypted: i=1; AHgh+RoQByD9d6++NedeeTrpmXEQZJvHQ+LvUjMpSUF8Vb1LdTTmB7/6n/Vs2MNMIzsO5kjCh1E=@lists.linux.dev
X-Gm-Message-State: AOJu0YzJEH0J5+b3rxzdfS+F5KpWOihe0YGkGr6XE0/52BDO8F0mTZpq
	rdQIkuGiY9DaZuwyGp4M2UM8K3LHzC2ljDJTAG+vurMm76fT4GUv6komfn6tAPRTKg9Jo2kL2S4
	ed2fJA0H9oN2QQnTlu7QgVdOGACmn95Em5lfze/Om/EaTMw/ogzg46rA=
X-Gm-Gg: AR+sD115XVw27MfkuEONxzsjipnGNjNlJ47g/nv8UOqmwXQ4IrigiWqbsfXHIkg9s6i
	YNf7Ab2Hj5wuwhnKw/K854my28c1+6On10ccMOinQAfqRy2yALt7E502I+3H0Y8MwL5Gc4K7CzK
	3i/3Tl0tyodXtKNjeuoCrmIin60jmX3OURsaCXvpi42hxyo0KrwVkIDayf7PQX3BsiKKtZUhKcv
	T4qZgiG3/GqwN70S4QcND0jl/qJM/Fnn5MZlfSvWDkWvl6TojH67w5MYCsOir3Wt4vvQ76tdEyq
	z68GOgCVwC5MPKpZBwqKYaMVQQ733bWUbMaUk1zmzZFwzdjzHzTRkgicd/DF3Ghu6M1fj4L5ks9
	3QhF9ADTPa4txx4wEu9G0tWbP
X-Received: by 2002:a05:620a:600f:b0:931:23a:83ca with SMTP id af79cd13be357-936d23849admr2611789685a.4.1787056884524;
        Tue, 18 Aug 2026 05:41:24 -0700 (PDT)
X-Received: by 2002:a05:620a:600f:b0:931:23a:83ca with SMTP id af79cd13be357-936d23849admr2611783085a.4.1787056884066;
        Tue, 18 Aug 2026 05:41:24 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b97a22sm140036766b.42.2026.08.18.05.41.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 05:41:23 -0700 (PDT)
Message-ID: <1ef41a49-dcf8-4252-acdd-f7f3c1210c55@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 14:41:20 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcs6490-rubikpi3: Add IMX219
 camera overlays
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Roger Shimizu <rosh@debian.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260812-rubikpi-next-20260615-v3-0-06e21232d8e4@thundersoft.com>
 <20260812-rubikpi-next-20260615-v3-2-06e21232d8e4@thundersoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260812-rubikpi-next-20260615-v3-2-06e21232d8e4@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2nbYCG2xtB8oWwk9BNDPEW77KE2HGkPO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA5MyBTYWx0ZWRfX4UbzmW0MBOrT
 V5Z7hkUfIPf/jVbRMf3CrDhUbnv2wG7rjoyqiqhsAVIQPQOnLbqi/SqbZ/OrBgIruhYKLeQNhXm
 oO0eSWMH8YlfO/aTCXiuHPjGWbkRvwjN5i1mlh/4LChtUsxtILi5ewFYu5piYSNxHgme5ybwmaR
 ESX70wlxkP0h+KBfdQD3HNpZ1RZwOlpHlHJRnGFbVxypJ1YaWYordiQZ2Ciask/L7zIodQQU91W
 pLtb5I1lmgvx/uHV8zgZAkaaBfDOWXiEzfo1ZMvS4/XuPiz8mx1XuZKv7S+QYL6v6lmpPfGqUjx
 vFJZXfMaBFoNKhiuYeqtXCkNEzmCHCZowVlKGECVvRDMwM27bj2tC9FaMt6FOe0Q2aG+s812y0E
 fI5HpcKvvD2ZEkxjQoZiPNSIwOLiX0Wb3f0DSiHQFP/32KZ2BpBBUwMySheaLPhc45X91RHzCaQ
 9WAmd4vAoUAhpUWw4Vw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA5MyBTYWx0ZWRfX64VtyIyQz1xO
 d6THNwsVhcHS72RgGTI7EdoovbGc/S/LW8qvrBNVWDHcE2skwwIB26y7agZHZOUsOYgIAuRsoa6
 VwAwUJZChgXuO6wMajpiIMEy4iYzIpg=
X-Authority-Analysis: v=2.4 cv=FsU1OWrq c=1 sm=1 tr=0 ts=6a8452f5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=Wdb1h0LgAAAA:8 a=UnzNPPs-tNYotgR03joA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-ORIG-GUID: 2nbYCG2xtB8oWwk9BNDPEW77KE2HGkPO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180093

On 8/12/26 4:22 AM, Hongyang Zhao wrote:
> RUBIK Pi 3 ships without camera sensors, and its two connectors support
> multiple modules. Keep module-specific nodes out of the base board DTS
> and add per-connector overlays for Raspberry Pi Camera Module V2 IMX219
> sensors.
> 
> CAM1 uses CCI1 and CSIPHY1, while CAM2 uses CCI0 and CSIPHY4. Each
> overlay describes the 24 MHz sensor input clock and models the module
> power domain controlled through the connector PWR_EN signal. The
> baseboard supplies VCC3V3_OUTPUT separately and has no per-camera
> regulator.
> 
> Describe each connector CAMERA_GPIO signal as a privacy indicator LED
> and associate it with the corresponding sensor. This lets the V4L2 core
> control the LED while the sensor is streaming.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---

[...]

> +	camera@10 {
> +		compatible = "sony,imx219";
> +		reg = <0x10>;
> +
> +		clocks = <&cam1_imx219_clk>;
> +
> +		VANA-supply = <&vreg_cam1_pwr>;
> +		VDIG-supply = <&vreg_cam1_pwr>;
> +		VDDL-supply = <&vreg_cam1_pwr>;
> +
> +		leds = <&cam1_privacy_led>;
> +		led-names = "privacy";

No reset GPIOs?

You should also have a reference to the mclk pin state to make sure
the correct pin function kicks in

Konrad
