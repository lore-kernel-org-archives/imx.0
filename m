Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FDF29B8DB
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 18:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771353624; cv=none; b=lnPwfegRT8leqCT2ijW7dLYVsDwmE5Y3MzzSWta6XmKMNYLu8dK72fAwTe4ySsfSTrsS28qtljok9TCRWXYwibsQJcDEGisnV+/DyQ2736ZPDck+IIf8h2AOY+490swNyN5VufcrM90dJILxqX0ZMW+4r+kH0IrPq0LL8QAiwkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771353624; c=relaxed/simple;
	bh=gL7vi8XaDsR6AJUOsYywCadvZLRWfiPCMGRL+niCQ0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RHNfFG9iAzJsm+10dU2pjqXZiVdgCYPc0dGdKFwVwd1is36zbI5/NCJgKGcsarav/aDbhlI010hq6AgcySN/Ljq/4T6TYaaKta6mJFbqIubkd18dyRPw5MLmJf8iOjF3S1P+Sil+M41QbtmyLxtnbHHOI0bj2mzEf4aUgZ/YuXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JOqpjRYu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O26lnZYp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JOqpjRYu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O26lnZYp"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HGFDvs297034
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 18:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4eqYZw+qW466/zd9o0hZO+Wr
	bSIyZjH1x8DDDr0yC84=; b=JOqpjRYupn9Fjgx6aUFYuSq+vqZrEJFB2W4Spezz
	aaDKrAUMKpj14T1ZnKXaGfIOTd50gSSYLFNaayjCIu8h+Io4msOmYBioT6cth/PS
	+IA8j2gt+eG1CVUxqloETCK6/njQZ6CEraP4BXqF+vjbp2kCm5thAOSuOTz68j5R
	ZFgTam9zOQR6DhCgOp/GruFXMeVTGG7NzsA+XtMmrfvM+/Qnwlv572y2zyEhNZst
	H8B8N9SGwgLLH14/wzcjVK4g52PIEc7SZWX1l8m7NrfqSN6VKftAGXkP23pmqy1e
	4e9vR0BdxdkhL5ZB12damwFeE4YLYzUePkKd13oH2Cn7MQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6a9uhsc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 18:40:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a77040ede0so48782635ad.2
        for <imx@lists.linux.dev>; Tue, 17 Feb 2026 10:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771353620; x=1771958420; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4eqYZw+qW466/zd9o0hZO+WrbSIyZjH1x8DDDr0yC84=;
        b=O26lnZYpmTnCsdTfvGDuCm4oNh16OU0ICzt+31LXNRvBFNkADxU18GiNYTCBziPq4L
         fgFa0352UoaUOJk+DhZz4j/lS0sXkNFVHvCi36edO7MJHO48QcbeLJPIHmNsYbWABQfH
         QPwA/JE99muN7dP7Lsij5YaLsdjvKlTPh2002lorsv3Gk1fqJmWt0aapEpCLEbi0Gb67
         ShBLn51BKq6NSIoJoo5RlteuUxDrzCS05zr9wCFb1sK/1RNNxcYTc2LmyT77q4/Bd+Np
         jJI1C+UIr3wOGxC1clgVO7GL/ZQ2ZJgaRAA4K/Gl7VZyoeWzUXsX7A+Xqh0fmtvsEiom
         BXjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353620; x=1771958420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4eqYZw+qW466/zd9o0hZO+WrbSIyZjH1x8DDDr0yC84=;
        b=ePRhgXODXtvkDoqWirSDUX/8XnlqXlRfkCjujcCpSTKmXXJhaehNdGBp8Mjm7UTwte
         ec2p+wWNVMRz8HzsqnlUfHL4RFr4JDY2BJVpWCfaVCsHt1g1OmIzGOLdLGbTpO6xUYIM
         3LpL+xzHucZcQocN51+vrp8YDoMWnBoLFBnkh5S+eQ2obobnnq9GWQHXw/OSKi10Fhez
         kxD99Ax8rAt0WnMh+5BhI9ExjeATY3SY2TTRFAe6n31ZIRZgcx0yyWnxkfF9knW7rNQe
         J2k1Ln65uw6kJlw+nzxcNThbK7FZa4SxNQCQlthgRMyEx4V+EfwmjHOpqOLKq1bqXNin
         Is4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXsQLTPrvl+xxYUfVmTpc5eI9T6grvUihl6ChLEJuswgsnZssPe39wMN3WQ3DWg/FlXsmE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwUEIa6szRxGZwwfX0azfqzIdb+XCneE2RbdDPQqbmVdy0c29e8
	ildG9wR1E9b97PjGuM4YmiCn33y7tz3eTSPgxki95m8W8qss3b0foc/7G6IJWwdY3XzparQiecC
	r+zzvglaDmzqfb2AV7TG3RT3zVSB/qFLDDJwtu+5wOBiUGja0NUpOveA=
