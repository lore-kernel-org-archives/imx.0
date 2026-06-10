Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9557403AF6
	for <imx@lists.linux.dev>; Wed, 10 Jun 2026 13:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781099313; cv=none; b=RV8dZb9tpT6D6e5e7qwUh7BmE2SLyqtQvq7lVnP4b0AVim0Ocm7+XEqy5CCumc5ava9UIgr+eQNK95z+Svg2d/DTCobIFFgIn1PnRiiBGxx4s4tLfOGJ23kvRsz1ojaJs3yDdhbSftYbUYuKewPnunZ7KRRoChhlV/UpiOiNLTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781099313; c=relaxed/simple;
	bh=bUpiHSAIALXiB2BHU/s8NMZzGgYMNRJvgoquxwx96wQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tZ0EIM4YGq/TFZooj1O3N/2EO7bjlD6eobo8ZZ871QpBanZ+0bnsXdd8DnxpfhBlSua3aO8aGJdP3h4r3MibSRGhtoH4m3HRwrC2mKYaiviU71QnB7gcU9FWSpftk85Ej/sUF4fh0YBocBjddVXtn8NbUhzag4WotFdwCRA+Dfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K27YSiHd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TzTrx7uw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K27YSiHd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TzTrx7uw"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBtLV1169916
	for <imx@lists.linux.dev>; Wed, 10 Jun 2026 13:48:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1t3DKnJLwN7pmQAaW15e3YyxivpxU3KsElLN9yzYDj4=; b=K27YSiHdh9fr/8jn
	4jofhsStGwSbgnREcY6FOyrDMEq8+oO+uXZVHfPtoQhHHedIvepbL4oBMj9Rexhx
	IieGa09kqmZ3iIGvaBHCa60aWgj79CgXT1zvz2NQpO59iQ7veGLxXvdHzW7EsILY
	OT2zHXZLBTtm4BoIq/ZKH3F2w4ev6musmd1KlIHqm5FZtXsyijos8ZZKJxBTfAXT
	fOci2S/+V/HD9aM78jmYDoDeoHfboLFWu1o3SjEu+zlSIT0zuI+Bd/UyV52UPbmN
	ipSyJ380I8pXtEGko2r2o14nr2Ji9smkjWJK9YmY+3qO9LLuKe7ca99LmxdO6LBm
	r8/MQg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq4w1s2n4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 10 Jun 2026 13:48:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0c36f4b76so78023495ad.3
        for <imx@lists.linux.dev>; Wed, 10 Jun 2026 06:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781099311; x=1781704111; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1t3DKnJLwN7pmQAaW15e3YyxivpxU3KsElLN9yzYDj4=;
        b=TzTrx7uwuP4vsFJyi2sZn957Y4OTGX9ThbGPcxiUkS+A4w0jCBz1ETKejylgll3kEg
         9I3ZvjJ21zGLzzN9F3XrwT0Wd+60RyUPTpATJ/z7wLecZ3ddclySTNnHz0LZohK37gIW
         hFFgp37CC4p17NALxK5qZRfLXt25FdFJnb7kkaJoAsmi6kS3FRMQzYxOUgOCh6wcJnue
         knOU2cWeHV+rpBdp4q7VWw7vtk3DJz725VZOtGuv2FyF6VixPOkM5y4H46spA53fFRGZ
         pdUuMNwlmmw6baybBYzia+ZChZAlrhCuz2Fa7QinpCl9FNvZB09PAFEb5kK71x109/BR
         MZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781099311; x=1781704111;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1t3DKnJLwN7pmQAaW15e3YyxivpxU3KsElLN9yzYDj4=;
        b=h3P3+Qw0yFE1V6wXhHe+mi4ZvRmW9eZ9Yh6Xq1y+oIp/MNQaz8ALS34JEe4Q/nmFyz
         U3xIP+wryb/w8o2aajZ3IXQ/gdJJ7COu52Mqldq2Zdi6mRWcvHeM2E/J0bmvh5K1oz7I
         ZgzGghvnlFHos6zK68PvV5HJVGAuQKlhNrYzOetTSQO1H2M3YLVDVwZO0HlpfaX2NJcX
         xc4C2smto0UAoy7uT0MPOvNOvAWWouFx6rgCI+xALJ29w8JPKnqjX+G6+UynPJEegY+r
         lqdNbWmG3aMCiN6a9EI0rv7RyQrUCrZEC0vo0Q+a/O23NnwxnN0jkWKvDrW2rKgVatp1
         342g==
X-Gm-Message-State: AOJu0YzcltGqqnYtEeRqkJVZcrHNlNmhaeBlVUzfllYyRdP/rtBt8oIS
	hH6OVX7r+WwbFg3/nNdKG2BItu1EAh4qHYgwJfWBxqWlOdDn+o5M1XPUd8pIsu1hlnOBQ+32W79
	ONSPYOyCJnzsowjUZI5vlkOLtii8Go2IgUCSRRb2WnMQB0XpMCc7h3EI=
