Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDDF43D4E1
	for <imx@lists.linux.dev>; Wed,  6 May 2026 11:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778067639; cv=none; b=uUfbGFcWjp4JEcqSuKb92yWIvq1ctOiFMFV2GlrFVfLkBm3aqFhH3ZxTEb+F5Kvd/05qeBLafepVWy18o9dr3IXvhxezbYgGvCgT9Q19hDrpmStWVaU3acVwnbVy4QCHlkFZ/x7uSSe4Fsv/6xYPRy+hqbFCF7jeNYC0NcOuQSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778067639; c=relaxed/simple;
	bh=YwHnAea+ZNdBKSZ+FdKL95GqYoOJftrvBMYNNriODHk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Lc+A4hkGMTvAqg0HqDDPALNVMXwApFWVBJQrVotoHQ24yFGVAK2wo+6geDL1uVAI09nq/hmooTx4ECOkF3kh3dnT0NPFYuW8eLthawURO3odM787hcdWRHn6smMR+KvXY0Gqv44Y1FooGTfS0+jcR/81Yctb3fubj9QvAEh7Qho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pDkpRUnK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eS4x1njo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pDkpRUnK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eS4x1njo"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646A3UdO1953101
	for <imx@lists.linux.dev>; Wed, 6 May 2026 11:40:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0oPLdXXouDVkhJv0oKpMf1eGEE226oo0STDXOOYuHJQ=; b=pDkpRUnKxfGFLMT5
	IN9zzXR7jhmgMF1GVsF3zijISdON48bJVwWva/q0u0GihR5r1vz1O+2J7MsBo43P
	cqZVAU11HbGoawH34omEc3A++vGylnf9Kb25BsYi1w1dTWZov8Srucv3oMR5sb1W
	LNoWgFdQKjKrekMnMgjHRT4egouTlr60rtxBzR0T1v1RmzC2BIdrbd8VCCGLyVK6
	AjRB8+3XLAFpEGJcSCzIxHBaWmL/MvWYb39ydI1kDGjODtj1ktEE96R6GOmnFQsI
	w66NyMy9WFDMvwwXf1tsubzcjgHn2DVJLyq8nMJRsft5JWnYUG6sBbWtlI6wZ+sm
	mALumA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e03jc09f4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 06 May 2026 11:40:38 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c6e24ee93a6so468028a12.0
        for <imx@lists.linux.dev>; Wed, 06 May 2026 04:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778067637; x=1778672437; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0oPLdXXouDVkhJv0oKpMf1eGEE226oo0STDXOOYuHJQ=;
        b=eS4x1njozwLmh5OSbfoveEtDAuEqIOQXpjrmG63hrR1RP1XhImUdiW99bqDJz/VriK
         9YeCmnmJgQu6xch0tJ41ofpo0vlFjgEWMtqvkkmL13g8d7ypfaWdklRrvUifH93XHeb3
         KsWDAywm8GEbBNRWVQmoy+x0/iB06Y/5qrkNcpL8v2hR/ub2c4rYzAZxrO3bXnUOLWWB
         CINA6pNedgYs107lP2PmZVxcb19N+NHj7YbRvPgEsEjHQ1tVonQJtjg7fdtBMCwVW7bs
         p9sjdfzzsbSqjAx6egvaHIGifb1/cie+nZyMd5Vhn3l3EtP4Rf8xoKYsS4mmnHTru7HM
         OaGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778067637; x=1778672437;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0oPLdXXouDVkhJv0oKpMf1eGEE226oo0STDXOOYuHJQ=;
        b=mYWQ5QKn6T87IJtEZ0HRCX9b23XjGsJcsXMetfCBx6P/y1CNzidpRzGpvVn9pfU3uK
         XiFqWSMcHNEBnjyAKD0+/3cvAKgn80YzZ9PeImkkd7uSjmdtsCYti+tN9CPkw2VFharW
         N3heZYxIfEkPvRikoSf/hYO98mU0GBbwyo2KbhB6sGPrEmlfAgHIzwxkpri6dh510dJ4
         0Es2kjyrk1vZ4kpjENW3cd4NWNvabWm/6HyGe3L5mXtv8Ch04vROwgAMGzNimkOHlwMh
         sEF8PvlqP+w9N4nDv0ALdoJldu3Vx9QZ3JD6fl3LturvCkZK8VpYuM7wdk4nutnyRUtn
         VCvw==
X-Forwarded-Encrypted: i=1; AFNElJ8u+1Qc4LvpJuQTSHnUHTT8kbP8+5i9V8IAafyL6N+e3v7zv5eX23ReDqDke6BJHNxNvCE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwKZ3/mIqtelRIyOhtA6V6GBj45HOwSXpika80Z0MdVimvp93me
	nLD7podR/RhAqwcAXMX3RLridR+MT68tTxnaYsSJaETD0AB1d8dK1Dg0lxbIwWSaE2L2I4Dlui5
	ICa3oHWmuI3ph4yZVncgUhIfxDi2Tj/8zsT+h6Mbd3+1HXxNrntM0OB0=