X-Gm-Gg: AZuq6aIaOJNW4seS58nEgnLEzkwkqjeQjlnOPDDpNZC5m0TbWXcyMIhTKCGy8bD2gB5
	6DBQi+WfHjTBoXU6i5tueZhrQijJIiRQJQdVPRFgQYCRHf0IVUgPccr/8WeYVFs/2JPksccz2yP
	wRc13tfYmjJLxElA049ijBZ+K6tm0nuGXsoBbjRvVohcL1RjPJ4akb4dCVK7VQno7XPwdzpzcOZ
	MthIO5CPnUvtLuN2PXr1sc473624X1wgQHn3F2999g5iAeS1OasswasIvlP+anEn1NDreWrDG6k
	l3I5EVeDbOCpZannNfPtJ/4LLjy8UxOlpVKxJF3ZHzi6AWmwYPfxBjciLwvyudrwdPKzchGU/QH
	FHHq3jUWjenOuifInJu9Jy3x8Dzv8q9qG+RI=
X-Received: by 2002:a17:902:c947:b0:29e:bf76:2d91 with SMTP id d9443c01a7336-2ab505a365cmr131982355ad.42.1771353620399;
        Tue, 17 Feb 2026 10:40:20 -0800 (PST)
X-Received: by 2002:a17:902:c947:b0:29e:bf76:2d91 with SMTP id d9443c01a7336-2ab505a365cmr131982185ad.42.1771353619915;
        Tue, 17 Feb 2026 10:40:19 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad416ee045sm30863535ad.90.2026.02.17.10.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:40:19 -0800 (PST)
Date: Wed, 18 Feb 2026 00:10:12 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Frank Li <Frank.Li@nxp.com>,
        imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RFC net-next 8/9] net: stmmac: qcom-ethqos: use phy
 interface mode for inband
Message-ID: <aZS2DAd9KQYHML+U@oss.qualcomm.com>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
 <E1vqKPV-000000093mr-3iT0@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vqKPV-000000093mr-3iT0@rmk-PC.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1MiBTYWx0ZWRfX5WZ99YkG7boU
 2Uo8pvSJEP2qgg0Q9m7nsa/eKIcsZh5+SI9yn3BfkPfpLV5aZedbp+COIn7MjBx0P5NFl3xnKJI
 Xe2R0slaY+lYhhTR/4iRMOQIZSpCOemMqSP0C2myBX1IMTyBIpY80nrcwcs7ATa+LmsS64cPBtw
 eGRgD+KKS/19oG3A0d/mkYPWULGgxHqwHUTwUabv6eDbXuwZOisaFTUlNhp/rbBadIXT6Hk9GmN
 wZUuS6JblTAyGgEa68m1n63ILThLTMeK/hSS7T107c36Pv9Vons4JBiKTirIo5S83WkIDy/1JNn
 mlNvorCrm6UzsQ4d4C0M1L1+SJNKpENhj6wvtj2Fah19eQUumkrUkNtuMzD7lk6QA+CZ/NmsvtO
 dnrqFG66oj/7jDt6seiZtYuacugpLMDp+saIIHvt9Djo3Oab4qzo9sAB2WKKDgqV1+gtMLbrs9v
 vV14yLrrdRTaUELAQ5Q==
X-Proofpoint-GUID: xqFDgfa34ZYN5rXo76Tlg_JJEdqS0JyW
X-Proofpoint-ORIG-GUID: xqFDgfa34ZYN5rXo76Tlg_JJEdqS0JyW
X-Authority-Analysis: v=2.4 cv=TPNIilla c=1 sm=1 tr=0 ts=6994b615 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=z4Hhns87Kg07ZqANAhsA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170152

On Thu, Feb 12, 2026 at 12:18:21AM +0000, Russell King (Oracle) wrote:
> qcom-ethqos currently forces inband to be enabled for the Cisco SGMII
> speeds (1G, 100M and 10M) but not for 2500BASE-X (2.5G).
> 
> Rather than using the speed to determine the forced inband state, use
> phylink's PHY interface mode which will switch between SGMII for the
> 10M, 100M and 1G speeds, and 2500BASE-X for 2.5G.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan
