Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22273B6C13
	for <imx@lists.linux.dev>; Fri, 16 Oct 2026 23:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792193296; cv=none; b=T00lG77BvBtI/2ZJrl4OPE0LFdfXJqAY844jOFF9AhAec9vL9yTctY0dSDL3x2XEwOkGxl3XPGApmkZzFep7xqxCHRQYgxNBqtZ88qFYWAg+eXqy5lCzUigOndGO5/o4SZV2PwQ8O/x+d/PdEzmS4pEhKGqFUrtHadLT7aMYJEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792193296; c=relaxed/simple;
	bh=CwWDDjpNnsPleVo1jcGzFZvinjzTeCjJVRg9u/FiAbc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Et47+aRkoQWlJIuZF3cVj9A+YEOBjKKB4Gu481Br6TPRknHM+i31Q+/x1/brtMRjD3guByAnsBuYLZg7sX8BOmRj3sU+ewlZp33mYrbnWDrjqK/epibm1lrAN4cpTHYCR3s0Gr3Feg9erYsL2QWXizS3DdYwFuvC8JKZuoaWd38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qUT7ltW5; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qUT7ltW5"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-74ab6c88052so114694137.2
        for <imx@lists.linux.dev>; Fri, 16 Oct 2026 16:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792193294; x=1792798094; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L+nHfvIYCrgROUwGVGZYqdh67rBw+LFFXBTqFw6Ps2c=;
        b=qUT7ltW5oyo7/kmKPS34c2xrsingbi/xmugqjGPKjHzeBTkVl8Bmyrt5oDgt234Ds/
         u1iac6Vzk49NsLjmSfWs6q+SqyPcWraR3KhOmQfKM291kBhthZUxSLerru50U63kXY34
         wU86t0WStXl4iOF8YhDRaeapMsh4Wlua6vyKsaGaEMSrCas9xdtJ4C2gqNXvnzAgC8eX
         6Bm51BReitRAVIBUZlhqtrk1IgZJpn4PGB4HENfP/oCh5cmRcmuiUt3HIfh1nHPUBM3D
         +or8O72mzH7p9lD1YZ7Kn0CcN0EC7UGfaGos+zkXL0kDkauudZF4h8rklKewDnzVga+2
         /Pww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792193294; x=1792798094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L+nHfvIYCrgROUwGVGZYqdh67rBw+LFFXBTqFw6Ps2c=;
        b=cDgP8YqgpX7LEj/Kfi49pr//e/SYyET3mQ6zhxGH2zLaM8xyT8iJBtvdGtCWJ7t+9+
         AeE5xxGRDQe3DeHE8lL9+zgIKkJNzHU1apbCKZnlxoUZx4duQmXwSmrKqY3zFdQW0DhU
         JPNEIwBOhEjxJKJ7qwAgvs7e2qL/Pl6Nw6Bj7pYsoPr2nDyoiF1NwEhuoy4FWPsx/P+u
         H8j/6qTd7w9xe01sk3ZwCfZ1ajO3Cdf910NjHpQxMdJkkmZXuT4j9S10ia5P9svK5q04
         ankqPTm9Mf3pcVrAxymra/Y2M9oWus1wsT66IZGeAabTKjmsLR1IOD1W5zZTbOyZ7uov
         iqdQ==
X-Forwarded-Encrypted: i=1; AKwUvBygmaAU98jCC0+xOVIeaCiOCFZfnQ8btEHVRcQy+yMJyXNt4P2blUgNPEvqnwJtTo8VQkw=@lists.linux.dev
X-Gm-Message-State: AFq9FYISQgLmo1LbU52o7N6//uyK88RMMRrOs8TI4TwTd2Roq0U8wY2/
	hsjcAJpEa0pMyUFD/kxfoFnPfNGrSl1ZB+KqxP0ykhGOhV2g/67XJAw5
