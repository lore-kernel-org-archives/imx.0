Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52859194C8B
	for <imx@lists.linux.dev>; Thu, 18 Apr 2024 20:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713472703; cv=none; b=qp+3sEnuAA5NN3nJirusCpJ4tNmuLwmPPdDein0ZVOFFqfbI4EPG9En4w1oRVbH8jFWoDvNDZnLf1FlcdQOsgof4eXatS8aL5vW/OhFQOTUxlVk1aOnEf66lnRMbCYIfi2pQgpk044XrodjDw2UlAWCWw8lPvWM3r1A77+Sh+Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713472703; c=relaxed/simple;
	bh=l3v8uiGH9iMneTQKAJQigSsmEW/6PSJtsODaXuUHOxI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fxffxmGp1AIGiVwijRLUcSjPUGFQ5EfAnZk6WnCWroq9Nz0+amwPtMZBRDmi9/7rFqVrIdOdgjETR0sS987BYeGle2A2wbMsLE96YwkE7hfCax4INQLPpB9lkaMjkXMUmsZRcrC/VqgQ60bPQRhdnyi0jDYiW8UDQE9EAXlcCwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FylRC1IT; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FylRC1IT"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a526a200879so161769466b.1
        for <imx@lists.linux.dev>; Thu, 18 Apr 2024 13:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713472701; x=1714077501; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VpwB/CJEZck9aj444xbdNc4njqRLnc/SoD7JSsSXE4k=;
        b=FylRC1ITSnbw/IwgBFXKZwaCuZ0dF3XSEWmfYCFEGCu2nczEJP1OixuQi+OpeKQd4v
         3gejdPUxtjio0JJHRNwgOXfD0Xv9pn/0tegYHgrLPPTTayYG77CTa13C79JkCBrBR8Yy
         Wksqidi2CwHJJ6yqHAbm8+bYBRpbcnSUuTNObA/7VHuwzwADfoeaxfj57cn8Y6FwCyiT
         yRfTV7lg42BkjeytwtYGEKLP8VF4dVUHR9Pw9Z7ILvjMHs51aF/7mtf01nrCLTkmjfqV
         uyhH4fFZvhp51sdoH5kF+xWRayD6JDuid3OQL9XXpjh2Lw4XnCeL7pN4oEqbXXKKluOg
         vbsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713472701; x=1714077501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VpwB/CJEZck9aj444xbdNc4njqRLnc/SoD7JSsSXE4k=;
        b=EXg4Tg6tgIk7SSVKANm+tqrto4lWqL3Apw2H/zJ20/yQp6Lh5nDmiRwMPcMBZ6PtyU
         5BHF8so6nS33dzRvqlY5twg1P+IuzUC7NsSfa3aaQ3OJb/yuR4ViPin+p6AViH+alAJD
         MYJFQAAvmt8vuG9CJGBDRer87u4/boET8oZupmy+RlM+7kF2vVf5P/gO16B3DEMeiKiF
         QZlogG4zlETGqlVSAqwHy7H7V1rIVfZvT6EAN3YyL8R7mZ8iAWVMeMieD0N4HqStIa0c
         DTy9ApFhiMgMyns+FilzdwdTMQMbUitsPBpk0BSHmxzch2+MlZlN91SRLTOEXW0Jn8XS
         1inw==
X-Forwarded-Encrypted: i=1; AJvYcCUbIzp5kXELniYNso0r4HeOq2LEz+JK3KYC5PgOTBBwml0MVzOX5cTy2znrgVE5ZQFvv2339KWw0ZoXhvOCvGPJb7eB
X-Gm-Message-State: AOJu0Yz7Sp1cZz6a4jk4mlKRz7214C9Xx7TZhNl/aS2DPEE334UAaID1
	Mz7COrqtyCajjvAJWGAr/WsFTv9CLplOcpstl63cj2Bm+3TdBwMK
X-Google-Smtp-Source: AGHT+IHy3ebiIyjZ2dOdwO1gTQ1CoH9YGtMxf7V/6zF0j96aRPInH4QXAR7n/SqRIS6C1ntyLMb/og==
X-Received: by 2002:a17:906:dc4a:b0:a55:635d:ddfb with SMTP id yz10-20020a170906dc4a00b00a55635dddfbmr145305ejb.3.1713472700682;
        Thu, 18 Apr 2024 13:38:20 -0700 (PDT)
Received: from lmc-playground.localdomain ([188.25.209.252])
        by smtp.gmail.com with ESMTPSA id l21-20020a170906079500b00a473774b027sm1305649ejc.207.2024.04.18.13.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 13:38:20 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Liu Ying <victor.liu@nxp.com>
Cc: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] dt-bindings: mfd: add schema for 8ulp AVD-SIM
Date: Thu, 18 Apr 2024 23:37:19 +0300
Message-Id: <20240418203720.8492-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240418203720.8492-1-laurentiumihalcea111@gmail.com>
References: <20240418203720.8492-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add schema for i.MX8ULP's AVD-SIM module.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../bindings/mfd/fsl,imx8ulp-avd-sim.yaml     | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/fsl,imx8ulp-avd-sim.yaml

diff --git a/Documentation/devicetree/bindings/mfd/fsl,imx8ulp-avd-sim.yaml b/Documentation/devicetree/bindings/mfd/fsl,imx8ulp-avd-sim.yaml
new file mode 100644
index 000000000000..4020c6e37f80
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/fsl,imx8ulp-avd-sim.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/fsl,imx8ulp-avd-sim.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX8ULP Audio-Video Domain System Integration Module
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  The AVD-SIM module provides configuration options for components of AVD.
+
+properties:
+  compatible:
+    items:
+      - const: fsl,imx8ulp-avd-sim
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8ulp-clock.h>
+    avd_sim: syscon@2da50000 {
+        compatible = "fsl,imx8ulp-avd-sim", "syscon", "simple-mfd";
+        reg = <0x2da50000 0x38>;
+        clocks = <&pcc5 IMX8ULP_CLK_AVD_SIM>;
+    };
-- 
2.34.1

