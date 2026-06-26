Received: from outbound.ci.icloud.com (ci-2003h-snip4-1.eps.apple.com [57.103.91.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD5013D53C
	for <imx@lists.linux.dev>; Fri, 26 Jun 2026 00:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.91.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782432558; cv=none; b=rNBOeKwmx6MREF4hPNcdeUe5uvl581Pp4lSYSlJwB3UQSnFCs7/y7BoEc2Nlv8MojUURhwKii0G7RaHPk0E8dUi1MVUNmayg8T9h5nYHSH8RgZ1dKOx6H5nfy3I6R1P7C01SXJHwoVPIJGyMDJmn4pVDzWcjrA8wIatnInL5wkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782432558; c=relaxed/simple;
	bh=pGwrsUgMSkXZxQz72F5yUOXaGG2M8gkrFehdMYYfvWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iCS5D3mHOmdvg/QKDmHxH9xQ4NXxtMtBm/3o3IbDb0y5U+P7KXul4CRNLZR78GshcbnAv/us6EVUyx/58h3qPykbEHUzNJrWNJfFjRYtQhKRUYQZ1rr/k2AUnCTS0T/4M2SWvV5WwlJaf7V5P/yximZUESqseNNO3TIFiRxMg/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=L69HB4MC; arc=none smtp.client-ip=57.103.91.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="L69HB4MC"
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-10-percent-2 (Postfix) with ESMTPS id 3FC281800B08;
	Fri, 26 Jun 2026 00:09:12 +0000 (UTC)
X-ICL-RepId: 019f0142-54d8-7cc3-9bf6-c6bc3c533f8e
X-ICL-Out-Info: HUtFAUMEWwJACUgATUQeDx5WFlZNRAJCTQhPAEMGXAVeC1YBXwFLVxQEDloDVA5cBBcbXwJCH1sVSzhaDlsERxQXG1wAFw1WTVAbXwJCDxwTVhUTH1RWA0UZEFYBWFZdBU0aXBhZDxwTUFZaDlsERxQXG1wAFxtGAgQjAl8ARQJeCVYBMBcPVk1QG18CQg8cE1YVEwBeDw9MC0gBWwddAEYJSANaBl4cQQhJAlUHWB9FFA5aA1QOXAQXG18CQh9bFUs4Wg5bBEcUFxtcAAlLRglJHQ4EVAddBV0=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1782432555; x=1785024555; bh=WfQwuydOeK6V1CoXII0HfYiJOqqMtVXHj9rKHdfI+eg=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=L69HB4MCg0HDPreoq2LHPf0xAJ+dfR1uzlRAVLK4LD3n8ef6YRgK6apKDl/HPxKNaBZPhUIlO2znat5lGJVqiD9eTqxSTb7joiABBqKvp1aBKoeCgaUVR+CQQibKFbrTanpvEAFpdMTLJ81KTjTLQYVXpFtbvmyp9klnzOnHVrUVBwLVysRN8ksp/J5JiAOfL+aUTIWrGHbkY4u37GmEQnL+rk0jycgZxiDgF+yMDXmFOSWAsSAIfzzzsdMrEtEiZe5J1oS/hXXGnV3yrfvGVoRtgD46H8ZkQdw0ZkbxRoO7DVtTPLMpqLh6Wgtd/sy35YQ/kYIx1NXzZh6CuGBReg==
Received: from bigre.localdomain (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-10-percent-2 (Postfix) with ESMTPSA id C80A01800297;
	Fri, 26 Jun 2026 00:09:10 +0000 (UTC)
From: Vincent Cloutier <vincent.cloutier@icloud.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	kernel@puri.sm,
	Vincent Cloutier <vincent@cloutier.co>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev
Subject: [PATCH RFC 4/4] arm64: dts: imx8mq-librem5: Add rear camera
Date: Thu, 25 Jun 2026 20:07:00 -0400
Message-ID: <20260626000715.1111803-5-vincent.cloutier@icloud.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260626000715.1111803-1-vincent.cloutier@icloud.com>
References: <20260626000715.1111803-1-vincent.cloutier@icloud.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2VvdWmrPWZdVNub0KeMOgqvRQKO-UmiH
X-Proofpoint-ORIG-GUID: 2VvdWmrPWZdVNub0KeMOgqvRQKO-UmiH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDIwOSBTYWx0ZWRfX30fSeoAsy88h
 z+ommw0lPDcP7hqzDJybEmAMMSjEGEBPrqEdZqjjChFRVijo4CJ+dxakwKlT/Fy9wXUStcHuXRS
 bPqEmHiKavWmrYqIBt5h6ohtJ/ydrjOrp/1aV9nDSXXBEkSvMBnK29zxQ/nivIVPxeYDWCfdit1
 QHiXtCrVlw4n/dGiir537bW2bPpFGcJpY6yhYRYBwo5ADth3jPucnsIndhFiclJ+0olLIh7tvm2
 9GlW2uXCZlsL8iwpAUwZfT9NJo/Rz7coiv99ZXBZMS6tUWYVsQkv3GpqmT8x5iGuG77ewqqHVBn
 DqCNXzqlD5o7h5zC3V/

From: Vincent Cloutier <vincent@cloutier.co>

Add the Librem 5 rear camera sensor node and enable the second CSI-2
capture path that receives data from it.

Describe the Samsung S5K3L6 sensor with the upstream binding property
names, including reset-gpios and the link frequencies used by the initial
two-lane RAW8/RAW10 driver modes.

Signed-off-by: Vincent Cloutier <vincent@cloutier.co>
Assisted-by: OpenCode:gpt-5.5
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 51 +++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index f5d529c5baf3..12d5fb3440c5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -318,6 +318,10 @@ &csi1 {
 	status = "okay";
 };
 
+&csi2 {
+	status = "okay";
+};
+
 &ddrc {
 	operating-points-v2 = <&ddrc_opp_table>;
 	status = "okay";
@@ -434,6 +438,13 @@ MX8MQ_IOMUXC_ENET_RXC_GPIO1_IO25	0x83
 		>;
 	};
 
+	pinctrl_csi2: csi2grp {
+		fsl,pins = <
+			/* CSI2_NRST */
+			MX8MQ_IOMUXC_ENET_RD0_GPIO1_IO26	0x83
+		>;
+	};
+
 	pinctrl_charger_in: chargeringrp {
 		fsl,pins = <
 			/* CHRG_INT */
@@ -1175,6 +1186,31 @@ vcm@c {
 		vcc-supply = <&reg_csi_1v8>;
 	};
 
+	camera_rear: camera@2d {
+		compatible = "samsung,s5k3l6";
+		reg = <0x2d>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_csi2>;
+		clocks = <&clk IMX8MQ_CLK_CLKO2>;
+		assigned-clocks = <&clk IMX8MQ_CLK_CLKO2>;
+		assigned-clock-rates = <25000000>;
+		reset-gpios = <&gpio1 26 GPIO_ACTIVE_LOW>;
+		vdda-supply = <&reg_vcam_2v8>;
+		vddd-supply = <&reg_vcam_1v2>;
+		vddio-supply = <&reg_csi_1v8>;
+		rotation = <270>;
+		orientation = <1>;
+
+		port {
+			camera2_ep: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64
+					<537500000 600000000 625000000>;
+				remote-endpoint = <&mipi2_sensor_ep>;
+			};
+		};
+	};
+
 	bat: fuel-gauge@36 {
 		compatible = "maxim,max17055";
 		reg = <0x36>;
@@ -1226,6 +1262,21 @@ mipi1_sensor_ep: endpoint {
 	};
 };
 
+&mipi_csi2 {
+	status = "okay";
+
+	ports {
+		port@0 {
+			reg = <0>;
+
+			mipi2_sensor_ep: endpoint {
+				remote-endpoint = <&camera2_ep>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
 &mipi_dsi {
 	#address-cells = <1>;
 	#size-cells = <0>;
-- 
2.53.0
