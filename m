Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6194E42CAF0
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 11:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785239081; cv=none; b=XcTQVB0YJCyW3r1ef5QC+Mh60VBsVFHq2jGgYJUD3+Q2t8u7uC1DH6U9yfhxtHePFeq7Ov3Dm56BrxA7+ZWAV9/GUz1gaqa85y9+FvhOZbU8hbGbd7h3how4f3oWNrkW2XpVQy6GVuyCGJD05iWnxVzxw3+7zYfCLg+1I+lDQuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785239081; c=relaxed/simple;
	bh=c6Vqvc3Mc6dUZEOCGASd7IPojd6XeY3sxjbT0ZKnDR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MDADfuagAeT5KPd+WqtO1ruLIpepI69amqrgS7lWAx9XYmx1JjI7LEuIIBuS55Td1sNKhBNUiiNC0Ql/KWoVpd2vTmpvv7pHFCwS/9k9SUO5GZ8vFBt3SbdqQ60CEGaWsiAC8pWdeSjWBEZtL9nkXGrS1bfBVZPycflYiRNv7ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XoKn5Nq2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gFiXfcgi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XoKn5Nq2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gFiXfcgi"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBHHxD2777079
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 11:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lmb7mLT6I+wUdBFIYH/lJzFOn0vXeKtWULk2K7WDTjQ=; b=XoKn5Nq2UwFWmGvi
	1+fg/dE/t/nkXYXNR7Nc+yVnIKhyQmQ/NM6M7SNdltr7/bRVF2/2cMU9VgDPEQs/
	NZyiN8t64y2I4IHcQVTnB3v92LlByKkOYptyp84DZoCgKBkZO6DJIRm14O0dEFwG
	3CYow3eQyXguL2Ilvh0+xN1tHdKZmwF7iybuYcgKxsWsYWdIy5GoS2FODBGMcCOt
	A3u7ckTbz0OCrHEx1MP6ncn0951yJgH7ApIbpykXkKU4G1iU/z3p/8KqH7sLRwDb
	B3y7b2gmRvQByixGMZZXJ+jZ5tkEzF9tRdSZ+tYa6be8i+k/XTBXiunBQ5cLMKSn
	5L8CkA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fptatgc5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 11:44:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bff5c7035so80985961cf.2
        for <imx@lists.linux.dev>; Tue, 28 Jul 2026 04:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785239079; x=1785843879; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lmb7mLT6I+wUdBFIYH/lJzFOn0vXeKtWULk2K7WDTjQ=;
        b=gFiXfcgipHNiti1kIsMDUh6awDRhdSMTGr5zLL7dUoXorkdMPD11+1zwWGeZgqCq2H
         DekK4brmacl111sT0w1/AhK4EILd1mgsnp/paHc8pXkRiTKU+CHNXr8vRclmalAMuiG4
         EidoqHwoMgB/Zkscgm8LR9uR4tu7K9Ul5Ha6NWMTGsZb+LXMaDVGcVTS35mCaEZ18f70
         iElf75vPQAUyRaXiTqoHIq3/enX6SXrtPtMW2cCJZN92f2RQMEy4OaHMDaZRQeo+Xpc+
         VOnXcKRtWa93T3skyv5VEFYG2XnrrneRNYkZjTOTJAItxJXVzyV4eTURZ2Z7xRh6tFM0
         +n5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785239079; x=1785843879;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lmb7mLT6I+wUdBFIYH/lJzFOn0vXeKtWULk2K7WDTjQ=;
        b=JeYhLuDCv2QtHJMjlpgHlQ+b8DE+gIWfVaFzB+jJx8zzgr0ylsiJqXMAySmzvZ1rU6
         yLUITrmYe6UCfu3xZ9km49N2fioM9UobEY7pcRdFQotVsabmRWRibMgrOI+Fknhzp9dU
         4vzzrf+CqKFj3q7Vrv8qxeteM+6fl8npaAUh2GiKfOYE1QduT0FDmMQRFLkW+Sez/IsQ
         j76JMht5lHrcGcNkmmjmTcyxyYVCOAU713EOx+Khjt0K9CKGryQ4ren3R+QX2oAgV7SG
         djNQhtn9iqYLeyO0l0UtyiCeIRrY0K24KZKPh3qXW0qFuDbHWysVyiHR7h8P0HYS5gWV
         X4kg==
X-Forwarded-Encrypted: i=1; AHgh+Rr0xTdtMGndeHYd6FOExqnL6CJbn/x8Ccqn9mCEliGfZYviJXJq3fwl3UK15/Vy1Tgwq6k=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2gfVjWkwMMrI90wxuCIY0B3EadWvnqXftnMCPuuZ5FhntiFOQ
	C55jYikwE6IVab9sMoQ752hGtL6VlNldxa4LiL6EUSrCBoK7823ctmEtQR+hUZpUT1mLNPct9nj
	JXt/E8Pf7j7j/HyPencbnbdmTtzLJRq7ZCw6rpQyrtSBxnHfXZuQJ6Ws=
