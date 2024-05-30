Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1BD4D9E7
	for <imx@lists.linux.dev>; Thu, 30 May 2024 07:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717053718; cv=none; b=F52QdeAVDXmK4JUI6tiBs73veSUqd+4ofOGO+GvMZEqxzNy1E//XvpuMNrdi1+Ze7+MbCigyj3voXUpcTPX/dz5Mih549nEYtu8x9/28S5XpoRNIfouJGte4pL36t0k+dplcIeDEAU7YX7/sqj89GOB1XzigH+RHO9WxZ/ax73k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717053718; c=relaxed/simple;
	bh=jJhmiG8KehPBL2jJ7s4/R8p14YnNFAx4zWKUCdgG0Hk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qK2NCoeHxV0PXrFIqkR3Roofj96dZ3aXFABA6KQbzkeFjO0wSJMZLmJ0+CPGJVr9i5uDLiPwucX/AP27UOb/G9w1iOp7R31Mv01klWIY55LHKKDloL/LIW2PvxPImn03uioW/lwSfsHhtVWJpu88/+iKjJQwWOFqkgdoShgfjuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YzLcD235; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YzLcD235"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6f8e9870e72so491376b3a.1
        for <imx@lists.linux.dev>; Thu, 30 May 2024 00:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717053717; x=1717658517; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wwEQ2aSFxNGCmqcaa7Y6YTRAbWdn03vUjAsreQHummw=;
        b=YzLcD2353wkqJ7IiCz5jjYmcLUDNB1lvLagyBZa9/lU5vmRT50bdPQjDCwJm8UkDPs
         12p9Ea/P2GVUhEpDvLrvaaVfh5KxMvnN0vBg8pjwQ5lFav+ZfU2ZOYYFfjQMqz40CAL4
         dzOQPx4FM7s2KS0lPW4LZY49oDgmgYyOaN691ICRnyOMixA/OvxVEWwuFA9Q+EYgFGWY
         jHPS1C+BeM9qLpXp8k0H7rYIdSL63Hl5E9FyDbp+5ztFtyPGZn4UtV8Rnls6uUB2NddM
         WXlzostlyB1giN/V4uCnhkdwfWpkftlSZsToqE551xzSmE4lWeFt2cQIQ1wtOPhPr4R9
         hMzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717053717; x=1717658517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wwEQ2aSFxNGCmqcaa7Y6YTRAbWdn03vUjAsreQHummw=;
        b=QEWgwqDmLgEKtNw5lWCdK8aXUSc5wdXEJGAi0tWI/Gfm5LVKREbrML/jni50/Op1kO
         asFmmWtpcWTZwCt7V1eXBbWe1H8t1cB60gagBn1MGir9WgQO8QPrdw5Eg1V3cbkzVesK
         /++aJ8hnUuRBWDFmT55mUrgADdghEcgElJovqB3HAqjNUI8aVNr3QuXcY23s0edcyUjR
         lu/9vCoI/cB6hLV8AjQmt4BfczNxVaSrMNDcSUG1sNbLl0DUY+lC+fYduAFxpUA22HOq
         2BpXp0SR2+8t+iNa8LhR6fGvlgLrjKCroZN+bFBMFFKOkCP0uOwr95MIIh5w6Za2pbjQ
         yBEw==
X-Forwarded-Encrypted: i=1; AJvYcCXW+UmfT9tCigvIc46Y8/YqKUh6YQo24QI12QQsATp8Tf+vYCvaBqDpKb+y9xtopWCXLt6Yas6xAHJ5VYdWI8T1+/p3
X-Gm-Message-State: AOJu0Yz5aUJpkFwLECkHwHRt7CCnZMPt335+c4uTRAWLze11/QX8rQ8t
	spvaWhxlHr05bFd0Hhh2qu0i9onxFieLv+McEw/JxE+eoWARtzb9k23PksEUNmmnPQ==
X-Google-Smtp-Source: AGHT+IHm8CThq7x4u28tGzaiRwu0dXSkjGYx78ZeeID2h/0ElC/teNL2bCFK3G+FY+BOPAg92MAnPQ==
X-Received: by 2002:a05:6a00:2909:b0:6f6:9601:b0b9 with SMTP id d2e1a72fcca58-70231116613mr1179612b3a.11.1717053716346;
        Thu, 30 May 2024 00:21:56 -0700 (PDT)
