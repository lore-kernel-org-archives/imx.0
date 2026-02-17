Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F352936BCF3
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 18:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771353565; cv=none; b=dcradxTQkb8ZrevH0iJt3gfFpdORpUEogkSDKr/BEqR9GT6SuPBVshhHA0EbOaOlGdBYMnoZsp9ATHXXuOmkbQe3nk7Ru1d3cHDQzH7V3vDts96z8c9q+lPfOG6O2ZewOTmolRLsfrXX7xNz9mhTvTo8xDX6fBvCGkFM0NCMPbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771353565; c=relaxed/simple;
	bh=+V7Vl4YLN/CBb36rZ1VGqeTqLId5Ikd74J0lrmVM8sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AeFd5MiOWW9ZDhPTAz57L4UD2b9d1ElXkUBsz/I8hVNz6Jh/9HqibER73zBFoLJ9TWAiJVhcX8Xo1YTTS6Jbh+Bx4Goao3Z+/tcMSkv8LPrMwzuIoOgx8nCU+lZE/idD1ROLDIC8jf/SNGkRnErHC1oLtQqCT6B5tzzeYPkRL6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XnMxNOFA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HLetZumV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XnMxNOFA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HLetZumV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HE2J6d2920763
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 18:39:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HrP1EV3T54x1E7EsuxwJ7YEZ
	jkA7SuQSx7N9/VtPaic=; b=XnMxNOFA2nL3bBPtO0tGC9aKa0ddr3/TFFj3lql+
	OLwEaR61vOGo5OobG5tWWGPMXlHRCQ6VbxpjC7juDNVFex8dYWJr9h8fSJMzAqsk
	QfF9nWGB0+y1rq+o6ZpZAt2bHwH6LN5Ne7ZJvwkFIokvr5gpaMUwYI7vWaaMMTzu
	T0PNooiyLyxniBkd5QqjnoTglaHnsauLxybFqkADjbDK9euSUDGfrF8Wqxu7bD1X
	cKdC2BId1DTqMnOP8uFI/RplCaAy4SAbut8RVuXx6Eve3V0WKQ+Ks/EyX6q4NCqS
	sc9nxdPXDaKfhzHSt7IdyaCDsi8cGcOuzA6M4m2PdgGlsw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6a9uhpv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 18:39:22 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c6e1e748213so2975478a12.2
        for <imx@lists.linux.dev>; Tue, 17 Feb 2026 10:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771353562; x=1771958362; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HrP1EV3T54x1E7EsuxwJ7YEZjkA7SuQSx7N9/VtPaic=;
        b=HLetZumVsdlbOp0qPIKgzYATvFoiaYWmiELsFuDEPIbcsmmfjboGUuP7IV/0+LRReH
         MBq0qZHnN0NooYuS0OL7xTlOlMsGmG0nrZbVzO5RQ6BRGY71238jp117PR7BRnAUrUAf
         +c42rF1dpoGPuc9dUexRaEV4tmSC2LGlvSkt9WOqGXr2wsDqOEknJ1mKPrFC0fc4qNFH
         Owoykx8ak9kjSk27aO0/c09wm6F/S7NbEEcPmQuoQLmgcpWon96m066inDiWYl0yW9As
         XWvkOF3pdKWLK4DaWaFEp6pNsm5NsK9uHOXsUaf+zD29PHbTHDyN8UUq+27xhCMZW9jL
         A/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353562; x=1771958362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HrP1EV3T54x1E7EsuxwJ7YEZjkA7SuQSx7N9/VtPaic=;
        b=JbveFd9NFgKT88PpxRJUEvi1tYKTR71tdR2uZOyb5DnzqZSuopXMWVngkL3jItcbu0
         wS5KaCtz18hfvXu/H6N8HwJf4ppVHy88vouiF3ham0I1AtLaW1G+Tt+xEw3OZQn2zj9O
         18TBxRyGmGzuNxGojAhEDtd/V8jdy924F0oxfDNcw5h69ROvFujrTFR05p5Ea/KKv12t
         TKDSZDyIwbklI1ncEZbqeF4F0nBQwMjcaBgk5FhD0rKxvCp/vQj0cmstJDqdeNCpfkqv
         lKnArBOx5eKliw6aY3ntWJIgG7QtU8GWiQ53ysuhsb2MIzbrtVccEjU7SlRiyTT07n97
         xUEA==
X-Forwarded-Encrypted: i=1; AJvYcCWFIG16HWJtDu/s1ZR4M5p9z40pTMv3ZTtXhEHQO0lJ5RyE0eUQHc+v8IN+A9K1jZUDNGI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwDyATDMZeqVxbRnDpbSsFJUg47PXRyv7mZZOFBinQNbER2tXTm
	OuZZtcYz5fYauyOo4GL6lvBBEuePBdZo64wXVENSeMVdxnSTWrK8w0C2o3Po8qEk4rpRRPGOiay
	3UNfu4NH2xMzjEXDjyEHqPHJ5M6ur5klskmTh2Vtu1lhiMlRD502OM6U=
X-Gm-Gg: AZuq6aK4k1CPKQlGFpPJuUd5m6GRmaROzA4nq5myoikE0jB4/au7oxCnLKPy51V/VrX
	zRB9W32F2iiaVv5p2GqmekSldFA8CwQ2MRn5OLShGWwxVeLLIFyMlQKoJkYoHTJPJUEUwRy14DZ
	jSgA3/1eKeRwlMC0ehi9QCVsAdzckPWv4wqd0lmUhg7kA+7YAOenTe0NGoVHXCosQviYDoanbTc
	5I1jAj6odZZxg8zdqbzihtuiEYPZH/pho3L3U5HK1QstSs2q/JUTXGlSUQqvWaeg2Gl0oSvrdFc
	7IEOBe/GbX6vQx++nNZGoXRUimdvTtc4uJFWeUVaiaChW3blbPtfEqHv07g6LU87jk+bRBT59Ol
	g5Xzsm7fMmNclkTTYVv8z4rZGctGRHbhx2+g=
X-Received: by 2002:a05:6a00:600a:b0:824:a0b5:730 with SMTP id d2e1a72fcca58-824c94ed641mr13781190b3a.13.1771353561876;
        Tue, 17 Feb 2026 10:39:21 -0800 (PST)
X-Received: by 2002:a05:6a00:600a:b0:824:a0b5:730 with SMTP id d2e1a72fcca58-824c94ed641mr13781157b3a.13.1771353561363;
        Tue, 17 Feb 2026 10:39:21 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6bba008sm13377726b3a.64.2026.02.17.10.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:39:21 -0800 (PST)
Date: Wed, 18 Feb 2026 00:09:14 +0530
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
Subject: Re: [PATCH RFC net-next 7/9] net: stmmac: qcom-ethqos: pass phy
 interface mode to configs
Message-ID: <aZS10liDHG0r6UJt@oss.qualcomm.com>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
 <E1vqKPQ-000000093ml-3FLd@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vqKPQ-000000093ml-3FLd@rmk-PC.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1MiBTYWx0ZWRfX4qQlgRjPLROc
 qLvDc/xOJF4pON+MfhMQN6audUWfsqyUh3nUnMZtJZALE9XAlr3gA7rGZkp8EJqUYfZ6jKns9dQ
 DLZuQjoRHqkDSwj/PN6YjuYhbezjSJSpIKgFP2OJINpV+SFq+2zCoQ2q6rI+wgrBC7JrnrIkpsJ
 ZXPvCWK6aGD5tXzFXkDJcZel3sj/olwZAVqISQ9vAhfTaU7hKcs9W5xbt7l0pFrjAkDU77cgFm3
 uNklEimKztm+z8pezDmBnzt7AwebitrEZui/YOp1U7sfgVyMfuhCMTtCJ7Z1vpzL49U7CcQZcbW
 LuxXc5b41dq3hEGK2UHW6W6SN10UapGjdUwpUCLRC/lBn/apVl5kuVn5fbqL62FwSF3hMJFlL/l
 TwDZevzv5mAaUdOjCEaWEJubfU3qCrjqCA+phbpDsTnM41UAwxJg8eDTxNobM0k1uyIneMiK746
 m2uqNBVnfz5TnTlDyWQ==
X-Proofpoint-GUID: LkFePbFyYwIgPPg0ZH2GmVtroQUHr__e
X-Proofpoint-ORIG-GUID: LkFePbFyYwIgPPg0ZH2GmVtroQUHr__e
X-Authority-Analysis: v=2.4 cv=TPNIilla c=1 sm=1 tr=0 ts=6994b5db cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=VKYGXzwvPY_sFHXjFqMA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170152

On Thu, Feb 12, 2026 at 12:18:16AM +0000, Russell King (Oracle) wrote:
> Pass the current phylink phy interface mode to the RGMII and "SGMII"
> configuration functions.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan
