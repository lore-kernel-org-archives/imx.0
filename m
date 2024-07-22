Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6BE23DE
	for <imx@lists.linux.dev>; Mon, 22 Jul 2024 06:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721630253; cv=none; b=F7nzsnodzGYkn9T4ogF+EkP6cwyV0Fuve/2itN5GhNhE5B+eCRpBxFAA6lmH1BBc+XrswXno8Yd5d60U/EPPdDHEzSNtxOgjb9OO7psbkn7x6CRjunD7pN5VBfR1aUcDCjaJFY0LWT8vcSTwhjrCOLAlrT7Xd3bqFrYPRBYFF8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721630253; c=relaxed/simple;
	bh=tCiUOPC+LHGq7yVm6U1jnO+V/S+Vj3cMrsyAv3mqaN0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dSLStj7vajmczz8Cz05V+3STvAGWbRB1qiUA1GXG+srz1jYKl3vN+lTEjQ2FGrNlHNc3mdtHjnnP397OaMJTLIkJP0xNXQ2iM05w/eXvkXNAf26gfgVUOGxdKovLDM3BwVWOCt7vMgQa+fxg0uDrpNMRDVKdDvP3a/hZSng9mxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IIspm1kI; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IIspm1kI"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-70d2b921cd1so389678b3a.1
        for <imx@lists.linux.dev>; Sun, 21 Jul 2024 23:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721630251; x=1722235051; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H3OdDRR0s7gFlYGOFG3KlnC5bWBGEwt6D2ZCwoIo8Ls=;
        b=IIspm1kIP4HHH5GM9vVqnVtVfV7hh3qVdAW5U3g/d67bW6Wq+vei/ZjY6cT+EP4WSO
         25EFVb0yoJiKjVValTHLqv/scTX6dIYRhLR/rNkPdvMQ8NOFHyT6+WrNl9hl56v6YXEh
         SENI+kGJPeTA1F8shelGiG1Fx24Rhv1wbM1O0M8NR9twCHlYIIVVWG8jIuJApYh51IS+
         u/RNqFGWqi5H2282DV53GwvILcxPE1DiIGc0qqRvb+uYQQzPdoXr9qd7vL8NB6XZlgpp
         sclpIHOsIFEaHGd8LYv8xyssJwykXgTzfV/1VlXbF4VihhQjHELvZjlRmnNQu52ywFAz
         1qFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721630251; x=1722235051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H3OdDRR0s7gFlYGOFG3KlnC5bWBGEwt6D2ZCwoIo8Ls=;
        b=wX+iLkeo1ucqEPdOjorj4VJUcDh9Bv4Ip21v0jyL/lTy7mukRLgC0GrLcRGDFOFFfs
         zrkAr182QgqQHC+NHPOAmsWx2RDU0KwC1EfxycCV7DYJm78W+2RhqHjL7CZtmscBoouF
         0JfHymBzgs93ToowItzCqcF6CkNAnhT3edSWgFqm4HTfs6D+y0+JCDzZevUWw/gga0fS
         uJbrsb48s04NNWCrjJvCILqX0cJUyhhPvEOXlSnd/3fj44xGW7uLhAbvlJnvNtvG/Zvx
         5xDh5SBNY8zz8phbBBfEPSbarRiaAOvH7AriLc6EV93ac/b12YerDrPt7RGC0Ro/bWwp
         B1sQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvMb/Nu2yS7K/wzy6NlQeToHd0raK9is8GKf2lqSf7GKcqXxzoWVG3t5e7wVWwViFnq31SmYwRcMSf+rhoteZHVx9Z
X-Gm-Message-State: AOJu0YxKkIGEGc8MlmvAHqBVrwWnhW5eJPsTfvH16VqiOThqGyzmnLBf
	4hxK0X4bkgiwwUxx2vjHJJVOHG9j+cpSZhVUIyDq8QNCO7fjj3cT
X-Google-Smtp-Source: AGHT+IFXYNzbTnKGTt9iEE6dtvm0saWHOBj8QQ6eRdU15WdgpiZx+d+Tjpig6aIZgQzB7p/YCNmoAA==
X-Received: by 2002:a05:6a21:3117:b0:1c3:b16f:31 with SMTP id adf61e73a8af0-1c4228c37f0mr8833544637.30.1721630251167;
        Sun, 21 Jul 2024 23:37:31 -0700 (PDT)
