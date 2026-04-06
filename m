Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE49135B649
	for <imx@lists.linux.dev>; Mon,  6 Apr 2026 06:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775457504; cv=none; b=h+Imb5t1m+abga6fj3aHu2Vlnsxuuq6mXigsTtJiE5nDJ2+KGI3+ZaSu6Uur/8O5jtn7m50udsY2tJACMmN4j60iEj7UpykKs3b+Czr1APwyUXiRuePJd1ebVSgFGw6yEybOcpG7MvseZljJHRYlkyxhmIjMYgaurQGVVL8HJqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775457504; c=relaxed/simple;
	bh=NKTG5+SHcXAW1JXdbaucnX+WCRebKnrDUyFIgU8QTw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jcon+A5zFn1VRD5/2Gr7qDR/7hFSNpoqlh5jJSWjMKoAY4NmyV7jJgkiIHC83mvHfeSQrj0o9l/42XszaNK/KcM1iGWu228IIN94Ki9Zh4i1nwl0ofM210f5/9pQbzPrwV0eLdDd9Uf7cukhUX3r3flu4DYRTxmmhdXdl6JtwkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eXpHbvDR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NE3MTve+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eXpHbvDR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NE3MTve+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635NCU1K734043
	for <imx@lists.linux.dev>; Mon, 6 Apr 2026 06:38:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tkqsgi/b9ZE
	29EDYbWjY0RehHrUxOeDAeSueJ7mUCYs=; b=eXpHbvDRt+Y+4uf0JmAFhVgxo6J
	13AsdqvlzVC6JgMSIcmZYjha2BPP+MIDX05acgQo764s9WR78/Ci4KTN2f6bL8dQ
	9fRW3259HTig6E5sno7GbNVbQpDrYUYsEk7x0IDf5Ke4CgRMhHSfIhxlusjj+apA
	TyWhk6OEqfAU8Y1jas8SgYNIE+nlQtJYQZm5mME1a7q/8ZesukB3hvr5b7DrYGnS
	5mmTyOhNoc4/QCLOKdVh+PvRorA4+rGVlItVuxMGrhO4kUFTMjHsuxP80DQafaOd
	VKlCwM1itQfh4BGOpsJdfbMgA6Gh0fnI27YmGBT2KluA37lb39slk/8nSTg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daskrmasq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 06 Apr 2026 06:38:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d984c74a8so4433531cf.1
        for <imx@lists.linux.dev>; Sun, 05 Apr 2026 23:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775457501; x=1776062301; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tkqsgi/b9ZE29EDYbWjY0RehHrUxOeDAeSueJ7mUCYs=;
        b=NE3MTve+cxFtCtWm3xaEOV0l/vxQQYVvb9xbN/KjopGcy0S9Bcy+uDTSxRIPgXmGEF
         Zqm9xWAtW/f/kKjdVLDEybmip2Br7UaEeTOp7db3+ZzmOQPsmj6InLsNhQ/9yfJa2NTD
         mmMhg2lXB+Ua/HuZZ1RQEJIyWZ2jP9wKX4C3kGvAXA32/Ujk9V367pPDkbdzCq3VUwUb
         58kTc21s3MkCT4kPVt5dpEHyoPag+wj6vblZY8mXghpW2zRNS3VbaQ30oQe541gFRbKQ
         38e9sVMxAbbFjEP2condTpmCPmFJw/Cd49AanAXAESxFrnf7/Xahaj48cDcYlj5ssfO4
         xGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775457501; x=1776062301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tkqsgi/b9ZE29EDYbWjY0RehHrUxOeDAeSueJ7mUCYs=;
        b=gCwdwRKztSUxlgZRrsfCOyi8Yf+3C3lCbBMglWfE/L1Q9H2sxdbbJv6r5C9oZmgvb6
         OeAMH4/ZMlockvr3XCw/fcPCh2c6/Lwhbp7THrdguOR+9u3KBEEU2FCRshNYJz1L4W9M
         lOAdrB0yfMDRo3y7+m6zaptd5xd8yWarVISsPvzFnwGqoikqTEhGIwoWD/63HPkhMDbB
         PQ2HVKNHBbntziCWYUVJhhxjUSyo8/j/VjzL7i1DbqI4Xms1gPaYBpFOZecyLEVyexed
         p14iruaS/F+aI+y08bYYsPOgngT1pUPCMxfMKXBaXFL2NrKBFEPduQbxAhFpLw0A7pdK
         rqVw==
