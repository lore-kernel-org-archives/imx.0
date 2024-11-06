Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588CB1D7E26
	for <imx@lists.linux.dev>; Wed,  6 Nov 2024 09:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730883973; cv=none; b=Bcdk9JiKzEq4spn0pHtFGx9Xo+zU3sUrjFpt3lsVLafFJhouczn/egJgb11xoSl4xej/GZ33QVcLcscAjLMLC0/DTc+tD+oz8VkTxp9yPbeNDlf4OOTBgqS1wdm6aqYsyaosmfJrwQ/ak6EZJsz1wOmyX+g1NrjbLHXOU0cdSus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730883973; c=relaxed/simple;
	bh=zSVT1VPPzMwphatbGwv5SHnw+nnYzwL4oiYG0Aw/df8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PiReJBQLpnvm7iCsy/z2AtsD1d9hcpB8JExYyQgj3jcspi4+cHPKxVS8zew43k1CFMPOCeKUzokJaxpslVEzGt7n8sp7ck72DHMpZ9KtKvvfZtXX24xEnQRsp1E5uXVRhBgl+HdEj7k5fzEHw+zcrob+ZWEnrzHbmw+WTSu4Ei8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=mWTjoNSb; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="mWTjoNSb"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a9e44654ae3so851212166b.1
        for <imx@lists.linux.dev>; Wed, 06 Nov 2024 01:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1730883970; x=1731488770; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QrNsJPPKHO5Lk6rFyymH1MtDjL//mpL7mQleFPtlyis=;
        b=mWTjoNSboaZXf91R1q4Z7Zqt5EwW5SzNspwTlLugEvi3qiIR9sdo42+YnPJLaFwqFL
         9LsXQ5AeFbKJ9Vl3VRbRIfb0ECHihGhrHRXzRNxlMPssorLj6hDjTvvl4BfOKkUvhE5U
         6GIrr8CJbro/pr/xd3J0+tDsNB8InqkiZIFhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730883970; x=1731488770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QrNsJPPKHO5Lk6rFyymH1MtDjL//mpL7mQleFPtlyis=;
        b=Dlt0vfUG8IJsWyZN9yvu4MH+ZoNJk6wSVSyQYPIsS+KjPHnTyFninXiQClCMhoRjsh
         IaPSCRXGy0i0lCftB473rai4iLVGXvXKtY8lozZI5W3yi9x049HqWepdK4xldCs0ISXV
         4yZV3kqRT6Sf3QJB7iKyfXkRDtzXAu+6plD8yGJ3OXpxqpgcP+sdEnV5PbGPTu+rcwEn
         HhBlteVGhKXHu2eTcQRrpmsGxKD6SDtI6Z4E5RkKlWB1jKPLMTLPLAy2JTBpmMJsyrXx
         yXf+mn93CuDSCq9OVFnv/yysMD/tskgUkaahHgLt7uON7CwKdwQ0BwN6tASBXDz8xKBq
         XT5g==
X-Forwarded-Encrypted: i=1; AJvYcCUSZLn9bVTLMl/FhU0e8ddP7+ewFJv98QUblQmCJVL4MmjYXEN3FjuVxtcffwjQ8tB/G60=@lists.linux.dev
X-Gm-Message-State: AOJu0YxDQT4eT74Vfsyr60EoIZAG1Zrf6/dgYPDOFmzp5FyLzxGZQN0u
	IkCffFerk0BIRSojV6aBxaxSF8YiqlfGEOCwXUEDOYKj5ZsFba120+kfzA7YYuc=
X-Google-Smtp-Source: AGHT+IEsxqy1QIMoDY4Ou1LJy4yOq+pq9/YaekGJg8fDbyA6VV3xENMscgOLE+Qbj+VEcc4PHGIAOQ==
X-Received: by 2002:a17:907:3f9f:b0:a9a:2afc:e4d7 with SMTP id a640c23a62f3a-a9e50b948d0mr2311624866b.44.1730883969647;
        Wed, 06 Nov 2024 01:06:09 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:afb5:f524:6416:8e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb17f9422sm247781366b.139.2024.11.06.01.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 01:06:09 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
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
Subject: [PATCH v3 1/8] dt-bindings: clock: imx8m-clock: support spread spectrum clocking
Date: Wed,  6 Nov 2024 09:57:57 +0100
Message-ID: <20241106090549.3684963-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241106090549.3684963-1-dario.binacchi@amarulasolutions.com>
References: <20241106090549.3684963-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch adds the DT bindings for enabling and tuning spread spectrum
clocking generation.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v3:
- Added in v3
- The dt-bindings have been moved from fsl,imx8m-anatop.yaml to
  imx8m-clock.yaml. The anatop device (fsl,imx8m-anatop.yaml) is
  indeed more or less a syscon, so it represents a memory area
  accessible by ccm (imx8m-clock.yaml) to setup the PLLs.

 .../bindings/clock/imx8m-clock.yaml           | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
index c643d4a81478..7920393e518e 100644
--- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
@@ -43,6 +43,40 @@ properties:
       ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8m-clock.h
       for the full list of i.MX8M clock IDs.
 
+  fsl,ssc-clocks:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      Phandles of the PLL with spread spectrum generation hardware capability.
+    minItems: 1
+    maxItems: 4
+
+  fsl,ssc-modfreq-hz:
+    description:
+      The values of modulation frequency (Hz unit) of spread spectrum
+      clocking for each PLL.
+    minItems: 1
+    maxItems: 4
+
+  fsl,ssc-modrate-percent:
+    description:
+      The percentage values of modulation rate of spread spectrum
+      clocking for each PLL.
+    minItems: 1
+    maxItems: 4
+
+  fsl,ssc-modmethod:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description:
+      The modulation techniques of spread spectrum clocking for
+      each PLL.
+    minItems: 1
+    maxItems: 4
+    items:
+      enum:
+        - down-spread
+        - up-spread
+        - center-spread
+
 required:
   - compatible
   - reg
@@ -76,6 +110,11 @@ allOf:
             - const: clk_ext2
             - const: clk_ext3
             - const: clk_ext4
+        fsl,ssc-clocks: false
+        fsl,ssc-modfreq-hz: false
+        fsl,ssc-modrate-percent: false
+        fsl,ssc-modmethod: false
+
     else:
       properties:
         clocks:
@@ -101,6 +140,8 @@ additionalProperties: false
 examples:
   # Clock Control Module node:
   - |
+    #include <dt-bindings/clock/imx8mm-clock.h>
+
     clock-controller@30380000 {
         compatible = "fsl,imx8mm-ccm";
         reg = <0x30380000 0x10000>;
@@ -109,6 +150,11 @@ examples:
                  <&clk_ext3>, <&clk_ext4>;
         clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
                       "clk_ext3", "clk_ext4";
+        fsl,ssc-clocks = <&clk IMX8MM_AUDIO_PLL1>,
+                         <&clk IMX8MM_VIDEO_PLL1>;
+        fsl,ssc-modfreq-hz = <6818>, <2419>;
+        fsl,ssc-modrate-percent = <3>, <7>;
+        fsl,ssc-modmethod = "down-spread", "center-spread";
     };
 
   - |
-- 
2.43.0

