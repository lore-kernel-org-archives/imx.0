Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A601B4144
	for <imx@lists.linux.dev>; Tue, 21 Jan 2025 09:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737452029; cv=none; b=k3LEIss9HNF350R/SN/BEzMK7peKCZ5hKArA3Z3FE0YSpd8k/KSHe48Niy2kY1VKYRLEsKrLxDO+gWgpoQ0iYDx4DhxBynbzpbXmTco4iD/SqT8HQdKQkAg2ltJEqet9w7z+dtI9b0s31HZditZDqcZNiM3DZwz6soNzO9ufZzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737452029; c=relaxed/simple;
	bh=4uel6ah6eaYhdAJonWK1L0+0Gg2X3y6qTJVhE83VkzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oEaZxABeSQEnEaHhdFDEpJ8GFk2YAFDExiMOE9ty+hhojQqukesHv8SFjlrIWVkY+ljOEHVWfIMY8pJGnMfNGOVFyg+lf2/rjwK3E5NRbFycPgEh0v/G9ey/k7LEFhoMcSHoZ05BgDG+TkJlqrwVgyw7tyEeQJEQ8xyudGgK0q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=e6q9zTHP; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="e6q9zTHP"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6BD6D1C000B;
	Tue, 21 Jan 2025 09:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737452020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5DG0T/Wj5sMTIfOxlaeeF2ogFt3hSsxzPW/LXs5xqPQ=;
	b=e6q9zTHPWm5A0p2N8Vi+9PeG6Mrcf+9KHacxxOVEIguvGSzPIrBejQtRLSQ0laTKEf4VYq
	exmoU7QXVdN5b1fzIJNhLfn6NuYPrOjbuka/4g4wQ5Gu3EWsT82R+VocojSpsfQe+w6H3i
	JUmGdVmibNLtBF52JWIYf7vTyyHmz0oryQXmL1oUHiobsD/K1Nvv6Yj06oaOJ94hoQ/lVX
	ZrIJXrc+OAqCSpE0GbD28xLOad+Sk3W74G5bADTvSG4qFtM3jw8z7mVslUDj5d+5FV76Hj
	0FYNIhr1BbDgiKhrSXCdCFvU467lJQZFG6tUYmAkrr6pZpTRuDaP6bwFMnXgOw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 21 Jan 2025 10:33:27 +0100
Subject: [PATCH 1/3] dt-bindings: arm: fsl: Add VAR-SOM-MX6UL SoM and
 Concerto board
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-varsom6ul-concerto-dts-v1-1-eb349acf0ac6@bootlin.com>
References: <20250121-varsom6ul-concerto-dts-v1-0-eb349acf0ac6@bootlin.com>
In-Reply-To: <20250121-varsom6ul-concerto-dts-v1-0-eb349acf0ac6@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1044;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=4uel6ah6eaYhdAJonWK1L0+0Gg2X3y6qTJVhE83VkzQ=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnj2ny5yWe8Gr+ev7YaQo/jseuSpZvTyVYPGDmY
 zTTC5H+8RGJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ49p8gAKCRDRgEFAKaOo
 Nr8/D/9kpyLJTrAbVewPyScvFU2LrKc7HTd+2jRGVZe7gJW1afmheDpdJT7MQscp1K6Q+mneGG2
 11u7DG4gTqzJXCZvHH6zzTGtpwWOnssRiOvm3X7IoCfvxleDTN8kxVau7MXMhwAmFWoDgi/qny2
 dF1631wHI/jzXKZsYfWXBdeub0Wn4PCBIs6Kwg3VL86Kyl6XX1w2bXf9bFp8h+CX3GUZZqb0cf2
 RCv948y68Q1hphXsVYZ1eSd5f7Zr9zBmrYjiLac0FfWdFCdDXCBahDTIVt4sVQrGKUFC370J8kZ
 I/tzZY2RlBGwcliI30CoKOrAUTDpG5A60aLItjlD83C5XAnLbVJbnGqKLbGlOYlFIZr4gQl4KHT
 N8CRP5brr9RUbU1TmeaAtoiib5MJLX0D79fdGNnf1ToPauy5K85mQXJ7xuR2C4dQGXTc2G4uZER
 08khVztbPnHecC2jMkrGfJy1938iIfk9WxNMIWMa3eRpFFTdUC3vFuBaluXnzWnLft/sf24XfjV
 qMn61fdO6RjReFBYm6wthz8eVa65Oubv/insV/2W4UA6ry+lgcVvX/a5Whtj+JbI457CSGccpGM
 89ScBaiMESXUMUezyQiLeDGT/a+2AWIwTgcue8GGYJTLbWU9u3Nv2jcG1gGNvgWmSSp7mM8Tt2H
 S3BvEAvj9SQRCOA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com

Add support for the Variscite i.MX6UL VAR-SOM-MX6UL and the Variscite
Concerto carrier board.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 6e0dcf4307f10040dafd96b8e12079813e414c08..5c1a27884f0d7ab0c7adc307ff502e179f85523f 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -402,6 +402,12 @@ properties:
           - const: variscite,var-som-imx6q
           - const: fsl,imx6q
 
+      - description: i.MX6UL Variscite VAR-SOM-MX6 Boards
+        items:
+          - const: variscite,mx6concerto
+          - const: variscite,var-som-imx6ul
+          - const: fsl,imx6ul
+
       - description: TQ-Systems TQMa6Q SoM (variant A) on MBa6x
         items:
           - const: tq,imx6q-mba6x-a

-- 
2.47.0.2.g7caf9f4c55.dirty

