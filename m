Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF8F4D7D2F
	for <imx@lists.linux.dev>; Mon, 19 Oct 2026 10:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405239; cv=none; b=eyzOkia7bUW876+hFedM+bsxBTQQ7i8Hg2Sh7Nu/6ZzzkKYWrxa7Nf6j9VgqLbBYR2LdFEvEjxryaGHANPlOnQuOTowa2OAOc90tQWpy+INNL1ODO7kJ5QpnYA/WKSIDVjLIIH+PxCTEM8crNOz02f1AJCRbAPKfgop0SA4vc98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405239; c=relaxed/simple;
	bh=p2BuP3I+TMrSGg/xzqyxfT/0XRDTvkwqjvU6at2DNLc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZfvrqabB90p81FjAc+9JdFPwIQqehbtwwuCktnDqsFQ6liRiP+CqcDZxC/wDNJuBGMphrCKo311XF84GCeWZfUf/hhZHOaOZoG11fpJtqm6emJGZNF7s/o2lOCY2/zhsuyVAIhO0/Gs79PFAsm712luPGtoKWSkWg0zhDAqr2Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WUkRuAla; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WUkRuAla"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-157fe9d771bso500274c88.0
        for <imx@lists.linux.dev>; Mon, 19 Oct 2026 03:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792405236; x=1793010036; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5cb5xsu/Ek8DjIcHOFj6xTziW0Tc8RenZR8/LpBW7iE=;
        b=WUkRuAlamCw1gzlXX2hJ0xwAa28bGKqDN9wni0S/2knumK55myi0tsGi237CwQtzTb
         fpjlRO452tMitD1bU/3fQph2Vxg9/pmywKz1gAKXb5zzTivhCr+WrvL0FGXeyaCrnEJA
         1uPgknDATJFSWHtLxHpwTqAdMChtGh9FjrI2LCKnftsXJWkJY1m4Um6Dl1T3OIx7jY2K
         /d5Ch72Tb+aHit28vQKaT7t3A5AepDCbHhSC95UEDMhOxEl3alHg8dw4mboNIg3qVSWq
         FtZiy0VR6+u+jTPLmcNC7QM19d985HQO71RjEjC45eHeb/yxF4H0V2mKXkvv1aIC7hXU
         R1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405236; x=1793010036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5cb5xsu/Ek8DjIcHOFj6xTziW0Tc8RenZR8/LpBW7iE=;
        b=VDaq8UfQviJWWW1HsjTyLd7U1XYMQjTj/bE5I4QWMzl/UczLpC/owKSpDGTqpBxYvN
         zpGw8twW0fL3y4rf3tBbEP+cURKwnASm6PLJnB1u9bbS0l8Pj2g72mzzD3Kga8TH1Mh/
         HAToXH0m/s5wl8y3fFs8BqtUP3kvhEol8Jut+jEqT30xhXwwV1JBX5352kKMMzioUXIy
         qSKniTaauW8Y/Ws9MrhJsw/mbRRAa6whj8vjziNO8KvB4kWt8iFVA6JiDib4cbkprB+t
         8Wa+QIauF5EXyIeO1Jrf3C4pWOQc6Xb8C6imScMHKcCRZepR3rr1PD6TI31rvPO2kGHh
         5ZyQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6RCeuV8sgK5uril2KP8QIPPQtrtCvW4N/wM45O74o+5x+Znk1TWSLC+kFzmasPQRd0fE=@lists.linux.dev
X-Gm-Message-State: AFq9FYI7up20XKWqVdMs+77wpVnQdMrHkub+PlClu/zx6zOkOQZJ2Qhd
	PpDpASEcTHWx5zCxhuoJBAWgf93iLeDYvq7+aZI2OQhSEyWUrkw78fg1
X-Gm-Gg: AYBFou0zYvlSoYfogT52JyowhqZqcetRPSnsKkTzteElJOr0SDeAdILXtF2RWnNOY3d
	zUbB0FBK5oGogwul2tL/5Ojhdo3d1vYOUUDzmwDkNv4r58YNJsodnQptDkEbasCMfbLP2dq3qAl
	hTQ4eNncqzt2DwY1g2KGrt3nEiIWS3WfZ8glIM+um0wfkr4M08W1FrOiU5qcNs6w7VQ3yuU8pDV
	9eKS7Q91JOTbvYmoBrlx7KOatiNnO37BcOW1uUP3MnSlg8kmN2KImAYLe6BVh17eVy66ViOJZw4
	ZOzREjqOeAal1YLcRr98+DhyfdJV+FFQFuMYWdBB3CNyZIFcY87xeJE2aw5ffyUAOB8131XSJjN
	cgEdZrvBb7PvHk67vovGW/Fe2ijfGgkMA/DcMZkVkKiawkY6L5gmqas05mJF6yKAgdKJNA+94/t
	aaaygonkwFOfcEJ69otCDnk7f+1RBHdv8LgMccI/pE5DT/JBN2qPiZKKfYK5E2gKJqGQDNQ51t4
	Y4=
X-Received: by 2002:a05:701b:4348:b0:14c:96a4:b631 with SMTP id a92af1059eb24-1851453fc8dmr10504406c88.30.1792405235442;
        Mon, 19 Oct 2026 03:20:35 -0700 (PDT)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18319d3b880sm26324251c88.10.2026.10.19.03.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:20:35 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Mon, 19 Oct 2026 07:17:14 -0300
Subject: [PATCH v2 1/3] dt-bindings: display: bridge: simple: Add
 data-enable-active to dumb-vga-dac
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-v2-apalis-imx6-enable-vga-v2-1-ef6a3a780472@toradex.com>
References: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
In-Reply-To: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792405217; l=1828;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=PF05NXBIDireg6ZUuKSrsvk0d/GOH3dnTBdN38H+03I=;
 b=HD53baHT8u8/D5pbXuDGQl16Aht+8414McxB843sMyEC12qLowhQ0jc1HnfAvNB3zgF23VEb/
 NDRwdc+iyH3BM2jB6dL4/ITgsqWwfg90tizY7oL/Djh99ux42ruW1MI
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Some simple VGA DACs may include a data-enable input that must be driven
at a specific polarity. Add the data-enable-active property from
video-interfaces to the input endpoint to describe that polarity.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 .../bindings/display/bridge/simple-bridge.yaml     | 28 +++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
index 7636c24906ba..b1b23d41245d 100644
--- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
@@ -43,9 +43,18 @@ properties:
 
     properties:
       port@0:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
         description: The bridge input
 
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml
+            unevaluatedProperties: false
+
+            properties:
+              data-enable-active: true
+
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
         description: The bridge output
@@ -65,6 +74,23 @@ required:
   - compatible
   - ports
 
+allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: dumb-vga-dac
+    then:
+      properties:
+        ports:
+          properties:
+            port@0:
+              properties:
+                endpoint:
+                  properties:
+                    data-enable-active: false
+
 additionalProperties: false
 
 examples:

-- 
2.43.0

