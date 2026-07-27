Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9E93F39DC
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 09:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145387; cv=none; b=Rvn0iOK9mpaQTGS/llgspxpEMrhZam2VSUOQwTeFzSkHCW6+GpTs2YcD9Xgli5k+itiWQkK3di2kPjl0rFGI43ib4m0M4oOKz1UoFzspB1+8HNSdIIma7uw0PUOxr5JnKqsd5vplOTswEUlw+me6M9u3nF4RIb503UcUC0cYu+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145387; c=relaxed/simple;
	bh=K5C7FIQgzC4FyQO72ZeisquxN2xDviJ4rXDa1mgC/p8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ijqn7kH7v78/5bTjvav1jI1BnM/Xd99cKy2qncRforIQlW6ypm9XdGAo4NppY9roHbbABxniQ6trOG5/zxYZF7SHChwcSxnvXxMzq4ERVlOUKEH7Pojr27d8Pe2K3jOOv4ewCeGQ+H1A5YJXAXehgxGANfdEWvRGfRziwtzuB0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1woHqw-00009N-Eg; Mon, 27 Jul 2026 11:42:30 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Mon, 27 Jul 2026 11:42:14 +0200
Subject: [PATCH v5 2/5] dt-bindings: arm: fsl: add base compatible for Skov
 i.MX8MP revC
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v5-2-67faa5ee0bf6@pengutronix.de>
References: <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v5-0-67faa5ee0bf6@pengutronix.de>
In-Reply-To: <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v5-0-67faa5ee0bf6@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 =?utf-8?q?S=C3=B8ren_Andersen?= <san@skov.dk>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1189;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=K5C7FIQgzC4FyQO72ZeisquxN2xDviJ4rXDa1mgC/p8=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ1a6Bst27lU9MbNfL/+RE21UkrM5453bCamfqufW+TYkG
 /0I8XbsKGVhEONikBVTZFFZWMEn6vHBM3KaCBfMHFYmkCEMXJwCMJGzVYwMT04uWCLV8SZrgu6+
 ROXLi3M0Huawd7VmlR5pdU9Zk/RKl5Ghz/aD9uON2tuUNIpjXj4pqL798F+j+a41R6ZVyReXzLd
 hAgA=
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Add a generic compatible for revC-based Skov boards.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 86876311ec59a..7bb5d6ca8485a 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1145,6 +1145,7 @@ properties:
               - skov,imx8mp-skov-revb-hdmi # SKOV i.MX8MP climate control without panel
               - skov,imx8mp-skov-revb-lt6 # SKOV i.MX8MP climate control with 7” panel
               - skov,imx8mp-skov-revb-mi1010ait-1cp1 # SKOV i.MX8MP climate control with 10.1" panel
+              - skov,imx8mp-skov-revc # SKOV i.MX8MP climate control revision C
               - skov,imx8mp-skov-revc-hdmi # SKOV i.MX8MP climate control without panel
               - skov,imx8mp-skov-revc-bd500 # SKOV i.MX8MP climate control with LED frontplate
               - skov,imx8mp-skov-revc-jutouch-jt101tm023 # SKOV i.MX8MP climate control with 10" JuTouch panel

-- 
2.51.0

