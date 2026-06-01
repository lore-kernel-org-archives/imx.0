Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88143624DB
	for <imx@lists.linux.dev>; Mon,  1 Jun 2026 06:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780296180; cv=none; b=PqcPRo5KwZ8ObhGUcM52QJS7X9/HZlKU0O24evHDYZdH0WdOWwPwj6BwStbI4p8idSPaaQKqPAtaWalfXbqOh1s4vqwOV/OBrCTs09BjnNnfQmdhKSAhCb7qB99XzEHFZGaE+anTj8wuraubJ+Z3DCdlPAZwFIBh/FaHsTf33BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780296180; c=relaxed/simple;
	bh=nYTn0G/ZDrzIo5l0OdoH+hwjxrMK1S6UIEIHuScxhhA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=anUY7m63eYcQwTKcWowMVrENAkCPJZJiRhmyA9gNqN1v4DVlSTKS2z204xTytKM7XdckoM5eyjfZ2CKsE+U5V40Bg0CxZc5USk70Eo78QvZHkKBbFyMg38TVVmA4YEDqUdjvAw1RvBSciH11h5edE7Z+3nI758sHeckHUNU/m0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fCjnLsQ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hZa1mDiW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fCjnLsQ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hZa1mDiW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VLBdWp1121970
	for <imx@lists.linux.dev>; Mon, 1 Jun 2026 06:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BUoRT/umrxuN/KHs4F1vXvDSCGOLYsWvMyewnQxtID8=; b=fCjnLsQ/g23ip7p7
	oBu+yycb5ND+i81+X9WRkdQWA08JR4L5yOXw5aeuGQE6c/oLdeRYlDn6f/EGKlDt
	W99a2sm91LJ/sp5Hu1sqFS9YntrWh1yrFdkywUpD2uGa9ML5pbH8iOHUdZv8/fKM
	YooEYIDLEwcA1iignOtMKMh7h58yTQEQJvWrViyezdAsQODRwoCpMFFVk/j1eZuv
	V2Kcm7ImvvwPLOG8N9F58VcamlnEviarqp5XgBrGVN0PUAhAQPnSelfdNBeWZUzq
	ojMYfNTd8C5t6MYtCO4J6UnjBpFaCZKIU690IkWh4qSjhqt2KChBchMArhPzIKhh
	ccnwLQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efux55p4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 01 Jun 2026 06:42:59 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d98b5a68fso2203066a91.2
        for <imx@lists.linux.dev>; Sun, 31 May 2026 23:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780296178; x=1780900978; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BUoRT/umrxuN/KHs4F1vXvDSCGOLYsWvMyewnQxtID8=;
        b=hZa1mDiW2EUKI857fFjHypcfCAzhjqOYnmS4fkbCbjox+nbRRXLsRALGObvYsakZ5y
         7XCpnchxTO4lNgvq0vAeiFj3qQHYqS3DDLlgpkpqQ/OunjSk3weagKaeq86/wlEv7d6Q
         7BIkNFho2iObho0FVp6c07QIV6GY6eVbX57XbFm4irD852YdLfoWL84BJS18e9q1LQKB
         /FH+k+0KEMpK4GIk6Dfcly494Pu9G5DAGrSR5Xnv05J3kxKmFQ4t7Vc7h9EMD7xQkUQp
         FoMB0aT+UWxCXwl852yZmUu78WQ8oAyA0mYM8Wgz7axlsMkD9QPeDJcngD/ZF5tovKPG
         M8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780296178; x=1780900978;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BUoRT/umrxuN/KHs4F1vXvDSCGOLYsWvMyewnQxtID8=;
        b=cuS3lmFVmyKnAFAZAxerl3BqeKp5B7qcC1V3VvP9XdBAbbmRaxGgFPlmLGloWNvxJe
         yF1axBEexVgD7QJNwToyKtc8ZHiim2scfXx8GdXs1LzfKivjYdSpx52rPgVHcfZkuQ9Y
         wsMnSeubWdHSvWwE4SReFYigqC8KXnd2ENBP/QeYAIkZM3Wcqs1Enmb2NEyXz7g9O9Hw
         Jx6JMMaozoK19LQwvB64D6/LIo4ZjSTWcGF7WiGZmGR/vFMpoyGPoZ97MQCRMqicX4W7
         02ogiJywtoQpT+Pl3oFrTz9zAYZoZgI5lyxDkS+QcOSUMtbxeIgC+i9+aqFtGGZSMJAd
         kzBg==
X-Forwarded-Encrypted: i=1; AFNElJ89Whopnuv24fJDL4bODD5+Xa6IV3USzY9hX9UyNOtoHloVMyxW6XXZCTbzujqa1JekJhU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxh8siQjBAg3kWWmic7kVy/bRZHPW3QiMNL/Lkwf8V0CfWRwXkJ
	1dyzizc2uVeZF6MM6Tis+nXxh50TssS8NATJ0NNbAgP4pzTFMkOKZb+JHiv6hta/EaoTm/T9LKd
	/fpceDtW4gzJ0XitidtxoFpbhpqnwXpf8oqLFuSvlZvvO5AzTinrJqB4=