X-Gm-Gg: AYBFou2PwcvoiLxoInhD/8u1XVDEmWUZLYrbBBU4YPUGuOIZfQdxdy3mAg5rXMUf4to
	IFMB0IfYdwDVOKVgDn+MLtqzWmQqw8eU6eEOGMuSioQl23Us7Ht32sSKHx+X8k5LE/ekSCkNJQI
	C+9JmryKGepbupsd5W3hZx6vjNdNwSqaJNZLYMxPedRBx/snzn4vsrYOuDg1oveUPby+2gtXOnR
	XAE3pqZhF0BHrl/sF69B4ljRcO0bQEcdBthTuG0oHtKa1Vq14NYB5lF3gbRJV7qN11tLNLTt8rj
	AIAa5izRodfpl5L5yaeyJXui0qMhRXB7Jsn7o1Sri0OafZTFhIpGkgfaIzkIFvrOZjWzAWL73TO
	wQy8BKpYL6EhJRXHMuIGlqQpTVquujzu7F4rKc71QQQZLFq6venVzIoGpFtrK+QFW5K7sb1j/M3
	2FHZs2qmEQsblUCtMNYfySdAq1GTr36H/L5SRgZjMbJ/88gTkzZdlAWI6Axoc7lLzjjueWuDETX
	JtqLRRl6SwN9MZgtgusH3FRzDzrVTQt3H1aNtsA6Y9/CGw=
X-Received: by 2002:a05:6102:4247:b0:785:c39b:6a1 with SMTP id ada2fe7eead31-7cc3691f50bmr274471137.6.1792193293549;
        Fri, 16 Oct 2026 16:28:13 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:42fc:16d8:d66b:d6c1:caeb])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b4f58bbsm2804299e0c.10.2026.10.16.16.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 16:28:12 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: Frank.Li@nxp.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: nvmem: imx-iim: Allow syscon fallback on i.MX5
Date: Fri, 16 Oct 2026 20:27:59 -0300
Message-ID: <20261016232800.536654-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The i.MX51 and i.MX53 SoC device code reads the unique ID through
syscon_regmap_lookup_by_compatible(). Their IIM nodes therefore need the
syscon fallback so the syscon core can instantiate a regmap.

Allow the two-item compatible sequence for these SoCs. This prepares for
restoring the fallback removed while making the IIM nodes conform to the
binding.

Cc: stable@vger.kernel.org
Fixes: d5b55c35e033 ("ARM: dts: imx: Fix the iim compatible string")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../devicetree/bindings/nvmem/imx-iim.yaml    | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvmem/imx-iim.yaml b/Documentation/devicetree/bindings/nvmem/imx-iim.yaml
index bb37d72c9eaa..ebfd947e6800 100644
--- a/Documentation/devicetree/bindings/nvmem/imx-iim.yaml
+++ b/Documentation/devicetree/bindings/nvmem/imx-iim.yaml
@@ -20,13 +20,17 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - fsl,imx25-iim
-      - fsl,imx27-iim
-      - fsl,imx31-iim
-      - fsl,imx35-iim
-      - fsl,imx51-iim
-      - fsl,imx53-iim
+    oneOf:
+      - enum:
+          - fsl,imx25-iim
+          - fsl,imx27-iim
+          - fsl,imx31-iim
+          - fsl,imx35-iim
+      - items:
+          - enum:
+              - fsl,imx51-iim
+              - fsl,imx53-iim
+          - const: syscon
 
   reg:
     maxItems: 1
@@ -50,7 +54,7 @@ examples:
     #include <dt-bindings/clock/imx5-clock.h>
 
     iim: efuse@63f98000 {
-        compatible = "fsl,imx53-iim";
+        compatible = "fsl,imx53-iim", "syscon";
         reg = <0x63f98000 0x4000>;
         interrupts = <69>;
         clocks = <&clks IMX5_CLK_IIM_GATE>;
-- 
2.43.0

