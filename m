Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728A819E99F
	for <imx@lists.linux.dev>; Sat, 28 Sep 2024 08:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727512699; cv=none; b=DDOS3PIjZvtibk8Jg83ClvGuzRRIt6Th2Y3Eo6nH+5XfHaxOSXOl8OUKEZ05mfqgy9rCMoQQ166CjvxOB2jr+skIlfEdwrth64EOWkxiolCHb/GvWEaCKtQFXj9ydcLeVd6tU34+aq+Jzf6eMNYVCW31M2+fJoP5ruFjhkTKLsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727512699; c=relaxed/simple;
	bh=Lja37Vxknt4vNnaSkdJb0D6DbUgmwOpWSwtN5vUK9Yo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oaw70+T0esVJunHnrqXKSM/wTJ2D0FvU9TbxbDCSsGC6GsU/9PtcTX51XWd9lsz+5TDh9rWQnt4Q+z9WusQzClhAZVtYrw1Uzn7cIGDFn8Zmkba5zV1BG4K+l3si5EJG3nzz55qbp+X0+yi4rehoeQC6mCjc5A5DSH0vhL0NufE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=gz9Uyryd; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="gz9Uyryd"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a8d56155f51so338585266b.2
        for <imx@lists.linux.dev>; Sat, 28 Sep 2024 01:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1727512696; x=1728117496; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgBA2YgBzcVdnVEoc6s2KOvaf1NpbuG7MmZKT5HNBsQ=;
        b=gz9Uyryde/PRQWeDhBeKCSVHopMqwAzqOFHnp+KQENxrIyEJ18IHVGrB+8uu2oNg7R
         vtcZo/aG+tMWmbbkVRtMjfZvtApvGe9TxvL9t5bLWKJSmQMQ0XgOh68xqobrsbh5WChP
         oEHn4RgJtkkhU2Stu3AOqC8wCpGwBo1aMOYeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727512696; x=1728117496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hgBA2YgBzcVdnVEoc6s2KOvaf1NpbuG7MmZKT5HNBsQ=;
        b=q6+nzN/NU8735Rx433q1ravVNGUIsybjZtqIaY95npo5lmvh2aYoFLzoNIVBSLNSG8
         c63JQ/8HP/MG6i/R2X47IzZZ8WkguCxbJwf8yRYGP4tYSF6lXt41Lou8gzR393sn34TM
         wUYqH0PzWSjSo2TZ2N+cXSYSdKSTeZeufA0hnPeS7RbkmmVK8Ka8Q62ACQO01zIecuP8
         3iMEva2+i5oA9u2iHZkC6Pigy3BQJkR/DdKSXpdOjGUjuM/RvGxxzxC8ah+1RB/ibCuT
         yaTBt0u7jhbaFDbbmxk0ta8wo09KCeTmrLWx9Y7ql17dHgZi1ZaPb5IPeHCIjrrD1fF+
         zBEw==
X-Forwarded-Encrypted: i=1; AJvYcCVg1EggKdGErD/riFVUMk10+eLtJ/rxtLCmoBIVotLvyUB1ABB180Niy65p0pS7Egc/iSw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5Ys0+FgNY+NisduuDCwHHOBUnKkya2koHxpdnJdZ/xdDn5wSQ
	1XpkxBPompifhUqppdlemNdZ4AiwPY3h7n5jUYXMnbUrsiD5k695CG7eGECViYw=
X-Google-Smtp-Source: AGHT+IHW+mNjedKWSVNhjRyLls2JlxbznPHja/LY2bWHOSPBdNL3yKePDnTYBIPjvZtBQUPB/9/APQ==
X-Received: by 2002:a17:907:1c19:b0:a80:bf95:7743 with SMTP id a640c23a62f3a-a93c48f8a9emr546855266b.13.1727512695646;
        Sat, 28 Sep 2024 01:38:15 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-54-102-102.retail.telecomitalia.it. [79.54.102.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2947a48sm223679466b.118.2024.09.28.01.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Sep 2024 01:38:15 -0700 (PDT)
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
Subject: [PATCH 1/6] dt-bindings: clock: imx8m-anatop: support spread spectrum clocking
Date: Sat, 28 Sep 2024 10:37:49 +0200
Message-ID: <20240928083804.1073942-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240928083804.1073942-1-dario.binacchi@amarulasolutions.com>
References: <20240928083804.1073942-1-dario.binacchi@amarulasolutions.com>
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

 .../bindings/clock/fsl,imx8m-anatop.yaml      | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/fsl,imx8m-anatop.yaml b/Documentation/devicetree/bindings/clock/fsl,imx8m-anatop.yaml
index bbd22e95b319..c91eb4229ed3 100644
--- a/Documentation/devicetree/bindings/clock/fsl,imx8m-anatop.yaml
+++ b/Documentation/devicetree/bindings/clock/fsl,imx8m-anatop.yaml
@@ -32,6 +32,47 @@ properties:
 
   '#clock-cells':
     const: 1
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - fsl,imx8mm-anatop
+
+then:
+  properties:
+    fsl,ssc-clocks:
+      $ref: /schemas/types.yaml#/definitions/phandle-array
+      description:
+        The phandles to the PLLs with spread spectrum clock generation
+        hardware capability.
+      maxItems: 4
+
+    fsl,ssc-modfreq-hz:
+      $ref: /schemas/types.yaml#/definitions/uint32-array
+      description:
+        The values of modulation frequency (Hz unit) of spread spectrum
+        clocking for each PLL.
+      maxItems: 4
+
+    fsl,ssc-modrate-percent:
+      $ref: /schemas/types.yaml#/definitions/uint32-array
+      description:
+        The percentage values of modulation rate of spread spectrum
+        clocking for each PLL.
+      maxItems: 4
+
+    fsl,ssc-modmethod:
+      $ref: /schemas/types.yaml#/definitions/string-array
+      description:
+        The modulation techniques of spread spectrum clocking for
+        each PLL.
+      oneOf:
+        - enum:
+            - down-spread
+            - up-spread
+            - center-spread
+      maxItems: 4
 
 required:
   - compatible
-- 
2.43.0

