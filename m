Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14F136F424
	for <imx@lists.linux.dev>; Mon,  9 Mar 2026 08:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773046731; cv=none; b=uD5jpYVdJAHqBlrGMSe4LpeOciN7jODqsNF8xeznr6hpD6kPtG7ft42WGTXZXvYpM/t2OXEu5Qcd2/hPp0h2pQGrdMqAfbuSf3QAlEiIge9oPFzUx1ZK7r0igqTwRbr8n9wkDMQiohhwtPUZYEwY4keNcZCgtE9GYdMOv0/eU5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773046731; c=relaxed/simple;
	bh=alfksuUsaIMwwikJNXi8Mz/rONNZgs1R0FswmS9hGp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Www0qP04PkEyVBbdFbeDtpqZi1Zqv3l+VguGCbz4kJ4J6glSn+oEaQLuO9kQb2cNVnVwnY4pIt3PvF9lBmwa+2eKmbzazOSL/CwbUXBzdrJOFtpaI9Si6w1DdW2F6cg/z+d7C3tco+JrCQChvGeH+v6bPr3tGxK1yRHfVuZJ5nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=CNXdO+dP; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="CNXdO+dP"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1773046719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sNGBrZbcItuL87F8eu29arIhBMtm0lZwX1AAsxQD8uE=;
	b=CNXdO+dP8JYgZs6IcsExtMJTi8AL7PMVvrZNXM2VJ61/M6ZpwGGSQOc6IYXLi3tLq14smU
	EzLz8KmUgvMulY3uL1fklO8APl3znyDfGZrK5ek5BMWU+Q+s7r4H9LpMmZ9ti2EKvairuB
	KxpaIi/s5M7N7UCBLcpAZMc/j1vYTsgq4KhRdE8MijyunvWwBXMRedFAJwu4K3LOiOvOVu
	IPC6evVX1wpfA4xq79/8dbqL2EXfQrgnnL1xqCSkZ+sqQdzoRbW1OVhDIxd9e5VTp11OQ0
	BXWroxT8nNOEhc+b47JOGBHQZdqzdy5tX1guWLsFGIXZGSMhlzdtGSWuOZ8Qtw==
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Annette Kobou <annette.kobou@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v3 2/2] arm64: dts: imx8mp-kontron: Fix boot order for PMIC and RTC
Date: Mon,  9 Mar 2026 09:57:43 +0100
Message-ID: <20260309085749.25747-3-frieder@fris.de>
In-Reply-To: <20260309085749.25747-1-frieder@fris.de>
References: <20260309085749.25747-1-frieder@fris.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes

From: Annette Kobou <annette.kobou@kontron.de>

The PMIC provides a level-shifter for the I2C lines to the RTC.
As the level shifter needs to be enabled before the RTC can be
accessed, we need to make sure that the PMIC driver is probed
first.

As the PMIC also provides the supply voltage for the RTC through
the 3.3V regulator, we can simply express this in the DT to
create the required dependency.

This fixes sporadic boot hangs that occurred when the RTC was
accessed before the level-shifter was enabled.

Fixes: 946ab10e3f40f ("arm64: dts: Add support for Kontron OSM-S i.MX8MP SoM and BL carrier board")
Signed-off-by: Annette Kobou <annette.kobou@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
index b97bfeb1c30f8..bc1a261bb000e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
@@ -330,6 +330,12 @@ rv3028: rtc@52 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_rtc>;
 		interrupts-extended = <&gpio3 24 IRQ_TYPE_LEVEL_LOW>;
+		/*
+		 * While specifying the vdd-supply is normally not strictly necessary,
+		 * here it also makes sure that the PMIC driver enables the level-
+		 * shifter for the RTC before the RTC is probed.
+		 */
+		vdd-supply = <&reg_vdd_3v3>;
 	};
 };
 
-- 
2.53.0

