Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96841B0F11
	for <imx@lists.linux.dev>; Sun, 22 Dec 2024 17:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734887169; cv=none; b=QYPgtq1JmHkc6Y0DBwU1w4dZD2EM7QMFDrbZAicJDiYrJLpioQGQQsg3fbQMQ+gVi7zmRyb+mN662EcRKbyCR7oPeuHlUOk6jtstEUtje+HBY7TV6GuPm4ZlY+TmODP+NgDaD9bFq0k51B/Il418lfoCzo5GWk0pth1qIS3MvPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734887169; c=relaxed/simple;
	bh=s5iJgN4o+dP7Gm3bTpRMP//ThuhyNAU+qKwiQFlkd/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=faoIL6PsRYavwZHDDSPKCMhKLZiJuuLMANCIwLs1y20sC35CwHuBkj8BB3+aJXzcoDJPkBKhkrsLuA4wY5morxXOvt8nLgzHQKmhsOqHGmG+whUcpnD4nacEgrpOqg8VwSOiD+HjWlKdl8hdmO1n4jlmrb7LXxR54+n5/orUh6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Yp5Xt9PQ; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Yp5Xt9PQ"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aa1e6ecd353so481778866b.1
        for <imx@lists.linux.dev>; Sun, 22 Dec 2024 09:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1734887166; x=1735491966; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D27zsP+xnLWGVrxLHgK+E6loU9nNNR60aUGojpIfAP0=;
        b=Yp5Xt9PQittkIeHZTLSxA2H680XtlFZzPIaqf54CskpB3sKACzbmY7VacgoGIPZQd+
         DZGAXyN68mlFjvVM0IlpcK5q19yyh0pQMtORkRv+TmUtlOFdvGamxJXwN6BhL0jkIoSP
         fVs9FsJO/5sEuuILlonH7Epn35sDDd9ibVdqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734887166; x=1735491966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D27zsP+xnLWGVrxLHgK+E6loU9nNNR60aUGojpIfAP0=;
        b=L3IRibgkTmlD3j7q13CrDcBOE4e9icVzBaVxjQMtzGvRUWfYvfFbSXNnqQuHH+q2O5
         hY/Mk66QQ2L878xvbWKI9QW3hlCGTVaWxR6HpuksP1tNB1KGOwUlSl0UFvyTPc3L7ugP
         3cBwTS3CSKuumlo7iP8WyRdfhTV2srkLVg2s1D/xeRWlchPmA4DXd0st3C441JLnNDwB
         2HGFQt6g0WMJgoTQdB6XMZi/zmoShAhDQMI/rCYBAEL44DpoN2wDrLZKFNXSb0rsukYP
         asXiPqkglYvMm0RBCW81AQ/V8yEEGTHIJ8C1VKaipoz42eFJLg3HVAtgY2Dlhe830FKW
         eVCw==
X-Forwarded-Encrypted: i=1; AJvYcCVHbUTel6M4ShT9kEdDQhM9RbfxLYfQGyMyQA5fhpJjE7sZKq8aX5XPv7brKLq+dm6+71g=@lists.linux.dev
X-Gm-Message-State: AOJu0YwbyF+/CZ9aYnOBVwEkKEdxjsCG4WPX+H1P70bGcep9hqmolB4P
	m1hlAFkGQ+b6HCNerQ+/TfGhBQOsy2v0bq6jsIVj2fZSznw/rMtyxyaTqh8knfO/TXiS8VtboD7
	n
X-Gm-Gg: ASbGncvjK8N9VDpFMokDB1jyKG0bXX24ZSuneoKOHWwkqDSShKTpHNionGBIXjU2X9B
	QB5FxQIRMn7xAOgjmTkCuytJbgcAUgGsInUTjgq+S6wTdZL0iyAkrGbKXrdJ30Iga2qUYv03gSe
	9NyTgjT+ZtkV0QDANOK9oB1ozNy2dl3m1cZeVe0RMWqdmDJcXTTTkoEjn5JSeat0tj2inHqxxMX
	P4ggn6vaLAtJSlQSi52UEToN7LlfUTecwAHI25cPmZPSCWGO+6fqgmj8Gk0K2S6K2+HWg3C7VOK
	ewEBysKZjr5mI0bFxcNwOIsHVunA/yXqSdLiUTPjg8YWtQ==
X-Google-Smtp-Source: AGHT+IGcYyO/2OQzc2CMhKzJEpw1eb8IeHSQcUz4cGsgJFNDVKrwWV2cnf1BfIdXqT/0W4OuaXsQKA==
X-Received: by 2002:a05:6402:348d:b0:5d4:55e:f99e with SMTP id 4fb4d7f45d1cf-5d81ddc09abmr22317161a12.18.1734887166231;
        Sun, 22 Dec 2024 09:06:06 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe48d6sm414056566b.127.2024.12.22.09.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:06:05 -0800 (PST)
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
Subject: [PATCH v6 16/18] dt-bindings: clock: imx8m-clock: support spread spectrum clocking
Date: Sun, 22 Dec 2024 18:04:31 +0100
Message-ID: <20241222170534.3621453-17-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
References: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
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

---

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

 .../bindings/clock/imx8m-clock.yaml           | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
index 05bc01960045..37cc6a6e89d4 100644
--- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
@@ -43,6 +43,37 @@ properties:
       ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8m-clock.h
       for the full list of i.MX8M clock IDs.
 
+  fsl,ssc-modfreq-hz:
+    description:
+      The values of modulation frequency (Hz unit) for each clock
+      supporting spread spectrum (i. e. audio_pll1, audio_pll2,
+      dram_pll and video_pll).
+    minItems: 1
+    maxItems: 4
+
+  fsl,ssc-modrate-percent:
+    description:
+      The percentage values of modulation rate for each clock
+      supporting spread spectrum (i. e. audio_pll1, audio_pll2,
+      dram_pll and video_pll).
+    minItems: 1
+    maxItems: 4
+
+  fsl,ssc-modmethod:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description:
+      The modulation techniques for each clock supporting spread
+      spectrum (i. e. audio_pll1, audio_pll2, dram_pll and
+      video_pll).
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
@@ -76,6 +107,10 @@ allOf:
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
@@ -124,6 +159,9 @@ examples:
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

