Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE4C13B7AE
	for <imx@lists.linux.dev>; Fri, 23 Aug 2024 08:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.26.50.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724400114; cv=none; b=dyKr9n1XvTL7g88ONAiZe2GpOKXolwVwwvKtqNL1shlOlsRBVeepBhKVwadUZTXMuHkirtgYH0YPlXdNYu3yh50jYMcclasC2uemas/17R/9hjWfbam9CEocXXwKAGtufewpKvDAppDbsf7nGBSNkhjqPE/SzYww4nz0OunnUMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724400114; c=relaxed/simple;
	bh=4hDm5FWWVa0YyBbMM+VE/PXVEM468xqIq17Z0T8yXgk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=ojIHCrlwcvP/kbk8WWLdGltgUqB7aHMTF/gA5CJW1AkZzimN5YcW8fKTPKyHHRUIgYMARd3Izk9nO0D5XLbz2rM50bWmHOL1mVMeIkVGLOc1uy+2I9B1XjQo0y7waXjsF+iZ4Lk2BqjDRQPDRe3KRJerXHJQNz1MB/Jwub8Auus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (1024-bit key) header.d=phytec.de header.i=@phytec.de header.b=rQLKGw3j; arc=none smtp.client-ip=91.26.50.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=phytec.de header.i=@phytec.de header.b="rQLKGw3j"
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1724400102; x=1726992102;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4hDm5FWWVa0YyBbMM+VE/PXVEM468xqIq17Z0T8yXgk=;
	b=rQLKGw3jm51QIJMGqb/sAuQNY2mkHl54JakLg9pvhl2j0TXRAVz1RgB+OcSXjvAj
	jqndwgRu/IVxknzzC5MVW2wLOJpynglQtUnN3v6iVJtmhiVdm3s2FAF1hCbCWhYo
	9ctt4iYcqfKBi6nu1B6MQY/hK+f7XMhHVCMzCm0I3WI=;
