Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E49E33031F
	for <imx@lists.linux.dev>; Mon, 26 Jan 2026 10:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769422488; cv=none; b=eEXyvV1A99a+cbTpNDrK0tfoAKBVpb6frnUVhJuhK/fCIncg7qO9MXaRhz1Zt95z7/o/aVbwL42spiR5pXD7+GlaVCntq+CK+o8T6KB3MqTPXH8o8whR48Nptu59hY48OHV8SjlsB/GH1rxrbyZjUFeZCWXjk0xHYphWsDMM/i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769422488; c=relaxed/simple;
	bh=nxEhAbzUXqWnF3GtEIE6Wfar4AmH3DAFLdLk3kB3Zw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b+Mi5ty/TrqIPAEfDdw8JQQfwGEcbbYfr2MccRUeoeyfkEA6Ex8a8ZvGt3p+2mRd9CGWtN2ckJkYXO36kaojP39j5k9L3l8V5aaMjGX1Tqs2Fa2V5KouMb8tdv94Npyc1T+smqZmch+aaibIKkZ4FE5nRAZCPM+0vgL5ZvYuouA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TEVY4r2p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ae4cJTu4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TEVY4r2p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ae4cJTu4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q82gwH3677927
	for <imx@lists.linux.dev>; Mon, 26 Jan 2026 10:14:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5yhpcFu8m2C4OmsSHPsRpoVJ
	XKRoa1siTRePuREnYoo=; b=TEVY4r2p1d2thn9eDmOkpbYvk6tfeFPh1u1Gst51
	tBkqv5uz1+CeuEMKpP6cUHl+Hpjn+CXwfp1RJD1sJUWIAQp1CfUVByHLM8GotX04
	Uxk5ZosIAh3wtFuuVjmiBhnQx70ZMaMXr6ja7AJwfLCxBEVDqtumVcyxi6V9XjFm
	tI6OWfTqKIOUzUNfzEpswoX0xu1mlh8wIypa7N5CjwUeFrEedFWyfxQ8Wpjuv5jb
	Ntrvyg/sFW8YUpsopwp9/plNdXpRJMX8PXXgfFq1m8IVLBihjIpOy8mOedtAemy9
	H4/0un9b958F2Khng5QOHBMeyT1BBEkGPS+vPjLHYT2fqg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq24m5ye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 26 Jan 2026 10:14:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c5296c7e57so244898885a.1
        for <imx@lists.linux.dev>; Mon, 26 Jan 2026 02:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769422485; x=1770027285; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5yhpcFu8m2C4OmsSHPsRpoVJXKRoa1siTRePuREnYoo=;
        b=Ae4cJTu4ZMjHU2BTgtWs15RgmaYI8xPnYC/ppL4a0UnLeRdSwKdyzPzPAfSJSPKauY
         fVMCQPUTh1HgARdgJpe8HEcvp8Zv6DZdzeX27rqMSITNLK37jMFlayQajwdBADk9XywS
         UL9cG6Zxk37kJmum14odBkmex88qkRPij2uzqhRyqI14zuANuHeR2xIQYUvaoMjk/cXr
         bGzOhOpYMzoriovI4DjOyBzjPh7+Ldnn2SqUNViBP0hMRFBcZ9fxrHroZmfTGm1qV+Mr
         gG2XdnFVcTCEbjs4hPgFUqmjIDDJVUajRXlx4UasL6XyPH8H85MVm8yB80Twb7Bja/6o
         jr5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769422485; x=1770027285;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5yhpcFu8m2C4OmsSHPsRpoVJXKRoa1siTRePuREnYoo=;
        b=S2dC+q1WVn1N9tCZNkAHdWbkdD+KpoP6/lSdN6sokzugdzpQDWjf8RlGRAAq/bWl+9
         6M+mwI6er08Oj3mHwFBmyJ6NN+rqXMRSGbewFSrNOaCOo8zdVsNweq6nBIRs4RGl+NGq
         HVm0X0Gr40MLJhP2FeunkABH8kllm8fvy4fcA8Dx1DIqI0+CvG7u6QiyeqGZS4AwVJJo
         rXwvhlvc5Ss9evtJR1ahK6ROmLOEs9Qb4ElaX1W2Eqf73HEy77Yq4oPecCsKOOykXrDg
         xqNF5ZomJKmKKOXvNGOGmpDwRo2l6h2SLQGwK45jQo8Y975Pf5G/cZyjzgIQlkp4G1tt
         kQKw==
X-Forwarded-Encrypted: i=1; AJvYcCV3W9KDKx6kKdpIzO5zrfXe8MAMVu31lCcOTcXfzRyFsYOBQOs5vY/evv3LE9pAG3MinxA=@lists.linux.dev
X-Gm-Message-State: AOJu0YziZjZzW8ZZAxyFF20oVXh9eEZ9iYR59HQpURda7hMyin5ARutv
	zwmCWbiDmM4angay8ZHUGnaHkrsVC8Bk3bhikZ+jYwQC5AG6zjiOSBT+RMS76YLPwZBbqt7ZvLh
	FJ0OMDgSreeQ13LtQU3YhG68V3Js20l2NENjX1MSRmX645WqasCBwnkQ=
