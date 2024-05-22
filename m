Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B447433CA
	for <imx@lists.linux.dev>; Wed, 22 May 2024 00:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716336610; cv=none; b=qvTnMZapPh08uly6F83aXBFXjoLzIcQv26CGBddGP9X6ppalnVuI1TCVb9hZP4tgWw0Jx4wGLmwrUf14o4S0PCQmhyL/EhM5ZVYji1p0rLRxzQFSIdzpFjq7bH23OXDW7mzOfNMkSTAhworT6RUjkf+pAFe29+yDnRbtRmhOvYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716336610; c=relaxed/simple;
	bh=oV6bmaYc8eeLEVZHdawApNxcvLAURbaBix3FTtLb5Ss=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YGqqj9zmumA4ZdXqGtYebzCbWWbAuPt/cIg94bp/HqtJ5Z5INS/VZ90JVezidyCb5HFjyitMDFEjIGP67IS+rJ6RvR6V610GUJwf903TeYybCoIRwmjKNaxpUBjA/xZ1VfXR3Ubm+dKXTIm2SFcdcdSma2S7IClpO8WHRovAsXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Ggeatj+l; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Ggeatj+l"
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 854DC8842C;
	Wed, 22 May 2024 02:10:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1716336606;
	bh=JixvmNFC9GMbSv+DKUdmSRpyGMvn+qECSeA63SnmiGg=;
	h=From:To:Cc:Subject:Date:From;
	b=Ggeatj+lFv3O09ow05DcWFfRO9wzfIWUoHRsM/nU2yu0enC9Rfjlee0Qa5jOnd7ju
	 v3YBHLXkBMzSTDsDp6fMysrscHyirZ8FNlQ7/4ljTpjAk1g3+yGWpT5bsiDO/Om2dq
	 FBBRRRyzh6LcjPciyRZDNUg8ayvKSbB9xLbl2FScu4AXgH6f08i+mch8fXY1upZAwC
	 L6jufsk+9+TaKcyFX/iRu8zdvNpDGgZi8LrBkcORz6jTfwK9IML8owlFLP1o0wbC+5
	 rQQw5U0k5uKL/a20gjcZ0tT1qDM+T9+ZSnIvW/KIdmOeaCHbnMGwV0Oslokdpq4lik
	 Nk0uUnj66WqTg==
From: Marek Vasut <marex@denx.de>
To: devicetree@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Rob Herring <robh@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
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
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Robert Foss <rfoss@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	kernel@dh-electronics.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] dt-bindings: display: synopsys,dw-hdmi: Mark ddc-i2c-bus as deprecated
Date: Wed, 22 May 2024 02:09:31 +0200
Message-ID: <20240522000949.49530-1-marex@denx.de>
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

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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
V2: - Expand the description
    - Add AB from Rob and RB from Laurent/Neil
---
 .../devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
index 828709a8ded26..33481381cccc1 100644
--- a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
@@ -47,12 +47,17 @@ properties:
 
   ddc-i2c-bus:
     $ref: /schemas/types.yaml#/definitions/phandle
+    deprecated: true
     description:
       The HDMI DDC bus can be connected to either a system I2C master or the
       functionally-reduced I2C master contained in the DWC HDMI. When connected
       to a system I2C master this property contains a phandle to that I2C
       master controller.
 
+      This property is deprecated, the system I2C master controller should
+      be referenced through the ddc-i2c-bus property of the HDMI connector
+      node.
+
   interrupts:
     maxItems: 1
 
-- 
2.43.0

