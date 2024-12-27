Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9311F8F0C
	for <imx@lists.linux.dev>; Fri, 27 Dec 2024 16:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735318663; cv=none; b=NtGzLQzl5PZ/noF+2lILfdme7Yw9o9RCbdeg/UbQS6KzCign9sUjA2kxGWLSWMuaqgCae2uo/OCLcmRXXbLD3J8uyGYNNcxZUiYO65qgkv3zol4hr/3ZKOobhnM7mB9PsvEGl26W1aylZ2g8g82p6WUK69Lmbljwk5edlMNhFYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735318663; c=relaxed/simple;
	bh=naoomUt0k88+wEV17B2ZOe7lNdxVn1y0MUvtBQNmPnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZlMT4p/2oLqz71mX+0wZ1MxDc6jP4wT4I/Ahc50AzblB4VUhyi2Zn0XGDjuAQC8dIFi8GgSq2z/zAGC3Tlk/V992083jvEYo+oP2TVIW6KrDqfftRZRB4oA7L8Fxm0GPgtiTHQvvc/BhblKXzzvaqClvlv1OBvBpNNlz1BuUsp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=V/FYSIu+; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="V/FYSIu+"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aa68b513abcso1419983266b.0
        for <imx@lists.linux.dev>; Fri, 27 Dec 2024 08:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318660; x=1735923460; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EXkTXrVS+/nRJltLKdRuy9fqF8vJTsINCmAjWzhQ/Xw=;
        b=V/FYSIu+ch7BCYCD8CgQXtL6RSFEGg/eZQJQVAhkgltRHmOO9reSZvXF+Za5E270/k
         vJdbpDEeHArpi1/nw16u2tStjsEAW8sbTbOTR+72k3uGlbIl6J9VCuXrP1VT05Jp++Fk
         WSxm07oi7BCDwM4wPpyTdwNOnLm6gHfkev9FY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318660; x=1735923460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EXkTXrVS+/nRJltLKdRuy9fqF8vJTsINCmAjWzhQ/Xw=;
        b=EiWPpW2UeNXn7dsK8OrMPykwuSLe71PO9SLUgQqZoQjUwl8u3AGFTC5ktxQIps+kvk
         FPN0/Opt/Y9h2W9zW7ch82G/zBsxNfx6fVVVeOTIWIkBFL2wGBydZHFFvVYq4JGwux8A
         2M9RUbAhBE0Gn8kDnURecgKMdpjShK7q4VJn8ETdlcxk2gUBreiqfA5FxIkl7c9LeXH0
         vexpBZuo5vucGytg6yBGR42rFJ4UQJQNv/25IgZ8V15iSr+LAQyYjRsGDt3lX180Zhio
         nxjHnDf/BWZSUZECH0UifhMInB/IdQ4nSTeBJgXDNsc9PrHx4KP2YBkggCOUxumM2X7A
         sZsg==
X-Forwarded-Encrypted: i=1; AJvYcCWWRdTlWYXKlMYnbr2LVkOHz6P56vvRQok2ClTm8rMQfKvJ4YFKdImXHtTYdq+lY9saXEg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQlQOY/ZylueqsEWH8ewTTYeqlAWK9fe+SI/Zyb6/8R8lAq2/H
	SsehbpenZXGM5Q5XHwZL8yV3q8EDirMEVYWSm/S5Y3KAY3FVM1/ix3tj/sfWIDg=
X-Gm-Gg: ASbGncuJInp8Mt/bFbXm5BPlz4S4OokLRQfu/rvfFbRV/vBTBG2Ru9ayBifD4FOk2Uo
	xcxF0VnMQBJvLc2yx8gSoNU3PdDvJdPeJ+McMWde3rcI7MnsYsRzqkik4vuTHjBc2Cbke+H0iZH
	4BybozYZ6SjYPIiH/TrAIErZ+POCx7BRbeZpVR9uPLVU7v80ENdmtrdxklLzz7aYpdiN9wFYhsq
	+jf+5B0m0MxXrKoV55ZQqeWIbK7yE3HhYrZ51RazjQBJSN0g2qB7H9xUC23+IGUNiV7FeFXdON9
	ryGo8rUS0lD66Xqd74aKPQ==
X-Google-Smtp-Source: AGHT+IGCaJDO5HxA1JrQ3trYq1mZgAVJbVh/QmApzDwyIdyVJeYbHjoW+NICkcizlG/u5obfXBOTOg==
X-Received: by 2002:a17:907:3d86:b0:aa6:9eac:4b7e with SMTP id a640c23a62f3a-aac2d455458mr2795714566b.30.1735318659824;
        Fri, 27 Dec 2024 08:57:39 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:57:39 -0800 (PST)
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
Subject: [PATCH v7 10/23] dt-bindings: clock: imx8m-clock: add phandle to the anatop
Date: Fri, 27 Dec 2024 17:56:13 +0100
Message-ID: <20241227165719.3902388-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
References: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adding the phandle to the anatop node will break the ABI but will allow
for a better description of the clock generation hardware, making the
dependency of CCM on anatop explicit. Indeed, the CCM receives the PLLs
generated by anatop as inputs, which, together with the oscillators,
are used to generate the clocks for the on-chip peripherals.

By doing this, it will also be possible to generalize the CCM driver
code, which will no longer require the platform's compatible string to
retrieve the anatop device node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v7:
- New

 .../devicetree/bindings/clock/imx8m-clock.yaml         | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
index c643d4a81478..b23e639e6389 100644
--- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
@@ -43,12 +43,20 @@ properties:
       ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8m-clock.h
       for the full list of i.MX8M clock IDs.
 
+  fsl,anatop:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle to the anatop module that outputs the PLLs, which,
+      along with the oscillators, are used to generate the clocks for
+      the on-chip peripherals.
+
 required:
   - compatible
   - reg
   - clocks
   - clock-names
   - '#clock-cells'
+  - fsl,anatop
 
 allOf:
   - if:
@@ -109,6 +117,7 @@ examples:
                  <&clk_ext3>, <&clk_ext4>;
         clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
                       "clk_ext3", "clk_ext4";
+        fsl,anatop = <&anatop>;
     };
 
   - |
@@ -120,6 +129,7 @@ examples:
                  <&clk_ext2>, <&clk_ext3>, <&clk_ext4>;
         clock-names = "ckil", "osc_25m", "osc_27m", "clk_ext1",
                       "clk_ext2", "clk_ext3", "clk_ext4";
+        fsl,anatop = <&anatop>;
     };
 
 ...
-- 
2.43.0

