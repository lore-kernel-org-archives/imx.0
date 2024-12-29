Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C25219D084
	for <imx@lists.linux.dev>; Sun, 29 Dec 2024 14:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735483854; cv=none; b=Ogu9wHSwEoyUZ52JnBiLZJhSRWIFMsMoWBEwV+9wMH+aOEQQ3cEraY5+Ma/mPr3uUJwEZNP8yzABSP1b7KdB1cEIXF4Oqz4Ry8RWjnXf4UfRD++LeduDRfyRPFmqY27bhCgaG1cRGBmLKHAKcuhh4b79KkeEsVVwDvLm9Exyrn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735483854; c=relaxed/simple;
	bh=3HpG5JSfnp1rR8LM9tLDyGAnkrv7gQYHSv7Ks+OYcRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gO8IUCTILSOHMbIpSYbgMhQBCHHwHWbJNZsU+MBqAuCDhlfuhLYdXC/HSfzEc7RN5WWJbeS353GINNmGq8uFYipa3x36/9NAdQpcBb8gV6lf36O/HAhl6796M5a5Wl7htxH2Vw5loFk1A/zXkqmolYzz/kuKZlLxBFlQvQJdVzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=GOSt+nTD; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="GOSt+nTD"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d0ac27b412so11228530a12.1
        for <imx@lists.linux.dev>; Sun, 29 Dec 2024 06:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735483851; x=1736088651; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AjwlhaAOkrwwhyUyrS6nha6mqO5aPDlQoHWfonPTSAw=;
        b=GOSt+nTDzBgaF/oUWTRoPEs5qXL1GESKJRL/S3I5Qmg6/O9dmuzS0+mIahGfjpFxUK
         441FJfHKqKFmLkYwW3GyVUQ4IOi+K/FKjGcmBW7uaPxtYJrumKxixA2cbj1CsjMRFXKM
         BHaxir6qBH7Yfy3UVqwGn5v2xytJ+gyUTqnQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735483851; x=1736088651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AjwlhaAOkrwwhyUyrS6nha6mqO5aPDlQoHWfonPTSAw=;
        b=SGT4W2u2KomnBLzXoZq1C0fHJjdusKQSbTyuU0TagQPFlt4FMK2BsXFDfXa7Ta8N3j
         FCns9Kbn0BNtBmidVUX3RzvP6pDdKkm0Obk2YLtHY05O0BFJgBlZmwCwAss0H/qru7CH
         Nm+OaxhmqM+xGxULI7SlARdmwEfpBsAdzj7vbHqnKAGGjMdPU/eVKW53kdnK0obq0YOo
         kTgPj4Gpb4dE/ZZj/P0GHb6ER1Io57DaAXEYwiUuzxe3psIv+aNUmseqs6oAPXeV0W3u
         GxE2gPWBUMjew1BKgGYGVE+mIKW6hNsXF7HK4dadZzEUY/oaorlp9QwoV85P44BjVyUP
         S62g==
X-Forwarded-Encrypted: i=1; AJvYcCUkFvpJ2TZS5h2hGZoPYrZMlabZIO/fmfpyVaELvpgrgIEi16n/qTcENgPrh1e8f3/eNms=@lists.linux.dev
X-Gm-Message-State: AOJu0Yww76YTSyY6cgQ4eWhRVeuERH2n9vS0RygtZhJ/cGa0yZcBHHkj
	cGBXqBUVWl2JJSfjJZYYggReGGvlX9Qrec/fMwk1LTTGpP3uS4kiD2ltc40Lxew=
X-Gm-Gg: ASbGncuz5A0MIWccv5vrUWNywn/32SxMOdwGNLQGoTfrVx6CiTVbJl8nzKAC67yAQOg
	yxd8+DwnFyvZGKzDLx+v6tarhu8fUtyinv4tO5fa1UY99jBeRhgxbuL+bXJ/NMAT72E6ZuTEmBp
	8poPhEG1553L+jy3lB+NaYNTsBS1FJhEdjw8wIVqSp6xQq306CCOHW864BSNn7oGJhNMNweQgSW
	Xy70Hl/mkwZ7+EoyKROY82C+cjJTUwHwY3/zefSQMjppcCIPNYwcwoVLX/S83waRLko+gW8DY4S
	TjL/vnSDvY7YXIjm/jJ04w==
X-Google-Smtp-Source: AGHT+IFxgItt54HHYH/8mA88WaD38CQ9mOKSbKko/RvuXIeFzD1DAkYznBzK7j3ZQqQYmVzmFb1k8A==
X-Received: by 2002:a17:906:6a15:b0:aab:d8e4:2062 with SMTP id a640c23a62f3a-aac3366b549mr2566530166b.56.1735483851580;
        Sun, 29 Dec 2024 06:50:51 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e895080sm1362084466b.47.2024.12.29.06.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 06:50:51 -0800 (PST)
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
Subject: [PATCH v8 12/18] dt-bindings: clock: imx8m-clock: add PLLs
Date: Sun, 29 Dec 2024 15:49:36 +0100
Message-ID: <20241229145027.3984542-13-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
References: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
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

