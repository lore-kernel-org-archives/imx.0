Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782581D4335
	for <imx@lists.linux.dev>; Thu, 27 Feb 2025 17:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740675655; cv=none; b=iWZnGa+wg3h0LP3FAWwzAjsgBqhDaCXAb+K93wwViAHPpLPPSs873fqjpEBWbumElZQ0/OrTZtnJs0tHjxTKjbLJUzArZQ+4skEaqq9AHYgCx5rR30S1+BToIURhJw+Ypz3eCi3M0QvpB0HJbU+Ceb6j+TtAEbKkGHyoL3NB2X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740675655; c=relaxed/simple;
	bh=aOLdfrJgG4xijrWsw1Q6AbfF+TEncusrKqqhCnXwUoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JCqoCbY+4CTjBHSceID+757hd++hh6FjqLvDTCkf3EgacM+IMgOXyqnZDhdIUZ+FdhasgU1rPLPal7xy7icQcleq6Rj+kjHMler47znokH4SEMGh6KrAc3KJkAYy4XnW/n9m3w2KGlMIrnTv65e//NHEhMbHXNW5d5cdFEvDvvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=KQNxjRXp; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="KQNxjRXp"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8A02410382F1A;
	Thu, 27 Feb 2025 18:00:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740675645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q+0tAWt+Qjct3O4SDcG8rZZ2o6M/LcHVGvtP3po6lSY=;
	b=KQNxjRXpcvJbz9cgkcZQoHo9j6WJlFA4+eHsi+79LIXltTLb8A2GR9urWj7yMW/wa4fC++
	O7re390e2VOV3buJ5/H6NnTQ2nJ9lhtq8tQ8dJKEU9I6CIgBgfQpklf8Qh1wkKodqvMZgY
	1kXjSslr0OIIA+HI6ZwkwsQA9/bl3iTU5+jCdZ4O3fei8TLnvxUThvGT7PIe3I+tUxP5WX
	uCsYX7xWdJ0IziUY+ZGVfNDARw9uFflLV38qjFs/KZGwnouYXYptpWA0Yr68dV5dhbd45a
	608JCAPJkOQTBgxfxoEMdJe/nPXD4hDYp6Xxg/Og7YOgn2xnNNJQp0hfdSF7Pw==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Reichel <sre@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Steven Price <steven.price@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev
Subject: [PATCH 1/9] dt-bindings: reset: imx95-gpu-blk-ctrl: Document Freescale i.MX95 GPU reset
Date: Thu, 27 Feb 2025 17:58:01 +0100
Message-ID: <20250227170012.124768-2-marex@denx.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250227170012.124768-1-marex@denx.de>
References: <20250227170012.124768-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The instance of the GPU populated in Freescale i.MX95 does require
release from reset by writing into a single GPUMIX block controller
GPURESET register bit 0. Document support for this reset register.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Steven Price <steven.price@arm.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 .../reset/fsl,imx95-gpu-blk-ctrl.yaml         | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/fsl,imx95-gpu-blk-ctrl.yaml

diff --git a/Documentation/devicetree/bindings/reset/fsl,imx95-gpu-blk-ctrl.yaml b/Documentation/devicetree/bindings/reset/fsl,imx95-gpu-blk-ctrl.yaml
new file mode 100644
index 0000000000000..dc701bd556c0b
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/fsl,imx95-gpu-blk-ctrl.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/fsl,imx95-gpu-blk-ctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX95 GPU Block Controller
+
+maintainers:
+  - Marek Vasut <marex@denx.de>
+
+description: |
+  This reset controller is a block of ad-hoc debug registers, one of
+  which is a single-bit GPU reset.
+
+properties:
+  compatible:
+    - const: fsl,imx95-gpu-blk-ctrl
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    reset-controller@4d810000 {
+        compatible = "fsl,imx95-gpu-blk-ctrl";
+        reg = <0x0 0x4d810000 0x0 0xc>;
+        clocks = <&scmi_clk IMX95_CLK_GPUAPB>;
+        power-domains = <&scmi_devpd IMX95_PD_GPU>;
+        #reset-cells = <1>;
+    };
-- 
2.47.2