Received: from fedora.pi.hole ([2405:201:6013:c0b2:b3f7:7c95:a370:4345])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702390b6fa3sm88609b3a.119.2024.05.30.00.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 00:21:55 -0700 (PDT)
From: Animesh Agarwal <animeshagarwal28@gmail.com>
To: 
Cc: animeshagarwal28@gmail.com,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: dma: fsl,imx-dma: Convert to dtschema
Date: Thu, 30 May 2024 12:51:07 +0530
Message-ID: <20240530072113.30410-1-animeshagarwal28@gmail.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the fsl i.MX DMA controller bindings to DT schema

Signed-off-by: Animesh Agarwal <animeshagarwal28@gmail.com>
---
 .../devicetree/bindings/dma/fsl,imx-dma.yaml  | 58 +++++++++++++++++++
 .../devicetree/bindings/dma/fsl-imx-dma.txt   | 50 ----------------
 2 files changed, 58 insertions(+), 50 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/fsl,imx-dma.yaml
 delete mode 100644 Documentation/devicetree/bindings/dma/fsl-imx-dma.txt

diff --git a/Documentation/devicetree/bindings/dma/fsl,imx-dma.yaml b/Documentation/devicetree/bindings/dma/fsl,imx-dma.yaml
new file mode 100644
index 000000000000..f36ab5425bdb
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/fsl,imx-dma.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/fsl,imx-dma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale Direct Memory Access (DMA) Controller for i.MX
+
+maintainers:
+  - Animesh Agarwal <animeshagarwal28@gmail.com>
+
+allOf:
+  - $ref: dma-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx1-dma
+      - fsl,imx21-dma
+      - fsl,imx27-dma
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: |
+      First item should be DMA interrupt, second one is optional and
+      should contain DMA Error interrupt.
+    minItems: 1
+    maxItems: 2
+
+  "#dma-cells":
+    const: 1
+
+  dma-channels:
+    const: 16
+
+  dma-requests:
+    description: |
+      Number of DMA requests supported.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#dma-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    dma: dma-controller@10001000 {
+      compatible = "fsl,imx27-dma";
+      reg = <0x10001000 0x1000>;
+      interrupts = <32 33>;
+      #dma-cells = <1>;
+      dma-channels = <16>;
+    };
diff --git a/Documentation/devicetree/bindings/dma/fsl-imx-dma.txt b/Documentation/devicetree/bindings/dma/fsl-imx-dma.txt
deleted file mode 100644
index 1c9929d53727..000000000000
--- a/Documentation/devicetree/bindings/dma/fsl-imx-dma.txt
+++ /dev/null
@@ -1,50 +0,0 @@
-* Freescale Direct Memory Access (DMA) Controller for i.MX
-
-This document will only describe differences to the generic DMA Controller and
-DMA request bindings as described in dma/dma.txt .
-
-* DMA controller
-
-Required properties:
-- compatible : Should be "fsl,<chip>-dma". chip can be imx1, imx21 or imx27
-- reg : Should contain DMA registers location and length
-- interrupts : First item should be DMA interrupt, second one is optional and
-    should contain DMA Error interrupt
-- #dma-cells : Has to be 1. imx-dma does not support anything else.
-
-Optional properties:
-- dma-channels : Number of DMA channels supported. Should be 16.
-- #dma-channels : deprecated
-- dma-requests : Number of DMA requests supported.
-- #dma-requests : deprecated
-
-Example:
-
-	dma: dma@10001000 {
-		compatible = "fsl,imx27-dma";
-		reg = <0x10001000 0x1000>;
-		interrupts = <32 33>;
-		#dma-cells = <1>;
-		dma-channels = <16>;
-	};
-
-
-* DMA client
-
-Clients have to specify the DMA requests with phandles in a list.
-
-Required properties:
-- dmas: List of one or more DMA request specifiers. One DMA request specifier
-    consists of a phandle to the DMA controller followed by the integer
-    specifying the request line.
-- dma-names: List of string identifiers for the DMA requests. For the correct
-    names, have a look at the specific client driver.
-
-Example:
-
-	sdhci1: sdhci@10013000 {
-		...
-		dmas = <&dma 7>;
-		dma-names = "rx-tx";
-		...
-	};
-- 
2.45.1