X-Forwarded-Encrypted: i=1; AJvYcCVmrG8l1JjZbs//vreP8O97zkwQ3sauVHmZ5132dCpgJG34HdHggdRDzAw2MZsvRjUQcqo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwUvh84st4GsPkgP/na/uq/rVup7ojs/TFQHJYYJmEVUfhlLwGn
	z9RUJ/EvJ0S/rwQkdRFuW5zIu+tnnhW1zksVuOUyVlUd38zJ0U83nzTep/nbd/syirXUA8mbM66
	QKLUBn3HavIt+Cwk1GHp0tDEdQylxu3SavDAg7qziESLuaKz86wUy95Y=
X-Gm-Gg: AeBDievDV9yxJo/k1CW2r1n3D2pAyLFMkPJ/dBBIfbfouKEvF0KnL9HJh4LNlGCgEci
	NhVGKi6e1qmlFcwZQD8UwTl2z9YFPmMm/NvJ3U0yR4Uov2srUDfWyQxtdNQF4vWATR1e6C4d1ad
	U3kssR5nD36x2rjDAw68nI6bGchKSl+0fjFwQNajYhrhtcWUCwAKR8j0zEpxpiKN7laCfWUckfR
	CpQpKWpKL/XomIMcUuPwi+f7tvpKjpnlSJMJ2gTTX97A92u2NuRcUSmh4i3oDdTNXlwHVVPQWH0
	EtZjaVzRz0ThIzn4FTGrfW7XtI3FYQEdxK0wiKdodOhLLSSR1DP4VoEM4+ExVhBXjoospJZBqKC
	Yfc9uzAvqo77zPov53lum/MWrRxefHETetcYU
X-Received: by 2002:a05:622a:14c8:b0:509:1d4b:f860 with SMTP id d75a77b69052e-50d62b34a43mr169714951cf.58.1775457501172;
        Sun, 05 Apr 2026 23:38:21 -0700 (PDT)
X-Received: by 2002:a05:622a:14c8:b0:509:1d4b:f860 with SMTP id d75a77b69052e-50d62b34a43mr169714581cf.58.1775457500656;
        Sun, 05 Apr 2026 23:38:20 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e52a0sm36724509f8f.30.2026.04.05.23.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 23:38:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@nabladev.com>,
        Peng Fan <peng.fan@nxp.com>, Fedor Ross <fedor.ross@ifm.com>,
        Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>,
        Viorel Suman <viorel.suman@nxp.com>, devicetree@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/3] arm64: dts: imx8mn-vhip4-evalboard-v2: Correct interrupt flags
