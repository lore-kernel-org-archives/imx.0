Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79C2263C8A
	for <imx@lists.linux.dev>; Mon, 24 Mar 2025 16:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742833814; cv=none; b=dJKDT6CLGHlXopiKmf9qBnTyfZg93jHgZh3PZIFim3DtgQ0toLyJ0IAGZEmTHmYuq2JGELLPWH9ZviDTz8AnH/dkh052l2F8/vqOy3AKYO0P+RwKP486wJV+F2g+rwnmMkZqpw3eb0+l/2jXFZ6Z9Hg0QELr0oQ6Lzw3PWgKNOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742833814; c=relaxed/simple;
	bh=nLJKxHm70qEycVny3nLFOeSNXCPfDqcDcghcDIodiCo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=acR5pZDBn2ImVXaMbvBMtaRgNiyllcNvDI4gTu5r/jMuR73/x2E1sdLGhRZKfwzJSoefunHEzCLp/ACnkW9aMFRqoKofEllQbjswq+Qx4ddUPv+79udzwuNCWXofoeKtUF5LVZA4lKv36x560CHrNzMSZEYLBEu0cRbsJN1HFR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RHqvoVBD; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RHqvoVBD"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so45058125e9.2
        for <imx@lists.linux.dev>; Mon, 24 Mar 2025 09:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742833811; x=1743438611; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MydIHs3qFCXYHM7b0s9l0s9CjimN0OE0vCb1xP0k2Sk=;
        b=RHqvoVBD2h6x1OetuFAVNZzDzEaVlr6u4RrSMvrIilu7MVQIaFTC2TAE9hsvBQOsGd
         HVI5n3krgQA2C0u5ybRg76GBcjfZKGPr4XUCdDPFm6EXQts+//8m9pA1LgGSwOnnSJnW
         8t0+XrZx0SM2fx+rz0zjHaOnG1hbHrqmQTbiBpfVOTJvvDQb+kJkJnNts4B6LISviEWW
         qcqlPuUbWe8Bl3ZwvT+mhtfOyVr7EN6W7lmmtjeWWJnGmRdvCUwChsuQsMTJPtiyG69R
         Slv0Rq0kbvbVJIVO36O4HGw4BFJ16f8qBOj41d2pd5HS5m2bLLcr0QWw/WaUAsUP9zWo
         MwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742833811; x=1743438611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MydIHs3qFCXYHM7b0s9l0s9CjimN0OE0vCb1xP0k2Sk=;
        b=JsXzV4KhZZyIwDsioCV+UMU1zd+lxvUgiTMuXWFsosjasJLWkHd5v9YSzXmsWab6oo
         cwe95n9kHNf+uzykCCMl0W5R2Hdqji4+zRrirhZiSC05IQOwdOBd2tmAKGobGcRFqGJ0
         HN/BTowjALG2BzEQaLFZf8zYROxKyCP5m7EWEWWuPtJ4NPjJVvC5TlUFE1jvsRIE8JTE
         f0b7GLrqoIN5rZ13xhdjpQbGom3jXnxNKEBF1Up5DaahMPUxBXzPaUHJ+8hweZKhJvuP
         j4gg7oqnCuAIpmvSH8tpbj3GnypqTNMpj4n4LzlsE1Sw2JOauvBY41GQa7RsWv7XuMd1
         Eyyw==
X-Forwarded-Encrypted: i=1; AJvYcCXtReiXK9dm0JqTfrur/H6IO6rG2YpIsVFOU6kmkqiye4+Tv4O383b5dUchDyzmSROr22s=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7d29rI9I/pBIDoWKATTzrfSeKjo2ySjm2Li5YDQcZ+FaQw+pT
	c0HKoHVjwDtCOTcniR/3kNbosqwmdYyrgLHepnKFDyc8gyGDHBKm3Qwn/swV
