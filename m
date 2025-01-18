Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8321AA1F1
	for <imx@lists.linux.dev>; Sat, 18 Jan 2025 12:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737204076; cv=none; b=MAN33LT3Ya8bbOLqJQbSHDImkaza29t2o7HAAfADO0lucLSuvw3ijN6+jJ/uVZLFW+9twoQqBUTRg1IpqPWW3v0XzoYdeXTOsz/UjB+hVozrijnhVlGyOsavuBH9HNb0Pk9Xck4A+X63aTTuOh+peYIKVMC92+H0xyvjsE925dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737204076; c=relaxed/simple;
	bh=3HpG5JSfnp1rR8LM9tLDyGAnkrv7gQYHSv7Ks+OYcRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T1Au1nn9YVvhNoeUQRtgn1STFOrdoC078v1hDDjQfcixHvJZnsFxMDP0lsDJqGCZ8r0E5EFdh09sS5ORN5GjumQKP9DAHEoYZ93HS3FZOn+KMRcXad95Lkj8fw5fqYso0m8HYS3eBQYihNJqcDf4OgQwIQr7BmEQoZCaTCE8DEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Kviiz7gf; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Kviiz7gf"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aaee0b309adso468939366b.3
        for <imx@lists.linux.dev>; Sat, 18 Jan 2025 04:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737204073; x=1737808873; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AjwlhaAOkrwwhyUyrS6nha6mqO5aPDlQoHWfonPTSAw=;
        b=Kviiz7gfkzRV2Razfh2PpXfDX0gN53WrEsT9+VFmzONX1t817+NxmOwvHiwF471K3/
         vejUGyc69ZEqVhrc0lZpWHB/rAgiwbAsDacMLox3O41WUjB2n4tXlEZd1U7CFEXx6HC9
         SVVAViJBkBBF4YyAAajrUXi+04CRCSu36b9Bc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737204073; x=1737808873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AjwlhaAOkrwwhyUyrS6nha6mqO5aPDlQoHWfonPTSAw=;
        b=PmNlzbpJngsrKSddxVhh4XCiANiNQWF0wJpmSrA4YqpLIKIBaOPmjiNc4kaYfpYslA
         BChor+OsHF5J/zXvwA6Af03JOZs/wbrWIQHuni4YxXg03zTUhRKNtu/R9lQE3w4qW20P
         5+tBJ73gayq/uQhw0L8XCQjg0QVhnW36U3mqD4q3VsAbinlGJ/+SzcnkrXN9aZhhSZ1K
         fsl1m5GMlYJ1H2euseiSiQHEwp1ioROd8Xuz6uv5GyCy+KQJSaS7G8MQGOYiDQy7XNIm
         dyIxhKOCwAfjV41oHSREYiWAW1KNCh1aWqahvJUaNtNwWZfw9jPeqgMQjhrdgXFTbe31
         FGXA==
X-Forwarded-Encrypted: i=1; AJvYcCUMyrPvPNPHkiF1iGJR5FUAo+d1gIlH/OioGqYP60omnkwQggoD05wBvADFxwHSuNEE+RE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxgrDtUTw7b3KGdzmZpUvYwIXIe/LIEnPaPxJ6+3/TCNJagmIVG
	Gtja6Vn/LWNh4NbsxVmytYVhYJ74qy68EqO9zOXVbo3u+EXxvNLlUGEWsq8thVM=
X-Gm-Gg: ASbGnctwMt8I0B8so+D9l5P+1N2XOtKKlWul/LWizx2LIo1vlRUVmrOKmeCcN7UPKRb
	GvQjUfhT0+8pcL7bFuUV8GkQN0rCe5OoGIWE/vvJDgsJ6VGZ8xToBH3vc5hF8QRxLf3+qCINyCZ
	p/bo01gCeaO/yCQNZDPWr06nx5eE0mxR5ox5UuhcLF2rtsK/KzdHftIHGZHu1dSNbmvc3HknjBK
	E/L3WlCTR3EsnW2RrVRWwkGJPHs+xvEfUF6Bn+ey4NNnbgXttDL+pEP79PH+aCWKSG7W+ltG2RL
	1la42Kb9AxRz4OKa3reWkDEtM06g1KVjF+BBdhN1qsQam0PiJj+tgcilSGWvFBH8gCvk3I0hi7U
	5g19JdACel4lly3yqfVjovSYkJqa6uqov7lKA
X-Google-Smtp-Source: AGHT+IGaQfD+XOUXbE+BkfgW/kdqk8npbiYgJKweh+ryekNShXVP8/4p8gDEZxKuRlimfmswkORPdQ==
X-Received: by 2002:a17:907:3f28:b0:aa6:79fa:b480 with SMTP id a640c23a62f3a-ab38b0ba07fmr581216666b.10.1737204072939;
        Sat, 18 Jan 2025 04:41:12 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-30-28-209.retail.telecomitalia.it. [79.30.28.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcd73dsm332562366b.178.2025.01.18.04.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 04:41:12 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Abel Vesa <abelvesa@kernel.org>,
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
Subject: [PATCH v9 12/23] dt-bindings: clock: imx8m-clock: add PLLs
Date: Sat, 18 Jan 2025 13:39:55 +0100
Message-ID: <20250118124044.157308-13-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
References: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Though adding the PLLs to clocks and clock-names properties will break
the ABI, it is required to accurately describe the hardware. Indeed,
the Clock Control Module (CCM) receives clocks from the PLLs and
oscillators and generates clocks for on-chip peripherals.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

(no changes since v7)

Changes in v7:
- Add 'Reviewed-by' tag of Krzysztof Kozlowski

Changes in v6:
- New

 .../bindings/clock/imx8m-clock.yaml           | 27 ++++++++++++++-----
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
index c643d4a81478..d96570bf60dc 100644
--- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
@@ -29,12 +29,12 @@ properties:
     maxItems: 2
 
   clocks:
-    minItems: 6
-    maxItems: 7
+    minItems: 7
+    maxItems: 10
 
   clock-names:
-    minItems: 6
-    maxItems: 7
+    minItems: 7
+    maxItems: 10
 
   '#clock-cells':
     const: 1
@@ -86,6 +86,10 @@ allOf:
             - description: ext2 clock input
             - description: ext3 clock input
             - description: ext4 clock input
+            - description: audio1 PLL input
+            - description: audio2 PLL input
+            - description: dram PLL input
+            - description: video PLL input
 
         clock-names:
           items:
@@ -95,20 +99,31 @@ allOf:
             - const: clk_ext2
             - const: clk_ext3
             - const: clk_ext4
+            - const: audio_pll1
+            - const: audio_pll2
+            - const: dram_pll
+            - const: video_pll
 
 additionalProperties: false
 
 examples:
   # Clock Control Module node:
   - |
+    #include <dt-bindings/clock/imx8mm-clock.h>
+
     clock-controller@30380000 {
         compatible = "fsl,imx8mm-ccm";
         reg = <0x30380000 0x10000>;
         #clock-cells = <1>;
         clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-                 <&clk_ext3>, <&clk_ext4>;
+                 <&clk_ext3>, <&clk_ext4>,
+                 <&anatop IMX8MM_ANATOP_AUDIO_PLL1>,
+                 <&anatop IMX8MM_ANATOP_AUDIO_PLL2>,
+                 <&anatop IMX8MM_ANATOP_DRAM_PLL>,
+                 <&anatop IMX8MM_ANATOP_VIDEO_PLL>;
         clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-                      "clk_ext3", "clk_ext4";
+                      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+                      "dram_pll", "video_pll";
     };
 
   - |
-- 
2.43.0