X-AuditID: ac14000a-03251700000021bc-fc-66c841e605bc
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 5C.20.08636.6E148C66; Fri, 23 Aug 2024 10:01:42 +0200 (CEST)
Received: from llp-hahn.hahn.test (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Fri, 23 Aug
 2024 10:01:42 +0200
From: Benjamin Hahn <B.Hahn@phytec.de>
Date: Fri, 23 Aug 2024 10:01:32 +0200
Subject: [PATCH v3] arm64: dts: imx8mp-phyboard-pollux-rdk: Add support for
 PCIe
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240823-wip-bhahn-add_pcie_support-v3-1-8b86af45e73f@phytec.de>
X-B4-Tracking: v=1; b=H4sIANtByGYC/43NvQ6CMBiF4Vshna2hpWrr5H0YQ/rzYb8Fmharh
 HDvFiYm4/ie4TkzSRARErlWM4mQMeHQl2gOFbFe90+g6EoTXnNRS9bQNwZqvPY91c61wSK06RX
 CEEdqlHGXU2eFU5IUIETo8LPh90dpj2kc4rR9Zbauf7GZUUYtM6Y+cyOAdbfgpxHs0QFZ2cx3F
 Gc/KV4oZRV3UkipDd9Ty7J8AcnSatUPAQAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Teresa Remmet
	<t.remmet@phytec.de>
CC: <upstream@lists.phytec.de>, <devicetree@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Benjamin Hahn <B.Hahn@phytec.de>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724400102; l=2246;
 i=B.Hahn@phytec.de; s=20240126; h=from:subject:message-id;
 bh=4hDm5FWWVa0YyBbMM+VE/PXVEM468xqIq17Z0T8yXgk=;
 b=/b8AKjwwccuG7USDnR92yOsjjCXaVrVrQ9F4gv/kcw1lUb+8tF+6Z2V+DWQ5y3Mxc6lL0K/8n
 yh+O0Qb9zykBpamy3wSJEkvJv2wyeOiTZ4KQLzCaSYedLeL60bgSWD9
X-Developer-Key: i=B.Hahn@phytec.de; a=ed25519;
 pk=r04clMulHz6S6js6elPBA+U+zVdDAqJyEyoNd8I3pSw=
X-ClientProxiedBy: Florix.phytec.de (172.25.0.13) To Berlix.phytec.de
 (172.25.0.12)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeLIzCtJLcpLzFFi42JZI8nAo/vM8USawd4LxhZr9p5jsph/5Byr
	xcOr/hYz77WyWayaupPF4uWse2wWmx5fY7W4vGsOm8X/PTvYLf5u38Ri8WKLuEX3O3UHHo+d
	s+6ye2xa1cnmsXlJvceLzTMZPfq7W1g9+v8aeHzeJBfAHsVlk5Kak1mWWqRvl8CVsbPpN3PB
	CcGKKb9uszUw3uPrYuTkkBAwkXi7q5Wxi5GLQ0hgCZNEw5lLzBDOQ0aJZ683sYNUsQmoSex6
	85oVxGYRUJVoX3KTGcQWFgiSaP31lwXE5hUQlDg58wmQzcHBLKApsX6XPkiYWUBeYvvbOcwQ
	Jb4Sx/+dY4ZY3M0kcbWBC8QWEdjBJPG43xBkL7PAQUaJP+sfsEMUCUt83r2GDSQhIbCbSWLf
	yxZmkAUSAokSO1/LgdQICchK3Dy/hQ2iXl5i2rnXUAtCJY5sWs00gVF4FpLzZiGcNwvJeQsY
	mVcxCuVmJmenFmVm6xVkVJakJuulpG5iBMWYCAPXDsa+OR6HGJk4GA8xSnAwK4nwJt07mibE
	m5JYWZValB9fVJqTWnyIUZqDRUmcd3VHcKqQQHpiSWp2ampBahFMlomDU6qBcbWK1q8KrobI
	XV/fqS9nlX66bX/y6jRR3W61Q+aPb54/x2G/1mha+RqD7BM3/5yP6jRj+jIx+EOJkzWjr2rQ
	xp4t66dqiK0+lFDFlSTMX/GxjX9x3+wS1kW8L98ourKFMOwT7bvacklqZo6jDWN5smmYWuLH
	sHWT5v87/yZTcMu6CZ7iDQ1hSizFGYmGWsxFxYkAL+taIp8CAAA=

Add support for the Mini PCIe slot.

Signed-off-by: Benjamin Hahn <B.Hahn@phytec.de>
---
Changes in v3:
- change order of properties for pcie phy node
- Link to v2: https://lore.kernel.org/r/20240821-wip-bhahn-add_pcie_support-v2-1-9c92d8488ab2@phytec.de

Changes in v2:
- change pcie regulator to reg_vcc_3v3_sw
- add wake gpio to pcie pinctrl and order the gpios
- Link to v1: https://lore.kernel.org/r/20240813-wip-bhahn-add_pcie_support-v1-1-c1bb062b4e1f@phytec.de
---
 .../dts/freescale/imx8mp-phyboard-pollux-rdk.dts   | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
index 00a240484c25..bea479b5203a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
@@ -6,6 +6,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/phy/phy-imx8-pcie.h>
 #include <dt-bindings/leds/leds-pca9532.h>
 #include <dt-bindings/pwm/pwm.h>
 #include "imx8mp-phycore-som.dtsi"
@@ -195,6 +196,23 @@ &snvs_pwrkey {
 	status = "okay";
 };
 
+&pcie_phy {
+	clocks = <&hsio_blk_ctrl>;
+	clock-names = "ref";
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_OUTPUT>;
+	fsl,clkreq-unsupported;
+	status = "okay";
+};
+
+/* Mini PCIe */
+&pcie {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pcie0>;
+	reset-gpio = <&gpio1 8 GPIO_ACTIVE_LOW>;
+	vpcie-supply = <&reg_vcc_3v3_sw>;
+	status = "okay";
+};
+
 &pwm3 {
 	status = "okay";
 	pinctrl-names = "default";
@@ -366,6 +384,15 @@ MX8MP_IOMUXC_SD2_WP__GPIO2_IO20		0x12
 		>;
 	};
 
+	pinctrl_pcie0: pcie0grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO08__GPIO1_IO08     0x40
+			MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10     0x60
+			MX8MP_IOMUXC_GPIO1_IO11__GPIO1_IO11	0x60 /* open drain, pull up */
+			MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14     0x40
+		>;
+	};
+
 	pinctrl_pwm3: pwm3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SPDIF_TX__PWM3_OUT		0x12

---
base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
change-id: 20240813-wip-bhahn-add_pcie_support-b9bd75fc4d98

Best regards,
-- 
Benjamin Hahn <B.Hahn@phytec.de>

