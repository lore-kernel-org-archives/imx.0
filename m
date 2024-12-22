Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136711AB6CC
	for <imx@lists.linux.dev>; Sun, 22 Dec 2024 17:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734887162; cv=none; b=S4fUvXIrK2pt+iaVLEiI2nsH6SxSWihicF3Ub6HaR1vdONO1/QUzZvlgNDQtNeGhpxkXHQsyxYYWpWcLV4AurqeW0QxcCLDFyVyXo3V1Im6DjdUUFr1N5pejyY/AiXuEt9q1m5H6D3qTnZlGAL44oZPh+FtSfhbN8GMCDYwFS5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734887162; c=relaxed/simple;
	bh=TjoCD0n/fid43aNSIysze2zCd8hypyQLvXidZ8o6K7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mwC4Z0XzAl5klPpQO6MWwE559b0qRuuZ5zSPAonlEEZisDzkCNbq+TmT4/YFHkeAukDAfzjSce7rYa3KFXERxm9NxXn1sG0b1rch7Ow8kNbM/9jlHF6NbMSa/iu5YVPlLPRv4QLk16Z6sm/Jo9l/PJsY4OBLVpkXL8XHNJ1Mv7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=MYrzx52A; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="MYrzx52A"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5cec9609303so4596992a12.1
        for <imx@lists.linux.dev>; Sun, 22 Dec 2024 09:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1734887159; x=1735491959; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m5m5kN2c/9wWpkcrILoC2ZFZNTUAnB55ZbrER3I9Ujk=;
        b=MYrzx52AQ20P0gD/0pKix6CHe6en6KadEh6wbxINnk9MEJ/+j/DBAKGjKAPRzVfkFJ
         TbiNtLcfFK39vx4ITZ54i3vzUwFjYeSPQtOEwZ2HLxcUrDKDlz8QbLi6zq5c/TU3unET
         Dng1u932ixLm+7aiZ6Areyys2zdL20pd9D+8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734887159; x=1735491959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m5m5kN2c/9wWpkcrILoC2ZFZNTUAnB55ZbrER3I9Ujk=;
        b=g3dFnUxkOLWix6h1iL2h49Ykfj+rUbAitWqJ8id4XLKKrS2hXXjVwu1jk7p1NelWnX
         IMG9sONeT7fxSpZc0ua7Ww2x6dmOk7T8Hg5V9E6PGv0OuCOgXOnrCa9p6VK05vNqRYXO
         E0srzHJv2JEka3H7a70Oaz4fcoTvC18f+h6Fzv/HyVMNzIXmyvnd6cybHmDAJPqR4lLd
         GVvirVwtV+12STFOikpyKa3UBUgwGC33rdPPbq9UaNXo/2un+zGwc06qcDJYauK6LcHy
         zKkr2JyTU9l4fZx0+2tQo7Z8RVoS30s5KV6lrTggt88iercq4q6HR6PPGtPfUd+sXPKx
         yMwg==
X-Forwarded-Encrypted: i=1; AJvYcCUCEAKTbCPhFmSQAmGWHiiu8kcCryPyz8I7DgXqRan+gtYUqb4Knb4l8K48D8iFVuklPfI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxE9M4PtokZ5fJMsTN9AtlPwTOCNG3QRknt3UwYucYTF5uerPco
	cLTRJ678QLgh7nQ+jvIcAVFnKva8UhL7naRU611LNNVB4ldik38ppLl87RwXTcs=
X-Gm-Gg: ASbGncv1QYreGjPSSzfAP951JI5p1GFlt8Sau4Kd84GCw+OjCinnwbmSOXlEAieuQjc
	yKfMwYsxsBUuIhyEzslJlMbJeKAkAwLXoiKWpPRW3TfqET/VYrU7kiuf8gh+qWFZOifyiqDqzX9
	H1rnSC+2rA4nuMsbp9rRSCVpZrftsQvLDhgWYhQ4T3TglLgRJ0BCLwZzQJxIyx3Gy457HTQ2H+V
	+9dlPVg3ZPgTvhndP5JD3ZBWTPtru+m1RUUXjyDbfj7J2u7uJwGtfnieZNeXIYIMZdU9D5BVDua
	13lB+LpFeqPD0HfXt+lhicSj27+0OgSUbEPulbWS489FUQ==
X-Google-Smtp-Source: AGHT+IGQ5PR82cMFXIsPEja5Rl1PnbvtKofbUp3RjtQReEYEa0n9aDLlqkOdSSEf7LtARguXmUTwww==
X-Received: by 2002:a05:6402:3714:b0:5d3:f6cb:73e4 with SMTP id 4fb4d7f45d1cf-5d81de1c236mr8514264a12.34.1734887159497;
        Sun, 22 Dec 2024 09:05:59 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe48d6sm414056566b.127.2024.12.22.09.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:05:59 -0800 (PST)
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
Subject: [PATCH v6 12/18] dt-bindings: clock: imx8m-clock: add PLLs
Date: Sun, 22 Dec 2024 18:04:27 +0100
Message-ID: <20241222170534.3621453-13-dario.binacchi@amarulasolutions.com>
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

Though adding the PLLs to clocks and clock-names properties will break
the ABI, it is required to accurately describe the hardware. Indeed,
the Clock Control Module (CCM) receives clocks from the PLLs and
oscillators and generates clocks for on-chip peripherals.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v6:
- New

 .../bindings/clock/imx8m-clock.yaml           | 27 ++++++++++++++-----
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
index c643d4a81478..05bc01960045 100644
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
+                 <&anatop IMX8MM_ANATOP_AUDIO_PLL1>,
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

