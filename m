Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4051925B6
	for <imx@lists.linux.dev>; Sun, 22 Dec 2024 17:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734887146; cv=none; b=Yf5+o7oTSE06V8dQ78GY5hCnYDPXM+PKqUuisMJH+6Esn+Y24+iTF98e2eo4rz8UW7Vr0rObA6OAYEyYEm29wuw0ClsNxs6J2CRyzF/gezbt2S/ZAUNxKTE0xDff2P3HX9FZLBQugbiMKvTgS2l2Wj6lpFQDtrQ1SpKkUtaOf6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734887146; c=relaxed/simple;
	bh=n6yoYjnKbi5rVHTB8jhSWowc2EOzEGWibaplsMGisVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cNxORa642BdQQzAwJU0H649myhjFfds9zBNiH8HWj3nLEDLcAj67xY5MZC9UxcETo47DBHs0X/rZIyb5YqUFNwz30yFDj4EUg0me8Xuz89iJ1tIMO9IDqStL2kIVC2z4NFtg/fXXzOdHsavb95gsS38qEPEFfhe+t2Dm5f0Hv1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=fkesvM7Q; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="fkesvM7Q"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aa67f31a858so615663366b.2
        for <imx@lists.linux.dev>; Sun, 22 Dec 2024 09:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1734887143; x=1735491943; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RyU4lCuYuLHxLX+AwXcVxyfMEtnFlBSdsy5ZVGUKyRI=;
        b=fkesvM7Qw+fsl4DDTsjkkljczIQcVhK4HlTwtK3HNUTAJWzELobnQE1zykLMKnJCQp
         SDXBSRsht0HblYFgd3iOapBD2iD1OKLPf2q5XVZxtrSwkKbqwDq3n+1jL7vkv/rdvlzE
         5R7YqNK4MEanSmH68QAX7lGChwfatCX4mGGEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734887143; x=1735491943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RyU4lCuYuLHxLX+AwXcVxyfMEtnFlBSdsy5ZVGUKyRI=;
        b=nBR3giivGDQChyXD4BV81c4zCxk8DcsalkF7+/kCH2fiFoLeZ0I05x3ZMqW9Pf9eL7
         13p8F5I/bJpbN9B6HpR9ydLWl1U8bMBzpBWPsNhEKDR4q7DVEN8JEhByoSg5PrSOqRCz
         Zjmdf+ZjlxxfiFk2gtnEh/zkqaZhvW1CKJb257a7bU2zXJ92auW61TQly7NEsSQnLRPy
         ni9PH4TZpUzc74eYuBEtYfrClYMhWIoh4RmjH12ueTnwJEgFblW1JjHtLmTb41czQgJT
         mMS8vq3GiFFNu3ibO9QvEebvzlxSzgWcuXKrc/z7umV6JSww4zNRkWTB2xVzyihpJ4Ko
         l3kA==
X-Forwarded-Encrypted: i=1; AJvYcCUudEVGpsFdOLioY5Sr6rmAikj+cnYXx9QAKjTgWj5LuTrOmOx3hh5c3CDWJRSFC54rlQc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyPOs6cssDnoj0D26QlWkfWTRAwdBiRWyn8q1r2waOlK83dfxWh
	U/7n8QRzrxL5ld8Trg1RD2sDKaq85OTEwWhsp95jDZgOhiFh83XkqhC/QsYTITg=
X-Gm-Gg: ASbGncuE44+8SjZ3+sNcHlPjKvOK8JgSLiuFJCDBnNm06J7f27xPFZ7OXjxY2rKKysl
	pROC13Z77sh0nw9WswgcUz4YZE1i51x9K1H63res/I6W8tAaI3/6DQnzzsB7XGgfU2h8fP8GlYr
	zkEaONDzEw10fVxiueOGPoLUYKTPm2fOqW8RE0bZPR1EFYw6PLViAYn/esP1NnQlJmehsjTw8bs
	pwqGvPiq6Yu+t30ijYv4gO++jVnxqB8Yw0e8CvDoEKCbRhq37aqtGUS8TI9xdmKhTdaQXJweCFh
	Mhpn1e+Qz6l5ocE18JDmlQ4EddxlFNrJAQ2SpU48iQzH6A==
