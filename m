Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D19C39E6C5
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 13:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772803697; cv=none; b=W4xurYYQPHs1rvanu1KTahIIufLBJ28C1/gijjcMXdp+E60ohgf03DI6JiZTkE7AN38ZmhC0NMHfREdmDLiuOB5lBnNFbdNYx9uUlXqJnB1LaoBka9b0DDQj93qNoTwqL04/jNKIYDBRIKrGUMbWTNk+VVqLFcuyc9upRk9MxyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772803697; c=relaxed/simple;
	bh=5zOyy+AMeXBPkio/p9NoYrjyHvyyen4DLCE4ay6mQVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iDbuTRTw5E+67pBpwAV35l6Fx8Xin9V6ZfkisG1nA9hSEkIFgod8+f2MrugzdZaxohoMs1MZLIk/PGN/02LkDm8iUH3Oz265Ac5Lx1PTspQX/cJ0YLuF54I99Kl0UNz6F9b8sOBtLKjgSKP0BLd8raq0jN1ItoW+nZZtm6+rEms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 2805820010A;
	Fri,  6 Mar 2026 14:28:14 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0A3CB2000F2;
	Fri,  6 Mar 2026 14:28:14 +0100 (CET)
Received: from lsv15149.swis.ro-buh01.nxp.com (lsv15149.swis.ro-buh01.nxp.com [10.162.246.145])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 932C520270;
	Fri,  6 Mar 2026 14:28:12 +0100 (CET)
From: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
Date: Fri, 06 Mar 2026 15:27:26 +0200
Subject: [PATCH v2 9/9] arm64: dts: imx95: Add Neutron node
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-neutron-v2-9-3019bd8c91ef@nxp.com>
References: <20260306-neutron-v2-0-3019bd8c91ef@nxp.com>
In-Reply-To: <20260306-neutron-v2-0-3019bd8c91ef@nxp.com>
To: Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Jiwei Fu <jiwei.fu@nxp.com>, 
 Forrest Shi <xuelin.shi@nxp.com>, Alexandru Taran <alexandru.taran@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772803681; l=1721;
 i=ruxandra.radulescu@nxp.com; s=20260204; h=from:subject:message-id;
 bh=5zOyy+AMeXBPkio/p9NoYrjyHvyyen4DLCE4ay6mQVI=;
 b=19SjmLRX/9Q516pJ+/gR8uJNtcM+iHTVCL+RnzhTJedKl/ISz9Jw+WnRgi8WmfTiH85LemNGZ
 yWz8j+uOTBFDdlgpFRf5eQCHSpHMIpfNu7FS56FxJG24iNwnrjqyKLs
X-Developer-Key: i=ruxandra.radulescu@nxp.com; a=ed25519;
 pk=zoq4b4OYR0c4faAH97xoTxdr6vfR8OvPbS+Cx0XhIBY=
X-Virus-Scanned: ClamAV using ClamSMTP

Add the node for Neutron NPU. Also add a reserved memory region
for allocating Neutron buffers, which have a 1MB alignment
constraint.

Signed-off-by: Jiwei Fu <jiwei.fu@nxp.com>
Signed-off-by: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
---
v2: Match changes in dt bindings
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 55e2da094c88..1c6865a8d482 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -336,6 +336,19 @@ sram1: sram@204c0000 {
 		#size-cells = <1>;
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		neutron_pool: neutron-pool {
+			compatible = "shared-dma-pool";
+			size = <0x0 0x8000000>;
+			alignment = <0x0 0x100000>;
+			reusable;
+		};
+	};
+
 	firmware {
 		scmi {
 			compatible = "arm,scmi";
@@ -2181,5 +2194,20 @@ ddr-pmu@4e090dc0 {
 			reg = <0x0 0x4e090dc0 0x0 0x200>;
 			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		neutron: npu@4ab00000 {
+			compatible = "nxp,imx95-neutron";
+			reg = <0x0 0x4ab00000 0x0 0x00000400>,
+			      <0x0 0x4ab10000 0x0 0x00010000>,
+			      <0x0 0x4ab08000 0x0 0x00008000>;
+			reg-names = "regs", "itcm", "dtcm";
+			memory-region = <&neutron_pool>;
+			interrupts = <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX95_CLK_NPU>,
+				 <&scmi_clk IMX95_CLK_NPUAPB>;
+			clock-names = "core", "apb";
+			power-domains = <&scmi_devpd IMX95_PD_NPU>;
+			iommus = <&smmu 0xd>;
+		};
 	};
 };

-- 
2.34.1

