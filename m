Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=92.121.32.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582964;
	b=FC0cXbx48pmE3SnRjN+BhWnK9qhGmtVdxN1bq3d5QJTZHFKCINUQ/WpY9cQEBZm8It7s
	 rJI0QHsqiXJ7bUZ+l9ozrf2PNC9EhVmkoTsbdMHlnQru9baSdySWBA5nDqj20c7GGcmlJ
	 UzQTIfXV0jFDb7k6RJjG7Ira8rqGDKKL2METyXehqzpnVmMN31ZswudKHG/qgMcWNA28y
	 uxdPkhPQN3KkZeX4JUmFszG4s/DEZcdfbBHXlymkdfu66rSM33pJQ+BCzIEHOotkFDZjx
	 W1YFhC1JmpX/d5GZmugclRrWLqteYmr4FIzrRaCY+c2isUjJphTuJABgNJnJY9u7rRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582964;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:Received:DKIM-Filter:
	 DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=ZgGa5bM85EA+WJ5zIF2aZWjfVTWgChQti2lPkPAvdQQ=;
	b=TsmgBoMPY5HyLre1pSIqPVe6cE2c5krcccxrwseZXTpJT1WtrUv+hOXpQOg9Ks3Zxv73
	 o/215TfgujpMQEwGpFafTIP+PyBLb/Z0vcgQ9WRbGZ7h1D6qzhbtORUpQFyA1oMTFvXse
	 IKYziQlNGWVxF/tYuztQP8iChx6afUOctrqmV5zcvz0/1uwp6wvgLA8r/0ZH9VL54U0ba
	 JLF+mdNVfU1MnI3MhJu8O68QZVZ4r0SdMQOFYh6bFXcee0NMtS8Qg0eve20aDJ0WGpHhz
	 mX+h8UysEFz4ZZlAgit77dvzbuj4oPU7OK3zkplT9MtN9CwiSBFIzvMVzpEIdTyW4VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=nselector2 header.b=BLizrRgj;
	arc=none smtp.remote-ip=92.121.32.54
Received: from inva129.nxp.com (inva129.nxp.com [92.121.32.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CF160A2619
	for <imx@lists.linux.dev>; Fri, 13 Nov 2026 15:16:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23CF160A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=nselector2 header.b=BLizrRgj
Received: from localhost (localhost [127.0.0.1])
	by inva129.nxp.com (Postfix) with ESMTP id 3BE6F607FE43;
	Fri, 13 Nov 2026 16:10:17 +0100 (CET)
X-Virus-Scanned: amavis at nxp.com
Received: from inva129.nxp.com ([127.0.0.1])
 by localhost (inva129.nxp.com [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jpevwBi3rs_V; Fri, 13 Nov 2026 16:10:14 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva129.nxp.com (Postfix) with ESMTP id A47966016F80;
	Fri, 13 Nov 2026 16:02:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 inva129.nxp.com A47966016F80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com;
	s=nselector2; t=1794582163;
	bh=ZgGa5bM85EA+WJ5zIF2aZWjfVTWgChQti2lPkPAvdQQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BLizrRgjIojD8jND7nEBaASCPTtHxNfPYuGVps1Ge5+POAxyl4ATsdxU5Urw2YGUN
	 d5soraRQNJ8GiBRMvaWJFuTQ6Twi2TXja4gkkWYMI+A+T6UjQbUpjc0Z+qBvgX24IX
	 94Z7Zh8rdzpg8fgDmrLwo/3DSYPc2hBunliyaXMJrQtlJhtQBKixyFzelvAO7O7WVf
	 PlamOJSTakPotwKgeMskHKRj1SlqBP5v6nF8YZ4clF7M4eAsgdtqAA/ZWczVMZD9P8
	 zXiSLcNzghoj1DXArTCxFG2nIdMinrsTAwt7+GXAOpgWYy3dzwJ31OgW2NOKVGtrk/
	 P5MLsRNg4toOA==
Received: from lsv15141.swis.ro-buh01.nxp.com (lsv15141.swis.ro-buh01.nxp.com [10.162.246.138])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 718D5202B6;
	Fri, 13 Nov 2026 16:02:42 +0100 (CET)
From: Claudiu Manoil <claudiu.manoil@nxp.com>
To: netdev@vger.kernel.org
Cc: s32@nxp.com,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 4/6] arm64: dts: s32n79: add NETC IEP18 ECAM node for ENETC PPM ports
Date: Fri, 13 Nov 2026 17:02:35 +0200
Message-Id: <d5ada3955de2cc5a68194e165ffb84deef45c144.1794581338.git.claudiu.manoil@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1794581338.git.claudiu.manoil@nxp.com>
References: <cover.1794581338.git.claudiu.manoil@nxp.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the netc_iep18 PCIe ECAM host node describing the NETC integrated
endpoint bus allocated to the first Linux cohort on S32N79. The bus is
enumerated via the generic pci-host-ecam-generic driver and hosts the
ENETC v4 Pseudo-MAC (PPM) PF and its VFs, which connect internally to
the on-chip NETC switch (not owned by Linux).

The node is kept disabled at the SoC level; boards that wire up NETC
enable it. MSIs are routed through the GIC-v3 ITS (msi-map) and DMA is
translated by the SMMUv3 (iommu-map).

Signed-off-by: Claudiu Manoil <claudiu.manoil@nxp.com>
---
v4: none
v3: none

v2:
 - Replaced the 'msi-parent' stub property with 'msi-map', as per H/W spec.

 arch/arm64/boot/dts/freescale/s32n79.dtsi | 24 +++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32n79.dtsi b/arch/arm64/boot/dts/freescale/s32n79.dtsi
index 94ab58783fdc..65cf65e82832 100644
--- a/arch/arm64/boot/dts/freescale/s32n79.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32n79.dtsi
@@ -122,6 +122,30 @@ irqsteer_coss: interrupt-controller@4ed00000 {
 		};
 	};
 
+	nwss-bus {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x0 0x48800000 0x0 0x48800000 0x0 0x4b0000>,
+			 <0x2 0x40000000 0x2 0x40000000 0x0 0x20000000>;
+
+		netc_iep18: pcie@241200000 {
+			compatible = "pci-host-ecam-generic";
+			reg = <0x2 0x41200000 0x0 0x100000>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			bus-range = <0x0 0x0>;
+			iommu-map = <0x0 &smmu 0xc0000 0x100>;
+			msi-map = <0x0 &its 0xc0000 0x100>;
+			dma-coherent;
+			status = "disabled";
+
+			/* All NETC PCIe functions */
+			ranges = <0x82000000 0x0 0x48800000 0x0 0x48800000 0x0 0x4b0000>;
+		};
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.34.1

