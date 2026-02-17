Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2205298987
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 18:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771353060; cv=none; b=GylBGJkIhP/dqw2Qvcq17X5gej7keNB0TBUMtRrPlCz7b15YLThO896LCGwZlBW4H1IMOuBr5RtLfx61HXWE/y8kflbSXbsb/ZPtknu5ouZT4C2zBi5oOllEYi1RFW1E26tUjuqpErNd/CTwGl0W8e9a3rvRUbkpdX83fD3m7u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771353060; c=relaxed/simple;
	bh=x7VepQbv4zE0qSIXnc719tjSDUvFwelQPfuLaSK8vFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=efBatseiUtOmCbqpTdbiYkCE/qTaeyw0Y8uVzPPPz3lMmJcsWv+ehw3zlg/b+M6GUerVo3cqdPUJw0xcB/1gzn33+jEOzQYsMZpk3t8/+7xIDwHJyUXR4phZohFYEAw7PJdCSFCs6T28QKF52tYe/49BkR0Xy7+sLWYRNa7/Spo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ikqywinT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DyDojeDW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ikqywinT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DyDojeDW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HEJiOX2112094
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 18:30:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iOD+nAdpJf1uzrUdiNFRB8KZ
	FSJpSBc7+kYwsye2bH4=; b=ikqywinTuKS2fa7esxmRwIAfZa+/VkzXtkVep2ZE
	n3W0IiiKCI09Rb62+jl4GeMZ26ELYqCT0N0tftBYfFXFY6+QDOChej3a3Mas2yqG
	RCWvYwNHtKP8wqMmjnMwuqhJ0jx07dd6QsxLYoJ0uu2odhj0s7dAhZSEwpzVp7If
	Gm2HYurPUjh+dI5jivTFtRpVCSHO7NVSVLi+M70EWGHqBLmnoIAjJv1eGt4MOfwW
	12tPNDU1QGg17uQH/6nQvRUUxrzVABxih+o2KKiXgPz9ZpuQgiGGaQfqGiYxBL6k
	JWhHk2noSB+Emfs3YUqPqzrTHWBo+7C0zuoERW3bxCBhRg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cchv4j6qy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 18:30:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aae0d40a47so218502875ad.2
        for <imx@lists.linux.dev>; Tue, 17 Feb 2026 10:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771353058; x=1771957858; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iOD+nAdpJf1uzrUdiNFRB8KZFSJpSBc7+kYwsye2bH4=;
        b=DyDojeDWbzabdLbQp13s+AyE8aUYmYPCWn1xR0nKd8qnwuHn5wFBkPQK4c9UEy2Aq/
         xjpO7JSl2qr0OHdrIWX1ACwi/J2V8xs6CylbaR+V+WTngS/zSUOn+ESZeU3rnillWmJk
         9uFobXaqFBuZ2rVqUzK3op2X3B0wSoEAgExtkaBaDRQFKlO+6ZFT8PuSk270j4kgsr2A
         BoV/cIfq4MSse4DdEDCv43iXBbqXg7++RwnOdWfz/hA1m4Hbudxb58envbiaQBoFZ1eo
         W5laC+h4DWKQAq6Rr39eisVxh7X4mSasxf1Ec5KwKAaoqZ1VRMDERn4atHRzEYI3EV56
         fgQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353058; x=1771957858;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iOD+nAdpJf1uzrUdiNFRB8KZFSJpSBc7+kYwsye2bH4=;
        b=DntRt/6XyfEmQbccs+smTNZfleGIxEZ1WVztNOcYmtfIUWLjm6WcATJcsetqTTsQ4y
         ErbYpZFJSrRoBiplCIzYZnIu9p6LGnixnR8EdMr28/KgSG6D0cFzLipW1eRVfV7r8XAd
         qiTEkr7TALeB7EGBPAdGcjbkEimzm5kFETNmVIR5odyyhBhzv2F6U/34h/EsGqP8+haj
         KLsRdLC5KXq7XVN7bQbTXXrNbqYeeQOGNcsITzQHI0GcH7EVEhffq+PN5YKAry6UTID8
         2OLtZTBR/pprkHx6igdDmb1/KIy3/CbJLi/rN67qEE8A5dZAXkO8LnJUU2BH0iZGmcFX
         vykA==
X-Forwarded-Encrypted: i=1; AJvYcCU6gVU+S6yqHgFCRu03thPMfv9nAzqSynhGN4ejMNPWoFfx6F1VUlxDDI1qqoIACJTkIUc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzXW+QdLLUB1mA5jzit4BwupPVkMBuRcs4n7y1vplv+z4j/Xevx
	N6/+PHytz89EKYUgWctod3n+Hh0nIDizND+hYIB2TkXRu/hUKv09R6RyPH0yCLXlU+9SbOwlaw6
	I1L/j1N7Xm3yhp1Aj+YsUMKhersx1ez1/+6c8rwbUPStQwiqGcX8uP18=