X-Google-Smtp-Source: AGHT+IGEXEEbDuDzwKi4k+vJkd3SyYQ1mRIpjQ1XjrU9M/ldV4p5zj2O9ZKURS7MYfi9C41Ss0G/Ng==
X-Received: by 2002:a17:907:3688:b0:aa6:aa89:6d5e with SMTP id a640c23a62f3a-aac2ad7f926mr1174889966b.18.1734887143441;
        Sun, 22 Dec 2024 09:05:43 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe48d6sm414056566b.127.2024.12.22.09.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:05:43 -0800 (PST)
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
Subject: [PATCH v6 03/18] dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
Date: Sun, 22 Dec 2024 18:04:18 +0100
Message-ID: <20241222170534.3621453-4-dario.binacchi@amarulasolutions.com>
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

Unlike audio_pll1 and audio_pll2, there is no video_pll2. Further, the
name used in the RM is video_pll. So, let's add the IMX8MP_VIDEO_PLL[_*]
definitions to be consistent with the RM and avoid misunderstandings.

The IMX8MP_VIDEO_PLL1* constants have not been removed to ensure
backward compatibility of the patch.

No functional changes intended.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v6:
- Add 'Acked-by' tag of Krzysztof Kozlowski

Changes in v5:
- New

 include/dt-bindings/clock/imx8mp-clock.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/include/dt-bindings/clock/imx8mp-clock.h b/include/dt-bindings/clock/imx8mp-clock.h
index 7da4243984b2..3235d7de3b62 100644
--- a/include/dt-bindings/clock/imx8mp-clock.h
+++ b/include/dt-bindings/clock/imx8mp-clock.h
@@ -16,7 +16,8 @@
 #define IMX8MP_CLK_EXT4				7
 #define IMX8MP_AUDIO_PLL1_REF_SEL		8
 #define IMX8MP_AUDIO_PLL2_REF_SEL		9
-#define IMX8MP_VIDEO_PLL1_REF_SEL		10
+#define IMX8MP_VIDEO_PLL_REF_SEL		10
+#define IMX8MP_VIDEO_PLL1_REF_SEL		IMX8MP_VIDEO_PLL_REF_SEL
 #define IMX8MP_DRAM_PLL_REF_SEL			11
 #define IMX8MP_GPU_PLL_REF_SEL			12
 #define IMX8MP_VPU_PLL_REF_SEL			13
@@ -26,7 +27,8 @@
 #define IMX8MP_SYS_PLL3_REF_SEL			17
 #define IMX8MP_AUDIO_PLL1			18
 #define IMX8MP_AUDIO_PLL2			19
-#define IMX8MP_VIDEO_PLL1			20
+#define IMX8MP_VIDEO_PLL			20
+#define IMX8MP_VIDEO_PLL1			IMX8MP_VIDEO_PLL
 #define IMX8MP_DRAM_PLL				21
 #define IMX8MP_GPU_PLL				22
 #define IMX8MP_VPU_PLL				23
@@ -36,7 +38,8 @@
 #define IMX8MP_SYS_PLL3				27
 #define IMX8MP_AUDIO_PLL1_BYPASS		28
 #define IMX8MP_AUDIO_PLL2_BYPASS		29
-#define IMX8MP_VIDEO_PLL1_BYPASS		30
+#define IMX8MP_VIDEO_PLL_BYPASS			30
+#define IMX8MP_VIDEO_PLL1_BYPASS		IMX8MP_VIDEO_PLL_BYPASS
 #define IMX8MP_DRAM_PLL_BYPASS			31
 #define IMX8MP_GPU_PLL_BYPASS			32
 #define IMX8MP_VPU_PLL_BYPASS			33
@@ -46,7 +49,8 @@
 #define IMX8MP_SYS_PLL3_BYPASS			37
 #define IMX8MP_AUDIO_PLL1_OUT			38
 #define IMX8MP_AUDIO_PLL2_OUT			39
-#define IMX8MP_VIDEO_PLL1_OUT			40
+#define IMX8MP_VIDEO_PLL_OUT			40
+#define IMX8MP_VIDEO_PLL1_OUT			IMX8MP_VIDEO_PLL_OUT
 #define IMX8MP_DRAM_PLL_OUT			41
 #define IMX8MP_GPU_PLL_OUT			42
 #define IMX8MP_VPU_PLL_OUT			43
-- 
2.43.0

