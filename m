Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D93849365A
	for <imx@lists.linux.dev>; Fri,  9 Oct 2026 08:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791533512; cv=none; b=peQOWFHRyy0tJNycbXPct/7v0l5AG3jp2vX2LgOViDzZYBlXd3cE8tkckldjFfSWjozMPCRsfcoCPSkGnfEz69b05kQrGYvu9s/3UzNXzTB1mApfx9ML0SEQ0zw7+KV2THjreLeq9GRZlX5duimx19FhOQbWLqXlZCxssFVfGSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791533512; c=relaxed/simple;
	bh=gRbbps69VA7y6AulrLwCFY/nwePzdK2qYrbO3Y+LK9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P36JZ6uu6cUq8RWsqzLPE3iRiSdjiy71lHEzh7XkjP8tQM+ah2iOiUALHCDoB4Tw0n9royZxxA+8o4kPZ0TCh4NFHaQIToY+kRUA/QXx5RuldP1QIK7z5WbdhlzRexSnrpJBiC8Yzjpc5y6qNJ9GGW//93AC8A8UNgwqy0l4Nxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fzcMbtO/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FJxHciNn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fzcMbtO/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FJxHciNn"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HF8F3768827
	for <imx@lists.linux.dev>; Fri, 9 Oct 2026 08:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	laHJsYnI/7xvkYGI4cOJBcsCLbJtIbGPxkDhu0frTK4=; b=fzcMbtO/4jaXDsL7
	gyiTrLMv+dryBtFCkSLJXLL6xRC3loCmHoBxikesbtcI2n59pEfjAbFFqVlys9cK
	wgzZbkBfOCDuOdR728Q0enWZ9JbdarRUaf/Y5t8zWkQ/1Ad+A2Kw6W73cf/sGLo+
	TH2ZrS7MF7HIwVJAirB8J48huJvqMPKmpX2IIIxaD6Iqfoxi4p1nQSfvtbm+Kb+X
	IEGXn9VvZ6c8KC4cvcFOER6dWWmzUmAHOX7uIaIsBDeu2F2vtH5KcogCsxd0iW4N
	8eJ/PG2jfE6q4ywIf0IenZsF0/s5ls/d09K0zripZ/U5DgTAYz12jurE/vDxZCiq
	aUgBvw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxu2kjs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 09 Oct 2026 08:11:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caf6c528aso1012999685a.0
        for <imx@lists.linux.dev>; Fri, 09 Oct 2026 01:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791533505; x=1792138305; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=laHJsYnI/7xvkYGI4cOJBcsCLbJtIbGPxkDhu0frTK4=;
        b=FJxHciNncIdNwT7jmhteGFg2Fnr8lgV4c5gamleBkZW4Qp2t8WquIQmUnMJ+UNZdFE
         Lc4rWcF0sacYUDd1zXFuH9uItr/bRsxRAnrKJ0H9D0Kx17t3SPotn6X7JgAtCHoeItQE
         oTzd8gI9RGEjDVMM9h+cj8NrKLXx+uqxlJ50UPjWKuJKZmMTSGEhgNeZzCVAP6uJ62bP
         mF8CBHuB+0o0MzUvOU32AVURnOAUM0zXZWFU5HWFaV/NETFkaPFniFJkSK/uqqqzYbih
         x9ZHuTYV+oA4SPn9HIYr5fUfX/oXR1WxzcuOcIuQvXj4XL1LDcxeHzgjFb+j95VkY5mt
         RQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791533505; x=1792138305;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=laHJsYnI/7xvkYGI4cOJBcsCLbJtIbGPxkDhu0frTK4=;
        b=IWAuVfWd2wfEAG9Y1hB5beV73BWbgYwQ7wg3ukwuna2L0lyFiUi0hQhnlt/PKSQfaQ
         rHz/7iCXgAUiBm3D3NkZjjd+FAJlkvJrwcaGrMp7s77YaEpJJcunqMvOiibTiblaH984
         MWjF1z7ttZZDvmNE/Ht1QPzsTVB2bu/8+vVKMPU+lp5wfflApa4L/A9kJxvEjS+OnhCy
         v1I0Icgo2YpS3pdvSQdQFvi7/LRKV6fLrCtX4txwFh6yKdpzK4iH1QQE6vc0PVifJkDE
         yNo/hBXPHV9HU4goPPofceTzo8k4VukqfDZPhdNuRBSwli7Wk/K7FTf/9P0/YefLtpJ3
         2nxg==
X-Forwarded-Encrypted: i=1; AKwUvBykiV+WB2GvDSEQ4EDWp/kXaaGoByiQygdmknh6jrUrQvDNzzXSlN5xV7FcT6SIxdG2Uo0=@lists.linux.dev
X-Gm-Message-State: AFuF++mohdP1zvGER150yXs6XVIBeoFdfFq/6W7z4WRcsAy/PNy91BL2
	HLv+6FisnLmpc97zs6i+YzvBAacPrVLzyIXtM6scxz2XdRu+2Y1oPQR55ae+3ediWY1Y9HiTSat
	Oto5G0n7YAAIL2zyEA81K2zAL7mCs3IwWuQJp7/kvILvSbApsCfTzKHQ=
