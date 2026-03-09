Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30650392C32
	for <imx@lists.linux.dev>; Mon,  9 Mar 2026 11:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773055177; cv=none; b=EYYxxF6aIFiUSeuJQ2GdIFVX0ykCBJvmBSCSCLBX1hCmTBXHCyJ5eO/62tmOFkY7Hg9keZ39wy5X0VsZTMz4gVN9vsRNdPBM51+AJtqiOBbezHRngojG2NoEnmmJwEtyLip20bXw4zZqcHcc3j2VOzZfCGu01IDyvpkDDchb7Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773055177; c=relaxed/simple;
	bh=AejVh39OfouTSd2iF1xalh+o1wTJiUiMTTrorUnm0v4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DIvoOyu73VszljU8+ylw80ysfVwIKScoJJAhU6zeRAqYWnlMl2usd+HDJe6qqTi6WOZBpIJPhnWH0pgadJX6Ml2vfPP8B207+NxeNwHHO3dzYXVrfQ1/0wgQNNz8DwZPUCeBfssG1hrOc/PLQWc4mBcv8p6qDvkAKQOQ9vDg4UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IpI6JDD0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FYh4dAf2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IpI6JDD0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FYh4dAf2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62983T63077317
	for <imx@lists.linux.dev>; Mon, 9 Mar 2026 11:19:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aBuXrT3z0syHkRjP3iylAVgo
	7EGbnv7gdiOgzGuaCiU=; b=IpI6JDD0HWnBmmlj0OFHN8/gFzwsaR6GGIPaSRWZ
	iFf/DH7u4vd7h1Ql6MNsSNVW9oPR5VFW70oJAOTynQa/kotTy97vXA0zLfU6dzvA
	uNntI343AApVrwilF4Ccnldt+LK7L50ujgLUmwLSHh8Zw6kc69JCAMGvA05QoRPE
	9O4dpQc5tRl5IG1keLHk0u4cwJIhRoOu4w361lkUDa5Q2QOyO9hNNQvNH43cn8he
	7kk5Yw7SulMX0XAPaDCMv1J1DuARQsDGemPZ4pfuNOCdlEnEvGJDhSE+ExzyMWep
	mCjRxW8ZWiSYWgw7VY+HBiZ9DBPabub841Zlzj4UETzIkA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc3vd4wa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 09 Mar 2026 11:19:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae4a6bb316so81940235ad.1
        for <imx@lists.linux.dev>; Mon, 09 Mar 2026 04:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773055174; x=1773659974; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aBuXrT3z0syHkRjP3iylAVgo7EGbnv7gdiOgzGuaCiU=;
        b=FYh4dAf2DkUIoXyU3S3OQxsKVOK2zMGGkpUh/OoV8xzKcekI9sXgTN36LP25aPmGcS
         jl4oBlq55aIUsY9fjL0mKc2DMLFjSIGvXKPJDVy5xdgMIzL9tVc15ruJuMuCGhALaYHo
         DXQh4cXv6acR7AQG9W60hN/GE0RkxiFpRCSSY4uPXMe+bqHBJoy7cESn/n9vkgRezfKf
         Oqsa6+NiXupN5YAygBBW4YkNl/nwsqmRwpiLFlUzByyv39V+soJR1f9GSLakWNyC2AJ/
         II/41yo/O/u1H/++HOoBLRf9rN7r8wHr5kPaqgGH/odktRAPu7WBO4B9Pj7H+uwSMCJV
         BVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773055174; x=1773659974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aBuXrT3z0syHkRjP3iylAVgo7EGbnv7gdiOgzGuaCiU=;
        b=PIc+i/6ikZyLfw5vh4qPP8YH5LxEOeV3spxIlAN+d7K8y12McMHinMPqSoAzknf1h2
         J8ZtlR4cz8yx02dQxFdTXvz4FEkl9GclljznELdisBCjZ1Xy0hYyOGPuT5Jo/lAjN/eQ
         Z77oFMbJZNi9rtfeeACM6uv9ZpknbYI/VOuDyRdQZNrCyPZ7HcvEqGBg7rJL/d+6axyk
         EQcNiqV3IlP7PxEBCGPPag8Ewlu8OCDu3pJLOGqD1HSxe3u+fNUl14w6bLIBtqOL4XeE
         Fgci787jVgziZFuaMcFTBMKuva0qzp9jAc1auC2HstRzFD8exS4Sbj7wsVn5QJmDLGLz
         HgTw==
