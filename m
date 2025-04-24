Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EB82036E8
	for <imx@lists.linux.dev>; Thu, 24 Apr 2025 06:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745475753; cv=none; b=rruMogsn/FwOVoRNd6xaqV/Y4SRfW/z+G9atKdYnT4882Z4bD0f5+vhxQQS72j/4GqqnD/zplUXn2ntnbTUYhoSkkhglb5pKZH01LuzMozUVZlpGB3sLcF0PXJPoUzYB+z3OPzDj1Ts2slq3T1HlWSu9BbQttHR8OA0tCsr1FYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745475753; c=relaxed/simple;
	bh=34ql/C/fKkOiPnnjJ/7R42kXdOJ4oBZrgE3R/kLi4t0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uDNu4FZbPHaLakn2f4YcYq3Jp2Gkzw7271iiQ4K3e1PdM9pE+B9v/vRDqGuP3KEIFwN3qqn63i2gmPNtpuOTIoFhGb5HEi0l031c9g5B9yq5rk2nZ62tuZaUa5HQs1pMcV9DhYXLVwlbGgxhDwrAhABjwG4vMHLpxbXxE8WuCuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=d4URfBhG; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="d4URfBhG"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso3986675e9.0
        for <imx@lists.linux.dev>; Wed, 23 Apr 2025 23:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745475749; x=1746080549; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lFy00OTtg40In8pvAKghkkcDK/j3ZCpiu8RgaE7BUc=;
        b=d4URfBhGegTVth46wgyirH+P74P0V0Nv1vAod89ArFaPPKdlRGwiT3m+OwGvToOo6K
         XlwSPrQWONd8DRNhArZjEeqRa1AP8y5oWqvy4tGtKW4k65Uw2D5YOnSbZ64M7sVIrEe8
         q+8jGZ3p2JshyRurYTFDRHVSASIQ4VEeL+FG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745475749; x=1746080549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4lFy00OTtg40In8pvAKghkkcDK/j3ZCpiu8RgaE7BUc=;
        b=FU5fJ4byK6yOV0G5C2mzUcy85DdSXGbuQf0QpywWSe7B5UENRgkuUDueR3Ry1Xz7oP
         4xMTZwXBYGBKHwGMYlDhEToHMiYOaA+eIBrGKAkJg5yS9998yH2Etp8fr5aMiQXwZvjN
         CJXOtRbdPiYjDUpHkoLD24Aj6aHxLDgo7c1GzxDTD/8XNiyNXUygOwVIgsBGd7KIrTPY
         0CnKZ9spSVUQnjDAHcga6yWUvruDuQFUVkRIMcqxW1RUJAx4WBrK8xQj04jFG/sL5MWp
         EPbNowWMyTbbxRE9dxaaIzwP7mXeM1tepG0g+OvTJPtEjR8d9Swu70pu/iOLqwnCD9c0
         iWjw==
X-Forwarded-Encrypted: i=1; AJvYcCWQBFTLdtlTo9hBojeYariexf6iQfHAp0TXMYDd5W1KKlG6gpWI+pU+flyG+vK6PPm55c4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxHFatFzpifPL+w/6WfiIbmRvocSFBbqy7LGPbIJIM2JlQR6oN4
	in5hjQr3hYx8H8tKArk3kU6s2jnt9mYfQguOroeusxmOGm0z/oEjUxZPpKdCPGk=
X-Gm-Gg: ASbGncuzoPEPOOQEHhOgsBYUn5cqUlAAGzwmiqiO5AHWzhbScquL3H6Qg5qFI+gGM1Z
	K6iHq3BnnzNthBAfOGMq2IHhilP872UmBUV+hCGvv4DFIj2zKRbVA6//yiG1/z833aJhWVQtD8E
	oZ2v5Hdxjsf3o0whov7+guBlh6dngJnucYNcPBlZWdRrTD9A9BA/dnxn0E0YRqXLbWmTh3GwhXR
	pw4vNNhfnFOZlR0AbZDpSrEwM8uI+wQsvW+LsA+AJJqAnAc3EyFt1nGAZLYp2QdIEVqjLzY5Jhx
	jlQfF4lUcVGkoptiK8SIjICVZ6IbQhqttTlAG0+mIYv9jlQNkV2nf0HVy91HVKA+sO3lo6uI9v8
	xARO9
X-Google-Smtp-Source: AGHT+IGGlGn1TKiYozz1AjS13SIEPJhaArHik4vJz2EcfG850BwHredNkQnaeix77ID0kQX88QIyKw==
X-Received: by 2002:a05:600c:2045:b0:439:8490:d1e5 with SMTP id 5b1f17b1804b1-4409c46087amr6406085e9.4.1745475749362;
        Wed, 23 Apr 2025 23:22:29 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2bf8dbsm7243435e9.35.2025.04.23.23.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:22:29 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v12 16/19] dt-bindings: clock: imx8m-clock: add PLLs
Date: Thu, 24 Apr 2025 08:21:46 +0200
Message-ID: <20250424062154.2999219-17-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
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

(no changes since v11)

Changes in v11:
- Fix conflict while rebasing on master

Changes in v7:
- Add 'Reviewed-by' tag of Krzysztof Kozlowski

Changes in v6:
- New

 .../bindings/clock/imx8m-clock.yaml           | 27 ++++++++++++++-----
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
index 4fec55832702..e83f08abd44c 100644
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
@@ -93,6 +93,10 @@ allOf:
             - description: ext2 clock input
             - description: ext3 clock input
             - description: ext4 clock input
+            - description: audio1 PLL input
+            - description: audio2 PLL input
+            - description: dram PLL input
+            - description: video PLL input
 
         clock-names:
           items:
@@ -102,20 +106,31 @@ allOf:
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
         fsl,operating-mode = "nominal";
     };
 
-- 
2.43.0

