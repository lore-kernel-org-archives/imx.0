Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4D1271A7C
	for <imx@lists.linux.dev>; Mon,  4 Aug 2025 15:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754322920; cv=none; b=HuF9cpDlc6z0e0NyztIb8MRPWBBVx/E1ciKZ1nY79NpLtM8DBhsdN/e098R+9NveOeMFTk5ujdMarM/8LwAxogfQo6N/cmPdKhU6BICqOh4sGOf2/ivyUlDLexSzJj3M+OutVxGHwOseIZS/xeTMy/TFcesUxxXC/aAyuPhBmp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754322920; c=relaxed/simple;
	bh=UY6jthgCNIsr9tlTLUKjXHRvM6vQnmImDhByNLafsHQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aZWqUxWK8fCOoGKqGGAwd8N8Rtpu9wu0okouIorQf4SGLFK9Wpd0z1SW2KEgL/X9ovjkPWR1QIA9NjMM9sxigeFa3uiMLIVbfwZ4nig/TJv6Ny+BJhDmvCGqh7/HgaK68hckpPvUIf7vGTXeE7vH8a2BSEinz4wLTQPwVVmi/oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GtgoRheq; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GtgoRheq"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ae6f8d3bcd4so941073566b.1
        for <imx@lists.linux.dev>; Mon, 04 Aug 2025 08:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754322917; x=1754927717; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txCGfkTtBsBSyGuNpD8Xj+5OLa4IbnLzvuc16UnT9Y8=;
        b=GtgoRheqnMjwbdEuUMTQaLael/Yy3iXCh9qNY8qpJXl1W+Ns7emVbcATt7F1U9gzql
         OrPxEObuehJx19D/96m80emlLArZN2MGwhpS/tTqTpGjXoYz0PMwbWJVY/lUn22gedws
         dx1YDLTMW9sj/piiHhc+ADU09cYINfncJu5887sa7bZ35y7Dz96NzsVkyVD13zncEWNB
         disy6pWUGaqB4LOVyLBieRfFliCKajIQA3xrrvioQgrbsVHQdU+Prl/mJd+kR2DnLyhb
         W5EHsCutyhRQ02EO+eOuAM95Qf6ouFBdjx+oTVihcCevzkH3oXIArThrYRQecyULFfhB
         JvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754322917; x=1754927717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=txCGfkTtBsBSyGuNpD8Xj+5OLa4IbnLzvuc16UnT9Y8=;
        b=P3GGMA5fLbuZDZ7twvYJcWIPAHm5ctwNsXNm2pUXb3RPB28Uj+M5C4f8Laci3d6MDf
         eYwiS6MR2XwOqoEduI/gFTUG5v36Arn0qtPKEOUFenaiyy5Cr8HHh/ww4JAWmG9KCsPB
         dZjaRl0D/bQM+mdGYfXhNHJ4tDFvT3wHLuQYrFyLSqZoPzl6EcXIJE3IwMWhlcr0zPZo
         P+xWWrRlwVpaXFM7YqsTfKZBX+LnOe9ztwuFVFo1s+8B4nyaUA1fMX+wKQ7xlri7EqAB
         dPeqq1899PdV8JvbkPxpC99HqL8VMT8NHGjgoh0rUgqxLK0T5es+8rKYReEnpHvueGe+
         rDiw==
X-Forwarded-Encrypted: i=1; AJvYcCWx6gISKBxltgdH8M4dvSdsuDqToy08/3D9gDPJs18QPKFVu42Yk4euWMOopVS8MODn7rM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy20KZCKT7RilUjP/HMQLV0DWIQTgSCMOlqajmGcgiUnnBaArTH
	/GspDgiq7K5JPp6am0KbNsM6LitHH5rqlB/tyYcwGGeoHGQivxhXYMDS
X-Gm-Gg: ASbGncuQmV/9rD1DmPV371FME3GGj5BSW+11b1I1dLpN0SySRB0WqDF5aH1YpTb12Ci
	Bu5oHFTAs1wM91thM+jwQB8ntb9s5vOJjOEfdyAiUaHvp+kPSJjAbIMBicGaEBeVlDDCgevqIf4
	S5l4zwrqXQdLIMAXPloZHQ6uBFtX8Dsfec2KMmaLxqzDTF1SqZxRwnp0r7IfmKUN/ayQcN2Ukjn
	50xLNMEHQOx32lrd3ZgLkrVDZ36BA2Ub2UzRy3eToVh2ta3yq8WQiAmjddKN8GWuK0vwyX5JLoh
	KnmdON/FGdrrdA/wj2DLYfNZfgVnNyX2fRQd7TJUPORoKP06wsfJpyGzRX3flj0GtNfrrSekqh7
	vif+GPyxTMGhp+DeBamXLw9bHLRU4BzICgAIS3eR/eRG0SLAC1d2c5v7CwP8=
X-Google-Smtp-Source: AGHT+IFE9fsToHPB1HzXL7CA2N5HVySncDZwT+zwwfREXgYG8O5U9/e+DlJl3UaSJhFPEZ4jMCwWYA==
X-Received: by 2002:a17:907:9721:b0:af9:3d0a:f392 with SMTP id a640c23a62f3a-af9400202f7mr1152845866b.15.1754322916887;
        Mon, 04 Aug 2025 08:55:16 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a075a74sm761114266b.17.2025.08.04.08.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 08:55:16 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 3/7] dt-bindings: clock: document 8ULP's SIM LPAV
Date: Mon,  4 Aug 2025 11:54:03 -0400
Message-Id: <20250804155407.285353-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250804155407.285353-1-laurentiumihalcea111@gmail.com>
References: <20250804155407.285353-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add documentation for i.MX8ULP's SIM LPAV module.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../bindings/clock/fsl,imx8ulp-sim-lpav.yaml  | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml

diff --git a/Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml b/Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml
new file mode 100644
index 000000000000..ef44f50921f8
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/fsl,imx8ulp-sim-lpav.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX8ULP LPAV System Integration Module (SIM)
+
+maintainers:
+  - Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
+
+description:
+  The i.MX8ULP LPAV subsystem contains a block control module known as
+  SIM LPAV, which offers functionalities such as clock gating or reset
+  line assertion/de-assertion.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - fsl,imx8ulp-sim-lpav
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: lpav_bus
+      - const: hifi_core
+      - const: hifi_plat
+
+  '#clock-cells':
+    const: 1
+    description: clock ID
+
+  '#reset-cells':
+    const: 1
+    description: reset ID
+
+  mux-controller:
+    $ref: /schemas/mux/reg-mux.yaml#
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8ulp-clock.h>
+
+    clock-controller@2da50000 {
+        compatible = "fsl,imx8ulp-sim-lpav", "syscon";
+        reg = <0x2da50000 0x10000>;
+        clocks = <&cgc2 IMX8ULP_CLK_LPAV_BUS_DIV>,
+                 <&cgc2 IMX8ULP_CLK_HIFI_DIVCORE>,
+                 <&cgc2 IMX8ULP_CLK_HIFI_DIVPLAT>;
+        clock-names = "lpav_bus", "hifi_core", "hifi_plat";
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
-- 
2.34.1

