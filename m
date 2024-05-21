Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DE057318
	for <imx@lists.linux.dev>; Tue, 21 May 2024 10:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716288075; cv=none; b=ZQ1IOybqB/36LM1LWlcGPQi6ieLxIBoRmaFVb/wxD/8b0Hnd9sMG8DZ9o9NR+yQ/JWsijQynX3yFBkpGLb+1jMyFVKb6bs0HWuGMZZugs8Cgw8YfH+D36YAC3UbiBKS8pGmTWjJFVJwnu35f/xvjC4r2LLMRU02YdxyAMNGjbV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716288075; c=relaxed/simple;
	bh=kbeKLFHtPQHEs3YHnmyaTP/T21QEFibznVBz3hB29H8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PlM/ftcAXJVgT6y5lct1yZqWbKMD0Dda4vNG8xsg2f1EcD9IWhvItqAO7uo8geo5NaVqyymPfit0RX6+FW9pAhYP6dbzMwQYZCs6zNcjB+wivR3V8tD2q6lnO0A7a1iD6gwIIzIb+MJ6iTHwVHLb4j1AwoZMxXBUCdXkKLVGjLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=fcg1xJoi; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="fcg1xJoi"
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 1531988256;
	Tue, 21 May 2024 12:41:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1716288071;
	bh=kX9kBEc76JfnFPvmJUWalto0Drv1AOFgM/olB4oTv5U=;
	h=From:To:Cc:Subject:Date:From;
	b=fcg1xJoizAuAIg2DYmv+y0mP/7Eux9XlrqBKppoF8o2qOKFmujESovVjg2740oTOC
	 AcsppvsjG777wfTXfxlWGYgu5q87lAjWde/uNtcYO7euND56y8xKhGk/9JltWbIjGv
	 jxCoiXc4GF64ntc0jHx7za18mkAzm3PoBUEzIESt/RMyylaLWVMkGuOSCmRrY5eTzj
	 3WM7682DCkLmh/cXYvfLJaZCCgPFGx7oCcgnZjsVQStGO5QcM1ZcCOZJL79BJk2WYj
	 XEtJ9qRCS4JBrjNpXWUK/H9PVfCgm8TZx5k54Ja+GGwTmHCXyyucVlqkyQCXhMXowK
	 J05nOujnYAamA==
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
	Liu Ying <victor.liu@nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mark Yao <markyao0591@gmail.com>,
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
Subject: [PATCH] dt-bindings: display: synopsys,dw-hdmi: Mark ddc-i2c-bus as deprecated
Date: Tue, 21 May 2024 12:40:47 +0200
Message-ID: <20240521104057.10485-1-marex@denx.de>
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

The ddc-i2c-bus property should be placed in connector node,
mark the HDMI TX side property as deprecated.

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
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Mark Yao <markyao0591@gmail.com>
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
 .../devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
index 828709a8ded26..d09a0bee54247 100644
--- a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
@@ -47,6 +47,7 @@ properties:
 
   ddc-i2c-bus:
     $ref: /schemas/types.yaml#/definitions/phandle
+    deprecated: true
     description:
       The HDMI DDC bus can be connected to either a system I2C master or the
       functionally-reduced I2C master contained in the DWC HDMI. When connected
-- 
2.43.0

