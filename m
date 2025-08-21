Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513342E8B9B
	for <imx@lists.linux.dev>; Thu, 21 Aug 2025 07:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755762962; cv=none; b=F4wNXGKY9t5Q/YE+6xX9Z6yXuMKUIMQKWiljz9Rmjshub0J2sBKPS7ECsRrqwXeWK4d5Z/BphBNMoZvzbUIAXMoW/hf49KnP6eeXCZr92C1KnM7UvYfnLgyu8MMT4oq7Z5nP2qFugO7iVrOVbPYQprNhEF51ZCTHj6HFciM9p0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755762962; c=relaxed/simple;
	bh=TwphvgFRn9I20xhvECiUAEzjB4QXWdH5Zi01h9MIO0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JqvzJ2eihq2HLPrQUNI8Q5v/7Dy7Iz8IihozLDLwGP5yohUH1sciwEK4/3yc6f6qDe9Ly5s/SL5IggDq46iqk961p8qmLBlg7Er17x0dV8KhbbMnQETg/SoC7Jy1jSKcG7YoVLfHy0nm+PZHi+YWB0Ec6QxtQPC62hfvAV01/Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1up097-00073K-Sf; Thu, 21 Aug 2025 09:55:41 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Thu, 21 Aug 2025 09:55:28 +0200
Subject: [PATCH 1/5] dt-bindings: vendor-prefixes: Add JuTouch Technology
 Co, Ltd
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-1-b492ef807d12@pengutronix.de>
References: <20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-0-b492ef807d12@pengutronix.de>
In-Reply-To: <20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-0-b492ef807d12@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

JuTouch is a chinese touch screen supplier dedicated to manufacturing
high-end touch display products for the global industrial market.
(www.jutouch.com)

Add a vendor prefix for it.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 77160cd47f54079a39f35b570d69f7c4c2274724..074e2ce9025dfa5ff76f7df3a743c2dd2f9ccd93 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -799,6 +799,8 @@ patternProperties:
     description: JOZ BV
   "^jty,.*":
     description: JTY
+  "^jutouch,.*":
+    description: JuTouch Technology Co., Ltd.
   "^kam,.*":
     description: Kamstrup A/S
   "^karo,.*":

-- 
2.49.0