Received: from localhost.localdomain ([115.240.194.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f485bbbsm46499085ad.277.2024.07.21.23.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jul 2024 23:37:30 -0700 (PDT)
From: Animesh Agarwal <animeshagarwal28@gmail.com>
To: 
Cc: Animesh Agarwal <animeshagarwal28@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: dt-bindings: fsl,imx-audio-es8328: Convert to dtschema
Date: Mon, 22 Jul 2024 12:06:51 +0530
Message-ID: <20240722063657.23018-1-animeshagarwal28@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Freescale i.MX audio complex with ES8328 codec bindings to
DT schema format.

Cc: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Animesh Agarwal <animeshagarwal28@gmail.com>

---
Changes in v2:
  - Changed top level ref to sound-card-common.yaml
---
 .../bindings/sound/fsl,imx-audio-es8328.yaml  | 111 ++++++++++++++++++
 .../bindings/sound/imx-audio-es8328.txt       |  60 ----------
 2 files changed, 111 insertions(+), 60 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,imx-audio-es8328.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/imx-audio-es8328.txt

diff --git a/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8328.yaml b/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8328.yaml
new file mode 100644
index 000000000000..5eb6f5812cf2
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8328.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/fsl,imx-audio-es8328.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX audio complex with ES8328 codec
+
+maintainers:
+  - Shawn Guo <shawnguo@kernel.org>
+  - Sascha Hauer <s.hauer@pengutronix.de>
+
+allOf:
+  - $ref: sound-card-common.yaml#
+
+properties:
+  compatible:
+    const: fsl,imx-audio-es8328
+
+  model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: The user-visible name of this sound complex
+
+  ssi-controller:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of the i.MX SSI controller
+
+  jack-gpio:
+    description: Optional GPIO for headphone jack
+    maxItems: 1
+
+  audio-amp-supply:
+    description: Power regulator for speaker amps
+
+  audio-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle to the ES8328 audio codec
+
+  audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description: |
+      A list of the connections between audio components. Each entry
+      is a pair of strings, the first being the connection's sink, the second
+      being the connection's source. Valid names could be power supplies,
+      ES8328 pins, and the jacks on the board:
+
+      Power supplies:
+        * audio-amp
+
+      ES8328 pins:
+        * LOUT1
+        * LOUT2
+        * ROUT1
+        * ROUT2
+        * LINPUT1
+        * LINPUT2
+        * RINPUT1
+        * RINPUT2
+        * Mic PGA
+
+      Board connectors:
+        * Headphone
+        * Speaker
+        * Mic Jack
+
+  mux-int-port:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The internal port of the i.MX audio muxer (AUDMUX)
+    enum: [1, 2, 7]
+    default: 1
+
+  mux-ext-port:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The external port of the i.MX audio muxer (AUDMIX)
+    enum: [3, 4, 5, 6]
+    default: 3
+
+required:
+  - compatible
+  - model
+  - ssi-controller
+  - jack-gpio
+  - audio-amp-supply
+  - audio-codec
+  - audio-routing
+  - mux-int-port
+  - mux-ext-port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "fsl,imx-audio-es8328";
+        model = "imx-audio-es8328";
+        ssi-controller = <&ssi1>;
+        audio-codec = <&codec>;
+        jack-gpio = <&gpio5 15 0>;
+        audio-amp-supply = <&reg_audio_amp>;
+        audio-routing =
+            "Speaker", "LOUT2",
+            "Speaker", "ROUT2",
+            "Speaker", "audio-amp",
+            "Headphone", "ROUT1",
+            "Headphone", "LOUT1",
+            "LINPUT1", "Mic Jack",
+            "RINPUT1", "Mic Jack",
+            "Mic Jack", "Mic Bias";
+        mux-int-port = <1>;
+        mux-ext-port = <3>;
+    };
diff --git a/Documentation/devicetree/bindings/sound/imx-audio-es8328.txt b/Documentation/devicetree/bindings/sound/imx-audio-es8328.txt
deleted file mode 100644
index 07b68ab206fb..000000000000
--- a/Documentation/devicetree/bindings/sound/imx-audio-es8328.txt
+++ /dev/null
@@ -1,60 +0,0 @@
-Freescale i.MX audio complex with ES8328 codec
-
-Required properties:
-- compatible       : "fsl,imx-audio-es8328"
-- model            : The user-visible name of this sound complex
-- ssi-controller   : The phandle of the i.MX SSI controller
-- jack-gpio        : Optional GPIO for headphone jack
-- audio-amp-supply : Power regulator for speaker amps
-- audio-codec      : The phandle of the ES8328 audio codec
-- audio-routing    : A list of the connections between audio components.
-                     Each entry is a pair of strings, the first being the
-		     connection's sink, the second being the connection's
-		     source. Valid names could be power supplies, ES8328
-		     pins, and the jacks on the board:
-
-			Power supplies:
-			   * audio-amp
-
-			ES8328 pins:
-			   * LOUT1
-			   * LOUT2
-			   * ROUT1
-			   * ROUT2
-			   * LINPUT1
-			   * LINPUT2
-			   * RINPUT1
-			   * RINPUT2
-			   * Mic PGA
-
-			Board connectors:
-			   * Headphone
-			   * Speaker
-			   * Mic Jack
-- mux-int-port     : The internal port of the i.MX audio muxer (AUDMUX)
-- mux-ext-port     : The external port of the i.MX audio muxer (AUDMIX)
-
-Note: The AUDMUX port numbering should start at 1, which is consistent with
-hardware manual.
-
-Example:
-
-sound {
-	compatible = "fsl,imx-audio-es8328";
-	model = "imx-audio-es8328";
-	ssi-controller = <&ssi1>;
-	audio-codec = <&codec>;
-	jack-gpio = <&gpio5 15 0>;
-	audio-amp-supply = <&reg_audio_amp>;
-	audio-routing =
-		"Speaker", "LOUT2",
-		"Speaker", "ROUT2",
-		"Speaker", "audio-amp",
-		"Headphone", "ROUT1",
-		"Headphone", "LOUT1",
-		"LINPUT1", "Mic Jack",
-		"RINPUT1", "Mic Jack",
-		"Mic Jack", "Mic Bias";
-	mux-int-port = <1>;
-	mux-ext-port = <3>;
-};
-- 
2.45.2