X-Gm-Gg: AR+sD12Sz+RyHi0JLfqHZMP34kh+DjtRZvZgXfNCF2fAw9JyMwajkL4ZyGfIQefW/j9
	4ymWqD2+bwVIi7+int2od8Y4m8DX2pG6FQxD+k3LBsAMLJKSOJEZFE/bB2w7WilL81O/pAU+R1x
	q+IJJa0XsHPtdHYhn6fzkg1vw0jEcr+fvb3H1GgLjBwNbcgaBvZ4aM3C/DXouMVscjck+7i47cq
	+wyVCxUp3flbRGy3rUmBLfPEZrCTnB3Eribk5NEKQXtEOpxYmyCfHOsHbCpXdbAtfcE1z1ahUny
	0nNrAbGX/SBb9KMtRy6nwu+ASC6vh95dAaj2AZSbrhOzOdyVaQr16NB0VUg52soNbUFTduKuPOH
	IhIx9ROws3gCpgzX/MYx0mWnmMNc=
X-Received: by 2002:ac8:5dc7:0:b0:527:2b06:2bcd with SMTP id d75a77b69052e-529d7182312mr16400931cf.79.1785239078433;
        Tue, 28 Jul 2026 04:44:38 -0700 (PDT)
X-Received: by 2002:ac8:5dc7:0:b0:527:2b06:2bcd with SMTP id d75a77b69052e-529d7182312mr16400061cf.79.1785239077097;
        Tue, 28 Jul 2026 04:44:37 -0700 (PDT)
Received: from hackbox.tail37bb1b.ts.net ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c46160dfsm68407265e9.10.2026.07.28.04.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 04:44:36 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] clk: imx: Add audio PLL debugfs for K-divider control
Date: Tue, 28 Jul 2026 14:44:11 +0300
Message-ID: <178523892596.3206426.181670345541616200.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260604-imx8m_pll_debugfs-v3-1-4e331ebc85d7@nxp.com>
References: <20260604-imx8m_pll_debugfs-v3-1-4e331ebc85d7@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEwMyBTYWx0ZWRfX5a2L9lW+E4YW
 N4/uYc36O6cXuSaqBTftwuRbmFCzgHhkDFK5XPUKRC5dX+nPOdChwX5hfzPskBPa+2C+2QGQq2p
 lKb2fjeEXiVhtXOb1jJ2SDA/tEPVvdM=
X-Proofpoint-ORIG-GUID: g-QBzPRTPnxI7JQWZ76iwgqXXERMr6Rc
X-Authority-Analysis: v=2.4 cv=KtJ9H2WN c=1 sm=1 tr=0 ts=6a689627 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=1NP200KD9VQfxfjUtC4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: g-QBzPRTPnxI7JQWZ76iwgqXXERMr6Rc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEwMyBTYWx0ZWRfXxNR+4A+HPqqt
 GZod1C0QjIOv1yWgfrC6n4K/+qwT/0uM08Nm+257+PGbyxw0sVM7d/c+1pEMt573wBiAvohhyDH
 pRSduR7z4eBnErk83pba8ZieKmqWab8QYf0w8e3RmqRX8/IJ6ZcUAv7r9IpFZPGsr0+jqYjLvRL
 mlNT/SxSfbLVlZjBbahE3f4mkELCJOyF3F64NMmhocORZ93xn2uzcpEPy5Yt3suDuphF+EQF19B
 4h1+UU6P/Fek0NdE6iSSEWcsNoQBuy2JR9alUHdfPeCu2JiFMsZhphdl2uYVmQ6IVlHSn85rDm9
 QJDznZL8wK0p6fiKaCHIuy+1D+0n0TyX50DUXW9aCr95hygF9mjVy7NQYnsmLQ3SlYzMhGlYtOn
 xKe7Ai2+6fO1Pb9IQdknB36nNZF0+3whb8MPqLVYmrCJ7pHu9Pyd4kX4H2ezhv5QI5ogi/D9tX2
 7h8oeNb1bsCRNMSKgxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280103


On Thu, 04 Jun 2026 21:48:01 +0800, Jacky Bai wrote:
> Add debugfs support for runtime tuning of the audio PLL K divider,
> which enables fine-grained frequency adjustments for audio PLL.
> This is used for:
>   - Audio clock calibration and testing
>   - Debugging audio synchronization issues
> 
> Two debug interfaces are exported to userspace:
>   - delta_k: It is used to adjust the K divider in PLL based on small
>     steps
>   - pll_parameter: It is used for get PLL's current M-divider,
>     P-divider, S-divider & K-divider setting in PLL register
> 
> [...]

Applied, thanks!

[1/1] clk: imx: Add audio PLL debugfs for K-divider control
      commit: 468238ced6c39dd4927392f16cedcde5f27cd0ef

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