Date: Mon,  6 Apr 2026 08:38:12 +0200
Message-ID: <20260406063810.25531-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260406063810.25531-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260406063810.25531-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1211; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=NKTG5+SHcXAW1JXdbaucnX+WCRebKnrDUyFIgU8QTw8=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGnTVNWiBDD++YBNGt5UAEaKATYJxmG/RLk5maCk21XeAIvfO
 YkCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJp01TVAAoJEME3ZuaGi4PXlMUQAI/u
 1IdB4Nmf2WXgCBhdFqpqbMpzPe9C09bOK+tFnYAmkWReWHVW1JjyneoNYzCEO6ip1VXva7jbC2j
 tKzCffLLXJda1Jyt+x23g0QKUQjE1hU092/7//R8e5mivTU6JjD4V+HAi3MF99z+iborvYGmUtx
 QOiPDFBwg88/5DDBiqgtFi7vQ0PY3O6UVfxix+kkaAeWZB5CaDUDNYcST6yMRZbKv3Q5IQyEJy8
 BEfAfny0udjyM0AkP3/aIPh1X1UbqRuGYVusV4BgVzSMnMOYJ+G/0eUdb5wjMZ3ZFnqQpR8xWdd
 lpPHuI2KGVJA4Nyquu4aIqo/Rm8VKm6+sfogP6iq4qXFN/nzPvV+r2IQ/st1tR01iUNNnLG/kTP
 Rl1vByDF7vJCeft5MkBwMbzcNdULXbKvd055EsQ9HqhrWcQwQsRLnd6AdKzM63VFGbztLvH28Cp
 0tiMmB8z/Rg4vuAXDJ4QtHzvZL9pigTWjAjvR+WsWWBXxuZwWUW6iA7TeTQIVPuB+zxkTzRa9uO
 8bGwn7zhxHr5ju91o6IJn3autdOVuEj6JGq59bbwPdoDHbu2BrqpIkbWGOx5xXJl8QphVzeoJdF
 REwy/HU6a+jdahbQcjGFdsXECC4MGwLgY0E2UhVWI8cTkOvIbsBsc3G0c+P5reh+JZRS1cB2mqx LJfY2
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Xpv3+FF9 c=1 sm=1 tr=0 ts=69d354de cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=0oGBXvcucFHjQTZxw3UA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: DfXAhUmII-dL01lTWfmuRgNAhjTGH3O8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA2MCBTYWx0ZWRfX03USE0etB4kz
 vJCjA3Jvgmd8Jcd7sFj+BroWxJd/9W8rCSTYZnq5K+NhNZdQedUIv5C52D4j+G2p6gHrRIjMH+L
 4y1WO7oETqaJcnNtjRLIWOma4tXCk6E6NXRyafg3VDoUmA3iiEcwmU6qaw40iUN1OOMsi7aq2Fl
 MpxKRobDixvwfiHG8xmVj0jy6mNuIOjXUtfkHI23X8neHOM18V9HjATlCJl3KzbIBoDHduX5VH5
 C9AOb3+zL6MEhRY8tvaIecKfAEFkHsF/r2wd4jL7VECKzmykbekRDoehnFwILiIpkVaP1AiV1Yf
 MUaOPKRz5Re/9f17R6hW9WcXZWUh4sqGhWNw0CnIfJculaZ7rRrqZSUwJqkWBE7R++lDEzYf3W7
 9zaXl09127L/qqt0c7kMMT9TePU+1uqQypixPWPumckkye9ZK+ekZhbH7PL+1M1YoiFNqlludNY
 AW93DDCaSyRsgeKij4A==
X-Proofpoint-GUID: DfXAhUmII-dL01lTWfmuRgNAhjTGH3O8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060060

GPIO_ACTIVE_x flags are not correct in the context of interrupt flags.
These are simple defines so they could be used in DTS but they will not
have the same meaning:
1. GPIO_ACTIVE_HIGH = 0 => IRQ_TYPE_NONE
2. GPIO_ACTIVE_LOW  = 1 => IRQ_TYPE_EDGE_RISING

Correct the interrupt flags, assuming the author of the code wanted the
same logical behavior behind the name "ACTIVE_xxx", this is:
ACTIVE_LOW  => IRQ_TYPE_LEVEL_LOW

Fixes: 5eb7405db99b ("arm64: dts: imx8mn: Add ifm VHIP4 EvalBoard v1 and v2")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v2.dts b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v2.dts
index 4dadfb7f78de..43fd4d0041ef 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v2.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v2.dts
@@ -99,7 +99,7 @@ &i2c3 {
 
 &ifm_pmic {
 	interrupt-parent = <&gpio5>;
-	interrupts = <17 GPIO_ACTIVE_LOW>;
+	interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
 };
 
 &iomuxc {
-- 
2.51.0

