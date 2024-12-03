Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45401E3782
	for <imx@lists.linux.dev>; Tue,  3 Dec 2024 11:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733223676; cv=none; b=KXz6M1+3vRqYmgrt0u1VIhQ2mFmy3VkofbDNu602dTdZLO33jWHszfg4CyDoBzcCEzebUSW6uNDp8iFAJLkJ5VjjCQ8hRGQq3yB62LPGEV8ROz49fdHjq1FWMV+OVY9510cbOyJ/YMZ+kNiO+qON9SFSi/yNbBTjA1BjrL0FnUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733223676; c=relaxed/simple;
	bh=Csbo7XV4I7vd7EsXUvg87SwChEFUFSAfWhQoTdS1VLs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nkJrMd9YxoqsIta7ZOunx2jKV28XzXNDrseBnW37Q1VH021N96WdO1DEHC84d1c6/OsPJNnufen/FBuTbdml+R5IPrB+qwTraZD3lSGTy3T07rKobXtE282mst9wWsBi809L69vGhGVGRzSIMWnGVlA0Tp5xOZrdN20PRvZDgag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=psJWFowC; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="psJWFowC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ueP7Zmu0cny/97JJOvIfWIB6M+S99UlmuleWK5RgZPU=; b=psJWFowC6z7E3RCXY3xnAtkT99
	Llh5+I/2mpNUYdtXTZEt91x3vMtngQv8AmprqCnzii+nz7G6C2zS+xhjvOA5ilKQNBTyCzfUsjL7n
	j9P/jLS+D8WHHG3CbGxVnk14+5XW2GYQKQXIbq/HfPXnNMx2UH1dhgYDRMn12cEEIH8Cyl8xYmLYR
	4/jBQkBQH2ShdXMPwyw9sTUeJecYNxXd6qEerMGr6X8fhCPY7uNZegrOyc+K31lDLJEMHGB+XXAhF
	zQBdmO83Ps3icWoY2YEBNVbOEcBF8/7rFQeodqQ+j+cxwPM2hVIadegQDjqCHst5PKw1fDOw6Nq0W
	CmGwHTtA==;
Received: from [89.212.21.243] (port=52296 helo=and-HP-Z4..)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1tIQeR-00Bd83-2l;
	Tue, 03 Dec 2024 12:01:07 +0100
From: Andrej Picej <andrej.picej@norik.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	marex@denx.de
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	upstream@lists.phytec.de
Subject: [PATCH v3 1/3] dt-bindings: drm/bridge: ti-sn65dsi83: Add properties for ti,lvds-vod-swing
Date: Tue,  3 Dec 2024 12:00:52 +0100
Message-Id: <20241203110054.2506123-2-andrej.picej@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241203110054.2506123-1-andrej.picej@norik.com>
References: <20241203110054.2506123-1-andrej.picej@norik.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Add properties which can be used to specify LVDS differential output
voltage. Since this also depends on near-end signal termination also
include property which sets this. LVDS differential output voltage is
specified with an array (min, max), which should match the one from
connected device.

Signed-off-by: Andrej Picej <andrej.picej@norik.com>
---
Changes in v3:
- no change
Changes in v2:
- move LVDS port schema to a $defs and reference it from there
- properties are now defined in microvolts/ohms
- use 1 property for data-lane and 1 for clock-lane LVDS voltage swing
- add 1 property which sets LVDS near-end termination
- since major change was done change the authorship to myself
---
 .../bindings/display/bridge/ti,sn65dsi83.yaml | 36 +++++++++++++++++--
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
index 48a97bb3e2e0..6da9b6e3beb9 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
@@ -80,12 +80,12 @@ properties:
                   - const: 4
 
       port@2:
-        $ref: /schemas/graph.yaml#/properties/port
         description: Video port for LVDS Channel-A output (panel or bridge).
+        $ref: '#/$defs/lvds-port'
 
       port@3:
-        $ref: /schemas/graph.yaml#/properties/port
         description: Video port for LVDS Channel-B output (panel or bridge).
+        $ref: '#/$defs/lvds-port'
 
     required:
       - port@0
@@ -96,6 +96,36 @@ required:
   - reg
   - ports
 
+$defs:
+  lvds-port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          ti,lvds-termination-ohms:
+            description: The value of near end differential termination in ohms.
+            enum: [100, 200]
+            default: 200
+
+          ti,lvds-vod-swing-clock-microvolt:
+            description: LVDS diferential output voltage <min max> for clock
+              lanes in microvolts.
+            $ref: /schemas/types.yaml#/definitions/uint32-array
+            minItems: 2
+            maxItems: 2
+
+          ti,lvds-vod-swing-data-microvolt:
+            description: LVDS diferential output voltage <min max> for data
+              lanes in microvolts.
+            $ref: /schemas/types.yaml#/definitions/uint32-array
+            minItems: 2
+            maxItems: 2
+
 allOf:
   - if:
       properties:
@@ -120,7 +150,7 @@ allOf:
           properties:
             port@1: false
 
-additionalProperties: false
+additionalProperties: true
 
 examples:
   - |
-- 
2.34.1

