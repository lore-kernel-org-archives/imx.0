Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2831F13AA2E
	for <imx@lists.linux.dev>; Tue, 13 Aug 2024 08:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723536154; cv=none; b=ZVlYyvzeR+5DTndpP3v6/X4KB4qWdRk7d6OfLjM1QF109YewI+nWxJqaYZPDnyZ2/l6K4mOMXrg0pcOrUg74Wps125e287gbJIP8fNexdCTAYrgcxtJwmA+S87Xy3nNOW3lfd50JgvDhLrzMMpPyINXgcD6vvWEaER75lSx3J3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723536154; c=relaxed/simple;
	bh=jUz1JOh/2k7wU3uH9YIn6s6nrjSbpT25iIzTCuHpEHU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=hA+J2ZwI3toZiMwjG/3Le57Ndf2KV+NwDV/GYVSGxuBHFEo2gfSB9wC5hXDddUpDjzIxAq0dm1/INNfTglOLBk8HuyiWpflJMcj8hmgJdQ/YssU0guNyJJNebIZFr8D0xPZgUym7WdyByBMH3VjyosrJkGt3xExiDdTAW3meUFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 603541A11BA;
	Tue, 13 Aug 2024 10:02:26 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 31FAF1A11AA;
	Tue, 13 Aug 2024 10:02:26 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id F0291180031A;
	Tue, 13 Aug 2024 16:02:24 +0800 (+08)
From: Richard Zhu <hongxing.zhu@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	l.stach@pengutronix.de
Cc: hongxing.zhu@nxp.com,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@pengutronix.de,
	imx@lists.linux.dev
Subject: [PATCH v5 3/4] arm64: dts: imx8mp: Add dbi2 and atu reg for i.MX8MP PCIe EP
Date: Tue, 13 Aug 2024 15:42:22 +0800
Message-Id: <1723534943-28499-4-git-send-email-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1723534943-28499-1-git-send-email-hongxing.zhu@nxp.com>
References: <1723534943-28499-1-git-send-email-hongxing.zhu@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Add dbi2 and iatu reg for i.MX8MP PCIe EP.

For i.MX8M PCIe EP, the dbi2 and atu addresses are pre-defined in the
driver. This method is not good.

In commit b7d67c6130ee ("PCI: imx6: Add iMX95 Endpoint (EP) support"),
Frank suggests to fetch the dbi2 and atu from DT directly. This commit is
preparation to do that for i.MX8MP PCIe EP.

These changes wouldn't break driver function. When "dbi2" and "atu"
properties are present, i.MX PCIe driver would fetch the according base
addresses from DT directly. If only two reg properties are provided, i.MX
PCIe driver would fall back to the old method.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 603dfe80216f..53748227db10 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2125,8 +2125,11 @@ pcie: pcie@33800000 {
 
 		pcie_ep: pcie-ep@33800000 {
 			compatible = "fsl,imx8mp-pcie-ep";
-			reg = <0x33800000 0x000400000>, <0x18000000 0x08000000>;
-			reg-names = "dbi", "addr_space";
+			reg = <0x33800000 0x100000>,
+			      <0x18000000 0x8000000>,
+			      <0x33900000 0x100000>,
+			      <0x33b00000 0x100000>;
+			reg-names = "dbi", "addr_space", "dbi2", "atu";
 			clocks = <&clk IMX8MP_CLK_HSIO_ROOT>,
 				 <&clk IMX8MP_CLK_HSIO_AXI>,
 				 <&clk IMX8MP_CLK_PCIE_ROOT>;
-- 
2.37.1