X-Gm-Gg: AYBFou2kyQijHqukFubD7AH7w5Hu+6MHEvPYX/sreFjobsAD19upDft7uMmLcXJRxJ0
	6vCpqNvSTfw4lT8t22YFLXRVR18j6IlMG7XkMGrbZ4S3EzByJjqTV6PaM2VcDWf6KVes6nnlX3f
	eId+yHdEFdsWdL9mnZg+y13qJKpVDmrtPb/eGBCF+RE7O+JpfqvwJKzsdEk8t4/xwHu9HlnbedT
	JH++9enkvogYiO37pui3N2HT/Ncqm4WpcEXkd22ezi9G190Z1EJVQ+OnfkWwdoOHroyHPWYuZbg
	SRE+q/+HmU/xp0ZdiwmteQzM9XSXhRfUJg9bihNjixo/E4ww6cXDesGXbe/HGOR3jNYAyesig2s
	6tmd4Q1P3eLSNXQTIbYEfj8uN8Do=
X-Received: by 2002:a05:620a:270d:b0:93e:976b:5c44 with SMTP id af79cd13be357-93ebd2960d8mr145639485a.65.1791533505137;
        Fri, 09 Oct 2026 01:11:45 -0700 (PDT)
X-Received: by 2002:a05:620a:270d:b0:93e:976b:5c44 with SMTP id af79cd13be357-93ebd2960d8mr145636485a.65.1791533504545;
        Fri, 09 Oct 2026 01:11:44 -0700 (PDT)
Received: from hackbox.tail37bb1b.ts.net ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be97d1esm65404655e9.8.2026.10.09.01.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 01:11:43 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Frank.Li@nxp.com, Wentao Liang <vulab@iscas.ac.cn>
Cc: abelvesa@kernel.org, aisheng.dong@nxp.com, bmasney@redhat.com,
        festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mturquette@baylibre.com,
        peng.fan@nxp.com, s.hauer@pengutronix.de, sboyd@kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] clk: imx: Fix clock reference leak in imx_get_clk_hw_by_name()
Date: Fri,  9 Oct 2026 11:11:34 +0300
Message-ID: <179153345647.1914323.1489876411002078599.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260915055515.1730145-1-vulab@iscas.ac.cn>
References: <20260915055515.1730145-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfXyLaIUyNbdSkg
 U1VGNw4y9XnX2e7SFebzkGlIR1RP2WQNuzsHqRK8wTqLryGRGuGjs74ocSLKR7G6ETPErzucyiT
 svVtJwlCzXRNMqJ8QsD1ma0kHHcg8o0gKnj+dHXXFiZySvImU+Jm0hkm2KOdq6w13jhqXKXG8yH
 wGcpYH+qCcfpn9TYYH0NqE/Bj9442Tk+C+wSPu45dvXM7IdoKa4nyEFP8QeUKUUvdlzl1s3rqHe
 R8D/xDr8gzq9Ve3XKemihd09yngud0UJJdnDLDSVoyNXB5uhvrZgiQwVEv2/0lAbaBbO3uLMqY3
 B6QYTxKbB8w2GdTdJNr/0W5YF8Lm4WE/7vxfQx3MMSkiuIKrjH/WDBgFqlBU55hgGtOMIso1MEW
 9CufTvnQLXLzZSNnlzCVy04yw51r6EokqkFsy08cNPxJ+HGWLIrbAw4vzGEHHKQNa06fyLRAlnM
 768u0PfRr254QODiPbQ==
X-Authority-Analysis: v=2.4 cv=QbjzLcbv c=1 sm=1 tr=0 ts=6ac8a1c1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=DNK6b7R2SRMYshW6mIMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 6FrOKAElaWpFoUViPSTLhadRvWAwcFi7
X-Proofpoint-ORIG-GUID: 6FrOKAElaWpFoUViPSTLhadRvWAwcFi7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfX+NP4o+1B6d/p
 gldILqAb36ErSFJcygxtHmiWOdgc+h22L9VsLbCuIaijmLZMDJJ417IApSZx39pYLtkei2mPrVn
 I7163Jrifu5GnOBDYqr9lSEUe7UBsEI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090032


On Tue, 15 Sep 2026 05:55:15 +0000, Wentao Liang wrote:
> imx_get_clk_hw_by_name() obtains a consumer clock with
> of_clk_get_by_name(), extracts the hardware pointer with __clk_get_hw()
> and returns it without ever calling clk_put(), leaking the consumer
> reference on both return paths.
> 
> Extract the hardware pointer first and drop the clock reference with
> clk_put() before returning.
> 
> [...]

Applied, thanks!

[1/1] clk: imx: Fix clock reference leak in imx_get_clk_hw_by_name()
      commit: 8e177ca735761a1f03e1dedffd7ab00d6d0540ae

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
