Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C380E31B820
	for <imx@lists.linux.dev>; Tue, 16 Sep 2025 14:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758034039; cv=none; b=Itm0TlnnfluclB28mPc5w6teIFVk1LUat/mGypexpfnCkmIt4sqGSqcz57wm1huNo3jdc/+zHrn+Haf2YSFb+f8r4SVsDn4u4seX0cqHx/isMdyo/3Fe/YqS3rtIRf+gMIq4/eWdoXP8AsfgRJbHKd2Up0hwYTCW6z8Om+L41KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758034039; c=relaxed/simple;
	bh=/dTeJXdPxUT53/ruJthxURTgDXuMrYo4Vt5Nrzhj828=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k9mQISOIuOMQYijGiylVDUeGi9HEmY6zlcfmJkY94E3u2iMm1XIodZpqIKuydIQDHbk3ESY1QaeCIf7IAmyc8Xb6TdxA6JZV/XQU5L6K570mM0dQve9kZwhBNY71k9/6qwoPcF4RKTmpFmiZOQhfHzOmZkFfoHQNjHMTt0pertU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iegQpZ/N; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iegQpZ/N"
Received: from Monstersaurus.lan (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6BBDC8D4;
	Tue, 16 Sep 2025 16:45:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758033956;
	bh=/dTeJXdPxUT53/ruJthxURTgDXuMrYo4Vt5Nrzhj828=;
	h=From:To:Cc:Subject:Date:From;
	b=iegQpZ/Nnu/0NTRKHBLZgQ57/302Okt9v041Ht7QjnlH8DT9U+6kRbLbND+1+tNcx
	 sXagert615SuTGfA2XlbPcR4SZw9z86g2k72Z9cq7jk8IsK+ckaCSkEwvE0mLb1ahU
	 O/sKQBPjHJul0BeJuBATD5n9UVExtcLDhsdKgj6Q=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH] arm64: dts: freescale: debix-som-a-bmb-08: Enable HDMI output
Date: Tue, 16 Sep 2025 15:47:09 +0100
Message-ID: <20250916144710.1285650-1-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the HDMI output on the Debix SOM A board, using the HDMI encoder
present in the i.MX8MP SoC.

Enable and configure all nodes required for the HDMI port usage.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

---

This replicates 4880ee1c9046 ("arm64: dts: imx8mp-debix-model-a: Enable
HDMI output") to support the Debix SOM as well.


 .../freescale/imx8mp-debix-som-a-bmb-08.dts   | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dts b/arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dts
index d241db3743a9..04619a722906 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dts
@@ -22,6 +22,18 @@ chosen {
 		stdout-path = &uart2;
 	};
 
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi_tx_out>;
+			};
+		};
+	};
+
 	reg_baseboard_vdd3v3: regulator-baseboard-vdd3v3 {
 		compatible = "regulator-fixed";
 		regulator-min-microvolt = <3300000>;
@@ -222,6 +234,28 @@ flash: flash@0 {
 	};
 };
 
+&hdmi_pvi {
+	status = "okay";
+};
+
+&hdmi_tx {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hdmi>;
+	status = "okay";
+
+	ports {
+		port@1 {
+			hdmi_tx_out: endpoint {
+				remote-endpoint = <&hdmi_connector_in>;
+			};
+		};
+	};
+};
+
+&hdmi_tx_phy {
+	status = "okay";
+};
+
 &i2c4 {
 	expander0: gpio@20 {
 		compatible = "nxp,pca9535";
@@ -276,6 +310,10 @@ ethmac2: mac-address@c {
 	};
 };
 
+&lcdif3 {
+	status = "okay";
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
@@ -430,6 +468,15 @@ MX8MP_IOMUXC_NAND_DATA03__FLEXSPI_A_DATA03      0x82
 		>;
 	};
 
+	pinctrl_hdmi: hdmigrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL	0x1c3
+			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA	0x1c3
+			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD		0x19
+			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC		0x19
+		>;
+	};
+
 	pinctrl_i2c1: i2c1grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL			0x400001c2
-- 
2.50.1

