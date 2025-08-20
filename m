Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88809327786
	for <imx@lists.linux.dev>; Wed, 20 Aug 2025 16:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755707287; cv=none; b=uvvLcY14exkSAubm2dsYtzyGVVARmxcmkAQee3k1DPAWkMnHujm4Em8zIVzJXLAi77NgWGSbPC6fdhdx0g+D5qQXK53Kr4CL0TzOO1XGQfFN5HQtyEpoa/uibRqW2/0m4gd9iyACb/Lqu3n35KPMJpl4QjLKZrs7qzQnIZcIhco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755707287; c=relaxed/simple;
	bh=nfheYhB/C6aMINyVhROjtt6gXzWnN9w6R6j+DnBEK5k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LiZ5qW4bfVMYK04P1Wj46eAu6WJ93HiK3hwzYny0ZEmsTdtT1SCPopd/CgfmmLVDPUYeD1LieTH1vnrlKVPRaIP0iDxioOcjNIawFjDHW27TvWMHUebgIKfDhqaYKJw3alC/jonze7Uk41ef6hFp7SpxIPto1BPAsfHMQ4lnkfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=htAFSp8T; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=a1+ovQjM; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="htAFSp8T";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="a1+ovQjM"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4c6X1b4fdBz9txb;
	Wed, 20 Aug 2025 18:28:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1755707283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=THxasewbB3NZErTvCJYSyt0kphg4beTkQydrDvdXdg4=;
	b=htAFSp8T2V57wTvbTeZuv7GKfkBTyRCwGxdnY4N01iRVv8otmuvNdXIuqsSDWLZsKfdQJM
	OvNaaWiNEOue4mKyEUXfI27MOMyWDqxE6syZ87tGCixt43XCbFAX9a/JVFvWeRQyYFCd0k
	Fa7rHBD8BFtIP0lFDXzhm0iiWG2GaEmn7qY5zfE5MxyQcZPoHPtWyKrs7K3ncW1u/5TgqQ
	OpMnzBNmhHGUXD0q3gAfcPDjiqxaT8OGKEPfjAyaj6NckTMgy1NmfXTxx9AyT0F1l8OSHa
	/LIvbFUukZa5eMtJwJ9lPCOjQZqyTlPX32tFrTAP4xQniSq/qmFILltxr2JzlA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=a1+ovQjM;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1755707281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=THxasewbB3NZErTvCJYSyt0kphg4beTkQydrDvdXdg4=;
	b=a1+ovQjMwVryi89XOnY02GZGO38nm14gzCqRrfUYXtHyPimtmo9abd/TGGB5q2KnYyBbDa
	NTmxWQs8lGMLDpzOnkvlCZiEIla9Vf0itvnfUFcaHZ9t3YkWbu7GpW7vtRa4QAYwoh7t12
	i57jvW40dole+8/6pAlhUfi97dNMzYfH5v3hzpad/rCPrFZkZ9dPgnk/BFXoxY+YW99RP8
	QUAzntF5gkRicgsrPuWMKUvLlPz/tgnad+9aMOu2Y3D65R3zVLiazbwvf8g09e1yQ+Mnjr
	fnLVle5EcqrGCXSiZUAhnkXiNMoViEJ/lC1rSI48LHsKyqyJItisTcHQPj0AJw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH] arm64: dts: imx95: Fix JPEG encoder node assigned clock
Date: Wed, 20 Aug 2025 18:27:26 +0200
Message-ID: <20250820162747.209626-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 42a9365009c8e456f2e
X-MBO-RS-META: 6ftgtswhgastpp3ta6et6eeoxbc7m4cn
X-Rspamd-Queue-Id: 4c6X1b4fdBz9txb

The assigned clock for JPEG encoder IP has to be IMX95_CLK_VPUBLK_JPEG_ENC
and not IMX95_CLK_VPUBLK_JPEG_DEC (_ENC at the end, not _DEC). This is a
simple copy-paste error, fix it.

Fixes: 153c039a7357 ("arm64: dts: imx95: add jpeg encode and decode nodes")
Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 4ca6a7ea586ea..8296888bce594 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1843,7 +1843,7 @@ jpegenc: jpegenc@4c550000 {
 				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&scmi_clk IMX95_CLK_VPU>,
 				 <&vpu_blk_ctrl IMX95_CLK_VPUBLK_JPEG_ENC>;
-			assigned-clocks = <&vpu_blk_ctrl IMX95_CLK_VPUBLK_JPEG_DEC>;
+			assigned-clocks = <&vpu_blk_ctrl IMX95_CLK_VPUBLK_JPEG_ENC>;
 			assigned-clock-parents = <&scmi_clk IMX95_CLK_VPUJPEG>;
 			power-domains = <&scmi_devpd IMX95_PD_VPU>;
 		};
-- 
2.50.1

