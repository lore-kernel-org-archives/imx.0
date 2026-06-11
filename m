Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0569D370AC9
	for <imx@lists.linux.dev>; Thu, 11 Jun 2026 08:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781165970; cv=none; b=Dv2KDDnHXZQYvtWpWM12BVBrka8WUgxPFbnqIf+WKkYl0IsMR6MmF6SRN5ugPdLE2THuWrgX3ZkULU+6+D07s5S/0b/blbVEhNb6uG0vU9aTLMikv/l+oPQNLKW3ED7BiyNpf4o2gdmWNiSksWebRg8OAJxXmBmxMKqjl1uIXY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781165970; c=relaxed/simple;
	bh=Byfl5+og89U8b3sXMExJ7u3hJtLQARfWBn1tNTj/z4w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KuB7p6KekkmG0JMjHxoZKlcDsKQvGJxg5iS6ajPxDpmK0TJzcPlhXvn5xPViWhxFVdSeI1LkFIdwg6rfFLjXfP5RKIFvIlULpglpMeYLiiLQyUw/5HER7gGfMitQaiymRDLQ2g0Fw9sKJc9BoJKVOp8ZWH/wbNU5uKHVgfqjarE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wXadC-0008Vx-Es; Thu, 11 Jun 2026 10:19:18 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Thu, 11 Jun 2026 10:18:59 +0200
Subject: [PATCH] arm64: dts: imx8mp-frdm: Add missing HDMI DDC pinctrl
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-imx8mp-frdm-hdmi-ddc-v1-1-b4e4c9bb0729@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAHJvKmoC/yXMTQqEMAxA4atI1hOoir9XGVzUJtUIVWlVBPHu1
 pnlt3jvgsBeOECbXOD5kCDLHJF+EjCjngdGoWjIVFaqUjUo7qzditaTw5GcIJHBKi10bqjQjbU
 Q09WzlfO3/XZ/h72f2GzvC+77ARIyDax4AAAA
X-Change-ID: 20260609-imx8mp-frdm-hdmi-ddc-715a3cd5a9ff
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Configure HDMI DDC SCL/SDA pins to support reading EDID.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx8mp-frdm.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts b/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
index 5fb9714215bf..f43330d1ff8b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
@@ -562,6 +562,8 @@ MX8MP_IOMUXC_SAI1_RXD0__GPIO4_IO02		0x10
 
 	pinctrl_hdmi: hdmigrp {
 		fsl,pins = <
+			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL	0x1c2
+			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA	0x1c2
 			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC		0x10
 		>;
 	};

---
base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
change-id: 20260609-imx8mp-frdm-hdmi-ddc-715a3cd5a9ff

Best regards,
--  
Philipp Zabel <p.zabel@pengutronix.de>

