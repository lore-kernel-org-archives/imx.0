Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E732419E839
	for <imx@lists.linux.dev>; Tue, 25 Nov 2025 05:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764048999; cv=none; b=Wrhj03PctnSnsF1slS8059E+B+yGvZ7405k+LgEbSAUZqX96DsXB52oF8WvX5KRseLvrW9/lh4MaNQw4i3KtknxIM1iapxBtFNLeK5Um4SYmKuDn1Dh6JDkHz03XF8R6Nza6wjTohENvBTlacnywPoDgnIA7vz55sTAIhgTZ49Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764048999; c=relaxed/simple;
	bh=h+VdoSv+Z2zrctSEadB3eFcSmZdj23PbErSScnq1rEo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=O0g+wA530fe+GQJA4Suh6v7IXbB7zeCWUNuA/jwuxx/q7VLhGkS5wFU+Gxloe4NqscMEAMQf7ZAkS8hjhS1k+Y76XFX89GY1PxRxikmVTy5/V97LU25Vy3oH9DQ8TwOYhtxgVzn9CMJ6X1ZFItpLdvePAcZ+TldPY46xlUlIlO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZSvLUA2r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HMjx5UsF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZSvLUA2r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HMjx5UsF"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP2gent2148645
	for <imx@lists.linux.dev>; Tue, 25 Nov 2025 05:36:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K2IEBOcA/PnX0xEHWPoSAZx6P5pC0fIMY/puI/SdMtU=; b=ZSvLUA2rl4UZu1SH
	mZrIGQYwS5dZaWRh9xzy4HXt/hDHQscVl0c4elvWZmNGRQKXMngaHdI4BJefE7Uy
	RLBeuj4OoyKT9sX9XuH0r9tBTKR+4M4psYo8pXIsve0ADnFOW0XYfFXSe1ybFfkX
	0TR395KUIX28faoc0epgemvVRoGf+bpbgFec6GaIQ3BlhUItACv4Y9Z/1kJl8lan
	THc5h+faNJABnlX5sPDgJMJJuOWEJKcWJ4sWHUzrDzAVtW8QNNycCJbrHzY/VHXZ
	zNi4LfawLifPDrpyighABVuYSlkCuOMxXebUwfFI84h9TKt547/SWdD/jTIjg1Te
	X/Q/tg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amr8saewk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 25 Nov 2025 05:36:36 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-bd74e95f05aso2848866a12.1
        for <imx@lists.linux.dev>; Mon, 24 Nov 2025 21:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764048996; x=1764653796; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2IEBOcA/PnX0xEHWPoSAZx6P5pC0fIMY/puI/SdMtU=;
        b=HMjx5UsF/I/93nPg3kodEeV68Sci3B2kbHjOLmyvpYThst/mQz4OXLX+8ous+Qh6JI
         yMMKzwTOqJL14Jzt9CXui3QmwwufTwaOX4qnThKnUumqlazR63R+0cX6N+daifwfmoIO
         2jGL5UNM0LjQLTijbllAGTE4O6CVXaBcj8TvUWUdPowd2V9qHfCtOFMC2ADDGhEZhccS
         XCvO5uxGA/R3bFPrilWGYj3l75BU3yxmSrrKJ1aR+s+4ujY8L9LJhbtGpSa07RKICauG
         UeAsRXkK+k48jFgMCyunrqEve/222g84DMeOcMclhzdLPfZXYoACjxQca9077nz1HjdT
         sykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764048996; x=1764653796;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K2IEBOcA/PnX0xEHWPoSAZx6P5pC0fIMY/puI/SdMtU=;
        b=YfamswGrtjS2VhSjnw1qcJhZFqibRrBC21WA4XP8GBdNTejeWntdcIK3DiJig3YSIM
         8rPWH5l6Vysuqs2vaq3WxT/b/G/C3AF0NyJJyB2d0qUo1fxitaW9Ht2saxDpjlsenpR5
         XJYQfIZa9MigatR+aLKux3XEKxzN8AFEHiq1cwHjBmj7RaUq/X6f9hNQMFxlOUffMqMN
         oxrGGbeeL5qYLYwbOH/WtAVU4wYWu4JYCf7R3d59vDMMmo3+bYpMLjteAePlOrfeRnlB
         s2i4cNU1Q1/f6Jb9pOf/rLRpVMwMr+3L/cH/Cd8wQTT6LCQRQfUizxaJuY3rNKpuxhyV
         bJiA==
X-Forwarded-Encrypted: i=1; AJvYcCWDqUU3uNOGjSHDrQlBSR+k/ypcoaXA0n0FywNFXz9B5bvEeJU1pXdf1pyjvzBwJgphPOc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9MPl3HC37gxrRH9hoEwwteLo1AWDkHP9hVOxmzkz0vvbGi5Eq
	utpCYVAyL60jtx3uICvPM0P7jcFMRLEc6Gs6eGedLSF2YuNYHGCb366iasBKJc6eeCoL34wXv1R
	a8ufhDV36oZzqLGF6044KVD/vBiMJQUigi1XeW37ram0Fbvvw5z/0NIM=