X-Gm-Gg: Acq92OFp02O3iUo8+gISXUsep9j3r0rf/vBzbdUMomEpivI8L2c+yTS+DImsPAwjEC3
	5mZatFv/SoUKxVqqboaVUnURTIAVHvu+fberACRO2SXd5CKvC4Az5OmUbnIi5X08tL0AXj8J8pU
	XHjhEQzRcWZa6fAUaGBu9nEwl9WZfRrs4/eEHkHfR0t6rPlDyAo71Yby7dLkAzGlNLf3ebM4Sje
	2L6Nqg4w6wnIdORjZ/2jRYVsfZKWSJ2fED8L0SOjerc0bdyMoTe7HK3q3+a5vfTTOe41HNxKgK6
	O4/76DHmDOMBXfAcXYTtwTr2XioknCJobknPdQGRA3G+WmRvnCPbqXnUWsA85YnPlkvv0Cn+d32
	N8LRgo9m/cvTit0z/9mvlY+ydexjqexo=
X-Received: by 2002:a17:903:1205:b0:2c0:e5ee:f55e with SMTP id d9443c01a7336-2c1e80f9b57mr295502545ad.7.1781099311380;
        Wed, 10 Jun 2026 06:48:31 -0700 (PDT)
X-Received: by 2002:a17:903:1205:b0:2c0:e5ee:f55e with SMTP id d9443c01a7336-2c1e80f9b57mr295501975ad.7.1781099310778;
        Wed, 10 Jun 2026 06:48:30 -0700 (PDT)
Received: from [192.168.1.11] ([120.56.203.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609df6esm270319645ad.48.2026.06.10.06.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:48:30 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        lpieralisi@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com,
        hongxing.zhu@nxp.com, l.stach@pengutronix.de,
        "Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
Cc: imx@lists.linux.dev, linux-pci@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sherry.sun@nxp.com
In-Reply-To: <20260520084904.2424253-1-sherry.sun@oss.nxp.com>
References: <20260520084904.2424253-1-sherry.sun@oss.nxp.com>
Subject: Re: (subset) [PATCH V3 0/8] PCI: imx6: Integrate pwrctrl API and
 update device trees
Message-Id: <178109930423.8833.16452944960716589912.b4-ty@kernel.org>
Date: Wed, 10 Jun 2026 19:18:24 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: CrFq2Esoax3P6Uvmo0TC6oWM61Glncle
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMiBTYWx0ZWRfX98zEzFYT3kr6
 YhywPOsOQVSx+E87xwfcrEoXzQs9srJ2M8VLIH1u4Zw3ThIgX6zG957NfWvSG57zJCNJbTWonwa
 aEdgYt4xF/Io0wnw1iVtiQEu1WfLUBMSjiAAT1osLATSoIb/VExcKscY+Gd78LU47LDxa2wqcwv
 pGp1eRviGQIpJLBHUBAp4+8poczwogZlSoiTKE95iSP1qUXdw3iE+LskB9uyFREcdLUqoi++1af
 qbvXrtVCS7gJAl9zN9f9rL3pfT+WinNm140VOMWwYyBpNS7RJVl2O6EmomodHvQuaFi+79gm+GA
 0cZ/w1ZzTNckyHZR1/SXxAHl91Y7yCHhXWtyLEW1VgSnQ2zewRtAj1DgHlMAtZfsY8IS6AtzKO6
 AcmaN7cokm++ATZt+izyk2fv2e2ArQlJh3NoslR1qO08QQGaNBVIpJIYVu1gJpAIg1mJcqzUIII
 6Q77rZS5NZ1Ef9PNQvg==
X-Proofpoint-GUID: CrFq2Esoax3P6Uvmo0TC6oWM61Glncle
X-Authority-Analysis: v=2.4 cv=ZfEt8MVA c=1 sm=1 tr=0 ts=6a296b30 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=eDurORsI8St+1bJHqsJewQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=8AirrxEcAAAA:8 a=VwQbUJbxAAAA:8 a=GUrLWBD2z8Uwe9ZWfuYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100132


On Wed, 20 May 2026 16:48:56 +0800, Sherry Sun (OSS) wrote:
> From: Sherry Sun <sherry.sun@nxp.com>
> 
> This series integrates the PCI pwrctrl framework into the pci-imx6
> driver and updates i.MX EVK board device trees to support it.
> 
> Patches 2-8 update device trees for i.MX EVK boards which maintained
> by NXP to move power supply properties from the PCIe controller node
> to the Root Port child node, which is required for pwrctrl framework.
> Affected boards:
> - i.MX6Q/DL SABRESD
> - i.MX6SX SDB
> - i.MX8MM EVK
> - i.MX8MP EVK
> - i.MX8MQ EVK
> - i.MX8DXL/QM/QXP EVK
> - i.MX95 15x15/19x19 EVK
> 
> [...]

Applied, thanks!

[1/8] PCI: imx6: Integrate new pwrctrl API for pci-imx6
      commit: 85c1fcfa740d4c737f5575fc7251883e54227a51

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

