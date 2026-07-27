Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44EC431A48
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 17:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785173484; cv=none; b=rjbgTTc4vNlexEIMpaa+1r9/Br0agKZmy/Zi1BfDPr1HkgGWuxFPtICVI+/BlK3B3Rx1nPa5FcJ8+BZlnH0MmO4EdlDCu7elycCmDQNS0bQVCjpkhxwMn+9q/1tErOunJKwVDOMzZYkrsqSDOQr9/RC7NHA9GzO70JlTdsEmhsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785173484; c=relaxed/simple;
	bh=2T+79v3+rRaHmQFTaPBt0dDlyJhj695NNSi9XL1E+NY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TExsECO7m2QJa7Yi6kkOefRoJlmtU0r+Tk9iXn/OilXPYeXrs8mQjGy5nNug9O4jwr6FUZf2mAuOds4I5lxZc0PP+U/i6YYUpeP7Vz71pUBLNDo5WEWHLC5GSy0sJITjRJrpGnGLPet1AAGeYkZKRweZ5pzw1UHutF/9c9VjPG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id E5ADF2028D2;
	Mon, 27 Jul 2026 19:31:10 +0200 (CEST)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1woPAU-001aZh-2d;
	Mon, 27 Jul 2026 19:31:10 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Mon, 27 Jul 2026 19:31:07 +0200
Subject: [PATCH v7 4/5] dt-bindings: arm: fsl: add compatible for new Skov
 i.MX8MP variant
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v7-4-ca8a0446166a@pengutronix.de>
References: <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v7-0-ca8a0446166a@pengutronix.de>
In-Reply-To: <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v7-0-ca8a0446166a@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 =?utf-8?q?S=C3=B8ren_Andersen?= <san@skov.dk>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1327;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=2T+79v3+rRaHmQFTaPBt0dDlyJhj695NNSi9XL1E+NY=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ1b61Dv+W7n9AiUtb/6oTqz49T/6/g2buG/RqouDgn3nW
 RW/aeXtKGVhEONikBVTZFFZWMEn6vHBM3KaCBfMHFYmkCEMXJwCMBEvVkaGt8JdwoWSvkzut4yL
 q27a3l4Q82NikYTYwjUmh31yMqN9GBmmHM6eM3nuwjWnbIN26DdyBa6PDpmqblj0sGRxSEe/hgc
 XAA==
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622

In preparation for adding a new device tree variant with a different 7"
panel, describe the DT compatible in the binding.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 7bb5d6ca8485a..e7f250641683e 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1148,6 +1148,7 @@ properties:
               - skov,imx8mp-skov-revc # SKOV i.MX8MP climate control revision C
               - skov,imx8mp-skov-revc-hdmi # SKOV i.MX8MP climate control without panel
               - skov,imx8mp-skov-revc-bd500 # SKOV i.MX8MP climate control with LED frontplate
+              - skov,imx8mp-skov-revc-jutouch-jt070tm041 # SKOV i.MX8MP climate control with 7" JuTouch panel
               - skov,imx8mp-skov-revc-jutouch-jt101tm023 # SKOV i.MX8MP climate control with 10" JuTouch panel
               - skov,imx8mp-skov-revc-tian-g07017 # SKOV i.MX8MP climate control with 7" panel
               - ultratronik,imx8mp-ultra-mach-sbc # Ultratronik SBC i.MX8MP based board

-- 
2.51.0

