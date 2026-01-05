Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7452D63F6;
	Mon,  5 Jan 2026 20:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767645603; cv=none; b=LXN5BqkFMZ7hQah5hQPQDeBLrW3klyOWUCuXseoCfvfxBFl8o1Bankzbaui90jplRTpTyHsvTg++YC7hpliOLxy885Qp4RmWmnDuWLERa/K/EQOqkT2ce2Vgpvz9rt6Ft9enj2WOWWRFnilN9ntzTLMu18o/UsNQGk5u3C8hP+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767645603; c=relaxed/simple;
	bh=HCV/T1IM/XQ0mrQhnNuV/4m4XVibtP8BdEmgmOlvjzA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gpVzeVrXaYCAXBdNpq2jHiQ4DpMUJTUrd/vHKPQcgr79fsHFYt3xg1D4YC7/kKX1G32oKVL6xQ7C7OZshnkyWHu2IiBLaQtLl5bYRsZQy7gbQzFayqlG0j5uGeKFxwSfS9668E3BAim1qszvaQMdlr5UBB8f+n1NHrDvjeCixGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bTsZYD+i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bTsZYD+i"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B34AC2BC9E;
	Mon,  5 Jan 2026 20:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767645603;
	bh=HCV/T1IM/XQ0mrQhnNuV/4m4XVibtP8BdEmgmOlvjzA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bTsZYD+ilI0KINZQVq3U7JD+ny+3pmdx3ZOm7nOsbnl9HYk9sicKxSc8VEa2Fgnz2
	 Rj9RJelEmn/TUgbNHFyS8orrxDRgEzTp2SLD04V98mK5mY7rYP1rSTZ+0vJxNIWW7u
	 a1IqX1lBzndDqgbQVd/VrIh+crePPd4phrQHylL6QzC4gd5nfbWcBCQt5S4A9vaPVN
	 mT2JqeGQGQt19jpZDvfM9uDFzuVP7EYz9EparXYmPlKYlAvXi6w5x9jEhievSYOhNJ
	 xeP6lyn4dTCID3ukR+KX/icuNW+r2i5QojYMW5fx1uOHj+mzLwpWFispy1MO51QSh+
	 nmC4SCfE/epcA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0BB3C9833B;
	Mon,  5 Jan 2026 20:40:02 +0000 (UTC)
From: Sebastian Krzyszkowiak via B4 Relay <devnull+sebastian.krzyszkowiak.puri.sm@kernel.org>
Date: Mon, 05 Jan 2026 21:39:40 +0100
Subject: [PATCH 3/6] arm64: dts: imx8mq-librem5: Enable SNVS RTC
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-l5-dtb-fixes-v1-3-f491881a7fe7@puri.sm>
References: <20260105-l5-dtb-fixes-v1-0-f491881a7fe7@puri.sm>
In-Reply-To: <20260105-l5-dtb-fixes-v1-0-f491881a7fe7@puri.sm>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@puri.sm, Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1387;
 i=sebastian.krzyszkowiak@puri.sm; h=from:subject:message-id;
 bh=JNuGNcfI6hOpvAZ8HqyeyXYhlWTDkcA5v2YZJDmxJ28=;
 b=owEBbQKS/ZANAwAKAejyNc8728P/AcsmYgBpXCGhgii/RpPhUf5h5CdefZyyrvNM0EOTExxiV
 fd3xaCeqQyJAjMEAAEKAB0WIQQi3Z+uAGoRQ1g2YXzo8jXPO9vD/wUCaVwhoQAKCRDo8jXPO9vD
 /3/6D/0XaLcU7/jVgEjAVZclOE31jKJh2hGo56atYPkmPm7G/LNt8rE/Frqs7T9YJk757Ee+76i
 iJKhVzimVKvodaL4/23/yknzgpeLW2Z4LGLDf2+WR/AHv491KC97A9PNGNZKq2XUN3xeAZsQTX8
 mwdHYuQG01XV6Y7BA1ijUwGW2/22yUZsH/zHKC+39Z23+/cTo01KBnabOW132d6XRtclB4jrS4T
 M3admKI8Q+O/QaXfWYKoOSDMl+UOrBFAElBKdleBUjW5PQGk7hMGLxeyk8am0SJ/1h3ijBoSSAH
 Pp9NO+bsZzzF+gC/bY/7klzabdyS7kd+mvyiX6oMfaEuXehqXmQJzIUb6XmhlW2PYOsrEVl8g+w
 fS1DQQbO5I2gGNwcLDNodChiPiRheCofr+OaDdX7hSG9tnHjUcNjCg7j5d6YygwdxPPFforjISw
 YPOAFBUQkwqaNEwx/julnaGWMfLTTWKQgfUb8/dHRiivCrHcaiXZWLqLSf2sc4r5dEJorArHQ/F
 DZ84XTn0F/GO7YQummaaVbskJ58pSfOHvGqCCuowhHXAv72FncdQuC6EiZlrVKA2NfnecgSp8rl
 ZukBVHYoPUK7ftZrUHsaRuB3S9I9YjsVvoElo/3m8a87+hMySKSJZYp8/gUJWs2bXfaTHBKMc4X
 LpvB6nF4rMj44Qg==
X-Developer-Key: i=sebastian.krzyszkowiak@puri.sm; a=openpgp;
 fpr=22DD9FAE006A11435836617CE8F235CF3BDBC3FF
X-Endpoint-Received: by B4 Relay for sebastian.krzyszkowiak@puri.sm/default
 with auth_id=32
X-Original-From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Reply-To: sebastian.krzyszkowiak@puri.sm

From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>

It has been disabled because it was being used for system clock instead
of the discrete RTC. However, SNVS has some features that the discrete
RTC does not, such as being able to turn the device on. Solve that issue
with aliases instead and reenable SNVS RTC.

Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index b92b5f7b2bd7..8c37b1293699 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -17,6 +17,11 @@ / {
 	compatible = "purism,librem5", "fsl,imx8mq";
 	chassis-type = "handset";
 
+	aliases {
+		rtc0 = &rtc;
+		rtc1 = &snvs_rtc;
+	};
+
 	backlight_dsi: backlight-dsi {
 		compatible = "led-backlight";
 		leds = <&led_backlight>;
@@ -1001,7 +1006,7 @@ ldo7_reg: LDO7 {
 		};
 	};
 
-	rtc@68 {
+	rtc: rtc@68 {
 		compatible = "microcrystal,rv4162";
 		reg = <0x68>;
 		pinctrl-names = "default";
@@ -1316,10 +1321,6 @@ &snvs_pwrkey {
 	status = "okay";
 };
 
-&snvs_rtc {
-	status = "disabled";
-};
-
 &uart1 { /* console */
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;

-- 
2.52.0