X-Gm-Gg: AeBDieuvdm8Klde1uJIiEpxWlYepHnOIg9hn2KpEtaTheUoYMa4s4U9dD0KSW2RPMh+
	MRpY+v/ACtKGIKONX/PsKNfgkEoGZcr7/nTh9utjOFjJdZ48TtZilrVQzPBBFxiQVZGjX4qROS/
	HboTsm6chYdAaGU/tdxROM5h9MI1ePf3lwNEFpENmUkBoa6G58s/LFcCwbu8wANf+MMgSCVHBnY
	fEaEqeTb6UDi/FWwuwVumrqcMEYF6bYAgTLBHT8/Yk3Yjjj2D9kiop/UGBkwfDhcpAA64n2sSN+
	nazHoskF/Yrh+sVUTokIiQAHE4EV/EI4GoHmy5R6OHu6fzK256lbP2Brv+zhGmXcvTad7La2DN2
	pGhBSzg5u/fCPQ6NEXpSMdd45SYnz8gM=
X-Received: by 2002:a05:6a20:3d85:b0:35d:cc9a:8bc1 with SMTP id adf61e73a8af0-3aa5a315ec9mr2589469637.27.1778067636436;
        Wed, 06 May 2026 04:40:36 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d85:b0:35d:cc9a:8bc1 with SMTP id adf61e73a8af0-3aa5a315ec9mr2589412637.27.1778067635781;
        Wed, 06 May 2026 04:40:35 -0700 (PDT)
Received: from [192.168.1.102] ([120.60.67.236])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965946543sm7058783b3a.16.2026.05.06.04.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 04:40:35 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
        kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        Richard Zhu <hongxing.zhu@nxp.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20260319090844.444987-1-hongxing.zhu@nxp.com>
References: <20260319090844.444987-1-hongxing.zhu@nxp.com>
Subject: Re: [PATCH v2] PCI: imx6: Fix IMX6SX_GPR12_PCIE_TEST_POWERDOWN
 handling
Message-Id: <177806763016.14331.14072129675795042605.b4-ty@b4>
Date: Wed, 06 May 2026 17:10:30 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDExNCBTYWx0ZWRfXyO4lmwEM/c7d
 MclP7/ApZFwweUw7hwavt+oj50HIFFXnTDU5w2LS3xqkwcJ0xwHUKHbsh/Jfr7DhgeyG1N3HgSD
 Y1s42ImWamlrBaBwraevvuIec6yL9KZ7RRC5dqO+kwswanhdB3l1bXNnDy2SDMHomx+MMYl7r0W
 u1p/wOVAsvTNif41tjtXMqroq0o40g6X+NGeCWlDF0iogcnuh9payKoujwTB7DP7a4s9w+v1pPJ
 fNtJjHK/JY9b5MH1kRu05j89XwlQbHh3tJJYSDY5S9zMx+vbmzWzlL59P0uO5B4PW4WeEVMlheK
 1gOkbAIoHurIiu92/q0pSvEz9B6H+VvJklELjV2j6zk91tf6zbSB0dcFLhrC3eeWmaD1Umxt86S
 kKQOr3hkmMMne3wSZgprkvddcLsQrbm8AuqggdYE0cM80Cw7fygrVIztffXZHCV9YJG+y70wI+V
 oMJgxUXfh05RF/SYYnA==
X-Proofpoint-ORIG-GUID: O5RJO4bHH9TcI5i52USjXBGNK2sYNftq
X-Proofpoint-GUID: O5RJO4bHH9TcI5i52USjXBGNK2sYNftq
X-Authority-Analysis: v=2.4 cv=EpHiaycA c=1 sm=1 tr=0 ts=69fb28b6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=SQtj7D3ryojUavkWoQJ0Rg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=VlnV4lHhP5wV_tSmghEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060114


On Thu, 19 Mar 2026 17:08:44 +0800, Richard Zhu wrote:
> The IMX6SX_GPR12_PCIE_TEST_POWERDOWN bit does not control the PCIe
> reference clock on i.MX6SX. Instead, it is part of i.MX6SX PCIe core
> reset sequence.
> 
> Move the IMX6SX_GPR12_PCIE_TEST_POWERDOWN assertion/deassertion into
> the core reset functions to properly reflect its purpose. Remove the
> .enable_ref_clk callback for i.MX6SX since it was incorrectly
> manipulating this bit.
> 
> [...]

Applied, thanks!

[1/1] PCI: imx6: Fix IMX6SX_GPR12_PCIE_TEST_POWERDOWN handling
      commit: 5a8c573879379eed867d279f7437dd4e3aebbb7f

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