X-Forwarded-Encrypted: i=1; AJvYcCXLaF4LNQrhzfuMBBtfnhhxmeqhhWoQIkOfScCrtxn6GdHdo69vfP3Igq6jhV2GRvezuCg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzFf1yERpe7ymJ8A1U6+ru0kteeet0k8Ec2fokHg8OucuFKg3b+
	AfAlJODa0pSlK3stpIA8DzNaBv4llQDKo2zdq9K8ry1Lxathu1a3bQi/qIQkm67x+Mki1X2WjL9
	Tn2qv5IEemWwfOcCzx/6xWSvr4PtFrYfzu3mhhMyE3MCrMib8/Acc05k=
X-Gm-Gg: ATEYQzymUCbhaERMmG6SZHHm3V2yxZkoA81LQFRygMisDft0hW7sOD28kjDsAsI7DD6
	6E9OV4fqeupTRSNtuKakxke4WOvTSy8UoNwsYz7AyQDZRPpc1Sq/e53xSrF6H9XhiHIIPJ/LuVJ
	uKDaO1sDoVzRja2NQu7+tAMat7cN3LhZ7c91MJmrb4rix8rcsRTy8CR86kzIum8Tny/030Fjih9
	9Sl33+VwDK9My2E0vJ6lF5+RQoCQRVcfH69Ewt2+P0uVvZ8H1pRWcgnQc6wdfQ7J9+a705x0V6c
	l4qnOGwi4XU1/B4oQ9YIo9RmjI5ln4VY0mesUikwcuJ4iDbzaZ8uRzYOExiLG7opMbm8B8J/Gd2
	lABVLLEaO8qeSI51c2tLQ4TiEqE3p0SWP4tg=
X-Received: by 2002:a17:902:f64e:b0:2ae:5fc0:308f with SMTP id d9443c01a7336-2ae825056cemr110474385ad.41.1773055174156;
        Mon, 09 Mar 2026 04:19:34 -0700 (PDT)
X-Received: by 2002:a17:902:f64e:b0:2ae:5fc0:308f with SMTP id d9443c01a7336-2ae825056cemr110474115ad.41.1773055173696;
        Mon, 09 Mar 2026 04:19:33 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840b2e9dsm150127135ad.85.2026.03.09.04.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:19:33 -0700 (PDT)
Date: Mon, 9 Mar 2026 16:49:23 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Frank Li <Frank.Li@nxp.com>,
        imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
        Jan Petrous <jan.petrous@oss.nxp.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>, s32@nxp.com,
        Samuel Holland <samuel@sholland.org>,
        Sascha Hauer <s.hauer@pengutronix.de>, Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH net-next v2 4/7] net: stmmac: use u8 for ?x_queues_to_use
 and number_?x_queues
Message-ID: <aa6su45ASA4jR2VJ@oss.qualcomm.com>
References: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
 <E1vzX5K-0000000CVsE-0J0Y@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vzX5K-0000000CVsE-0J0Y@rmk-PC.armlinux.org.uk>
X-Proofpoint-ORIG-GUID: C4GX2HLXBymc9ADqVpFHoMynByC8LYXl
X-Proofpoint-GUID: C4GX2HLXBymc9ADqVpFHoMynByC8LYXl
X-Authority-Analysis: v=2.4 cv=OOQqHCaB c=1 sm=1 tr=0 ts=69aeacc7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=2l7Dc_Zt4Q8SQ2GGjncA:9 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwNCBTYWx0ZWRfX5ho470/AVOyf
 6r/NnmCNhB1EOItaAjjxJLHlM1piw3VtUpr+GYfoRcpHF+IbDuaReOlFDwx0tqn1Qb6riYoz9rd
 NPiz7sgB0pMlc75BtJCbqvKeW0Jfy7xT3b44uMgdNqmBE5smXacz8sdmd3e3xInZi/QMvgAuym7
 NdQVidHvm1P4SQJaJONMI8mXzpMHSFVe1m2+3yTPgJs999mtzMzXzLOX7HVEzctgKmoMLYuFFxC
 CNCJbKy3hNv93dILc8EO6LFSp6684lzzQTfISeo0nTMWtzPAVcETQ3OtbQSGxyF1Xk4XUIsH5hU
 qwkcWRuhwIIj1GFNCr+JEysKH0rgUvZJXQl73PWDKEUQ28Oz0bq042TU++HgSHYlcbyic+4yixZ
 f21NmccdY/az5cNUVJca0xMCda5j5z2ShJysUNjHFCrj5D5ASAB4OsHw4e8Wu3NIWH7aW9uJuq0
 RMrT3ZmouFRmA4hkjxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090104

On Mon, Mar 09, 2026 at 09:39:34AM +0000, Russell King (Oracle) wrote:
> The maximum number of queues is a compile time constant of only eight.
> This makes using a 32-bit quantity wastefulf. Instead, use u8 for
> these and their associated variables.
> 
> When reading the DT properties, saturdate at U8_MAX. Provided the core
Nit: saturate?

	Ayaan
