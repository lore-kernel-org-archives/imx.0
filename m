Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63151D7E33
	for <imx@lists.linux.dev>; Sat, 18 Jan 2025 12:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737204084; cv=none; b=jC50kn+AnXYi6dGz/BloVDarInDziYwLJC32nwnbaWK2bDsXGYwk0PwlUEewIVmOto29O6BfbdzG+gpbpppF6JBS8muA8LXbuU3KaTKQ0V9sgWEZJsHazhD2jPXPUiLonEudR+PTwTmSe5mvvrhCU7zBFzICsDdOVhtjHwOq930=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737204084; c=relaxed/simple;
	bh=El72Xw99HLuBdH9KtR0LW7UzZsYG3PNdKxTAjv0VMF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XTQGFCtH7gOnZCPPDC55FAIA6aSKCK5/9oa2BcufbXC3rl3WxrO8L+eEdbtw9tB2dMezJykCOS/s5hSA6+x1UD15S0iUjAH2J/mTfQua4G1srlzORfh0ISQi1X4Y5BST7pPRdm71U+uQwvse9CAAshG53/VrfdciGX4zh2/HzPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Bs9i5Edy; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Bs9i5Edy"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d90a5581fcso5194810a12.1
        for <imx@lists.linux.dev>; Sat, 18 Jan 2025 04:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737204079; x=1737808879; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aXOt2DStfgxzjFuE8T9ZB+qgm2XwGSAXjcE/H4FasAs=;
        b=Bs9i5EdykUEu3GmyIwHtkMqHhw9Q3aCd0mySlLf5JMyKbzpsXGybyOBQi4JI4rNgOM
         V5k27n9drOdkZtm55vsiK1KhymfoVA0ciMgwC6leALmfiE/TMio1FLe9By/MDn4rU1uQ
         kvkWxUao/kQ0cr051IivBNZc/lKGYlk3NNbnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737204079; x=1737808879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aXOt2DStfgxzjFuE8T9ZB+qgm2XwGSAXjcE/H4FasAs=;
        b=qzvE/uK6hj6FFClk0CBnODIxjhWR+r7FmAypFrfznRivcePhQkNiQcBayEvv70BlYR
         WtgI0Oy0/QBmLMfo3Bu+sy648LABcsGDMULjmJw/T5CrQECMuWg8rmkCla7uW3Ly8jdk
         xvjA5KRxfaXo7EnY/oU5IFUPqjkExlG6EWTqZ2cgGedKlm6bi5a97Uw3aQvuKq4k3Lvz
         T78PEVgn1W+TJpzZNWJDCSC9dcJ6Ub0NOHK05bYNpOckgXIhpCaqd4t6J1dFs7fUTdUh
         ZlvC8IywJG7NQRz+MyADRSOo5rVoRkJ40L3X5Bn/BO7Zg4drakfPyLlnOidtLBd98dAE
         kM7Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2FNRhvnf3OzRMHgqhUXN2Q3zw9xnfMpscxQCbvJqFNDBE2yIduDU/upXlsn1iJN+NraY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzA9Lgavj3boGV0/RD2dajCogj7filwg0lJC2uNe0BdyyB2l2ZW
	e7S8ESmhYbX1dXZuqoAcxoyGSqQjCRdrjFHt3hC6SDr72TxWJr7SPAfwvlOrcPA=
X-Gm-Gg: ASbGncu0U8VFGEsU8+Oh9rjtxAMB8zextcYu+HqPu69UV5HqusSUuBYm3oWvNvzcoZZ
	5vTpYTAxJdAoQ6bu3Tl0Tperjr8UxH6wCVYzuHv9oX+98gx4eq5lc6IyS5bFfmB2XS9rTuWTDED
	LyHLZHOzb1l9Obrsq/o20wkV8eoXSYBYFqp9tTtrFeHfTTnbcyTj7u0v8UbtgrdOoF/n7W34q6i
	ctjA0BGUKTtQm1PGU840qiMaWrbmlRCmM6I/DuqBBBO3H4YTFt8eG/Qwgz1nGwU/ZDm8jwok+9L
	LFERhoTCLZs2Umb+EeJpw6ZZHMvtkXzWPEM3GHYssKpvEgWlFdedX/fIDmwb0TWHvEzjDlngmH6
	HrDj4J1VSyAk1hwUh2q/NSPkw3aAApL+2eW1H
