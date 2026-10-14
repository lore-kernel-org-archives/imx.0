Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FDD511E94
	for <imx@lists.linux.dev>; Wed, 14 Oct 2026 11:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791976091; cv=none; b=cI6GWxMDR7McsCbOsBwca4OZMTwr7lslY4JbunaMocEaqDek3dpIZhu8zdukXt77mo1s5bPLT+wIAtsqbdJTdhpZ7wVrBS6te5aUNrvwMbfMJzF8VaavNbP9tR81Prswfo4WW07r9YcKhB3sHUjpblzoweUISFCnVnPiIQzltJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791976091; c=relaxed/simple;
	bh=PGiY5w0Bw+ZJiJah8I5bNou1KJJLLOdYPIjQF6qLmRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=levxeVc95Hiwy3mpePOIEJE+QBYJFO3tTYNRKuw+B4hUtur82rN2BHVsH/66+QlPBIju5RvlCV79yOTXkAmtEv/2sc77+QoSg9LPIX7etHvYhwA9rcLwUf9HgQpFkc1B3N4rO7gdvZvmD7LUvhdHn8RoxJjPrru9Q2WnVYrvH2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QTCKT+P1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jTS+8AGh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QTCKT+P1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jTS+8AGh"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E6ttRI2088183
	for <imx@lists.linux.dev>; Wed, 14 Oct 2026 11:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t7/ELP5QzUV9MtdJIhtE22tO
	y5vpjDEBoIy32gvwohY=; b=QTCKT+P1G+AASpDALulMAYptwpSNSKzHeTLmp6xR
	1Jhftn7PeI951vdOmzt36/Tz+3H4HRanAk6vPQcjZhOBFDQBoaGm6aEKiSL/8tLc
	px+4Fy/EX5i5LGgOr3OHKrvwEK9eMLayUtUL1XgqKhcj/B+o5nTtQQuJ3fZA85rN
	jpfYw/DARozQJNqVfUk0ZoMmExoAEwqBwcSDmaDrIlU4BktVXLd6nWRhuOPnD95x
	bfO11ODDZAWBj+x2GJcAmZJzmewUzrtK8O5ZPRRN4elTa+RhoWqdKCxEMfanIajk
	v5tDv5N9Tpbi/Q75gW+85jlNEd0SKuNPy/d9jSUXXstepA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9x49jgwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 14 Oct 2026 11:08:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ae8e7e546so846966385a.1
        for <imx@lists.linux.dev>; Wed, 14 Oct 2026 04:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791976088; x=1792580888; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t7/ELP5QzUV9MtdJIhtE22tOy5vpjDEBoIy32gvwohY=;
        b=jTS+8AGhjk54SmU+NQKhOObMXyzmgpZMeXkJ4l0Xfkf9a2+Scxjdo1qR1wQpx6tw71
         eXO0jlw/IiP3PRGRjilQbeggRPAxMWOpSEYByGX+H1mXrFhZwQD8SjWSNsZwDc8eQh4K
         ia7coPue9lVFqgzZcj4j4Lg3E6CEtiFKIRAyTZVVwuUP/XE/1t3Km/rZ2fBJpYqgwhVC
         ddwGwOGghlguwJ+Zn8KeAKVOuHHdm1YYPcz64bdzH5mLp2ddRdxe1aEsNLntTppbz1oF
         WjoZ6+sUMoOm4ABr+cUaRZ2XfZKeE2ruBMo2HTztaUmNYezAnnqIpJgUkpqwNSmzvwEN
         6GJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791976088; x=1792580888;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t7/ELP5QzUV9MtdJIhtE22tOy5vpjDEBoIy32gvwohY=;
        b=JUBS2BCcCCeCsmLwQ5BKqBkM3k/tDerpyY3hOxJ2pJGDCGNO7qY2XTVTy7g86vGb21
         wU41ELS4g8zy5EaWjjNSkFVc6CbhZDIysWnDmjt9AvpMp6zdvU0BsjPySBeilyqFae7O
         CW8CFfkANuyNsxdH6DPn5CSqG5jIZMAUqucaIDEK/3QnqUmYxuYNuS3ishPTcmqKheTb
         HD4IIStv6xYhYeN/HP/b4O89uolrSj4Ff7bT/Rj+WljpbHk5XEMcMojdAaERAMHh1zo3
         nJGqZx8QA5th+Jmb0iOtKTj5NnfN09h0a+5FG3opVZrxuteoFV4qD1XlhJFkYZfgGnBs
         qksA==
X-Forwarded-Encrypted: i=1; AKwUvBycN17D1tJ0yn9ZvDa1aaMIXI84uV/kaVekyVZhbCAwchSSc2zzfivjNvbJkTAMcjMX+Co=@lists.linux.dev
X-Gm-Message-State: AFq9FYIiva+iLA+avprIOPWKBW0Udg+7GWHn70s5HmGelQG9bdCcA8E4
	NFAB27Ks03OpIKem7AZD8TOQUOrgOAQV7kC5rtyYD/rj0EbyXq+vGhp8rz46utOwOJf0AYxK+t2
	PFTIQeSaiUKPakiFSZLmDGiltu3g9JsGqA9LkFcCG7U48Zzufl7EoF9o=
