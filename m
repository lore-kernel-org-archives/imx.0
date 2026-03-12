Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C75D39B960
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 19:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773343663; cv=none; b=DHxKdqA0FE1D0VLi7igTLVTWl/nv1fTMcple+BpRX85LbQ4TEQ1EiN4rrlGW4cHza4dd4k5j+mHlHeYuP7Va1xcMUMwgYKLgb1ONFhuHakDki2fP4AtS9P44tF+IbMhN0cMysGYnwNal6CwZbDffcnNuw+kajpxeNWrzbllluy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773343663; c=relaxed/simple;
	bh=qcYWhGU+lKYyRru8rsAqqW6z64ECxSzycLP9cHq6cE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JdfihFdVoEf8h90jfO0cuyuTQ7bTA+t10Dc5jjWFmodupug01zVCEgkzDwXSPc+voC7UN+O+p+5w9N4i6vxOErzdlnF4B7e6F+SmeKGfLiq58jJphPFvXbN5MSiLSvSyOgSv5XoXynrqyY3vDfbh0ahK5WyhGDviAYCnIXlcbEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pF+KY7th; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fnVLV4zg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pF+KY7th";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fnVLV4zg"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CJJxgP4026575
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 19:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+72H9EwpwHIiHMhfY/D+/DjdblPYpP/OetfHmb8NBZc=; b=pF+KY7thp3KFqlGw
	gw/5pbZ6oezTF/1/T6bOCslrD2bFU4oKBK7hFMNjDLrj3UEERoMzsdiBZWTcDr2f
	n5BcsJhFHRWfPAW/t+OQALZGQh+IRjyxSemCUgEfc8YQpLbLM5gTkqvNAb0IQpj6
	3jZRoB3ISjyAQiO4GWpSgAAegLsr0GCPki4WL5AfJpXpRr3q4yoBjVm1OLvxAG7p
	5FeL7VXRGBoDFi8wLFTqs1ADFQxJS76d1fmFZyOK1er9hFH8uj8eJplHiJ2bnEVe
	OBDG2etJ8DSgQqg7JgGVZKTgwE3fM3jAbDTGQlrjeluOPSTQlvI8jNGudlZBPjq5
	I3e7bQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh54u8rf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 19:27:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb706313beso214432685a.3
        for <imx@lists.linux.dev>; Thu, 12 Mar 2026 12:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773343661; x=1773948461; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+72H9EwpwHIiHMhfY/D+/DjdblPYpP/OetfHmb8NBZc=;
        b=fnVLV4zgssr9qDXEfeE6Y2nNvGD0fUG+dxl47+er4wX65xdbnRw6eKwS8hwFPKIPX4
         RXrFlowWyK3jAMKG5H8BWhHIW5dyo2wq5s/fjiaOrHF6aCadF0RVy2eXEzWEfURMbM3W
         y5rkigUUupjjWZDnkHV0WfY7lxh2R2jUh8ItJrQKJyBJHhLeaPdTBRItl+LNDfRcm7U/
         VEFRVqnikPqi3UHeh2nKF6I26gL+a8HpiSisXwfNy2PZjEueIxiT6gnYOZzIe8/9e97S
         xmzRMwj8+QBnjZnNgCmGz5Q49ahP2P5YZbm4dUn50L//RK5R9s/LUP7i7vprHSalVUGP
         CbCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773343661; x=1773948461;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+72H9EwpwHIiHMhfY/D+/DjdblPYpP/OetfHmb8NBZc=;
        b=QBPdUoi0qU1ocuPNFgfeFv8olO8JDScuPl0TJKIZwC/k8nHq1Vic/Ab47syHlCbT22
         PhGmfuhDaX2T9idv1BCBfRPQeKnX+aSUpzdHm1kl7RChYbWA2BfZpbJ2qeaqKCpIYGBd
         efNVyUpX15NInByzzRWWTuX9OKri9BgqN24ayE7rFvW+L4fh+ffRVtzV+9TyllOnN8au
         KTmyZbx9zLwe1rzQ4R7bG+EMn77GJ1PL7bflVe6RlOeRRUdngE2tLqsiOVTwK3KkH1r3
         1jHgmh6aTTP4T/jlb3lDNOjMYCsjaKmKBYJYdXEmI8OF6B97Hw8TCC/oukEnXuMZuJdg
         8syA==
X-Forwarded-Encrypted: i=1; AJvYcCW7ETQuaGA5NnlX1o4gCY4JaTesEQK4/PbplPDB7vLPdNMQMSAuuUBElu5ZYd7widw/PGs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwzHikOYifQeAYEPRmqzdzfSwSVElTaZWP8sKoFIa8rhKf8ZSX1
	euqz9R05qqm7cK8aSoJbDx2HfmIyQ/L3AHxjQD/7nuvmJp8mcxHHR9gf7481hlRVnsWB61cCKlt
	D+M7Mw7ECp45S1rcpiAAbxyhmc0+s/REY39gidf1Ex6QNUI8+9uk4l7A=
