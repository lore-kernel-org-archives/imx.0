Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18D22F6577
	for <imx@lists.linux.dev>; Mon,  4 May 2026 20:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777926136; cv=none; b=Psnt9TzWdsQec1KpVG51Lq//zkRB5VEGcHHSj0LXz+JoOSMrDRgd5tGdmJp6JClrf1yKixLGMcXrtcI172A6q6Vcbn9DTeXGqsxTQ36ZPAT2a1Kof/4IySCR3yWMeajQ+9Pcc6rKnfp65wxOa/zOFl5nVc5iRYZFLDsiVDaaxUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777926136; c=relaxed/simple;
	bh=GjX+Zl01+xvHUVCSI7brDzkX1/1clyd15YAzu3xxyvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cWgT6eYOwNKmi61fjbax9XhwGGUyFcAzKcTfezROW2DJWzQAHyW9xzWV11/iu61vCRaPiOmDvO6n0ie6TJo6S9DcPtKrIdxyp/Bq7sTbiWLhJepNR7vKL5vJ3kvfhOe66U/ulT58n/4kn4LYMmHq+xHeRe9filFXtK7ekewJpik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1wJznX-0007WV-BD; Mon, 04 May 2026 22:21:47 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Mon, 04 May 2026 22:21:41 +0200
Subject: [PATCH 1/4] Revert "dt-bindings: display: bridge: ldb: Add check
 for reg and reg-names"
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-v7-1-topic-ldb-fixes-v1-1-0125d937ff7f@pengutronix.de>
References: <20260504-v7-1-topic-ldb-fixes-v1-0-0125d937ff7f@pengutronix.de>
In-Reply-To: <20260504-v7-1-topic-ldb-fixes-v1-0-0125d937ff7f@pengutronix.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, laurentiu.palcu@oss.nxp.com, 
 victor.liu@nxp.com
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

This reverts commit 8aa2f0ac08d3b207ba54e98698c9d696b86452a7.

The LDB is either part of the IOMUX_GPR (i.MX6SX) or the BLKCTRL
(i.MX8MP, i.MX93) register space. Both IOMUX_GPR and BLKCTRL are
register ranges with loose register definitions. E.g.

  - On the i.MX8MP there is one register which controls the AXI
    threshold for two different IPs (BIT(31:16) - IP1, BIT(15:0) - IP2).
  - On the i.MX6SX IOMUXC_GPR5 controlls: CSI2 mux, WDOG3 settings, PXP
    handshake, ...

In conclusion: it can't be ensured that one register belongs to one
dedicated IP and the LDB is rather an exception than the rule.

Therefore remove the 'reg' and 'reg-names' property requirement.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
index 7f380879fffdfef28d9a35d7fbf87fdf28377b43..828b7a40e9b6cf27f76d1cd3009505b03cbe09f1 100644
--- a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
@@ -68,7 +68,6 @@ required:
   - compatible
   - clocks
   - ports
-  - reg
 
 allOf:
   - if:
@@ -83,15 +82,6 @@ allOf:
         ports:
           properties:
             port@2: false
-  - if:
-      not:
-        properties:
-          compatible:
-            contains:
-              const: fsl,imx6sx-ldb
-    then:
-      required:
-        - reg-names
 
   - if:
       properties:

-- 
2.47.3

