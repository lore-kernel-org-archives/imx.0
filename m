Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B418532B9BE
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 18:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771353648; cv=none; b=oKcR4Sov2ft/OgiwCDbtOpL+OphX84Iu7K6UFyvYyGQgTYHw+3LPehUA39o+4SDk1oeBEQMrUn8Hg8wv3330XVI2yPbLyfpjB/Iz2FrGgLi4WKYc3HKqZHHx8pKuuT0exw4VrNRrQAp6iYLIYGU1Wq568aDykgPtduiyRJvVsAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771353648; c=relaxed/simple;
	bh=UvUFl9FDfuFUB4napow20tV4rDiY5o+TzrXHGXuIR6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/AAutvefsAcNnYKClL76UDHcelb8+F319ympa+GoPQNM91FvmGH3O5UhKNRdTyuL4MvQbzfzG28ArE4DgYd+5eHFg5KnEH5YCjsFXLYhrlDNSgzpKJ2+vK9q3he/l2wAjBrxa/Bd4BVjU7xH9ZFEYNv3pnHtiGOn/4Dij3w+sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Icz67uQZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EbZu8Rjp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Icz67uQZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EbZu8Rjp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HEqSkl2111750
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 18:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4QQfKD8GVBA2aksYDATKy5SS
	tCQ8N0yPkSM4M0vZP0w=; b=Icz67uQZ1w168zYFAvuoeuarGF2Bn3D6hMvtUWNg
	zmTKVF3NpQStoRjg8WUb7wjYfAQI5z2BZMpvLmLpEHs1E/Q20DbCNoBEhR0sPTax
	ze9EMQknHWmfvSyf1zda+OpzVx3KY6WCHtjl3l49nAeUzR3SgiMQoLZ576nPQ7EM
	t8kwiF7RCCl7lVzF4qpCXw+Amz+clkZmYoyLKpnbDKt1g37NcoQZX3LHu1jSk2Wz
	vk6jCWqZOgYLKWYjC6TS6Pyd8lITbPGK+9Sx6zJ21h+l0ZHxpWH2CZI9CwcXIDez
	ETlIK2eD9FTSwSqfXkJxZtqsXnZHIrX1cxmgGtH9aarCjg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cchv4j7qc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 18:40:46 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8249a739d4eso11489327b3a.3
        for <imx@lists.linux.dev>; Tue, 17 Feb 2026 10:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771353646; x=1771958446; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4QQfKD8GVBA2aksYDATKy5SStCQ8N0yPkSM4M0vZP0w=;
        b=EbZu8RjpWx4ML+c5PyCjKbJJtPeheM/Gpyrb+D8SiKmcYpKgqJbuVAwalon/T6063+
         mY4JStkZAyPXIKX0+kzmM2ty9w6EJ+YGsYx9IbXfQTzfem4K4sL+GpYdNn5Eo2VluiaF
         /SWeK0zxhPx0jkompSrhT18jGLk/xWqoERlUseQsZrHVrnRRTGIV0s7xs3ZUt0ubEYrR
         q9PkY3Gg0rjvZptUp4nmjPdRO0nm96SqL/iElPetvpwff3denPMU8wdKsqXCUdW4VsXV
         DvUSKMmLsejVMocbxgc/tTyJ8oXfX83V2j1jZjZ1dTkK49yTQGA06v9vjaLuUoi5DQ4j
         04Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353646; x=1771958446;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4QQfKD8GVBA2aksYDATKy5SStCQ8N0yPkSM4M0vZP0w=;
        b=i4zJrgTHYufq/db75065PxTCc6xvb3X2C+RtxaNSAYPYYCIAnO5B+hk+H/rm3q6SDM
         oiJHs6mjmuYztY/qmmYplcn5RuLvFWxynh166YEtBQfe1z9ucbvSLkGv7nadvDXxW8zB
         2/G/B5Px7cw1+jm8qscDYnveSd0ZVcJRrwWijy3JUNwtv+6QPmVCkHtvRJD4QZnXkK09
         i6fixKA5dAvFQmsNQmdA9GMBuq121/iJz5KzuB0kLQjnzxdy1ukZheFDBm+IhtBzlVG4
         FFakPhMK0enonR9nb2jR+NMtDer7QseVqz19m4dvu+ieseIQRBRlZSUkSTAxLtHEzj8C
         RTOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfaeisB/fonei54mRhlKt/L8IzWS0+RoB8UAAtCv6T41h+88kJQs7KmbR0ObrXRm9ITa8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwFsSYEu9QAX6zN+33FbwKJes7WXcK2NGuzxYhSarQq9A/0OHM4
	hZG166eMpOphlZDrZBxvI4FRgPTSXJzOTQbKR5RFT+hwHIlS0r1bwzZRJSrugDnGHraZ89r9Nrt
	k/VNj6Jcmzf1rafhdpuYt/pL5SpcgUBy0HcmlC0wY0DpEZbqNLPUd/7M=
