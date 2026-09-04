Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E02948AE06
	for <imx@lists.linux.dev>; Fri,  4 Sep 2026 12:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788526158; cv=none; b=eC4Tm7JnXrFiF6tZdAXG/Xoxf9zZVzoU2k9GtkbEQTjnouZB9laX2GpRgxRLNCWeWubghKcjecDXfeA+ecXXOxiYXmaBoRUrieG6exRvz+rdqdto71/eTDwdAtwzDjZ//Fgbl8D2xOPCgcQ8ax1p+uY3AdoUAchI2Lt02kl9B7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788526158; c=relaxed/simple;
	bh=4uCD3FkDz9bxjcYN/3/lDqGUMS+biPLxmZeBLmbH+4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZVd59FFAm4S4stgnIWyQV+GCKsezzmBa4LIszsfVICX55wlC81vzBOPw9xFymUZJ9oJE4Jx8swrqK6DY8vUqQ08ltZ3bcPvM6qrdxTaKrPlfc5BW8cJxTNdjT75HuE4FdqXiel8fpjTDgEk88qZRsVtQgPqWhe1G7hVbb5vcvCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NZGf1kz2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J/FYqyz0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NZGf1kz2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J/FYqyz0"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684AI9aG2616015
	for <imx@lists.linux.dev>; Fri, 4 Sep 2026 12:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+fjf9Eo3K1S5f5JYH1uUJ/g1
	AeGfbugPlbVkWxhv/j4=; b=NZGf1kz25U5vQm0g+IJstunRFvBBgR7BO+veqj7z
	OOKGIIkZT1WHFkumvsp+NqoUD5o292spTomk6KFO00l66BPoMKUAcXM2ux/NL2p0
	ClNRL/EF4ju3LH3PMYKTxdi6t8IQd5AObSIxK3bP8iN861cPQhuQaGuGLwt3hfhj
	0uP6S6v2CNdDm4pGtjggx4TB+yGjaLMAI70lcG0DHJvVC34d//QmmST2xZajFHeA
	0JCbelh4Ey82KnRhcVd0VRA+DBxUKdJBjbG1SnXzowbK7G4uGSlWzTcW27n++eFv
	Fb/N16jZG84r6wBLkrc2OVxU5W+WsZi2VvKb7cq9OPxmnQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfdyp3h70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 04 Sep 2026 12:49:16 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7866c4ed349so854531137.0
        for <imx@lists.linux.dev>; Fri, 04 Sep 2026 05:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788526155; x=1789130955; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+fjf9Eo3K1S5f5JYH1uUJ/g1AeGfbugPlbVkWxhv/j4=;
        b=J/FYqyz0Jl7esaPqElGiaqaNsAPEiSOLPp4Tgy1ZvtmnPXJyVUtsfHSQUcWld0TiSW
         jrZxzYzO7Abx1r3H2dIyAIu1qgwvBy95tB8FGyPPDu1yQ5N3Fn2hR3YUfI/F0tEQQBhX
         d/6csmVS+XQ0vKmb+4SI/f4Dk4ISHGkeooGgj+cAJSSQ9ofdbDJxt0V111ZP1YLMHmAP
         j3AYP4zQFo8aPKPePEaJGQktrZH04M8hqzOU3Uzo7lcsyRv6em5RakB3nyVP2nu1p2dh
         NVzS62TEDRp2w+mfyqPZOWAVaIIIA5rx9XfCOmfodOV/L1IaSsU5cZQtRXjgRiDFF8Lc
         xORw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788526155; x=1789130955;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+fjf9Eo3K1S5f5JYH1uUJ/g1AeGfbugPlbVkWxhv/j4=;
        b=tR8X6hdE0v49EITT/pE+PZSCXNy3zdhY2ggH8Yqq3aa8nz/zxk3tK+qr3QBTUe3T9k
         eR+fQxIob6KS+FZArsmnuLpl/uNLbb6P/ezWKJiyjr2XvQDNyHcw7NmeB69mxhDn/oHs
         Vd9TJrmRwdzkzWmE7G3bxm+oC7w5RGdYGiQgA0dMRey2dMd3lMpIawTz3wLsqsN41pph
         UQZevPlGgNH3odR6uHzd8MWaeEx848UZfra7gUjRt8Mjk0LEPl6u6A9oOtAfDIVX41/I
         ADHZWj3juPK1i+HiSEiJ5XUaD6D9EC89dlcg/hPMdGIr6i3xdHesNK8DTTRux4FrZOjZ
         Azkg==
