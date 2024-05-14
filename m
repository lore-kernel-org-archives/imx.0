Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5A713A244
	for <imx@lists.linux.dev>; Tue, 14 May 2024 09:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715680396; cv=none; b=gLWloXdYGqxqoYiT6fZ+vFoBjEBjC9XkvzxjGbOp+6RtV+UitctpDucQpjHM+ME95CPchBK1rSGn1ctX0adZFz/H1j7EEsziqyiCkFXeWF7rPuFZfVRLsXxZkOM/mX4X0+QwFiWEDKbW0Z1GJmBni/lYoGQF4ffm3RMTHE9vM8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715680396; c=relaxed/simple;
	bh=N1Be/lHX9le8mgGi3YYkU+QV7lUMRQix+T57VbFccns=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References; b=LCBvyd15oiv107UU59FsZC8bNSj9q3rxq7T0XQS1M19IDJVB9k3i2pMmPqnQjpCShMUUKgioODRBE4Ct7QbtmIoQ5HHtY3A+JkfIUawOadK7UoBCGLjCbx9UNR+VT8pEwzbcPi8B9/y+Qbmu9s6tY2JChQmIG6ehn1EjneSKQso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4DBD320192A;
	Tue, 14 May 2024 11:53:00 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0F267200BC5;
	Tue, 14 May 2024 11:53:00 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id BCA39180226C;
	Tue, 14 May 2024 17:52:57 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: abelvesa@kernel.org,
	peng.fan@nxp.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	marex@denx.de,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	p.zabel@pengutronix.de,
	shengjiu.wang@gmail.com
Subject: [PATCH v3 3/6] dt-bindings: clock: imx8mp: Add reset-controller sub-node
Date: Tue, 14 May 2024 17:33:27 +0800
Message-Id: <1715679210-9588-4-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1715679210-9588-1-git-send-email-shengjiu.wang@nxp.com>
References: <1715679210-9588-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

The Audio Block Control contains clock distribution and gating
controls, as well as reset handling to several of the AUDIOMIX
peripherals. Especially the reset controls for Enhanced Audio
Return Channel (EARC) PHY and Controller.

So Audio Block Control is a Multi-Function Devices.

Add reset-controller sub node which is a reset provider for EARC.
Add compatible string "syscon", "simple-mfd" which make Audio
Block Control device support reset-controller sub-node.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../bindings/clock/imx8mp-audiomix.yaml         | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml b/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
index 0a6dc1a6e122..a403ace4d11f 100644
--- a/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
@@ -15,7 +15,10 @@ description: |
 
 properties:
   compatible:
-    const: fsl,imx8mp-audio-blk-ctrl
+    items:
+      - const: fsl,imx8mp-audio-blk-ctrl
+      - const: syscon
+      - const: simple-mfd
 
   reg:
     maxItems: 1
@@ -44,6 +47,11 @@ properties:
       ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8mp-clock.h
       for the full list of i.MX8MP IMX8MP_CLK_AUDIOMIX_ clock IDs.
 
+  reset-controller:
+    type: object
+    $ref: /schemas/reset/fsl,imx8mp-audiomix-reset.yaml#
+    description: The child reset devices of AudioMIX Block Control.
+
 required:
   - compatible
   - reg
@@ -60,7 +68,7 @@ examples:
     #include <dt-bindings/clock/imx8mp-clock.h>
 
     clock-controller@30e20000 {
-        compatible = "fsl,imx8mp-audio-blk-ctrl";
+        compatible = "fsl,imx8mp-audio-blk-ctrl", "syscon", "simple-mfd";
         reg = <0x30e20000 0x10000>;
         #clock-cells = <1>;
         clocks = <&clk IMX8MP_CLK_AUDIO_ROOT>,
@@ -74,6 +82,11 @@ examples:
                       "sai1", "sai2", "sai3",
                       "sai5", "sai6", "sai7";
         power-domains = <&pgc_audio>;
+
+        reset-controller {
+            compatible = "fsl,imx8mp-audiomix-reset";
+            #reset-cells = <1>;
+        };
     };
 
 ...
-- 
2.34.1

