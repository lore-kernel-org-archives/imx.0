Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7090C181BBB
	for <imx@lists.linux.dev>; Tue, 14 May 2024 22:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715724322; cv=none; b=Rx12v23TqaItRWYlA2B1Sa4IrhyTGRNH6qejhLRNa1C3qXYRD/xKRMf6jVHhplma/oiBgusnquVE4qi0hEw6Ga9q7IJN1GcVxx7aIulOSGwaJ6lPoONVK+TEUi4dh5gwy9U4RC7kl3vAovL2KDujzSiPNGWzNnekA7IQ5kdl7vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715724322; c=relaxed/simple;
	bh=ep8cuByyWocp9XFQrkrZr7ObZ0qhUAmqM0BWqWm1vN4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=auVhH2WG0a7xE4pfyEwBd7rblVLxSHhDiopph5SIsGPnAJ4qp48Opl1aS4AzUztGssXMFe75V4RjfNyDf76xkAKZtT5F1bRVqUj5EHpX0CTx6ZVkTA2JgqoW8xDQ5thwgfUg5XlyhUVnvcHnQNyFvAGxDza/mkoqm02ZcJkPtCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=LpmgJp4o; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="LpmgJp4o"
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id A0162880B5;
	Wed, 15 May 2024 00:05:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1715724313;
	bh=n2jheAJ8Sxwn43CfbtUL4w+B50VhcTUUTpBxYcsYJO0=;
	h=From:To:Cc:Subject:Date:From;
	b=LpmgJp4o7O7AD7v1SeafCZocvZ5fzJmR8O937WJxBFF8W4/z6UTsluOKuk/U3e8yE
	 xGeU1u3ZJGnSZsijQgEeqNBRTDFLVOPaApLrtIzHe6rpH0t75i4edeE+A8gDc4EDtS
	 /etop1F/mD2Qo9tNIVq8Zca61cFEhVmMHGZfswO17NziEQgNinN/HGgwma8jaCWLpY
	 UA5vZQHs/w2rLucNrOhKLT9CuaU3J4yW+mBU3c0shm+rlFYjVSt8lee6IxMrIYl2jG
	 7iatZQrtLQS2qx0G1c56sbz7ZREiF4f6QENixZHh63Q4GsQtsdiMe50rfeVmGu6HPe
	 b3GqebwqHD2PQ==
From: Marek Vasut <marex@denx.de>
To: devicetree@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	kernel@dh-electronics.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: display: synopsys,dw-hdmi: Document ddc-i2c-bus in core
Date: Wed, 15 May 2024 00:04:39 +0200
Message-ID: <20240514220457.94571-1-marex@denx.de>
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

The DW HDMI driver core is responsible for parsing the 'ddc-i2c-bus' property,
move the property description into the DW HDMI common DT schema too, so this
property can be used on all devices integrating the DW HDMI core.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
---
 .../bindings/display/bridge/synopsys,dw-hdmi.yaml         | 8 ++++++++
 .../devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml    | 8 --------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
index 4b7e54a8f037f..828709a8ded26 100644
--- a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
@@ -45,6 +45,14 @@ properties:
       - const: isfr
     additionalItems: true
 
+  ddc-i2c-bus:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The HDMI DDC bus can be connected to either a system I2C master or the
+      functionally-reduced I2C master contained in the DWC HDMI. When connected
+      to a system I2C master this property contains a phandle to that I2C
+      master controller.
+
   interrupts:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
index 7979cf07f1199..180c4b510fb12 100644
--- a/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
@@ -31,14 +31,6 @@ properties:
   clock-names:
     maxItems: 2
 
-  ddc-i2c-bus:
-    $ref: /schemas/types.yaml#/definitions/phandle
-    description:
-      The HDMI DDC bus can be connected to either a system I2C master or the
-      functionally-reduced I2C master contained in the DWC HDMI. When connected
-      to a system I2C master this property contains a phandle to that I2C
-      master controller.
-
   gpr:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
-- 
2.43.0

