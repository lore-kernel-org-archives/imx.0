Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E87330F816
	for <imx@lists.linux.dev>; Mon,  4 May 2026 20:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777926144; cv=none; b=DY8UzbRlBff80ajrTd6MyaGU/KgDJUOedD81n3C/fdhvX4YkTEQfNR12JczhajUBI55XKeusHPdtFP4tIaOIOIa231mzNKLUuwt5UjPH6a/O4GMG4w3TDA/tF1IDTomZU9xowt7CAcetvhhyZu5dmxBANfAf/9yxwRU0r48x1xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777926144; c=relaxed/simple;
	bh=NGmZ1nLevNt9hfEIAD0jQ4K1aYW1Its/G3qV/ux2Phw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AeiUP5foZwT4PVrUadshKuXRO1LlgoS4yiYIlWavpgK3tuuXvCpB1oeOx4qKq94a5LMTwepHg6wvd+RjNLQlWRNcaO7PxzYEe81ATdF53Wf6AX736l23xapjuLIil6iWfSkpN2VpGprahzMF3S6bXgZLFVzlQpLmuMpSK2NlSsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1wJznX-0007WV-EF; Mon, 04 May 2026 22:21:47 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Mon, 04 May 2026 22:21:42 +0200
Subject: [PATCH 2/4] Revert "dt-bindings: display: bridge: ldb: Fill in reg
 property"
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-v7-1-topic-ldb-fixes-v1-2-0125d937ff7f@pengutronix.de>
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

This reverts commit 16c8d76abe83d75b578d72ee22d25a52c764e14a.

Remove the 'reg' and 'reg-names' property from the LDB.

The LDB is either part of the IOMUX_GPR (i.MX6SX) or the BLKCTRL
(i.MX8MP, i.MX93) register space. Both IOMUX_GPR and BLKCTRL are
register ranges with loose register definitions. E.g.

  - On the i.MX8MP there is one register which controls the AXI
    threshold for two different IPs (BIT(31:16) - IP1, BIT(15:0) - IP2).
  - On the i.MX6SX IOMUXC_GPR5 controlls: CSI2 mux, WDOG3 settings, PXP
    handshake, ...

In conclusion: it can't be ensured that one register belongs to one
dedicated IP and the LDB is rather an exception than the rule.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 .../devicetree/bindings/display/bridge/fsl,ldb.yaml       | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
index 828b7a40e9b6cf27f76d1cd3009505b03cbe09f1..e04df77af756f1dc46fc098d765502d44cc2de00 100644
--- a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
@@ -27,14 +27,6 @@ properties:
   clock-names:
     const: ldb
 
-  reg:
-    maxItems: 2
-
-  reg-names:
-    items:
-      - const: ldb
-      - const: lvds
-
   nxp,enable-termination-resistor:
     type: boolean
     description:
@@ -99,15 +91,10 @@ examples:
     #include <dt-bindings/clock/imx8mp-clock.h>
 
     blk-ctrl {
-        #address-cells = <1>;
-        #size-cells = <1>;
-
-        bridge@5c {
+        bridge {
             compatible = "fsl,imx8mp-ldb";
             clocks = <&clk IMX8MP_CLK_MEDIA_LDB>;
             clock-names = "ldb";
-            reg = <0x5c 0x4>, <0x128 0x4>;
-            reg-names = "ldb", "lvds";
 
             ports {
                 #address-cells = <1>;

-- 
2.47.3