X-Forwarded-Encrypted: i=1; AKwUvBzG37CtKCBghNY4mhHmJRP8l9Q078wrBKBS/e02/OEMNoVyUG9tM/kZpowPSYvEy+DRo18=@lists.linux.dev
X-Gm-Message-State: AFuF++nkZbPBxqBIIe1aZixPiE+ethTGcJkcsNBffyEai7ygYeZy95p0
	Ck6Zp7I4XKe/hoJAYMyWug+EJL3L+klgUZnl4gSjwOkrhN8ccUkP2rBed7e6ZnOX/LQaBijG2bo
	/gsRrxqi81z7xmvFHhZQyE+fv37DQw6yozRWDN0o4LFr82ziSs9LTycs=
X-Gm-Gg: AYBFou2HsbRK0oMBwcIDMyRDXkS1btt43+VKvEp95m22r3vfWBV16lZ1cFAiJndKSHo
	pzF/dpGp0KiUFJz3cvwTPkrr58Ic0yPXcs8e5q3N2vghOEdSAzxY1FZlI6AT7FJhwDZAL6lE8Kq
	GZbqre9LZ4a9KtKlBCJT+K8+uWBOobTrZ/N7zN6/0lEvUzXso2uVS9SCBgcTo4ryoK40PpZ54Uz
	JUR9Aj8j/mcLdo3gUqQ74/LEpgf6w3jRsA7K59eDUJySWKs1dch/OlmQ7OFkb7WettveQAXlsyQ
	UmRwxnwTeXYkPCXDjTuqJV5s38L2bW1ggOyQWx01qPRynbu7+WFeiTm744SRvNKTpncQl/gJy3K
	8pbKgjEJAsimz
X-Received: by 2002:a05:6102:2b9c:b0:785:1a50:3f56 with SMTP id ada2fe7eead31-78a4aa53ca4mr2019987137.12.1788526155158;
        Fri, 04 Sep 2026 05:49:15 -0700 (PDT)
X-Received: by 2002:a05:6102:2b9c:b0:785:1a50:3f56 with SMTP id ada2fe7eead31-78a4aa53ca4mr2019969137.12.1788526154671;
        Fri, 04 Sep 2026 05:49:14 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm135742595e9.0.2026.09.04.05.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:49:12 -0700 (PDT)
Date: Fri, 4 Sep 2026 15:49:10 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
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
Message-ID: <f33mv4dqb3gcapmh4e4kg6zcgbtmb5zjyh27q6v7cnuq3ajvai@vn5pkiyhkicp>
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
X-Proofpoint-ORIG-GUID: FLk-mKDBIScOPLmhhPl--Y2AoDFGNQVf
X-Proofpoint-GUID: FLk-mKDBIScOPLmhhPl--Y2AoDFGNQVf
X-Authority-Analysis: v=2.4 cv=Q5XiJY2a c=1 sm=1 tr=0 ts=6a9abe4c cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=8AirrxEcAAAA:8 a=iP-xVBlJAAAA:8 a=EUspDBNiAAAA:8 a=HkkWczMphfeU9HmRj9wA:9
 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22 a=ST-jHhOKWsTCqRlWije3:22
 a=lHLH-nfn2y1bM_0xSXwp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDExNiBTYWx0ZWRfXwJ6LujdsOvwM
 Hytg8KVst6QTIJWHqUhsRua474IHApdAEu7Apt5vcDC0uz0WZvjurfnmT5R7LMtSEbxH4X267HL
 cUZlCROVOz5MM3cgaimt8W/R+mIr3/SDWmem5uRTVvr1dLgD58TQUlgH57DEx7O15DVbZvORsiA
 nrHYDLBlgoyI6O2A3XNoUOGDKWTVrC7Pl56avihx4tCq6P5tTyI1+Lmjezgcjn+hXgZtrKMHrp5
 RzMUBJRX/bf8V61IqOa1RmcoFc8TYuYsbNE1HH0s83urGfGZL9bEXevQYCgqT/mwPvFhPoGBJNx
 UwVe2pX8xWh1qu36t5e/4L171Zp7ZPEV1l1KKB3GLsP47DeVaMebTb3M2hhvht90a/9x+8cxYz7
 MHJAT7w+2sw1i3PrBtEVPdvLXTYPoipR1AI7WLFS1ZQ2Q4B3rDIsbyIATnuTjgleOInkFLmNoHt
 umzuJvrd3pf41Y5ArAg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDExNiBTYWx0ZWRfX3VzXhfzw4uY6
 AXMuSfhDGvbMv1UK4YS3A8tT5S8pg70eSx6jBUjHwxzSinfDHDUubad5Y+8GdL23nLhEf5E2Qzz
 pjYu/ketX3gcVdXemBJqOBZeW6YZwkI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040116

On 26-09-04 12:06:33, Dario Binacchi wrote:
> Add support for spread spectrum clock (SSC) generation to the pll14xx
> driver.
> 
> Tested on the video PLL of i.MX8MN and i.MX8MP based boards.
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

LGTM, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
