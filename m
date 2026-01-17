Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E8F21ABD0
	for <imx@lists.linux.dev>; Sat, 17 Jan 2026 20:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768680556; cv=none; b=oV8Nd6LlG76ZcB+TTkURPcnoGY8YiWamFo4RpSymi1BBSh7eC6q6YLi0IQj/ctYi3SHWWdg8+tJn5GrmNIdd86fd0Sh1L4yrBMDoMeQpMliNpfMn3esGNM+7TCokqGJRfpFf/lMB5AnXiPkgat1p1efq4+uRPRI1Zf+yZOPueAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768680556; c=relaxed/simple;
	bh=MJb33HNgU3Zmytnv3tpMnmIy6S7ipd+PtC4wbgRBWlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ORZ8e3afvBukdzdeURBsxoXVBz+Bi32fr19OiySA0fSYzceBTf6VTdXXkpgCT8gJ23kU8YGyPtT32kSF+2ZKJPatnXYaxzv0Nue9+KfJOOHFEei+TM+ultgRbfT76w/7aaS4mNbgTl76C85jzEt/M0I6Ti3mEOlgCzD93O5isK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UGqhU13B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WeyJ9aYZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UGqhU13B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WeyJ9aYZ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60HDtnBo941458
	for <imx@lists.linux.dev>; Sat, 17 Jan 2026 20:09:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7V8bBuKNKK2x8c3lgEfAbpN+
	fsyEP0+sJm1A0oWjeBg=; b=UGqhU13BRG9cSmRH9uJJRuX+l6ZHcGijsonHFWvF
	Bac58faD6rtFDBekyjGzPTLqB3jU5/oiEIRG+j0nRuRoMpElC44FbJQnclLvA3xC
	ZUcAJMAXfpYRDEJJ0BIoiqBPyD9TfQZ26XDdHbyf0x9V84xQwLl6VBzB6X+tS8iK
	pbAubTME6sS0AWmxbfr6ON0jjAH0HHwV3VXFGoUzsILi6pYQc86d5f3FMVOVKM63
	TYOiRG2WZaL44meNO0sCADWH/rbtABUunjk9vX8NxBhpJEtCw0qo9L/pKgbKq3qD
	0wxq6oGm7mySjwFyyAdFyLEuL0caqBRhu2e/NgfXPyh/Tg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br1e5hhuk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sat, 17 Jan 2026 20:09:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52f07fbd0so1339033485a.2
        for <imx@lists.linux.dev>; Sat, 17 Jan 2026 12:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768680553; x=1769285353; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7V8bBuKNKK2x8c3lgEfAbpN+fsyEP0+sJm1A0oWjeBg=;
        b=WeyJ9aYZhUWgxKpePCzDFc1ZtHI6EiTxyuUBxWop3COOm+6epE8prg0g0o0vB5yz9E
         sHT8wv2VxtrINrrSIC6FXrLzoZwktIlO+fEnZ/Vr7Rhtt9KjktQoKDhbxFHr0dXx3ThZ
         fSfOP85bFfIDAWP9rkzUt/6E4Qtc1Jl1nu8NqbXR+tUHthuNQjYfLVCRob9oDhJ9bLfR
         bCplSUxSwYd6Gr0gCHQh28ZkEDoU9hODp2WuCB95pKO/rVNzz+4od02lbSKLQ6rYY8jI
         g4zLyMJseR60OqqCyYqAIb0rjrY3k2jzMAbeTa60Bpb/dv41D82vJrvS4nocMLJyqcPb
         3KUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768680553; x=1769285353;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7V8bBuKNKK2x8c3lgEfAbpN+fsyEP0+sJm1A0oWjeBg=;
        b=fHttQhel/5oCAhdYmOYS6nehuCUB6dobQVFGRtkBuLbjvWzo2nH3GUBor69i/0Q0cf
         WEQ/zRsqEzMo1NzNjSJL6mlKSpqe4RhTCZ9sw4FZD/1tHas2XOLu1MkaZeMyFLFVLYQ3
         B/UfvXqepbtA6yl77UI/tEz0oUnL1NRQECt5wqjMRSEe3FFZjSijB7ENS24tJ95n5Ymn
         4lG1PuSDH3LjEODPmWYkkXlYT4YxJiDUKDViYRHY2NJUZKicm0JxkFw+CR1h1lLjB/AV
         /pPTJsLJcxV8QLmvHK5k1iCFIArPxCd1n1l26ml16YDUcXR/JsbdKLKzxUzFA9svmr0x
         6yww==
