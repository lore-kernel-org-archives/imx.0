Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24962158A06
	for <imx@lists.linux.dev>; Fri, 31 May 2024 09:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717146317; cv=none; b=SV5bSFaJfz0KqHXGxQCFvolno6GxoiJNOCaWplT7uZOH+ORyd/ehAya/PdILlwJLc/VGCkrYFrjZoNJu6hQO4+tx5yFtF2OrJNq9gO571jDpQDcws0/PfedteOB0nULWT8+vlyQoeO1avpw6iUB0gq/G6l0+72LXwvGcF1O50Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717146317; c=relaxed/simple;
	bh=l9od8fUQjOt1e50pDgBVKHh7h1Sq3qEMWS9k7Ol8kHs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rm8kmxqL6n3Rr4ggCV0T/bdlsqBDQKRlHDPe5Grw1qTa15uWMmoKhWcK9BhrgPCcDFSgzyxN+WHAflbUMZlP1XIxLp1e59Sgdu67F+BLfD4aJaEFWKaC4Y67BIx48JC4PAPvmHmFUpQdmzG8Zpt5r9H7ZHuHJ2yE2gedvsVvTwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DcELrzjW; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DcELrzjW"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1f480624d0fso14267155ad.1
        for <imx@lists.linux.dev>; Fri, 31 May 2024 02:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717146315; x=1717751115; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cIqlWuPqBxRMmc3AFgZJ/wVDP6Hh20wzHjGm/ayLPpw=;
        b=DcELrzjWxQFYnhpANbs3IBt52DQb5q0h9oW+TEyWXHHKnlm1B97R7kI6Z/BUekaXN5
         Zk5Chv6TVfigZN0j+JxesKqX0nX+25rsMj4B4MTkxvzpOzfj98alTQNiSqdTiHZ4iSMo
         77Db7u2hQfWdSQcA0oXUBkgu6HCeTqCC51aRenV7kjXQv7IzfdTab7BvWNcKjYI1J9Pl
         hYNRiaNen3JfOAjvXdLd0WhmvMDX/s9Ll+qKaAi1iF2Bh3vWlm3YTZhSZm6E3/R7iTsY
         Ek2+z38Gpsk/kp4LN6hSUwOH6g9ziETU05FmtiUUN2fSadJO+iXmqrTHHAVydF8EXzlX
         HuOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717146315; x=1717751115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cIqlWuPqBxRMmc3AFgZJ/wVDP6Hh20wzHjGm/ayLPpw=;
        b=rzMTm6zR5UY1ftO+t5J1dZntHRSW1XW/JBU2k56MSIHHlvxr6fPYFnVDa09ueQE4vI
         4JvBGbisR8N1nOv6O0NFiGQVKgGIIp2nCI2g7QiDT60PPWCeKW6uCbHYc/ywxanHykiL
         FKqwiDEjmH5DKRCBDh8XVACwqZpHmaV7sfDz5WpJRHh/KKFqvUASe1szWINriirgqmqJ
         yxSH0MCULBDd4iiUHhuGD7bt/8wLHM9t4m09b88jUrZf0jFACxqUfGbyPoQSWW480xpr
         2pjaMe4Iq/NeIFG5Q3SQNiLmMvJbcW3U/mAfs8MJRXn97X4lkye7XIvzdh/4c1xuUWAc
         t6gQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/COjIxR2p7QIK1+DEI9aecLbkxVOTRd+XgE/NtsAdajHy/yR8WbxsvZ8E/aN6LHVL1BFqoEof2c6AOOhktL8m3uNQ
X-Gm-Message-State: AOJu0YxDf7SY0I+cKEoaetD+VFDeARazp6QyYa5Q/b84uS+QfPpq3MwX
	EINvKVsZYWB4jKheeV4dbrPU+6uNsnuBXsctJMFG8+crPdKCURhU
X-Google-Smtp-Source: AGHT+IEcCbIUb7FLaS1kv0Gl0B/d0JLuJYOBmQuhl+Pn9+ipuPL8cfMSAbBqrvyB9DDLlJppJJN4Lg==
X-Received: by 2002:a17:902:e88f:b0:1f2:fe12:b79e with SMTP id d9443c01a7336-1f637012f93mr15319515ad.17.1717146315068;
        Fri, 31 May 2024 02:05:15 -0700 (PDT)
Received: from fedora.pi.hole ([2405:201:6013:c0b2:b3f7:7c95:a370:4345])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323ec184sm11572445ad.209.2024.05.31.02.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 02:05:14 -0700 (PDT)
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
Subject: [PATCH v2] dt-bindings: dma: fsl,imx-dma: Convert to dtschema
Date: Fri, 31 May 2024 14:34:51 +0530
Message-ID: <20240531090458.99744-1-animeshagarwal28@gmail.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the fsl i.MX DMA controller bindings to DT schema.

Signed-off-by: Animesh Agarwal <animeshagarwal28@gmail.com>
---
 .../devicetree/bindings/dma/fsl,imx-dma.yaml  | 56 +++++++++++++++++++
 .../devicetree/bindings/dma/fsl-imx-dma.txt   | 50 -----------------
 2 files changed, 56 insertions(+), 50 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/fsl,imx-dma.yaml
 delete mode 100644 Documentation/devicetree/bindings/dma/fsl-imx-dma.txt

diff --git a/Documentation/devicetree/bindings/dma/fsl,imx-dma.yaml b/Documentation/devicetree/bindings/dma/fsl,imx-dma.yaml
new file mode 100644
index 000000000000..13ac6d6ad49f
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/fsl,imx-dma.yaml
@@ -0,0 +1,56 @@
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
+    items:
+      - description: DMA complete interrupt
+      - description: DMA Error interrupt
+    minItems: 1
+
+  "#dma-cells":
+    const: 1
+
+  dma-channels:
+    maximum: 16
+
+  dma-requests:
+    description: Number of DMA requests supported.
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
+    dma-controller@10001000 {
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