X-Gm-Gg: Acq92OFdCwPNDMoGhm4b0x8sAtCN24/FDbcJ0jal2N7zOJqRmIW5Al8bssQq6/4wmK9
	FGwFqsSYbj3cym5dNgFPrkD7ia/o7MqN+iww+I/LQ5LORaaUmLDbJHoN0gW7pLNlByhxtcyLD/x
	X879haoNQUfTGsb4uncsiZiR1SdZsBMqhKTuSY4rhDpAAAOIpGMFOACGDsFAgmBPTBStA//vqxw
	4iBIOH0Z7TaYJ4G25BFnb6ZwbQLIU47d0aypSvX+9JCp1q+denqF6chgrcVDKOBGMc9NW+wGhm4
	6OYTJEV5hQnPAtBefjEy8gezkgNr9hQdlkS83VE6o0G9nyTksP7GxK7v8W4crCnoqGXNPakEZG/
	bS8dV2Fcgrfghn9JRO2pMJWynm/wBxYIzHrjjH60NtBugU+uu9x/nVRgBj5f05Q==
X-Received: by 2002:a17:90b:5704:b0:36a:f612:e6a3 with SMTP id 98e67ed59e1d1-36c501b8fb2mr9707569a91.17.1780296178462;
        Sun, 31 May 2026 23:42:58 -0700 (PDT)
X-Received: by 2002:a17:90b:5704:b0:36a:f612:e6a3 with SMTP id 98e67ed59e1d1-36c501b8fb2mr9707531a91.17.1780296177992;
        Sun, 31 May 2026 23:42:57 -0700 (PDT)
Received: from [10.206.103.106] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc65e7afasm11934608a91.1.2026.05.31.23.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 23:42:57 -0700 (PDT)
Message-ID: <f7403443-3c0c-45d2-8235-46c70883a296@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 12:12:49 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH 4/8] arm64: dts: qcom: shikra: Add CAMSS node
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>, bod@kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
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
 <df00e8d8-21ab-415f-815e-608eb7ab0967@oss.qualcomm.com>
 <23d2a824-e894-4c26-8bd1-02bbb8a7c6d1@linaro.org>
Content-Language: en-US
In-Reply-To: <23d2a824-e894-4c26-8bd1-02bbb8a7c6d1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kfG4jRSBXPTpbxe_m27SEaveIT-pMivZ
X-Proofpoint-ORIG-GUID: kfG4jRSBXPTpbxe_m27SEaveIT-pMivZ
X-Authority-Analysis: v=2.4 cv=BdnoFLt2 c=1 sm=1 tr=0 ts=6a1d29f3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5UiWIToyZdRRPDun-cEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA2NSBTYWx0ZWRfX6zzRVgLt0kSY
 uhuhBhJNY9w6nlIZLkPC+bKoro2quEcVT+q09nk4N8yvvfBqClyk3Kvb6AFB3ytt/hMmGBF2KOR
 mAKjvQc2htOKRurGi7KfTfpZapgiRJFqYobAyb+WJpCrajFAzXCI0DFT1MiZl1vl5Jp0SroQO1F
 7+DyMHzJNoKmUNvzz6PJLq5GGTRDjUaxNg/Pe9K3CAZ1bZe+zXupvFIfm/fiohQlhsIvYkz8DD3
 fFEomDS7OxqJBN9MWw+ddnpmqVO4q8u8axowwWLoynETV7iIj6VE6Hge3TT/1aKuT569FCjDwnm
 JQJBks73oUrhysDPr8ENX2yTga8KE937VYqM8qVILSgWBkhsMO1dg7y/Up1jWh54bKfrmFsQNpS
 eVvgm1A6oIWTs7PBo+5gxm+F2Cu1+oW/I/WW5He+ddYSaN8iGFHSHAkJWLAyJ+WKBNemT6vvlnK
 l5FQVSjFwUo/c8CQCNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010065



On 29-05-2026 20:28, Bryan O'Donoghue wrote:
>> Regarding cdm iommu we have excluded it as we do not use it to program registers as of now.
> 
> Which will be a problem as soon as CDM is attempted to be enabled and yaml changes are dropped upstream.
> 
> Hmm then it seems to me that five is too many for Agatti's IOMMU set.
> 
> I'd like a number list so that we are discussing facts instead of nebulous hypotheticals.
> 
> For both Agatti and Shikra.

Here is the full IOMMU SID list for both platforms:
Agatti (QCM2290):
- 0x0400 0x00 — VFE non-protected
- 0x0800 0x00 — CDM non-protected
- 0x0820 0x00 — OPE read non-protected
- 0x0840 0x00 — OPE write non-protected

Shikra:
- 0x0400 0x00 — VFE non-protected
- 0x0600 0x00 — CDM non-protected
- 0x0620 0x00 — OPE read non-protected
- 0x0640 0x00 — OPE write non-protected

Only VFE SID (0x0400) is shared between the two platforms.
The current Shikra submission enumerates only the VFE SID. 

Should CDM and OPE each get a separate YAML binding like [1], or
should both be part of the CAMSS YAML binding? If part of CAMSS, 
please confirm and we will add their SIDs in the DTS in the next revision.
[1] https://lore.kernel.org/all/20260508-camss-isp-ope-v3-9-bb1055274603@oss.qualcomm.com/
