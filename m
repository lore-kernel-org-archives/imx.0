Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C8321CA1E
	for <imx@lists.linux.dev>; Thu,  9 Jan 2025 15:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736437343; cv=none; b=UVbFyj/d+baTWW+yNCMEHBZh5ZdSGB1uuume0aUQ54a471mMbBqwSyoXRivwOBJudv/PEPK5PHwxiyvg/9EzJxeH5eyqAX4nexIcQ/K7ieKfFTBL8eWLvm+1OOyUmpJEM/2y2BA/EhqFvIU22uTbdpO81WOKKHRtni6jHVrsmZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736437343; c=relaxed/simple;
	bh=5Y2bIJcXUVeRq/52yqMTXRgAjwKnGM1KYGlk8qkGwzY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NcBREpUmevMByC8Y+flzDZpkeCKOccDmwBKu8TKvqhFLpB6HQufZM0ov4pcWceLlExxAxexzF34VpQTrNn4WNMqt3TOXWtmdp1IWG05Mp49nUvGTERdsBDCtgJ0u+XtAZ1JrV3mIPRm+YLIkqu2DK9jo7DKQCN4BzMSF+SzWfR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=MwNH6SxM; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="MwNH6SxM"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 970BF1047DC25;
	Thu,  9 Jan 2025 16:42:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1736437338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Juwn84S5vUX2aH6VsMCIM7pJOc3sVKVbXwLzJq3+1Jw=;
	b=MwNH6SxMOaF55Up/l3Tbf4uOwxVhmBCllDmFgpH7//hYrGxM7H+0Ry1PZlNWv6O1LYpUjQ
	47GI2VUN+e63rGR3ifUmACUxkWVg5p/7+BHx4UkyGGv6BNsbCNYsBy8tc3n8tRQfjN5ZVf
	EWOQiOfXsJrI1PwfvqoI0hwvw22+QMmvs7Y9Bu8T7EW/Vx/EBZuDo8Bl2Y4daqtmcxf3Te
	VQaZ8557tEVpnF7AeNmla4MqVZsmfzePK3xqh4rNy9PJyCjbtsTA3msaSDk/vPj7qT6bvV
	EeYVUAnKOZIK+5u26nbaz5kj8qgWC0vYIZPTxeU+IQ/hGx6VnpWeeKLOU1m15w==
From: Lukasz Majewski <lukma@denx.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>,
	Lukasz Majewski <lukma@denx.de>
Subject: [RESEND PATCH v11 1/3] dt-bindings: display: Add powertip,{st7272|hx8238a} as DT Schema description
Date: Thu,  9 Jan 2025 16:41:49 +0100
Message-Id: <20250109154149.1212631-1-lukma@denx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

This patch provides the DT Schema description of:
- powertip,st7272  320 x 240 LCD display
- powertip,hx8238a 320 x 240 LCD display

Used with the different HW revisions of btt3 devices.

Signed-off-by: Lukasz Majewski <lukma@denx.de>
Reviewed-by: Rob Herring <robh@kernel.org>
---

Changes for v9:
- New patch

Changes for v10:
- None

Changes for v11:
- Combine both separate dt-bindings patches for powertip,st7272 and
  powertip,hx8238a into one
- Drop the quotes for in "title" entry of powertip*.yaml files
---
 .../display/panel/powertip,hx8238a.yaml       | 29 +++++++++++++++++++
 .../display/panel/powertip,st7272.yaml        | 29 +++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/powertip,hx8238a.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/powertip,st7272.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/powertip,hx8238a.yaml b/Documentation/devicetree/bindings/display/panel/powertip,hx8238a.yaml
new file mode 100644
index 000000000000..b7d74faeb5d5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/powertip,hx8238a.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/powertip,hx8238a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Powertip Electronic Technology Co. 320 x 240 LCD panel
+
+maintainers:
+  - Lukasz Majewski <lukma@denx.de>
+
+allOf:
+  - $ref: panel-dpi.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: powertip,hx8238a
+      - {} # panel-dpi, but not listed here to avoid false select
+
+  height-mm: true
+  panel-timing: true
+  port: true
+  power-supply: true
+  width-mm: true
+
+additionalProperties: false
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/powertip,st7272.yaml b/Documentation/devicetree/bindings/display/panel/powertip,st7272.yaml
new file mode 100644
index 000000000000..f3622800f13f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/powertip,st7272.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/powertip,st7272.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Powertip Electronic Technology Co. 320 x 240 LCD panel
+
+maintainers:
+  - Lukasz Majewski <lukma@denx.de>
+
+allOf:
+  - $ref: panel-dpi.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: powertip,st7272
+      - {} # panel-dpi, but not listed here to avoid false select
+
+  height-mm: true
+  panel-timing: true
+  port: true
+  power-supply: true
+  width-mm: true
+
+additionalProperties: false
+
+...
-- 
2.39.5