X-Gm-Gg: ASbGncusfusbiZTLnImVh0aQHEi4CaLuO8uHYTSYiEh4MgCE9FCOPJFKqKtlRfjgB7B
	EXVIRmVf08DcX4sLBUDUO9GwVHwFbGFXM1bedUU0xt8rQ4fexpAt8vNGQZ5keYkGd0g+Ar/0TiI
	eOm6tis8ph1Wzkr/MoGrp5SolV3QtzI+91BX5SZtqaN3MY77kJcqQTZKxdlhrED1cHpERLr/sDZ
	YDfUEqnA2rpVFQ9hFEHA31hOu+Lnwhir8KRZ3zMrEu28QbbW/fwQEc/4syhOYZWz4S7uifVM+Qc
	KpqO6ztaKSDTeL2b6KjQl29Mr8JD5hJCyy41cuuOFubNsuyoh2l441x9+ZOwpOhkNg19u3t/lm/
	i2vZBefvwmg==
X-Received: by 2002:a17:90b:280a:b0:343:43bf:bcd7 with SMTP id 98e67ed59e1d1-3473345bdffmr13896332a91.13.1764048995908;
        Mon, 24 Nov 2025 21:36:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxgaDNdfNEfhXZPwt2DNVay84SPTVRR5ocAbrQwMZt47vcF3pJ96a4PxRWzhqq/3ZJlT+etw==
X-Received: by 2002:a17:90b:280a:b0:343:43bf:bcd7 with SMTP id 98e67ed59e1d1-3473345bdffmr13896310a91.13.1764048995405;
        Mon, 24 Nov 2025 21:36:35 -0800 (PST)
Received: from [192.168.1.2] ([2401:4900:88e8:55c:808f:7bd5:9774:52e7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3475ea6d780sm452943a91.6.2025.11.24.21.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 21:36:35 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: chester62515@gmail.com, mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com,
        s32@nxp.com, bhelgaas@google.com, jingoohan1@gmail.com,
        lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, Ionut.Vicovan@nxp.com,
        larisa.grigore@nxp.com, Ghennadi.Procopciuc@nxp.com,
        ciprianmarian.costea@nxp.com, bogdan.hamciuc@nxp.com, Frank.li@nxp.com,
        linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, Vincent Guittot <vincent.guittot@linaro.org>
Cc: cassel@kernel.org
In-Reply-To: <20251121164920.2008569-1-vincent.guittot@linaro.org>
References: <20251121164920.2008569-1-vincent.guittot@linaro.org>
Subject: Re: [PATCH 0/4 v6] PCI: s32g: Add support for PCIe controller
Message-Id: <176404898659.18373.12076537585341452677.b4-ty@kernel.org>
Date: Tue, 25 Nov 2025 11:06:26 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: bEtwtKNPyAL8ePLeAv8efoFH_tpz_-zF
X-Authority-Analysis: v=2.4 cv=KP5XzVFo c=1 sm=1 tr=0 ts=69254064 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=1z36L96dY_S6Ah6j7mkA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA0NCBTYWx0ZWRfX/hkz/4uBmmla
 hzPMx709x/NsC7cXJJxTTmaUqS+wY9LO8+k3ViwJq+VMuR8B9LR6lw6UKdy1ing2bybNmiBf4Wi
 0/d9b89jQBNDMwWcykG5Kh5vy7I4BlOZ3UKsHzvK6vFxjNwXKKTG0eGlsyU3/t0wj+/WUEN8+TK
 Kkbc7jCDUQxKuRJs9VvPksf1eUzhYI7t6q4snOCOK4uIxSs1o6yQTYxrBqHx1e7IYJ38jdolgND
 8TaYfHKI4dCR6j/B1lBzCaFCAyYburQczCLpZJbcdOlLTJRvidUWPxWeMxPS+MctHMO0ExoWgC9
 0aNV1UUby7S4h3Voj4p6PHvY7GV9MgH5uqTvpCNEap4+VngVpVqmeKQCejQYQaH61P6w4OMUvJk
 vZUKG2lwM07erIBETtYLl2Is0hkoaw==
X-Proofpoint-GUID: bEtwtKNPyAL8ePLeAv8efoFH_tpz_-zF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1011 lowpriorityscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250044


On Fri, 21 Nov 2025 17:49:16 +0100, Vincent Guittot wrote:
> The S32G SoC family has 2 PCIe controllers based on Designware IP.
> 
> Add the support for Host mode.
> 
> Change since v5:
> 
> - Removed relocatable bit in yaml
> - Dropped pcie-nxp-s32g-regs.h and moved reg definition in pcie-nxp-s32g.c
> - Removed a useless ret
> - Change kconfig from tri to bool because of memblock_start_of_DRAM()
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: PCI: s32g: Add NXP PCIe controller
      commit: dd17ec3df57b7bd0d23f3a17124d59b2740d81e4
[2/4] PCI: dw: Add more registers and bitfield definition
      commit: bd1be33651b21ce15eee8fa2f080109e3eaa8e29
[3/4] PCI: s32g: Add initial PCIe support (RC)
      commit: c403d6d7282b72fe1a0812c99beeeefb1a7e1f4b
[4/4] MAINTAINERS: Add MAINTAINER for NXP S32G PCIe driver
      commit: 58fc675c34c583771d412aa89fb364c750fadacf

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