X-Gm-Gg: AZuq6aJanD/G5EM/dW7z6lAryL+r6pDqcVIJVwZ35S487extl/GPpws16MLSju5Xl3X
	+vncJDNdTDifZjh93LdFwXAvGjnP0tUOVfTByD8X9wIjbTAdVlDV4+qRXhsFtKh8hSVNgVhx390
	fa3wGFcOYwRbEVZewFKXTk9G63hYPgNGkTVjqDI0XPOL7xRgYKGfACtSyan5gw6P5ycJM7FFKzy
	nFCeA7eXeJLo9F0BST9LA0SlXaHSAB4+m5dBI2m6l7SqBM5PsHW327isio4h3skWfUJITFeDKu3
	GnwWLNGsS9Hg4xJyyDYtL8w5l70czZB9PlZZiTmI2WMcfjyQkOtOglMEJmY7BPucD3EpT7NSTp7
	doHVFbOrsHKd8ZPwInnywEOv9
X-Received: by 2002:a05:620a:1911:b0:8bb:18fe:d1c5 with SMTP id af79cd13be357-8c6f9572c3amr418714185a.9.1769422485499;
        Mon, 26 Jan 2026 02:14:45 -0800 (PST)
X-Received: by 2002:a05:620a:1911:b0:8bb:18fe:d1c5 with SMTP id af79cd13be357-8c6f9572c3amr418711485a.9.1769422485002;
        Mon, 26 Jan 2026 02:14:45 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d85206fsm266606285e9.6.2026.01.26.02.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 02:14:44 -0800 (PST)
Date: Mon, 26 Jan 2026 12:14:42 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
        imx@lists.linux.dev, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: imx6q[ul]-clock: add optional
 clock enet[1]_ref_pad
Message-ID: <uilxikzky53j7sg2barmsu6fkco2fiwgak3fh6eqc65iggmbge@7oogboikthae>
References: <20251106-ccm_dts-v2-0-12fa4c51fde7@nxp.com>
 <20251106-ccm_dts-v2-1-12fa4c51fde7@nxp.com>
 <aVwV8/rg2h2x4OwN@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVwV8/rg2h2x4OwN@lizhi-Precision-Tower-5810>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA4NyBTYWx0ZWRfX9j+fjbPgh66D
 1w3xg3UrP9i40ZbyOIXvMqz6BPI+Q0Q7jQngMjw8s5Jk/OgerRuQoOwCIKCt5l7BuM3+Mto/7LC
 f4SlAZNc4h3m9erRVvFKp34wJaF/YHFzhybt0yvg3MvSowebeVJeDYRqG844P1oetskUrEwK4EO
 uPNRh+OJcfrsTfoe56DWLqMB5A82X7KRmDaEMjiHI7QAf0uFUclvFFYe4tlDjlIxdhGJ1oP95Ta
 QJE2jFaPC4GHxiy2X8ScsNfbSwbcuWRK8ZD6XQkGbzGk9iGLCFwuV8MDTCIxDl5RTzoFba0nEJD
 K4SQikgqyd0hpC5eHRtqjFl/32nUQRzDk3aC+Ta1BkA3BzoTEANbEr4+OdAWyw9Dh1XvRgPpn0a
 i0s3BG9339SZXIUd/1uzDhKd4bUM37rAdIDxXCUX4UP7zL6wBP7HLxBvdRmXOliyFwJIVtbQH05
 RHm4Rec57b3AH+DaP/A==
X-Authority-Analysis: v=2.4 cv=EsXfbCcA c=1 sm=1 tr=0 ts=69773e96 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=XYAwZIGsAAAA:8 a=8AirrxEcAAAA:8
 a=7OV0ED95LoZXi-xfo7wA:9 a=CjuIK1q_8ugA:10 a=QYH75iMubAgA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=E8ToXWR_bxluHZ7gmE-Z:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: AE-88RFBgbqByTB3jZHuGo_nCOKEQgr2
X-Proofpoint-ORIG-GUID: AE-88RFBgbqByTB3jZHuGo_nCOKEQgr2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260087

On 26-01-05 14:50:11, Frank Li wrote:
> On Thu, Nov 06, 2025 at 02:57:21PM -0500, Frank Li wrote:
> > Add optional clock source enet_ref_pad for imx6q, enet1_ref_pad for imx6ul,
> > which input from ENET ref pad.
> >
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> 
> Who will pick this patch? Abel or rob?
> 
> Frank

Missed this one. Sorry.

Will apply.