X-Gm-Gg: AZuq6aJYqwaLA1mKAuGWh/vvSQa7r1oj/9oTuJVprReJ7U56sLd2Sd8EkYDdp67vhSD
	YzflVT/mJu8uGEd1X5THhWSfmSefpqPHrqjicgdP3Jcl6WCR3wms7aE5SNWkuE2U34p9KSOmw+s
	p+UiltiFVTcDLKpCKwNM/ep7GPut49+6bf7VsbiFMaSxYY1jHcp4X27ZGyKUUs6LbYQVwVauOtS
	99+mnTJX/NttLsqbmCQr37RRZjAObyW/l1v1bIeH2eWaQxKQLHAzpXyaUiXcdWtNzVNjh7z5Ne+
	8njXgqeRp9C7KL5H0t4OYFyFTSuAMLBxpBUDyJ3345avqcjO/djxBe8zLcz5JLBCsp0PfUvaXWj
	CtEnZsq8ztAGLkQCjSbrc4B8khRtycm8aJ1I=
X-Received: by 2002:a17:902:ef45:b0:29f:1bf:642a with SMTP id d9443c01a7336-2ad17433468mr128152185ad.12.1771353057878;
        Tue, 17 Feb 2026 10:30:57 -0800 (PST)
X-Received: by 2002:a17:902:ef45:b0:29f:1bf:642a with SMTP id d9443c01a7336-2ad17433468mr128151555ad.12.1771353057241;
        Tue, 17 Feb 2026 10:30:57 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a72e444sm115401545ad.34.2026.02.17.10.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:30:56 -0800 (PST)
Date: Wed, 18 Feb 2026 00:00:49 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
Subject: Re: [PATCH RFC net-next 0/9] net: stmmac: qcom-ethqos: cleanups and
 re-organise SerDes handling
Message-ID: <aZSz2Z5Ps47XrcHf@oss.qualcomm.com>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=eYAwvrEH c=1 sm=1 tr=0 ts=6994b3e2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5Q1s3vWhG7-J6-f9QwIA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1MSBTYWx0ZWRfX7QFD6ihBHl9v
 LLuXyu8OG9tUf3XTu5dre+qGOwR79FYR1x81vG6bJctDn1Gl4pZkMXNl6aYWfPhWTNS54OgxzXe
 WNJaTUC7JjdDdiTCApLa1DCD9KsNZyFSF5N59bQxJSaZuT9188CHveN5nvRHxepDDE0nTNn3Onx
 2FjlyBx+kggkbJ2y85ypIToXZQIksqyuZKzVPIXzIJPgrXPmHqcfybYI3iKFbU1ZAzZkpz/CLLO
 uj4Dp+7eQkYSBWpv4udU4DtphT3l50StR97l5G8QvBupx8eIKlTQOeDDh0Ld9yeodTVsE+L9gwS
 ILkoEP/0yZHaAoucXW4PTirXz3B9pBCjWEOFFxzrpQKzJL9EeUeyP7csg+vd/BZ4hVzSMHVv0ez
 A7CVzTfGjYeuU0i0HDmi6Bcqia9UhNTAeWL0f4nEXEHBhCwfXpkS56KySIP6vMFXQCpSJMmz5Wo
 NqXLtFC0qeBLazoDtqw==
X-Proofpoint-GUID: cj8Xshwgu_9lIJHkMaQw9dsIiwgMqsdh
X-Proofpoint-ORIG-GUID: cj8Xshwgu_9lIJHkMaQw9dsIiwgMqsdh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170151

On Thu, Feb 12, 2026 at 12:09:10AM +0000, Russell King (Oracle) wrote:
> Hi,
> 
> As the last series had issues with stability, I've changed the approach
> in this series to concentrate on keeping much of the SerDes related
> code within the qcom-ethqos driver rather than trying to move it out at
> this stage. This means it should be possible to bisect these patches and
> pinpoint exactly the code movement that causes any instability.
> 
> This series starts with various cleanups to qcom-ethqos (the first four
> patches) before beginning to move code, passing phylink's phy interface
> (which will change) to the fix_mac_speed() method, and then using that
> to configure the serdes and inband setting before moving the SerDes
> code.
> 
> Please test this patch set, and let me know whether this works, or
> where it breaks.
> 
> Thanks.
> 
>  .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    |   3 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c    |  11 +-
>  .../net/ethernet/stmicro/stmmac/dwmac-loongson.c   |   3 +-
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 114 ++++++++++++---------
>  .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    |   3 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c    |  11 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |   3 +-
>  include/linux/stmmac.h                             |   3 +-
>  8 files changed, 90 insertions(+), 61 deletions(-)
> 

Tested without issues on:
  - QCS9100 Ride R3 (AQR115C PHY, 2500BASE-X) - 2.5G/1G/100M
  - IQ9 EVK (QCA8081 PHY, 2500BASE-X) - 2.5G
  - QCS615 Ride (KSZ9031 PHY, RGMII) [0][1] - 1G/100M

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan
---
[0] https://lore.kernel.org/netdev/20250819-qcs615_eth-v4-6-5050ed3402cb@oss.qualcomm.com/t/#ma85cac924488d580b971e6477e7df30dc7e48045
[1] Ethernet is not yet enabled for this board in the upstream kernel.
    The changes from [0] were applied locally to test this series. I am
    trying to figure out how the board deals with RGMII delays so that I
    can revive the series.

