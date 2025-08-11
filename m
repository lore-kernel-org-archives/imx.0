Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8042D027F
	for <imx@lists.linux.dev>; Mon, 11 Aug 2025 06:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754894706; cv=none; b=BNcmpoN8d3WL2kxCaq1i3kZ5cKDziKyXiQtWmN/Fuoc3SnO+7UC7xZtpwobhFGbTtnQkwFDxHfW0u/aFwNK1troYE0BhCNIjrMhpdMGOLDy1AihlkEiSyohgK8vljtAFFYS5UhaxDJXU0C124cofsKLtPvZKuVwDWJCdv3K73fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754894706; c=relaxed/simple;
	bh=mD95dRVFmK4BbDr/sN8HqSFcSBgqlctasaYLRzzGoWg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=IXnxOkYvT5xJDeCONZYl1OgynjllPDV8EwdVl/IFFYQEgONEf5FMt3KF/YojazjI4Co89tjFjGV3MfGaaRfHuPLqWVCx9NUnzodqrl3RGHY3a7aP+4Q41d2rZGNT+YVMOIo8NAQVOxveKzN/sF6J1PWN2zeb+cqHxQcYQoyT1SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=iK/zGLLL; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="iK/zGLLL"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 24117148003B;
	Mon, 11 Aug 2025 08:38:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1754894340; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=EJcwko3c7uyCeYh/tGW6fF+83okM4Hcdm+WEAVIUDSw=;
	b=iK/zGLLLcQTsPRVVPlSXi2vZprXSiexLaEk1zoq/cLARMbJaH7pt3Fo6l2dlWU4cVkf7xh
	uD5OgMfZzNpYuW+EjxC4Y5XTs4AVkET+1g6uVem78JkYWjXg5lf0ejTZOvn7vxVWSYsOn6
	RqcDERKnXYeNnSNIltHtIvxspfIXwU/2ae7Ce4ZA7sM91uWsTjLoVivPUF0nkSoX5smp4M
	CMQHukpCDDjjSZsEYSDFufXThGL6QWy/VGXTIbS/5eePGG3PTfCTndQNNCxlCA0/9stdjP
	rZ2bKEj04VpSCGOeMiM4CcJrIaPfGcF4ded9LSabspywR2zCCilvh/BRqgyx5A==
From: Alexander Dahl <ada@thorsis.com>
To: devicetree@vger.kernel.org
Cc: Frank Li <Frank.li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3] arm64: dts: imx8dxl-ss-conn: Disable USB3 nodes
Date: Mon, 11 Aug 2025 08:38:54 +0200
Message-Id: <20250811063855.46431-1-ada@thorsis.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The i.MX 8DualXLite/8SoloXLite has a different connectivity memory map
than the generic i.MX8 has.  One conflicting resource is usb, where the
imx8dxl has a second usb2 phy @5b110000, while the generic imx8 dtsi has
one usb2 phy and one usb3 phy, and the usb3otg @5b110000.  When
including both imx8dxl-ss-conn.dtsi and imx8-ss-conn.dtsi as done in
imx8dxl.dtsi this leads to a duplicate unit-address warning.

The usb3otg node was introduced after the initial imx8dxl support with
commit a8bd7f155126 ("arm64: dts: imx8qxp: add cadence usb3 support")
and since then leads to warnings like this (when built with W=2):

      DTC     arch/arm64/boot/dts/freescale/imx8dxl-evk.dtb
    …/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi:148.24-182.4: Warning (unique_unit_address): /bus@5b000000/usb@5b110000: duplicate unit-address (also used in node /bus@5b000000/usbphy@5b110000)
      also defined at …/arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi:41.23-50.4
      also defined at …/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts:645.8-653.3

Delete usb3 related nodes at dxl to fix above warning.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v3:
    - reworded commit message (thrown out irrelevant parts)
    - rebased on v6.17-rc1
    
    v2:
    - reworded commit message (build on mainline with W=2)
    - rebased on v6.16-rc3
    - Link: https://lore.kernel.org/linux-devicetree/20250623075440.36660-1-ada@thorsis.com/
    
    v1:
    - Link: https://lore.kernel.org/linux-devicetree/20250610060756.8212-1-ada@thorsis.com/

 arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi
index 9b114bed084b..a66ba6d0a8c0 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi
@@ -5,6 +5,8 @@
 
 /delete-node/ &enet1_lpcg;
 /delete-node/ &fec2;
+/delete-node/ &usbotg3;
+/delete-node/ &usb3_phy;
 
 / {
 	conn_enet0_root_clk: clock-conn-enet0-root {

base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
-- 
2.39.5

