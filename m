Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C8D41C6E
	for <imx@lists.linux.dev>; Sat, 20 Jul 2024 10:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721470154; cv=none; b=nibRZ/Nsvo7LYvi+/94JSELNGiuPlOUR+a3wTAYMtKL4WahKNp0DyDfzfLAuN/L2wVA4sVJJmPklBrRBLaCk7HDGe+Q0QEcSfzxJ6tb2qpFeYyCQ9L7Dgd93sDE0ff1Gyazxi1zYM72yuzdOMnjqcnbCf3FZvd7kcwuhpp358Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721470154; c=relaxed/simple;
	bh=qkzTRSoui91UTwraDoNj/kZN0RD7tb8SwvicWbh8QeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EOvxP91GHD/aV0329jVqA6vm+6qoEZ/SFzoQI6FR5garIrUOqpXT20kuaWOXPizcI0LBk46tAxL0hXCz7ybzWjNbFkeHvMqbaYxACWsNyIk7HsumsmgiEnGhsXEYH+RVVq/3/nUrvKV1ZJJjbMKgzLCGP7e4LM/zGFhGlchtdKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WdlIkXzP; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WdlIkXzP"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-25d6dd59170so1388807fac.0
        for <imx@lists.linux.dev>; Sat, 20 Jul 2024 03:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721470151; x=1722074951; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bW5+wJPul1XSgUhvOdeAPOioFRHQZTQPxe+x1R0qvME=;
        b=WdlIkXzPzsGITfmT8CtVg3XYFlKxQ+wDBJSTrBbpg7viGgh0w7qnqW6D/26huSRAeY
         wgAVbsIllEpa68c9wGMd3eCOEpOBSFJlWldXIIB0Xtim9x1r7GZQnHcw2jUN7zH0ciod
         wPi4WP/b5/WUUe80RAnF18Alqh35Y9cGsjqoy3Q0bGLqYmuAa+GKglo1gASr22jSZTI0
         urDA8BlOcRQbxGXyOl1GO/He6vb1OhfPAfz+CnF7HP62EKPpaORExLQGwMRg3y2T1xgj
         pndTEdurAfXY2D1YJ2PWRBRuSftCisIlGYFgMJWyEDUYJxC/MeV7uHMxrw9JbMVG+FEV
         XkbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721470151; x=1722074951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bW5+wJPul1XSgUhvOdeAPOioFRHQZTQPxe+x1R0qvME=;
        b=g0pNFqi+jpFG6HriYB4tvGlC3xTnNqB9C3Ahb3f4c31g6p2tqaYzkumWrY89dfBv2r
         ubtFlglbfDdsQNztzNjcOTFv3GPDXWXLz6FriULhthF/yNnsMf5vtNN0jv19tfYTBXdV
         JR0EEnXi1Sgpxm1ztl0uhYW6AggPA/tuaFh40fI3uqWDR23HbxAUCQTJZQEUIclpY31O
         /pZz2b0GZkHgBQVQHHINeGqVcQ6fL7CdJ0y79ePXE7JhaAJvKWv11/QeQh75qY68epyO
         G/Eg8X5gbAaS/S45WnWpVO8tAfmYBE/bYQ4OymWLoKjM/aorqatkTlU+9HxsazzXDK44
         zNuA==
X-Forwarded-Encrypted: i=1; AJvYcCWYaudgka4zHll6SEvpJC+js/4dWnQNgbUyGMMEnmi0I46szUyRDBovKvzUQGqRVRYtFXMut/sJV9My4//biiG6EgF+
X-Gm-Message-State: AOJu0YyZIUCtXXg4B3sNmaX7T4XahVyRD3HCCYHKDnYsQquwGsra7xaP
	eWr6w8Zol+CWfk6Bz0dfgBTGOevqr7+eOXYd2yw6j/seE6Vdh+Ms
X-Google-Smtp-Source: AGHT+IFm7DfKM8u1iF0Y/SvTZ2QTe3xVLLmUxTj2IgklWCPIwAENmQwjKKNDmaBLExgtf6EO0tBFPw==
X-Received: by 2002:a05:6871:b12:b0:263:3b45:b7dd with SMTP id 586e51a60fabf-2638df809ffmr715555fac.1.1721470151335;
        Sat, 20 Jul 2024 03:09:11 -0700 (PDT)
Received: from localhost.localdomain ([115.240.194.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70cff491070sm2396724b3a.24.2024.07.20.03.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jul 2024 03:09:10 -0700 (PDT)
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
Subject: [PATCH] ASoC: dt-bindings: fsl,imx-audio-es8328: Convert to dtschema
Date: Sat, 20 Jul 2024 15:38:40 +0530
Message-ID: <20240720100848.203546-1-animeshagarwal28@gmail.com>
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
 .../bindings/sound/fsl,imx-audio-es8328.yaml  | 111 ++++++++++++++++++
 .../bindings/sound/imx-audio-es8328.txt       |  60 ----------
 2 files changed, 111 insertions(+), 60 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,imx-audio-es8328.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/imx-audio-es8328.txt

diff --git a/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8328.yaml b/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8328.yaml
new file mode 100644
index 000000000000..5a023c2d73f5
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
+  - $ref: dai-common.yaml#
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

