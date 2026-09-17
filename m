Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F904E73DC
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 15:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657759; cv=none; b=K4Eef0j9vIiaFQ2pqXzrCDw+vgFdy+0qQx2jaVviIsxejxmqAGkAcVGAsf2cOaH73jTa+XKqDSQQx5rDbv/yl/lyafPX0TSB/fX0FYUjnigdJsQ36Zfz71ccmjKWoukaC7/+gqDRSeXB8651QpUE2JG0DgKLbF2/D01mYkvoBVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657759; c=relaxed/simple;
	bh=TEfy77fQc7gzUcObXL0A2hoFIbOeaaX1tVmcfYmjZFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R8ZEZZhhBmc6tsMcsBlTwe8byTGLRf5xyxJSm1N/7Yq6JOYNsd69/3KL9LZ7sAqxW3nW7VgoX+VZhrnDtodlaZAcb9pXfjeuPawSCsQnWsHySs7lgHBsor3C+8dIOo19Uk/pMnDIG0wWk4PG+YBFxzGytTBaG0fGlwi3595wZzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CGsgr2AE; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CGsgr2AE"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so4784105e9.0
        for <imx@lists.linux.dev>; Thu, 17 Sep 2026 08:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789657739; x=1790262539; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gdbF+rIH2kuomyDNZ8PZiq5VuqMW/f4lQBUYl1lQH/Y=;
        b=CGsgr2AEfB5pXetf2GJdP+VFZar4llBriU7hrlj3ypoBu+ZOumfqofThN8kyIzibGB
         dI3eEQnt/dNTGhmh8DS+mHbfys2N4eoiSZ2tmFitRWH70hA8WK/AX3vHiZqN3aOfkYAn
         8cELU+aoe79rkx3SpdZfPTljt5BARRoAlkAwf8QJk2ZUUcykZ/pLKTqfiMcs7u7BZ6Em
         I7WMC/HamJwikVRMqximPqRbbhVWxjaZwWYwSYheFrObBDsszGi8XEf0hC3A8mQuGKpa
         YIz2z0MOgdpbXnpgbHfTx0xdUPwQNOqfbAH2xhIQpxmwjzW/FAHfViXuKZcevd6yD6HO
         qJFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789657739; x=1790262539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gdbF+rIH2kuomyDNZ8PZiq5VuqMW/f4lQBUYl1lQH/Y=;
        b=dZFe7DXPwhgPkUdepDR23RaTQMeW8a0rbO2ZmSEZCWV6Yd0JMTkcdeWlhRlOSkuhHG
         cAMvm2sFnLtM5aAMpNP+nQYBRdVYpbIBHksa/x09LmwfqGQr9aRpNdsT5esa6hn3bNW2
         N0rVH1CEDW66slJeSCYSs8rn7Yf3olhvzHAwZ9OPrU5Rr2m3E52ARVgQULr6Vn+c1Y/y
         kUmJEPu9TxD6e6pcp1MY347WJM/dPNyf4+Xgy7c5ltfMqsLaR0p0GKFjqqxPMhohpa0r
         nGOTN7kVkqu1wBSRqroDapu4F8F3W5EsWKaWUMPz6hM0KDn8HA+yw8h5HNIaBng4BGge
         rspg==
X-Forwarded-Encrypted: i=1; AKwUvBzO2i+aj1sEix+H/jsmwFR2Y7ZctSdcETHqWEIOxvkRrZUux7zbuLxGZZ6GBqW9tdJEgSk=@lists.linux.dev
X-Gm-Message-State: AFuF++mfus3Jz82pjL59bGCK/F+RnO723EB9LomluyO9ZFwtzEbsT8BF
	8rooxGkNqhJfcs6Ac+s8s7COwqGZH4wPDSLhEJEQIG0O4SryJtn5be/35MKV8Og6
X-Gm-Gg: AYBFou2hSlKwSSC5S6qAm6TUZmbWyMLSCTWaIy0Cg+SY3C13AmMEiDKIPrPVHPqGuDD
	EKwYDF3EdX0amoYH4c+dHhaO0lGiFU8BP1gvy2kYXId9sY0gE3jZ+1KRyTxlfIg7zvfeCmM8BR8
	RuJ4cHPpmfrrVYiLv17SO6XrkB/lHGsc33APCvZSbeqtj4ikshbdm+rjZ0VfQnwOhB9f1RwBL5J
	vla1GxN+KRH2GZs/cr1phoZAQb6H5itVqfsffgIc9G5LFSIphgwdNuu4q7bJP+CHjF4/d3wMAFv
	nujwES1fTSu8PW41lx+vMPgJRAzhKHH81fPjKfY1lqSlV9F9v3VjL64fBv/W1JO7S7RRP4l3Grx
	pStUgWpzoW7iSGC7iJR8r3aVWZUCMAHq7b60aJ/HYmGUJykLtVxLnUAmNObHik1sOG2EnT9IZm5
	HX4ISKxhus2t3Pq3f88RzMaZUrMFpbT0nzm6ekCUp+4b9/AfDb1MMKgMXGhc9Ic81Pd4V4/iXJl
	wHQ5E41KNU7cJPdQoD4XB1o4SntW+vvvesVvOYup1qG++1ElYlYOnfs7P3LmAUuOP75VjAFLxhG
	XfHDnos5uK6omObfunLJp5Y=
X-Received: by 2002:a05:600c:4e91:b0:49d:726:cc9f with SMTP id 5b1f17b1804b1-49eb72f39d7mr165685185e9.5.1789657739517;
        Thu, 17 Sep 2026 08:08:59 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd226ef3sm82531345e9.1.2026.09.17.08.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:08:58 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Ferraro <francesco.f@variscite.com>
Subject: [PATCH v1 1/3] arm64: dts: imx8mm-var-dart: configure SAI3 synchronous RX mode
Date: Thu, 17 Sep 2026 17:08:43 +0200
Message-ID: <f155648a50185df5d273f697f10fcd7efb154364.1789657399.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789657399.git.stefano.r@variscite.com>
References: <cover.1789657399.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Configure SAI3 to operate in synchronous RX mode, so that the trasmit
path uses the receive bit clock and frame sync signals.

Remove the TX_SYNC and TX_BCLK pinmux entries, as these signals are not
used in this configuration.

Co-developed-by: Francesco Ferraro <francesco.f@variscite.com>
Signed-off-by: Francesco Ferraro <francesco.f@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
index 2324063f8fd9..c7a9eb23e5e8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
@@ -305,6 +305,7 @@ &sai3 {
 	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
 	assigned-clock-rates = <1536000>;
 	fsl,sai-mclk-direction-output;
+	fsl,sai-synchronous-rx;
 	status = "okay";
 };
 
@@ -446,8 +447,6 @@ pinctrl_sai3: sai3grp {
 			MX8MM_IOMUXC_SAI3_RXFS_SAI3_RX_SYNC		0xd6
 			MX8MM_IOMUXC_SAI3_RXC_SAI3_RX_BCLK		0xd6
 			MX8MM_IOMUXC_SAI3_RXD_SAI3_RX_DATA0		0xd6
-			MX8MM_IOMUXC_SAI3_TXFS_SAI3_TX_SYNC		0xd6
-			MX8MM_IOMUXC_SAI3_TXC_SAI3_TX_BCLK		0xd6
 			MX8MM_IOMUXC_SAI3_TXD_SAI3_TX_DATA0		0xd6
 			MX8MM_IOMUXC_SAI3_MCLK_SAI3_MCLK		0xd6
 		>;
-- 
2.47.3