X-Forwarded-Encrypted: i=1; AJvYcCWFZusS/hTF/H+awhkwP3dm35IAX/yi0jD6nidoynRc1Fv/nwOjrAKk/psAGcqafilyTOE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzrwmPKAshC7clqDpj2WhIHEc4CaQ7sjXH4umNtdt7F1eiauwoN
	UIGe1PBy+GhPcxPwV2pwe9dC56YJwBJOJc712o/UTW+5KbYRsWDAwVC51zbdQqXvE4s5CNkHrT1
	aE2f3UOxjE70FGg9snJSRMcbgh7ZFxSphwd1cIujkj6ZJnXp6Ex3a6/E=
X-Gm-Gg: AY/fxX7/ai9c8iC3aj4zaBtdjtqXeZ7gqAyQhIm0Cv8sF95/yTHN3T1M/Us9YX/tTfs
	o94TgLlZU6oaomsE2n0i0P3m/5eaxclO10tgv1B7hTZ5faPf2Zr90W3j9gKG6z6SSNZCDMAOUuM
	wCSsFatoqhtyxVNZcEwp6z+Jgf6ayL1N/z25iYyfkGB69AB9u1RHZpnEDc+h6gFj/Qk3pNwMr8D
	05KUvzNV2VpV+QC7Qyy2bu/cdIS1ewa1n5cgmYzkU5PFpGDwIGpPWxwzWSBw0FTozwIz+0YMAoc
	7iNTjYqIOPszqxmSQbTYduUiw8+q3gHRNBUwyWvy0U4sXY9ZIcCmI1mF3nowOfWiWKSrws7zrTv
	QWNN1PSyMr2P9iERnrne/ev6H
X-Received: by 2002:a05:620a:4482:b0:8c5:3881:da82 with SMTP id af79cd13be357-8c6a6944c4bmr929202185a.48.1768680552945;
        Sat, 17 Jan 2026 12:09:12 -0800 (PST)
X-Received: by 2002:a05:620a:4482:b0:8c5:3881:da82 with SMTP id af79cd13be357-8c6a6944c4bmr929198585a.48.1768680552304;
        Sat, 17 Jan 2026 12:09:12 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.163.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997df75sm12742304f8f.29.2026.01.17.12.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 12:09:11 -0800 (PST)
Date: Sat, 17 Jan 2026 22:09:09 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] clk: imx: fracn-gppll: Add 241.90 MHz Support
Message-ID: <zf7yc4s7i3fo6tcbenzmce5n5jszanw47umqixczxomx4ryby3@bo62yj6fyviy>
References: <20260113-v6-18-topic-clk-fracn-gppll-v3-0-45da70f43c98@pengutronix.de>
 <20260113-v6-18-topic-clk-fracn-gppll-v3-2-45da70f43c98@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113-v6-18-topic-clk-fracn-gppll-v3-2-45da70f43c98@pengutronix.de>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE3MDE3MCBTYWx0ZWRfXx7efjrtN/Ov9
 qi6mUd3j1mBXWq7s4qpS/H8W3E0IICqXvO+8+0q5KjiulRasseD8YsoIa1ad9dSekbZUh76/XRy
 9ayWbIXDEMLvq0Wi4Fm+Q9KY2FIJ5oLCLBxHG/w4A6W9BXbOqAFYzWOBJk08EYuchX4VsjQcxyB
 rc6SF+iL9fC2hxtXSfa7Jingck4EtUWVYFDRFrmbdZcVdUeTtY5RwvZ2RM/eLX+m0EYTVHSjEO9
 JYTfYbJockgFjm4fZlmaCz/vRhnpYCN4/HvT/LtJpmO6TPETnv9Kthish6BeEf0lSDX4MP3KujG
 oud4hzOyIhFmrDvD4BGDCQJHKgJL7S7kmPU9ta/ElIsLuHT0xqnAfgM7FMKijjdmffWXPKan1QF
 itp0BQUH0B15pvMxbwPuk/FWY0g6bZ8PEVFaSFovU/K/Xlo9AmRPMUkosUtJOt5i1WKVQJovHwd
 rfM1I0RbbFfGSMtJOww==
X-Proofpoint-GUID: A73SMedsYi3A-Mo_FxhhF3nyaMqlp7eC
X-Authority-Analysis: v=2.4 cv=U5yfzOru c=1 sm=1 tr=0 ts=696bec69 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=RUlelSpolvTNyr7Sls5SJA==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kZO3GQxq1qvB2pjO5BgA:9
 a=CjuIK1q_8ugA:10 a=_pNNAR3j44AA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: A73SMedsYi3A-Mo_FxhhF3nyaMqlp7eC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601170170

On 26-01-13 15:52:42, Marco Felsch wrote:
> Some parallel panels have a pixelclk of 24.19 MHz. Add support for
> 241.90 MHz so a by 10 divider can be used to derive the exact pixelclk.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