X-Gm-Gg: ATEYQzxdZmYxbyOlOVwDMIQUu0GEC8fUL9JCXn0aAHbxoj70ch/G1ph2H3oxTvwMI2T
	byZafVZfSVHinLUvBM7Sp+d88TTHEyA1kakaAgR5LCf5h7aDIrpLpQ/SZim2d9mZuse/MzA+Rn4
	2pN9hcPoMJAlScg0uOspDux5TnrsyhWHbubKn/dj6csSpSIHCVNo44ZfXfnpP5apGQP+jaBTBak
	Ed9f/xf/K8f6xcHqjEebmjwwlviK3ymR0F58m358KEV6sLVkIUfAPx/7jv3AsFC93bAh0ym/Zbs
	bHUatl4ZqcWn/2RIRowl6jVaUyC7j13wrhRrukDjusTpAGIE4GmNuDfz/wwE3AT/NSgQy62y9kO
	n8rd7qRdCAxWEHHCZOYQGhD9dsFe1+l8rz5D3c8PxhD2QN5zX
X-Received: by 2002:a05:620a:4609:b0:8cd:b33a:9c0c with SMTP id af79cd13be357-8cdb5b05d3emr141743385a.48.1773343660834;
        Thu, 12 Mar 2026 12:27:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4609:b0:8cd:b33a:9c0c with SMTP id af79cd13be357-8cdb5b05d3emr141740685a.48.1773343660386;
        Thu, 12 Mar 2026 12:27:40 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972de47966sm146845666b.17.2026.03.12.12.27.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 12:27:39 -0700 (PDT)
Message-ID: <9caf255d-834f-4407-afd8-7eae9c0f3cb6@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 20:27:37 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/12] ARM: dts: imx6q: Use undeprecated reset-gpios
 and drop reset-gpio-active-high
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Christoph Niedermaier <cniedermaier@dh-electronics.com>,
        Marek Vasut <marex@denx.de>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@dh-electronics.com, linux@ew.tq-group.com
References: <20260312-dts-snps-reset-gpios-v2-0-0d5040eb4a1e@oss.qualcomm.com>
 <20260312-dts-snps-reset-gpios-v2-11-0d5040eb4a1e@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260312-dts-snps-reset-gpios-v2-11-0d5040eb4a1e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: flBvue_q6hPK3N9RdHV9xX5dVrG9yk2P
X-Authority-Analysis: v=2.4 cv=BNG+bVQG c=1 sm=1 tr=0 ts=69b313ad cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=0uu5XC-UX1W2kQo5SVEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: flBvue_q6hPK3N9RdHV9xX5dVrG9yk2P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDE1OCBTYWx0ZWRfX9rXdHfmUQa1Z
 Sxj5h0yTYkykGbCPLLhFeXipI5+nRoyJPoWWCpwCcUsUvtEt0zgSOnLU/08Pz/tOGomUUdpSDwg
 xxThLKfee1dI3WDzLoQCtwD2jxVCGsynKGE576y2aJgmmhOPJMN4UE0f+VlxihM4wwbV2wk6UW5
 0C3Q8k6ovqLpKwKtNktYKFs0UHWdlgoR3jZjwNTYkaOokGCmxMMs+YjggU8sN/+hUnG8M1OKbRK
 5f91oS7LkulNjuhUXqoRjts7xu2+c4eDKOXdRi7U30Ma46V+mwCUMwn4FQGjvgdNFooXD4WYZfP
 cut6VJnseT3V2Ym8ipK5kuadBz55vBncJ/z3ccU9bQWxBTjhfMH6tQmQXZzOlQ06lmhtjGukwzP
 m1TXtpRbnMNBzCxpR4JYv+93a2A1EG6kEDmef4PPMwdKAIkGLGZ322KSmiVbJRLGzI+jYdQRBv7
 FXWD9ffr5+jZsW73KJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120158

On 12/03/2026 20:17, Krzysztof Kozlowski wrote:
> Freescale i.MX6 PCIe host controller bindings, through referenced
> snps,dw-pcie-common.yaml schema, already document "reset-gpios", just
> like Linux kernel did for a long time.  Use the preferred form over
> "reset-gpio" which is deprecated since commit 42694f9f6407
> ("dt-bindings: PCI: add snps,dw-pcie.yaml") in 2021.
> 
> Linux kernel already properly parses GPIO active level from phandle
> arguments, thus we can also drop "reset-gpio-active-high".
> 
> However this change will impact U-Boot, because it only parses
> "reset-gpio" property for imx6q amd imx6sq.  Intention is to update
> U-Boot to work with newer DTS, but any other out of tree user of this
> DTS which did not implement undeprecated "reset-gpios" will be affected
> as well.  There was plenty of time for these projects to switch to
> undeprecated "reset-gpios", though.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

U-Boot patch:
lore.kernel.org/r/20260312192605.131132-1-krzysztof.kozlowski@oss.qualcomm.com

Best regards,
Krzysztof
