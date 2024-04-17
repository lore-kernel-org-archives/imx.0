Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5938F13C9A7
	for <imx@lists.linux.dev>; Wed, 17 Apr 2024 11:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713354168; cv=none; b=u394jxLhbSjcK4VZdxvC/8pl8r0SYlzZTIPHbi4AYe3ufEd0Xi2IPkvcp2R1UiJ7TtcsP5SiDjI+C1gWJt7Ul9q2n9SG27mZvq8u0oFff8rZX2k4cE+YQKZq0n7PLdo/TN8P9N839BvWc5h5xDlSube7zBEoICJt/As0pcQRw9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713354168; c=relaxed/simple;
	bh=NYeg8orai6KBD+CcId5wXJtIw99UyoTcZSujtN87lYw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dpL+kY9Tg/75dUk1WAi4hpJFDLirjVqrDjJWMkAlZotmxk4mWhemvew5qLrFJp0LOWBh2oFhvAYK34fiD+9AlF2+T0XFAM2gmF+B4WmbUPPx28h5jrFeDoWxlVCRrikMHNAWHXr/vWLZ7G8kG8dwjLO8+imXODj3OfkTZf/GLko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=jIy/z3eF; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="jIy/z3eF"
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id F00E28847E;
	Wed, 17 Apr 2024 13:42:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1713354163;
	bh=re+dmG4DlmUNXzNLIkTemvL4r73mnMr+yNxVCRTHIjk=;
	h=From:To:Cc:Subject:Date:From;
	b=jIy/z3eFKN6vZc+7gGYVspfzSLQWvI72wgfyQiZNNj0XtIVVVgDiOU3NVtB8Esysl
	 tMGqkrT1zk8T6ICyM9uX9kwMjd/+CR2jW4dqWlYVPWdcf1lMHEL/dUAwl2kPrnUD8v
	 m6UU9/JJBPCCE+8GGDFj+ioj7Fq7lNiO6nCpwUZPNeJjsTeJR0lL9aU7IktW+/cmpq
	 ZU6mqujYnGqhLo3RDd2DjanIoZ/Uq+S7dGBWiJFI/gtJ5bCQV/quAL6tcpSuvXi+kh
	 h4SIB7J1DStNUSGK0j4Wyjg1hUZ2fKvn7RxMDwE8aRGf7Kf+aPH8g7RhhOqf+fbv1H
	 Fg7XEjS/YO59g==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Peng Fan <peng.fan@nxp.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v3] arm64: dts: imx8mp: Align both CSI2 pixel clock
Date: Wed, 17 Apr 2024 13:42:06 +0200
Message-ID: <20240417114231.7044-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

Configure both CSI2 clock-frequency and assigned-clock-rates
the same way. There does not seem to be any reason for keeping
the two CSI2 pixel clock set to different frequencies.

This also reduces first CSI2 clock from overdrive mode
frequency which is 500 MHz down below the regular mode
frequency of 400 MHz.

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Paul Elder <paul.elder@ideasonboard.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
V2: Align both clock to 266 MHz and update commit message
V3: - Fix up clock-frequency to 266 MHz as well, update commit message
    - Add RB from Peng and Alexander, but maybe those need to be updated?
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 1bb96e96639f2..b92abb5a5c536 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1657,7 +1657,7 @@ mipi_csi_0: csi@32e40000 {
 				compatible = "fsl,imx8mp-mipi-csi2", "fsl,imx8mm-mipi-csi2";
 				reg = <0x32e40000 0x10000>;
 				interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
-				clock-frequency = <500000000>;
+				clock-frequency = <266000000>;
 				clocks = <&clk IMX8MP_CLK_MEDIA_APB_ROOT>,
 					 <&clk IMX8MP_CLK_MEDIA_CAM1_PIX_ROOT>,
 					 <&clk IMX8MP_CLK_MEDIA_MIPI_PHY1_REF_ROOT>,
@@ -1667,7 +1667,7 @@ mipi_csi_0: csi@32e40000 {
 						  <&clk IMX8MP_CLK_MEDIA_MIPI_PHY1_REF>;
 				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>,
 							 <&clk IMX8MP_CLK_24M>;
-				assigned-clock-rates = <500000000>;
+				assigned-clock-rates = <266000000>;
 				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_1>;
 				status = "disabled";
 
-- 
2.43.0