X-Gm-Gg: AYBFou1+NKbREhFdiAZe0E6RVgTxvUfjoojqy/4dhhzgEy4cRntPjtwls5AMoq8rIRH
	atv0Z/73olqZCqn1zP2mah9g9Tjcwfw93qwyzhSl5oOWBZU+zHDgmX3ZbXRBm7KYL0RgQgCTFkl
	p5oYEwitWMR+oqWGqyfMNkSIJDboGZqhnt0mQxphVVSD2IZvdEMzo4+xz33mALqV7Tv2QR1r6KH
	Sm70SwZN+LTrPgSVBppKPumPsZquiefGlxM/yU8R7MB0pcRbQ0FBBnMYWRqpJvNeU2WOR/R9AuB
	2Y7zjAM2OcTd75B/LCrWzOQQpla+KIJEREw9ZTbYMykhnw5BLBomAK+da9jlqh6FN+dT2rdNsQX
	EQ1QQSTKUfEC8cqCl
X-Received: by 2002:a05:620a:6601:b0:93e:7192:191c with SMTP id af79cd13be357-93ebd1e0044mr2477179885a.17.1791976088067;
        Wed, 14 Oct 2026 04:08:08 -0700 (PDT)
X-Received: by 2002:a05:620a:6601:b0:93e:7192:191c with SMTP id af79cd13be357-93ebd1e0044mr2477173385a.17.1791976087488;
        Wed, 14 Oct 2026 04:08:07 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf31b83sm454585915e9.12.2026.10.14.04.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:08:06 -0700 (PDT)
Date: Wed, 14 Oct 2026 14:08:05 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Brian Masney <bmasney+clk@redhat.com>
Cc: linux-kernel@vger.kernel.org, michael@amarulasolutions.com,
        linux-amarula@amarulasolutions.com, Peng Fan <peng.fan@nxp.com>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v14 4/4] clk: imx: pll14xx: support spread spectrum clock
 generation
Message-ID: <fqdoyldpejrzju4w4kex652ioi4txzbp7i2cf6zyqgu7h7ymx7@yepdo34huhw4>
References: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com>
 <20260904101243.412006-5-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904101243.412006-5-dario.binacchi@amarulasolutions.com>
X-Authority-Analysis: v=2.4 cv=YJcKWhGx c=1 sm=1 tr=0 ts=6acf6299 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=8AirrxEcAAAA:8 a=iP-xVBlJAAAA:8 a=EUspDBNiAAAA:8 a=HkkWczMphfeU9HmRj9wA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=ST-jHhOKWsTCqRlWije3:22
 a=lHLH-nfn2y1bM_0xSXwp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0NCBTYWx0ZWRfX55ALebrH5sIr
 TVLdknwfoEmxooBIY5rC3IXMTRYCqpGhWGPFLEMt7IffBrA3yYx1NddTgLz/K6SK6Wp8vj9xer1
 rBSKkHw1svbUBxLj69Em7kE0F9RAPdUGVmQONzrIxN2JgPhCq7yDLie+zJUJKW3fXR1Y9PTgoee
 fIts27QoMAoZ1aAxIzWCT+SPjHi1qOuPK3fex7JsN222o2Kg2X/8doM+RQQixcS1SjVL0CCzI9Z
 vYxqS+8jWMQFhN2I+UMPZCsB7W2Uh4EZFdxIn9b8Nuh9YnS9aW6nuvOvLjpZQumKRujjcEGwP/L
 cxlmKFjyHJXXFWSQMiHX6ZtBa1WQBIhszSfEAC0U2CUSZIy9T6dGepJvVfy3NGVDEqn5QELG0MH
 s6q7pKCgYc3VvQ8dOndwNTzjapmHEzlBBsHjajb2kB/tmD+YN14s0M1gCzdtnWT7RgJ1r27vawW
 0nNuGoPrb65GEgXjEfw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0NCBTYWx0ZWRfX2Q921bRCSaz6
 pPzKewMx9rZJ7O2jiavBAYrrzi4+Ft2RijV1mrjQsTzLAA6cR25imlt+7WbO39+EKWsa1d0Q1y7
 T7wBM+lBF/GVXiE2fY3ioAsYgEnSicE=
X-Proofpoint-GUID: WOiucxyIiulJAiWbtxkSoauAKrMhv0mX
X-Proofpoint-ORIG-GUID: WOiucxyIiulJAiWbtxkSoauAKrMhv0mX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140044

On 26-09-04 12:06:33, Dario Binacchi wrote:
> Add support for spread spectrum clock (SSC) generation to the pll14xx
> driver.
> 
> Tested on the video PLL of i.MX8MN and i.MX8MP based boards.
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Brian, you can take this through your tree.

Acked-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
