Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421F915747A
	for <imx@lists.linux.dev>; Mon, 11 Nov 2024 11:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731324950; cv=none; b=psAuyNdLBjILm3NXSpkXpzpLuUNcXgYYlfYCnMycylJc9iT1Q6CJJYRzvEFGPy6IfiWWxPl/B1m1aY9w13LzegdBctwCNx40uvXk5+5HzVqvwQw2GovST8+9u8alDWz9al3GIz43mBbWDyikZSv+FAXF6sNa6dR3hE8B0mQh/G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731324950; c=relaxed/simple;
	bh=vqq/W/TesO4F4SxBt24KGj8YFVmJ6jbiTxo1Upz758A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=owOlTvNrxp/EgynmJTJI8j6dS3m+GwjlLo+otB9XJoN41srgtWdldevhKkXqiP/vjbawyF74u+UHf8yhcj8Bp9qBrF1SxMT+/1QSIs1NGdK7Bq/v7UCJd1FWhqT2uqnaj6tzD0qBWI4gDe4okaVzTsI8w+VIJSFTy2X6ERCrESc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Z/6WPIui; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Z/6WPIui"
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 1B97888FC4;
	Mon, 11 Nov 2024 12:35:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1731324939;
	bh=GlzTFJ3IMZj9tO6/VpaH4/1od6HePRgJ3wA01MIwe5k=;
	h=From:To:Cc:Subject:Date:From;
	b=Z/6WPIui5FHu6d4dlpqRxa1mXFsPdY0WE5eWCtnfUHLbd4vimQYyGLWuSH0utzmVR
	 4gXcCrWMVrL243NELmUX26yr8OZOFNU+c20b4g2CfQJhy+L0YdfJ/3YElt/ShqkLoA
	 73jUOoNsvGfYon7cA1VApQx9hsOm56xZDDV1mhLnvy5V/Ii6NU9sznvqR0ZfU4ahWo
	 ipVjZpjQjXMTHd2QLV0fNT0fZYD3Jip9SM+eEqifVWJQErXy4cuO14sbT3ICKwMTpS
	 opYkegPhANgeS9BjNrgzNsRzPAPHsWOpEVyq5fH3LYevdmOBan66hviM4YyGcmLWlu
	 cAEUmVguBDkKA==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	kernel@dh-electronics.com,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] MAINTAINERS: Update entry for DH electronics DHSOM SoMs and boards
Date: Mon, 11 Nov 2024 12:34:21 +0100
Message-ID: <20241111113524.10727-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

Update the MAINTAINERS entry to cover all DH electronics DHSOM
SoMs and boards. The DHSOM is the name which covers all modules,
DHCOM is the SODIMM seated SoM, DHCOR is the solder on module.
Use glob pattern to match on every DT file which contains either
of those three module substrings in lowercase.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 MAINTAINERS | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1cf1ac44398ae..40b23e71f72dd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6633,19 +6633,14 @@ L:	linux-rtc@vger.kernel.org
 S:	Maintained
 F:	drivers/rtc/rtc-sd2405al.c
 
-DH ELECTRONICS IMX6 DHCOM/DHCOR BOARD SUPPORT
+DH ELECTRONICS DHSOM SOM AND BOARD SUPPORT
 M:	Christoph Niedermaier <cniedermaier@dh-electronics.com>
-L:	kernel@dh-electronics.com
-S:	Maintained
-F:	arch/arm/boot/dts/nxp/imx/imx6*-dhcom-*
-F:	arch/arm/boot/dts/nxp/imx/imx6*-dhcor-*
-
-DH ELECTRONICS STM32MP1 DHCOM/DHCOR BOARD SUPPORT
 M:	Marek Vasut <marex@denx.de>
 L:	kernel@dh-electronics.com
 S:	Maintained
-F:	arch/arm/boot/dts/st/stm32mp1*-dhcom-*
-F:	arch/arm/boot/dts/st/stm32mp1*-dhcor-*
+N:	dhcom
+N:	dhcor
+N:	dhsom
 
 DIALOG SEMICONDUCTOR DRIVERS
 M:	Support Opensource <support.opensource@diasemi.com>
-- 
2.45.2

