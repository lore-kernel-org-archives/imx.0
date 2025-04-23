Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121C1266EFA
	for <imx@lists.linux.dev>; Wed, 23 Apr 2025 06:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745388203; cv=none; b=iaoYE/3tCXQUKMnSER7s7YGB2cxW+ImXhcFmEYvg/jWk28c1GTVhbHcu5o+9Q44Qzds9pXz6Kvd6vXP49NoX6OyKrxmek2w0eUgQcc8FoleRkWv4ZU2chZr3CrF3LnzZsnckyGB83XZJtyNJSL/R7KnndYgyOA5BcVYCn9MdhnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745388203; c=relaxed/simple;
	bh=hkq6fHmdJC3Lk8cO5+DRsRwOVcxTWLet80Z76mwc3rg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I+I2GWTsd5DgosgYZfeRRY8kFcRbbpgro2SlvO505TnbkR20bSKnokh4N3uTH3zFiLnOuAeL30c+qCmvetdmTX3h50qXQe6PaqU3nJX4MrPKXl9k3c6n3iAqqxSdbYhHmtU+bpbaru6VDwlL4ZBD3RzPenuD3mWfCFgQm5p2VXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Vu8HWg0O; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Vu8HWg0O"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac2c663a3daso980249766b.2
        for <imx@lists.linux.dev>; Tue, 22 Apr 2025 23:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745388199; x=1745992999; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qlcrl/s66F8iW4Dfes9I7PvLNwTvzV7zn6ge9EdXk3Q=;
        b=Vu8HWg0OuYpf4yuDPF/KNlHYQw4i7e72gjRN06B+sJleSmSaEPKZLu9rElCwmMXTEX
         zq+mHhHSUpDgOKPqBE9b8sTkUedu6a/J6bLnBOyXLoTQhzVBqlRyIHpfGqIYCocGEb7Q
         8Fw27/4acn2yZkAzN+4F+M3VRPgrwdDkpiHSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745388199; x=1745992999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qlcrl/s66F8iW4Dfes9I7PvLNwTvzV7zn6ge9EdXk3Q=;
        b=U58VVzow85RPseCsErvThP4eJJmULTNfMIlq5yXg8ce3DhZHCaqUq4auzXUBaOvjL9
         A4uca+rdLfVrkDhKPtlTo5VrPgeOgKaA2ZD690TJMbWd0ugjcklEzGflUZJUYwFtyjiR
         6+PMObs9XncN0i4XmRcZjJnkSGfQMLiWGdXaQw+Xe2Wewvb49cgKUNDfk+EmWh6EaMeq
         IdnQFAmPbT2SccNS8jLzgclA+tyCKlGLNMir1JiTQloGKGXqQ0ZH74OHs2hWeJEjOyL2
         tj/gw4cyQYnVKc6yn3nkkUVxngvF9AWq2FsdWI1leNu49T1TQ3C42wwDoJ+2KK1FxUCU
         +LRA==
X-Forwarded-Encrypted: i=1; AJvYcCXr/ZgBIbC86HX0QLFz9CdLL2/m4nUp40Q2MCWZ9aV6b7ribyO4+JSDx3WCT9GY3lIWFdk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyllQBwt70vmegAFe3se8xtLFRkJy2A00h7Oio3FIvy3DQo7WzU
	f3qdZe/DsCd5ZTHzJo/1VjjR9MqI2gAC5b/jrAln7LT771HYa5v8Z1DZWRzMs0Q=
X-Gm-Gg: ASbGnct/6DfJnZBgsmdTtWpIZuYpsLF4K4KENgcLEcnO7BKXaRa3FpaW7elpAaRK7tW
	ZJGIMssNZdT4LblvmAAU+/IUH1HB58V25Rcjo8oWvpJPhePKFbSkFW2kyick8/tbdKJDOnicXSp
	cgoMw7FUEo1cOjATF/M+t5LHh4wq+d5809J93bX7ZSXBkrUUNWj5IihTW9hXDmKclJ0b6ygajDf
	HFwCP/8/TatIyRdjSGMYD/K9DTCjdbYJ94eMjbR59RzHA6I7yI+c1wcf1o15zdUGB62ucnGj+wa
	7js96qEi3mBXFnQKDOn9aUZZC88K7nU0lTIZR9YEeHbetPeFbhqux9FkYcYwdSvC5aX36Wm6AR4
	ct9YE
X-Google-Smtp-Source: AGHT+IFXK5t2CjXs/VSaGgLG16geNEJEoOfNTY2wN1N5E9kGgqXmwH2XgsdysdftJFFBu3tzrfnH1g==
X-Received: by 2002:a17:906:c154:b0:aca:a162:8707 with SMTP id a640c23a62f3a-acb74ad9629mr1643817866b.7.1745388199239;
        Tue, 22 Apr 2025 23:03:19 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef9e7e6sm745234366b.162.2025.04.22.23.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 23:03:18 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
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
Subject: [PATCH v11 15/18] dt-bindings: clock: imx8m-clock: add PLLs
Date: Wed, 23 Apr 2025 08:02:32 +0200
Message-ID: <20250423060241.95521-16-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
References: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
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