X-Gm-Gg: ASbGncsVUDs0vKUxlr5B6tgZVHwXdN9SueqDhlaGTRTncNDppw3625Zm98+k9emAhiz
	1s9E6gO4ooa407y+GGziJ+9qpmn8gDdaBnCUFIILlFGogPmB9S7BdcUpUCopVvJeEGaOp71euId
	bNFN3vlKGxnby1O3vZdbki97O7K/vW4G8WdNyWmU4Qbj94SJer48Bh8qwqRvp8Dtuogh5QWdSAw
	Mv/2EJy2TYqSUp2kV2pTHQUsSsDrwe2EOfxReX6meLJDpmbfg+yvw2oPi9u64uKQBz+5aslSWrV
	gE5wSaU1Zxxyt20A0WCxBgWCO+qEfTOmIv0t06zpMGaz9G66eQJjUFpt0ShwmGP7nB8rxn8H+64
	1Sn+dttQ=
X-Google-Smtp-Source: AGHT+IGxi6nV2n7varj0qhe6d2tnIqqhV16RoNl0Qc8fSY/LOPv+JoBGfDdaLR/jA9RX2SzmSWv2Dg==
X-Received: by 2002:a05:600c:5849:b0:43c:f81d:f with SMTP id 5b1f17b1804b1-43d52a2068emr83255765e9.8.1742833810655;
        Mon, 24 Mar 2025 09:30:10 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdb0669sm124106765e9.34.2025.03.24.09.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:30:10 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/5] dt-bindings: bus: add documentation for the IMX AIPSTZ bridge
Date: Mon, 24 Mar 2025 12:25:52 -0400
Message-Id: <20250324162556.30972-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250324162556.30972-1-laurentiumihalcea111@gmail.com>
References: <20250324162556.30972-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add documentation for IMX AIPSTZ bridge.

Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 107 ++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml

diff --git a/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
new file mode 100644
index 000000000000..c0427dfcdaca
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/fsl,imx8mp-aipstz.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Secure AHB to IP Slave bus (AIPSTZ) bridge
+
+description:
+  The secure AIPS bridge (AIPSTZ) acts as a bridge for AHB masters
+  issuing transactions to IP Slave peripherals. Additionally, this module
+  offers access control configurations meant to restrict which peripherals
+  a master can access.
+
+maintainers:
+  - Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8mp-aipstz
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: bus
+      - const: ac
+
+  power-domains:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  "#access-controller-cells":
+    const: 0
+
+  ranges: true
+
+# borrowed from simple-bus.yaml, no additional requirements for children
+patternProperties:
+  "@(0|[1-9a-f][0-9a-f]*)$":
+    type: object
+    additionalProperties: true
+    properties:
+      reg:
+        items:
+          minItems: 2
+          maxItems: 4
+        minItems: 1
+        maxItems: 1024
+      ranges:
+        oneOf:
+          - items:
+              minItems: 3
+              maxItems: 7
+            minItems: 1
+            maxItems: 1024
+          - $ref: /schemas/types.yaml#/definitions/flag
+    anyOf:
+      - required:
+          - reg
+      - required:
+          - ranges
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - power-domains
+  - "#address-cells"
+  - "#size-cells"
+  - "#access-controller-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mp-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    bus@30c00000 {
+        compatible = "fsl,imx8mp-aipstz";
+        reg = <0x30c00000 0x400000>, <0x30df0000 0x10000>;
+        reg-names = "bus", "ac";
+        power-domains = <&pgc_audio>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        #access-controller-cells = <0>;
+        ranges;
+
+        dma-controller@30e00000 {
+            compatible = "fsl,imx8mp-sdma", "fsl,imx8mq-sdma";
+            reg = <0x30e00000 0x10000>;
+            #dma-cells = <3>;
+            clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SDMA3_ROOT>,
+                     <&clk IMX8MP_CLK_AUDIO_ROOT>;
+            clock-names = "ipg", "ahb";
+            interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+            fsl,sdma-ram-script-name = "imx/sdma/sdma-imx7d.bin";
+        };
+    };
-- 
2.34.1