X-Gm-Gg: AZuq6aJfZgH1pRgaMIOCVFz9csytmTH4ZrsPqAoraCObsZmPlLpypUWthereTOVwEjB
	jw8Q1HI8drYTPxYxMxYmHaoUfgDBd8AnwHvqUpvaax2r/AD3iyGwuo/ehdci3oLzrnsEMQURLSp
	NYCJ0T0YVabQfXfvQMKOBOtQL2/lu8Pw5RI7Z12rVcFs4xCSH5e7NZt1Gs73FyYFO1XfYyEy3MT
	GU2X3G4af3z+dQgm/Zug/3Iw3HLi/Tu86VJ00oLqcZ/DdzU/WljYGxpTz6Xo/HfsFqYMT7U6ANm
	cE09aLsUhzkJ5SCX71AqMQufPahfFv5gQIMxpIHmPBBoRjYvInHGOYX6I79lVXpZ8SZgXYSj+Gb
	77oWmJbos96ZuMEA+lfmE45F2KiB+uTmLmkw=
X-Received: by 2002:a05:6a00:2395:b0:823:998:95b0 with SMTP id d2e1a72fcca58-824c6102044mr12985342b3a.35.1771353646318;
        Tue, 17 Feb 2026 10:40:46 -0800 (PST)
X-Received: by 2002:a05:6a00:2395:b0:823:998:95b0 with SMTP id d2e1a72fcca58-824c6102044mr12985319b3a.35.1771353645747;
        Tue, 17 Feb 2026 10:40:45 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b9a0c3sm14187532b3a.51.2026.02.17.10.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:40:45 -0800 (PST)
Date: Wed, 18 Feb 2026 00:10:38 +0530
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
Subject: Re: [PATCH RFC net-next 9/9] net: stmmac: qcom-ethqos: move SerDes
 speed configuration
Message-ID: <aZS2JpQAO8z2xej1@oss.qualcomm.com>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
 <E1vqKPb-000000093mx-00Jj@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vqKPb-000000093mx-00Jj@rmk-PC.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=eYAwvrEH c=1 sm=1 tr=0 ts=6994b62f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=K0zUmU2yKo6XzqUEZrMA:9 a=CjuIK1q_8ugA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1MiBTYWx0ZWRfX6mHRW/tViLmJ
 XwNQd++8VP/vB90xbJNJR8vipJSXg8oKX+EwOmasW3V3LXPm5yaTmCBe9xURa+2J7DA0wnMuCaN
 0mBhVk964yWONDFE6OcEkKyVLysvY8s6oXIQeSfxfE1ANnx0kERfAgU4JKrHUY8y07Tyy0Qm7Ry
 VBDRjWEdBgMoarwrv6Z5O8EPV9pKz1iWfhOTTQlCSeeitqzvGj5JghdGfKtxZEjYTXvKRvYolUh
 3p1Gi/9wBWnt/jvtPfyopcu/Rw6dezjZfG+pz6MZVtBvDh1m2k7I8/KVT4jsv2EQc0QR1kwzqSz
 4kRNE2dtYnmL8lVxEoHK9JVE3rpo31nWl0ZL4IoKO4kFRYdDl5RR6BtI2fW5o8RvKR6v2KdeAcJ
 neb56boLCdpK/qnCen+epaRdijAItBhpMHAkehH89NwPYRxllfgBZ9h16/Sq93L3h65QTk4fjCC
 CddDoL08j6TL6a3RseQ==
X-Proofpoint-GUID: jTd2GB8ZAAkkwLJli_py87DlDbiz1g-L
X-Proofpoint-ORIG-GUID: jTd2GB8ZAAkkwLJli_py87DlDbiz1g-L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170152

On Thu, Feb 12, 2026 at 12:18:27AM +0000, Russell King (Oracle) wrote:
> Move the SerDes speed configuration to phylink's .mac_finish() stage
> so that the SerDes is appropriately configured for the interface mode
> prior to the link coming up.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan
