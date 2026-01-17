Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463D22222D2
	for <imx@lists.linux.dev>; Sat, 17 Jan 2026 20:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768680678; cv=none; b=ZIoU4ZuwliK7U91uRX1n6HLuOIEtRRIpU2OSxH2E2s7NkrECf9Y2MelSKBjueCmOLtzuOPgKjMTiJZxUptZ03cwLkyORUkk0gP28PjSFsVFFHvtZ3ixlvSj58GuRoyVfFBG39jCn7rD2hDhXRWXK/XRutBVsywKsX4slCGUrXag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768680678; c=relaxed/simple;
	bh=xYUB2VUQb0Sc8Sj+Eo/ZFpkiP75CO3KSWxGTkgyvN+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WkbAlGOnMpnsuy1NxKI1bEsvY4/dYrZBm7ivXYriUbUjhXLksP/ZxPGCbAkMkimAvr9G2vJjsYOBzLbZd2SmibuRnkK5Iv8X1ORivjCf+6pVRRwSNflHoCY5SLoCjqX1+bQBRUC2UElvELc3zD8HGh5bY4kJtqc4AeRe8h97lQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fVhhSOv5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WFq5i1ge; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fVhhSOv5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WFq5i1ge"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60H2Bb2E3742965
	for <imx@lists.linux.dev>; Sat, 17 Jan 2026 20:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ujKSyEbbhm5nCRZUQ4cnSVXm
	CMUReNgv+yj8//WkZoU=; b=fVhhSOv5Lx2fhXt2xSaWb4me6DFUQerANOtb6tVe
	+MHge8CJ1m8AJHhSaTaYdIThsosEDc6iNBysdTAs6ETvzVVHwh/e74a6TK2mjpQ3
	ZYZaNG3U3H+howdqAJEuHOJ+fbT4RMToSDRJq7DA8mfz8K1nFX4IW/T6m8zctdJy
	bcrncAKcufXaPapAJj/asNQmTMitEfJoL7PiilPzdYANnZQ0KVpPdbfF6LEdP4JO
	rHNcgqpLRgp1h1JepWOYXWPyCyM1/WGGDQa9Ie0imnGh7t24q8DwqPJjNPTGFkGR
	yXsgLzA0C6i8uhaE6JLCVisNRFRHFEE3tUhAOeEp1xhTWA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br1e5hhx5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sat, 17 Jan 2026 20:11:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52f89b415so781143285a.0
        for <imx@lists.linux.dev>; Sat, 17 Jan 2026 12:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768680675; x=1769285475; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ujKSyEbbhm5nCRZUQ4cnSVXmCMUReNgv+yj8//WkZoU=;
        b=WFq5i1geHOzZMwfkntQLuLOiqxnwnGWOnqLcGe93MrA/9jl2lCfpTNWUx4En1QRPuQ
         XeujvtwPv+AFxeFWA8j15wLR3qDUvfg8yhP3pj/lu8p8c78+lT52NgAdyDd/GY7q6BqF
         rYsndviN0dyNH0cuHO840qrJ1VozDxwVEagCVdpMd0qX7M667s+8LIYhh6H/SY1Tt9mS
         WBpgFKIT2cjuKjwXy/ofw+fPsy+sKAmwACofiRqZmueD1bT8zdixfVGKTqV774keaa5P
         +58M55laE5xOZBTeWD5FPfJj3sZx1+mL8n5FyR7ALsHZbrcnMmVpBb0Daw5KkCLWlRKC
         6JNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768680675; x=1769285475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ujKSyEbbhm5nCRZUQ4cnSVXmCMUReNgv+yj8//WkZoU=;
        b=vNRzuYAIo+27g0Nhzgsk5c9mBQLQ5uFHyPpTgchTx600HLVvtqz5lxk8aXbi0Uh/C0
         mQghjUiCjhiKbMmWJjmFcZC5OOtRpG1b6lx8H7YzEL33VvPwGmfvQoVIZRpilD+mW249
         x4Bn97Lwn9f4n81HVKw95yBuFosHINhr7/3tGkMCAS4/7Xg6MrTVfhvL5HLJx+2Q6Obe
         mpX0KO/9ax7lbaE1I5vZ9Bf5IFVivvCoB9K4isgCRColK8yjihrKEORX/KOg+15jD7mq
         R52+YvLDWiKcPeajLU5SUoTA9thPfTN0jMd9w6WhahppNslQhE5hpsOKQmcRnE17qz3/
         B3EA==
X-Forwarded-Encrypted: i=1; AJvYcCXgvwUIaq6WJ3es9OODwzc6LSofHFEayjovJI+gveMoZfdMjOW8kwkleQNeaJh7r46DsD4=@lists.linux.dev
X-Gm-Message-State: AOJu0YweMG1cuRuZjukDxgYEjDS+8dTTH4cyeThiHGckwdqZ1AkcVz9l
	gge0zXuDkn8ZMKMKh9mYRXjQW/yT/8TZhWNn1HRzpxLwyJ9I7T1iqxHtfCmb9ju5zt0/AH5mcHS
	M7jfUkhpUPM0Xehu6ZJGamXsCd1q6oi0VYOld0CEqDaA1GSeOXYmSyas=