X-Google-Smtp-Source: AGHT+IEGWBFQCcPRpsGYAMeB7nEf4t2kqxNBUWYNEEALNt45EQbT5cmxoYvaE5QDjvNCrevmdUBs3Q==
X-Received: by 2002:a17:907:7fa8:b0:ab3:875f:a246 with SMTP id a640c23a62f3a-ab38b0b68c7mr643475766b.7.1737204078976;
        Sat, 18 Jan 2025 04:41:18 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-30-28-209.retail.telecomitalia.it. [79.30.28.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcd73dsm332562366b.178.2025.01.18.04.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 04:41:18 -0800 (PST)
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
Subject: [PATCH v9 16/23] dt-bindings: clock: imx8m-clock: support spread spectrum clocking
Date: Sat, 18 Jan 2025 13:39:59 +0100
Message-ID: <20250118124044.157308-17-dario.binacchi@amarulasolutions.com>
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

The addition of DT bindings for enabling and tuning spread spectrum
clocking generation can be applied specifically to the PLLs.

The "" value for the fsl,ssc-method property is specifically intended to
specify a "no SSC" case, as in the example, when you don't want to
configure spread spectrum for one of the PLLs, thus avoiding the use of
a method that would only make sense if SSC were being set.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

(no changes since v7)

Changes in v7:
- List the PLLs to strictly define the setup order for each of the
  added properties
- Drop maxItems from "fsl,ssc-modfreq-hz" and "fsl,ssc-modrate-percent"
  properties
- Add 'Reviewed-by' tag of Krzysztof Kozlowski

Changes in v6:
- Improve the commit message
- change minItems from 7 to 1 for all the ssc properties added
- change maxItems from 10 to 4 for alle the ssc properties added
- update the DTS example

Changes in v4:
- Drop "fsl,ssc-clocks" property. The other added properties now refer
  to the clock list.
- Updated minItems and maxItems of
  - clocks
  - clock-names
  - fsl,ssc-modfreq-hz
  - fsl,ssc-modrate-percent
  - fsl,ssc-modmethod
- Updated the dts examples

Changes in v3:
- Added in v3
- The dt-bindings have been moved from fsl,imx8m-anatop.yaml to
  imx8m-clock.yaml. The anatop device (fsl,imx8m-anatop.yaml) is
  indeed more or less a syscon, so it represents a memory area
  accessible by ccm (imx8m-clock.yaml) to setup the PLLs.

Changes in v2:
- Add "allOf:" and place it after "required:" block, like in the
  example schema.
- Move the properties definition to the top-level.
- Drop unit types as requested by the "make dt_binding_check" command.

 .../bindings/clock/imx8m-clock.yaml           | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
index d96570bf60dc..d347d630764a 100644
--- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
@@ -43,6 +43,46 @@ properties:
       ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8m-clock.h
       for the full list of i.MX8M clock IDs.
 
+  fsl,ssc-modfreq-hz:
+    description:
+      The values of modulation frequency (Hz unit) for each clock
+      supporting spread spectrum.
+    minItems: 1
+    items:
+      - description: audio_pll1
+      - description: audio_pll2
+      - description: dram_pll
+      - description: video_pll
+
+  fsl,ssc-modrate-percent:
+    description:
+      The percentage values of modulation rate for each clock
+      supporting spread spectrum.
+    minItems: 1
+    items:
+      - description: audio_pll1
+      - description: audio_pll2
+      - description: dram_pll
+      - description: video_pll
+
+  fsl,ssc-modmethod:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description: |
+      The modulation techniques for each clock supporting spread
+      spectrum in this order::
+      - audio_pll1
+      - audio_pll2
+      - dram_pll
+      - video_pll
+    minItems: 1
+    maxItems: 4
+    items:
+      enum:
+        - ""
+        - down-spread
+        - up-spread
+        - center-spread
+
 required:
   - compatible
   - reg
@@ -76,6 +116,10 @@ allOf:
             - const: clk_ext2
             - const: clk_ext3
             - const: clk_ext4
+        fsl,ssc-modfreq-hz: false
+        fsl,ssc-modrate-percent: false
+        fsl,ssc-modmethod: false
+
     else:
       properties:
         clocks:
@@ -124,6 +168,9 @@ examples:
         clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
                       "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
                       "dram_pll", "video_pll";
+        fsl,ssc-modfreq-hz = <6818>, <0>, <0>, <2419>;
+        fsl,ssc-modrate-percent = <3>, <0>, <0>, <7>;
+        fsl,ssc-modmethod = "down-spread", "", "", "center-spread";
     };
 
   - |
-- 
2.43.0

