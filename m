Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9A61D88C7
	for <imx@lists.linux.dev>; Sun,  1 Dec 2024 17:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733075245; cv=none; b=ZDSWVkAf1vEWcrkKZYD0cGeOC0cBdMZOxW2+EfubLrlemKQVnRkXYdY5stnnEGfh7CJp3yXBP2M8ZU6Yh0QoAMmjT+iyzKDyujQW9qKi2jouRsA98m/OG3e87FnQE9GJVgFFMeEnHeQyNPO0wzKo0lLlRfwgcBSBk5CH5QMcfiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733075245; c=relaxed/simple;
	bh=z0V5Gl9oP95XYAidqMBjgfFtgx9xsZSr/31PbkxMc5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XRdEjsGgx2gtc2Ee2aZzCHBz6NJ6T7qolHfKNfv4xgAB0xNBSdeGnhR+dZRgvpBZaqheLMQka/eqQx9fXQ9QZ/16+0OF6roWE9ATzG7hMrNroY37CEKQDRN0UzBtYc9I/oGGXF3i2FhH6Aanb+5yHZOyo2g2Qwyz1tc9MFpKgzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=gbY9TepW; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="gbY9TepW"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aa503cced42so519215966b.3
        for <imx@lists.linux.dev>; Sun, 01 Dec 2024 09:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733075242; x=1733680042; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ta60IQaIhWAnkSstQ5gFLSU/BoHgdvU4T6DFjF2nino=;
        b=gbY9TepWTBS+8VfugD2Tz+kU+fPqySkgT/BJsKtL1nj0bdfY3zenRhutrJ+sKiFqtp
         2pBDlGGRAttZ7ZpwxVHWV7b0KAs0RndpluPme2dKn/a27EC5LcupisfP5enidqW6Fusn
         4RzXMPE4qnmLWm2OI9Vllo46y9i3L2XwXf1jw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733075242; x=1733680042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ta60IQaIhWAnkSstQ5gFLSU/BoHgdvU4T6DFjF2nino=;
        b=Y+KHXQH3qMUFz+66/N5tNKnU405c0l4c0fjb47bPZvld8f84+eWl4NOHtwUzRKbJQ8
         A51b148mnYSU5LM4izO48l3FkDcIfIJKzAR3i26OqCNtjqQj0+1tQsi+e7jV3nXRefB8
         WZS8upbJ997oTTNMs8inTpfc8wPLb3wlf/zTMEGZDZjKmiLR33eYQey5oEGYp8mO9OaL
         7BIfqWYXYoDAGrDQmJz20lDh+d0rqNiXPXbrw5sYSQKOA2iS/pGqafJjSJGUWIzx/4im
         2ohaQBaEWoOKA2voMyBQovzVCxazjLxjF9BlbhdFkCM3hGYKxHncEKGo2aawkXHo1w0/
         fPRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXwJ74o+VOh8rdXHpLWnOK0TlZHPDWn1P2f3189I1OpUO4gZYahO+S/ptr2Uw3UpWd4UI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxRCeLazr7PAuE0ZQtjhQGqe3aSlJcXoqSuiJ20bptndcmsW4ea
	6CibFQu3ovJRrhKlSwqgfaaL+gl+6OADD3cqgO08CjdJh8gu9Wl+tuoRwbdB7E0=
X-Gm-Gg: ASbGncuiuAwHpQEGiEQcFlDjzgKZsy3UrSlNaiyxhrVLZqOwi/mV+YZjCDdCdl3CCE7
	+hKPcg2mXxVWJJ8+gQlkvrs7rP0cEvB64J9TFXkl+H9IzD9UxEppEoFvE3UrsnA1VrWIK9QFcPu
	ueopiZiW2Sq4Bg5wa13XVdrJZTZ6E3jVbXRUzLJ/kjbz4qC3TgTNfZ2cYHEcaHm/ZZluhGcykhP
	+p8iTDWLQQ30mX7jmmDP7ympRxKVR3AF7ficE4zhHTEzZpPoM1roweO0CohJRpNBF9v0BBUII2S
	zOVzpvzpPcHpjf0IFT0bLCLHFS97PoRb9yQDIXau5Mn6hxEDcZdHuTrwA3yOPts9ZbaMt/Boxef
	DcC3zhM1LvbBbAyJA
X-Google-Smtp-Source: AGHT+IFgxSmMaUuIfgqqx9wN9WkSl2CULWn6wLzUNHeYGK/zmvXMdPbcdrCJqoIfMbNoh6JOnFaSiw==
X-Received: by 2002:a17:906:3153:b0:aa5:43ee:2ff6 with SMTP id a640c23a62f3a-aa580ee8d40mr1783857066b.1.1733075242627;
        Sun, 01 Dec 2024 09:47:22 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a78esm415220066b.163.2024.12.01.09.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 09:47:22 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v4 03/18] dt-bindings: clock: imx8m-anatop: define clocks/clock-names
Date: Sun,  1 Dec 2024 18:46:03 +0100
Message-ID: <20241201174639.742000-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
References: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define clocks and clock-names properties of the anatop device node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

 - Added in v4

---

(no changes since v1)

 .../bindings/clock/fsl,imx8m-anatop.yaml      | 53 ++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/fsl,imx8m-anatop.yaml b/Documentation/devicetree/bindings/clock/fsl,imx8m-anatop.yaml
index bbd22e95b319..f439b0a94ce2 100644
--- a/Documentation/devicetree/bindings/clock/fsl,imx8m-anatop.yaml
+++ b/Documentation/devicetree/bindings/clock/fsl,imx8m-anatop.yaml
@@ -30,22 +30,73 @@ properties:
   interrupts:
     maxItems: 1
 
+  clocks:
+    minItems: 2
+    maxItems: 3
+
+  clock-names:
+    minItems: 2
+    maxItems: 3
+
   '#clock-cells':
     const: 1
 
 required:
   - compatible
   - reg
+  - clocks
+  - clock-names
   - '#clock-cells'
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx8mq-anatop
+    then:
+      properties:
+        clocks:
+          items:
+            - description: 32k osc
+            - description: 25m osc
+            - description: 27m osc
+        clock-names:
+          items:
+            - const: ckil
+            - const: osc_25m
+            - const: osc_27m
+    else:
+      properties:
+        clocks:
+          items:
+            - description: 32k osc
+            - description: 24m osc
+
+        clock-names:
+          items:
+            - const: osc_32k
+            - const: osc_24m
+
 additionalProperties: false
 
 examples:
   - |
-    anatop: clock-controller@30360000 {
+    clock-controller@30360000 {
         compatible = "fsl,imx8mn-anatop", "fsl,imx8mm-anatop";
         reg = <0x30360000 0x10000>;
         #clock-cells = <1>;
+        clocks = <&osc_32k>, <&osc_24m>;
+        clock-names = "osc_32k", "osc_24m";
+    };
+
+  - |
+    clock-controller@30360000 {
+        compatible = "fsl,imx8mq-anatop";
+        reg = <0x30360000 0x10000>;
+        #clock-cells = <1>;
+        clocks = <&ckil>, <&osc_25m>, <&osc_27m>;
+        clock-names = "ckil", "osc_25m", "osc_27m";
     };
 
 ...
-- 
2.43.0

