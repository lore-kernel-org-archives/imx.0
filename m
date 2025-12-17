Received: from mx-relay96-hz2.antispameurope.com (mx-relay96-hz2.antispameurope.com [94.100.136.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290D93358AF
	for <imx@lists.linux.dev>; Wed, 17 Dec 2025 08:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.136.196
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765961347; cv=pass; b=NpMS3r0o2bl5I3PhTES+6MUS42D4PRejJ0A1cnh5iinDa/v0E3VCJ6MgAK/LmYtTvvPoRW7cd1t9TcLHLI/ZY8trkVnLV21FkMZcUt/HH1oN136RJU7NUxeT3TyE4lYEtv+fqztZAzey9f7JJQIlZVyKwwXCpCG3bKCi3f2KmVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765961347; c=relaxed/simple;
	bh=h1Ja/rSQIq1TWvNF38IFvW9sEAqOWuoSLE1OhJQnWqA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rZ7XQFRmJkYwJeDVQk5DOrDTl3kBi/WHcAh+NxfAkHeRKWiHe+xa0ZL62DxGwm8XpS2IcZvYi83L7Fr12qAodZKy7DqYiqvWnsEMnVh1JZGCH3e/B7p16Aw4fIvDhyCF0tKUcyDIsm/48xMg4rC4W/IOUKuVIkyvtjUOZFxOoy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=s7SHO0P/; arc=pass smtp.client-ip=94.100.136.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="s7SHO0P/"
ARC-Authentication-Results: i=1; mx-gate96-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=e8+/cZk0H8N2WAzWr4PEnz6SuI6lU+scC72gDf6sJvg=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765961300;
 b=qXbQ2A7ENC4P+YBPfdbjkX45AHvksz9j1Xg1iltVS83ZzRWTAE2PTGaS3/8YUHke4bJnjOyu
 JLEQSVzArUyXf25zs83PHhvG6rf26xCfSxJwIJKu+QOWkcABflocCmbwUHZj341Od6KNc/tJtYR
 lcV08IopD+SOd7tVfQyM5la99xGGb7+moQfYw9vKUYU4bWX5bkWRTATRywdz+3Bkd1BKmPgyvEM
 ZD/+r1eAPpu33nG0yJ2dVjgET6zOnbVDz3xdUtRrOjd0UX/FBcbh/pb+r4pC02ATI4szVB8/2Th
 R3cXQw2NTJcGKaUiYZ4vjKc2GRa3sqFR0F1XPojXrsBPg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765961300;
 b=eNVHAbmWY9LitnG4X3r1ybGpXRSGGuFcyMZ3RJwOW97XSAlUd+R4qLP/bZ45Fd5SrwWkxuCV
 RgTZzkZ/VgM4daiemp0CGaeDepZau0bGlCnnkJHEqLQHGYYa/Bl+3zC1H6YoVATPYs2Ue1kZ66o
 BgseJYHR428WaMKH7slWyZkW5lkQJ+gY/KHn2oRoKy0CriFhXvM3OTYx71DDzr7SvFwpcmfzBoy
 /tiMezIceQRfVjaFQZ9TyxU2Lobp/ENpmwAKFI7CyerlJ6g+4vt0RQMXYkKSjJRQRrNduCZTh93
 U/Vsy8mjQ5DAafhBIWfMy16++SGNvsQ2UdK5Wr2E5Mzpw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay96-hz2.antispameurope.com;
 Wed, 17 Dec 2025 09:48:20 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 5FB5A220CD8;
	Wed, 17 Dec 2025 09:48:09 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] arm64: dts: mb-smarc-2: Add PCIe support
Date: Wed, 17 Dec 2025 09:48:04 +0100
Message-ID: <20251217084806.41853-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay96-hz2.antispameurope.com with 4dWSB20czCz1TMgh
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:1eff63407a427bebdc6c421623ea4ad2
X-cloud-security:scantime:2.164
DKIM-Signature: a=rsa-sha256;
 bh=e8+/cZk0H8N2WAzWr4PEnz6SuI6lU+scC72gDf6sJvg=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765961299; v=1;
 b=s7SHO0P/EebQjRwnH7etOpemk0VbaPHAyw94K45Qv5OJ9YuuLtKHQolvr1rX2FSoyJ4C+rJR
 8+AE9nz/kw7BhaMkce9J4sjkAhnCQHyew/wRgpHwxYwKWdGgMuaj1uPULMHxZt2+yRVC51yYSII
 1x55uDPn8JW10ze3lqqM3MptTPQ8qXjLHQOwOTmCdpWcC3MBEtHw6ICFNZ4l3tRXth+j15srEii
 DAK+EOTvzb0Lj4YSzkys26y9tQYjVCG7ByDMSMhcLMdVb03FAWbI5hneRo3A18FtW+wEnC0X7A2
 u0sGriK8o6d6YDUb/epXLrNKgRY7hrSwgheEBKRmNeJIQ==

TQMa8XxS on MB-SMARC-2 supports mPCIe on X44.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi    | 10 ++++++++++
 arch/arm64/boot/dts/freescale/tqma8xxs.dtsi        | 14 +++++++++++---
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi b/arch/arm64/boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi
index 8bfe77113d64b..050ae23c4dc1e 100644
--- a/arch/arm64/boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi
+++ b/arch/arm64/boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi
@@ -126,6 +126,12 @@ &flexcan3 {
 	status = "okay";
 };
 
+&hsio_phy {
+	fsl,hsio-cfg = "pciea-x2-pcieb";
+	fsl,refclk-pad-mode = "input";
+	status = "okay";
+};
+
 &i2c0 {
 	tlv320aic3x04: audio-codec@18 {
 		compatible = "ti,tlv320aic32x4";
@@ -156,6 +162,10 @@ &lpuart3 {
 	status = "okay";
 };
 
+&pcieb {
+	status = "okay";
+};
+
 &reg_sdvmmc {
 	off-on-delay-us = <200000>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi b/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi
index ebf20d5b5df9c..bfc918f18d011 100644
--- a/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi
+++ b/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi
@@ -402,6 +402,14 @@ &mu1_m0 {
 	status = "okay";
 };
 
+&pcieb {
+	phys = <&hsio_phy 0 PHY_TYPE_PCIE 0>;
+	phy-names = "pcie-phy";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pcieb>;
+	reset-gpio = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
+};
+
 &sai1 {
 	assigned-clocks = <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
 			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
@@ -646,9 +654,9 @@ pinctrl_i2c0_gpio_mipi_lvds0: mipi-lvds0-i2c0-gpiogrp {
 	};
 
 	pinctrl_pcieb: pcieagrp {
-		fsl,pins = <IMX8QXP_PCIE_CTRL0_PERST_B_LSIO_GPIO4_IO00	0x06000041>,
-			   <IMX8QXP_PCIE_CTRL0_CLKREQ_B_LSIO_GPIO4_IO01	0x06000041>,
-			   <IMX8QXP_PCIE_CTRL0_WAKE_B_LSIO_GPIO4_IO02	0x04000041>;
+		fsl,pins = <IMX8QXP_PCIE_CTRL0_PERST_B_LSIO_GPIO4_IO00		0x06000041>,
+			   <IMX8QXP_PCIE_CTRL0_CLKREQ_B_HSIO_PCIE0_CLKREQ_B	0x06000041>,
+			   <IMX8QXP_PCIE_CTRL0_WAKE_B_LSIO_GPIO4_IO02		0x04000041>;
 	};
 
 	pinctrl_pwm_mipi_lvds0: mipi-lvds0-pwmgrp {
-- 
2.43.0

