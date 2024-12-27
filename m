Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2361B1FA273
	for <imx@lists.linux.dev>; Fri, 27 Dec 2024 16:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735318681; cv=none; b=YDWUcwEVCmQVl8aiyJKCEvfiNEMkbAp3mPCr5r53egkq58z8nas2ZhvK9dy8+fB8k7UXApPh6fT6xIX8XpaTbRtzqBPlKfJKJhgTe3TFspXbbivi2ZjVq08a5wNB8lP4CO7m/Vz6b6Rrxv1mqdYn0HoZD9h+zn7sATg1oRHrb8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735318681; c=relaxed/simple;
	bh=bPw6sBKo42nWd35aKTqsGLLoGTjQzArJVhFrICMWSWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VAf18EmZTodFoH2jl+d5DTl1i8H9XJ48i0TkK/yb+sNNtRLq8UQeJfWuHnPKxCABTaVkxvCwIVA0AlNVlb1I3JbtI/Fv/unFuBimi9IMTKvoysvrnOzIbrN4RRh3T965bKTdbP8HkDvzwy+IkYDFo638OmeZNLMCsv8b1+27QQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=FELiZAoG; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="FELiZAoG"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d3e829ff44so15360683a12.0
        for <imx@lists.linux.dev>; Fri, 27 Dec 2024 08:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318677; x=1735923477; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZqUbS4QFbQjY9acz5KfEUvUnduu2cjIu1TltoLZFYZg=;
        b=FELiZAoGfvNZ4evUJwLJhPFSL+Nc3u+qsVMhlBlMS5eLnVvZlaBbEm08q2bqcbjzTB
         jaZ47oX/E/FRmZY+29RAzYwFDsEPFX++h6QEka4YWd1G9SOcIxeKjLBKafTYWdNvRatg
         2piON1hsEZWA1oCWeViIwdwiME/OoW33T1XOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318677; x=1735923477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZqUbS4QFbQjY9acz5KfEUvUnduu2cjIu1TltoLZFYZg=;
        b=cb/fIFiNzjvm54h8DQkHr0+Ci8MFJQzM8SveERd6le1oJ1AeP46k37yqlMqRZnCd5J
         RpJFs1o2DeYcS0gvP0S9n2UwP/1UZVZll+3fFYZKvuy7uF+CVBTe+OCJG2Cj1PtVF9az
         wgZiD3yOECvDM2zVnFQevgEq+w3xF6CUa1TN4j24WV/eYbNYu2HQksixbCioiJ88QlKC
         ao+nZRl31RU4HbjqC178ze4xr+ulN6L4cp0L7rnz5eeoU3AzPvgxc5LG7ydEx71pNBqZ
         dWWP5dt5xy0xOJrD1qLMwrtX5Qt36I7b7mpNj4Z/aP3apg9xXe5k0DdT+3XpVQASiHZK
         PG4w==
X-Forwarded-Encrypted: i=1; AJvYcCVil0mB/uNgp+8xM1sGEsfebSjIq9pPx1Tu4dH1gjdElocDSI2pTQnxwinQixLTyvbJX2w=@lists.linux.dev
X-Gm-Message-State: AOJu0YzUJYCVMFsj03PMhcRRpH+LSnD05edlf5uq5mYhm/F4U9nZZIrQ
	buFMgb5Lww8UNeaK6qLvmzpJ/FAT0RI7pcBjOLPxt3rjOTFhfl3KlZVFh1jhqb0=
X-Gm-Gg: ASbGnctgYQ55I/KlapWWKwj8J7pScxDfuPzxLvvBos/M1sWU1a27eklykhkQosSCXqt
	teiYhoQBQevN5pmiXLPUuwVI4vn08j6RoVxUFBAPqPC2NpjcTcF2kaccoQshsjPAw7Bdr0UsFKd
	s9MYUKTO0gcBxwdxeu14rCWcYK9u5oY7C6Zh2C4c44BY9XgHx/TGXLiCWdvMRVLUG49oudoX/Qg
	KTl3K6m37KVP4ZxRvyaBCgTrJoUqzZ3wFJTju2QXzC9Us+OED/vmlCuRq86/03qfyTeH97QPySj
	zBf7+7udWLvP0Jn/ebV4Og==
X-Google-Smtp-Source: AGHT+IHElfZi3i1uNBnK2xJqGFXo7qQDmANxsj6O+9wLFu70VpPDFGks7oNgpbJku7AT+TTCB0jLHA==
X-Received: by 2002:a05:6402:2346:b0:5d8:17da:dcf0 with SMTP id 4fb4d7f45d1cf-5d81e523027mr20469463a12.4.1735318677486;
        Fri, 27 Dec 2024 08:57:57 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:57:57 -0800 (PST)
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
Subject: [PATCH v7 21/23] dt-bindings: clock: imx8m-clock: support spread spectrum clocking
Date: Fri, 27 Dec 2024 17:56:24 +0100
Message-ID: <20241227165719.3902388-22-dario.binacchi@amarulasolutions.com>
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

The addition of DT bindings for enabling and tuning spread spectrum
clocking generation can be applied specifically to the PLLs.

The "" value for the fsl,ssc-method property is specifically intended to
specify a "no SSC" case, as in the example, when you don't want to
configure spread spectrum for one of the PLLs, thus avoiding the use of
a method that would only make sense if SSC were being set.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

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
index eb2e6e702de9..76040ee9cd5c 100644
--- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
@@ -50,6 +50,46 @@ properties:
       along with the oscillators, are used to generate the clocks for
       the on-chip peripherals.
 
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
@@ -84,6 +124,10 @@ allOf:
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
@@ -133,6 +177,9 @@ examples:
                       "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
                       "dram_pll", "video_pll";
         fsl,anatop = <&anatop>;
+        fsl,ssc-modfreq-hz = <6818>, <0>, <0>, <2419>;
+        fsl,ssc-modrate-percent = <3>, <0>, <0>, <7>;
+        fsl,ssc-modmethod = "down-spread", "", "", "center-spread";
     };
 
   - |
-- 
2.43.0