X-Gm-Gg: AY/fxX7RcKymIj5Z8bk365P6tRB1gtuetbuNUozvug1zqA3ROfoHSltvPoNha3baL14
	8CCI8pgSHemVap7lAP7UUguQlULIsEzqfNuJsWll4QPQaIrDeZRnIs3hdT+oi2XXVhc6ZBl/zyL
	cCR3PAqeVYNqSLmN8IZutedcFzxAtzC/K03DYffWwHNPOP1KztvZ0IhQ8l3CIGIGJYk49Qp1yYS
	PN5rkFyp/7fPLz6WFfBBPwqhwpF9N4iMP8LQQJlER8o3G/Q2DHrezjIXrXLs3Ay/7lheISHjnEK
	/S7MO5mVChbBh10jusx6ARQXG6irl6ppLJ9olPMKx2LpB2pjdkstRC36xEfqeh0DmwXG2V+0WJp
	tlmEuwjtD05zNKlW1iJzL/ZTN
X-Received: by 2002:a05:620a:290f:b0:8a1:b5ab:bbd6 with SMTP id af79cd13be357-8c6a678d1c5mr1037441185a.71.1768680675405;
        Sat, 17 Jan 2026 12:11:15 -0800 (PST)
X-Received: by 2002:a05:620a:290f:b0:8a1:b5ab:bbd6 with SMTP id af79cd13be357-8c6a678d1c5mr1037438085a.71.1768680674879;
        Sat, 17 Jan 2026 12:11:14 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.163.152])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f42907141sm164657495e9.9.2026.01.17.12.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 12:11:14 -0800 (PST)
Date: Sat, 17 Jan 2026 22:11:11 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Primoz Fiser <primoz.fiser@norik.com>
Subject: Re: [PATCH v3 1/2] clk: imx: fracn-gppll: Add 332.60 MHz Support
Message-ID: <3wfaqupyiynig5fx6uuo3jhole6f4hxwmaetcmq4sk4j3w5a7r@qxyrms524sl7>
References: <20260113-v6-18-topic-clk-fracn-gppll-v3-0-45da70f43c98@pengutronix.de>
 <20260113-v6-18-topic-clk-fracn-gppll-v3-1-45da70f43c98@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113-v6-18-topic-clk-fracn-gppll-v3-1-45da70f43c98@pengutronix.de>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE3MDE3MSBTYWx0ZWRfX+G5Nr2+pfdyj
 Jk0aewQyI8wf66n7Jm5VR9iAv2ivVkn5MbFls6vrmefwnTsjl7V7BNijS/dqX+g4ukIbLH5eJYk
 au5+4VrIp8BuIO0MAzmvdbvM0YJnLR0ZnX7qPku2WLGsGN2skcQMipmxSc4WZcPXGl7sMUxAOBu
 rMPEdvfx3/LbF+iCsuU2MYEC/R05XsV+7lXs5J3UY0oz+rkxIT3hhSE1hQcHs4qSoSC6nvOHHT9
 isXFXG/ybDAB20iS+w5h1ZCE0vZaBKBywmLnUaEMlPJg3py7b0RiMnBYq4mNUMbpTWbLvrAlVJP
 uhBNYJEebzR1PNQadZejy4YTXG0Bmgi6w4uabJECdosPWfJj+56l3y4yLGTeY9jASZnSbUBYutQ
 3HgSqvJMy1piN7tu35Qp9jY0MG3ROevZEOqEg7NfmX3FaST/w381enJedz8XKLADGyHRRRqvuNp
 NfR2VkUWyHCknsLZxAA==
X-Proofpoint-GUID: BZXveo2XE6w-2Ki-2Xjv_kUsTpBmuw-2
X-Authority-Analysis: v=2.4 cv=U5yfzOru c=1 sm=1 tr=0 ts=696bece4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=RUlelSpolvTNyr7Sls5SJA==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=xkLUNt4dAAAA:8 a=EUspDBNiAAAA:8
 a=aW4Cx1oNOFiDtan71kAA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=A2EApc-QTtVVSfvlwUcc:22
X-Proofpoint-ORIG-GUID: BZXveo2XE6w-2Ki-2Xjv_kUsTpBmuw-2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601170171

On 26-01-13 15:52:41, Marco Felsch wrote:
> Some parallel panels have a pixelclk of 33.260 MHz. Add support for
> 332.60 MHz so a by 10 divider can be used to derive the exact pixelclk.
> 
> Reviewed-by: Primoz Fiser <primoz.fiser@norik.com>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
