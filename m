Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2682198E63
	for <imx@lists.linux.dev>; Thu, 25 Jul 2024 09:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.26.50.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721900778; cv=none; b=e1giQH+TdP+ks5njrInLyk302+yTd/I92ggdV296bHgu0zD5uZ6PWWRTXsE7MHoHPf8oSOwYo34XicwVXGxmtzEBIjzP1lmcSPuU/QCAVZlsyrESMMgxxmGrrr33sHe4WkPPvFcHEsK7IeBDCQ1xXSjx8t+gndFvicV8674le9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721900778; c=relaxed/simple;
	bh=EWlCTrmr78RmYQSLYt3TEjJuFQwHsJj1/kxDPH9sF8E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uPgT6ALx3RBl4EPK9WbEMGCJ3H1g431Kirx0YvyRymE8lsUMRsaVrVjvasXuJiUKxTO5L0pkt3w5XkjhuXM7kWF1DWToBAqdZqWZcca6haWTpJ9XZSbsIUWNG3yHuD6tgFvWluXVqZj18Zq+MD1/crlbQyyR35qbXfeQY2aP6Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (1024-bit key) header.d=phytec.de header.i=@phytec.de header.b=Gw/EF7ml; arc=none smtp.client-ip=91.26.50.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=phytec.de header.i=@phytec.de header.b="Gw/EF7ml"
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1721900762; x=1724492762;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EWlCTrmr78RmYQSLYt3TEjJuFQwHsJj1/kxDPH9sF8E=;
	b=Gw/EF7mlG4jmHVogcoYKPq5v2WBNrC+6x5OuMkRbBDIZTqABLfGH4FoCeurP7GQR
	Y3JRuOauRGVnIwIW8s8MplhPkDVOoaUrdUe1bFJsLVRdfmHs2dpQ1rw188ExEUZl
	meu1REZiXdDX9oDUYpd6G/NqsXkBPTFGvond34zqjUo=;
X-AuditID: ac14000a-03e52700000021bc-ef-66a21eda37a0
Received: from florix.phytec.de (Unknown_Domain [172.25.0.13])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 45.CC.08636.ADE12A66; Thu, 25 Jul 2024 11:46:02 +0200 (CEST)
Received: from llp-varakala.phytec.de (172.25.0.11) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Thu, 25 Jul
 2024 11:46:02 +0200
From: Yashwanth Varakala <y.varakala@phytec.de>
To: <shawnguo@kernel.org>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
	<festevam@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<upstream@lists.phytec.de>, <y.varakala@phytec.de>
Subject: [PATCH 2/3] arm64: boot: dts: freescale: Add no-spiflash overlay
Date: Thu, 25 Jul 2024 11:44:56 +0200
Message-ID: <20240725094457.37739-3-y.varakala@phytec.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240725094457.37739-1-y.varakala@phytec.de>
References: <20240725094457.37739-1-y.varakala@phytec.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Florix.phytec.de (172.25.0.13) To Florix.phytec.de
 (172.25.0.13)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmkeLIzCtJLcpLzFFi42JZI8nAq3tLblGaweq7whZr9p5jsph/5Byr
	xcOr/hYz77WyWayaupPF4uWse2wWmx5fY7W4vGsOm8X/PTvYLf5u38Ri8WKLuEX3O3UHHo+d
	s+6ye2xa1cnmsXlJvceLzTMZPfq7W1g9+v8aeHzeJBfAHsVlk5Kak1mWWqRvl8CVsendH9aC
	boGKGZ0PWBsYp/J1MXJySAiYSPw6c5Oli5GLQ0hgCZPEtfdvGSGcp4wSq25/ZgapYhPQl1ix
	bhErSEJEYBmjxLfT3WAtzALbGSVOTHzHBFIlLOAp8e3BYjCbRUBVouHrBXYQm1fAUmLR5JlM
	EPvkJfYfPAs2lVPASuL6nyawuBBQzb+WPWwQ9YISJ2c+YQGxmYHqm7fOZoawJSQOvnjBDFGv
	KPH+YQc7zMxp514zQ9ihEvPXfGefwCg0C8moWUhGzUIyagEj8ypGodzM5OzUosxsvYKMypLU
	ZL2U1E2MoIgSYeDawdg3x+MQIxMH4yFGCQ5mJRHeZfcXpgnxpiRWVqUW5ccXleakFh9ilOZg
	URLnXd0RnCokkJ5YkpqdmlqQWgSTZeLglGpgLL7rdt8jZfuhB4qyhhNTot7PfLNu/rGYy/vW
	ipT8mDylmqGy68CTsKV/1nssuaGW+VpzWYZkf+3i7IecM1M3nVp+ISvK8e9nq60hEo3Rjvu2
	NvKHLI6/oJiYVjvF/Un1hRkmYRrfzk35OknH14pbhIVvR0idzkv+L9OjlbLcX138L2Gkkj4h
	SImlOCPRUIu5qDgRAD+odZ2WAgAA

Add devicetree overlay to disable SPI NOR if the module does
not supports or not equipped with SPI NOR flash.

Signed-off-by: Yashwanth Varakala <y.varakala@phytec.de>
---
 arch/arm64/boot/dts/freescale/Makefile           |  2 ++
 .../freescale/imx8mp-phycore-no-spiflash.dtso    | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-phycore-no-spiflash.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 8f41db93c3d9..dedea4b5c319 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -176,8 +176,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-navqp.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-rdk.dtb
 imx8mp-phyboard-pollux-rdk-no-eth-dtbs += imx8mp-phyboard-pollux-rdk.dtb imx8mp-phycore-no-eth.dtbo
 imx8mp-phyboard-pollux-rdk-no-rtc-dtbs += imx8mp-phyboard-pollux-rdk.dtb imx8mp-phycore-no-rtc.dtbo
+imx8mp-phyboard-pollux-rdk-no-spiflash-dtbs += imx8mp-phyboard-pollux-rdk.dtb imx8mp-phycore-no-spiflash.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-rdk-no-eth.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-rdk-no-rtc.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-rdk-no-spiflash.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-lt6.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-mi1010ait-1cp1.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phycore-no-spiflash.dtso b/arch/arm64/boot/dts/freescale/imx8mp-phycore-no-spiflash.dtso
new file mode 100644
index 000000000000..95329282d559
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phycore-no-spiflash.dtso
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 PHYTEC Messtechnik GmbH
+ * Author: Cem Tenruh <c.tenruh@phytec.de>
+ */
+
+/dts-v1/;
+/plugin/;
+
+&flexspi {
+        status = "disabled";
+};
+
+&som_flash {
+        status = "disabled";
+};
-- 
2.34.1

