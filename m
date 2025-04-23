Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086B726657B
	for <imx@lists.linux.dev>; Wed, 23 Apr 2025 06:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745388183; cv=none; b=iXKy8+B2pNz85G68Jm4MiR1DrUNfpCM1nfjbmN0gXpzoLt5Ty3G+Io6vohMagSV7lff2PHyQV3AzIRKIgmmPew7qb6m/LLgXEruV6USH3ZKb45f6KgFYzQsfcI/6h743pcJvWnfAxVIyymMXFV0KcMW7o4/+G0TjOOoKQjUX+7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745388183; c=relaxed/simple;
	bh=xUBRrkr1aLPPwLeMGNd5Xto6SUkG0PhtvIzCxxAX118=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bw2ljwjWa1bjswSaZuD0o1QpmzrwNlgKBkxYGliInr+MO88cN4r78vjW77vKJdEwan2UcRDktK8vc5N9paSlEDOdPJKAokXMlq2g+azWHCr1UARNfzMzIUPZPzFYp+EVFHrwlmN4bXIy4LX5jXVN0m8EBoykBViLNmqxK2YOaok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=duTO4KF8; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="duTO4KF8"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-acbb85ce788so440631666b.3
        for <imx@lists.linux.dev>; Tue, 22 Apr 2025 23:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745388180; x=1745992980; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8/6J4AE7rdE7DvbcqL7lv8LvF8nVi/MJUfgoa9DfhY=;
        b=duTO4KF80jMgnxFBNq6LytT78f6hx704ny6C94oib7yZIKJ9YY0V3YMaMuRfmwiVMk
         D+6H8N5U+sJ/i5WsCBKWNFvcIfdPKUxsTWqrlISYyo9gbIr1gwKARh3Yg1XfEYaXO31E
         cmnguA0gl8n+nj9u8UfkEPNmaUx108IUHspF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745388180; x=1745992980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T8/6J4AE7rdE7DvbcqL7lv8LvF8nVi/MJUfgoa9DfhY=;
        b=aOGUwFDOFU38f1u3DngvPrRCK4Nu5THJlmF+0GnBCUdugFCu2iTOZKnrk+GSatcT1l
         YqHz7dQGqKIBqGYSnGy+fGX4Q3Gi7305p3JfqJ/gUv55d7QicnHu52yc3egTBEnwZkWG
         abxq79v0eGTUhUCaahE01KX7K277uUn6aHikAS4apHJkN4N+rckvyeDuoze9sTCUCWOn
         T4VBAuuhnOXt47lYtgHrfz1v2f08STIk0BOzkKcyPmyro5G+lQDYkbHNfBGadeKqHLiq
         9uCRe4SE5dBxjZBaFxVdLAcxLH0+Ui/00dLcS664IaID6ctwO4pH5XdqrvYkyObqZbL1
         3kuA==
X-Forwarded-Encrypted: i=1; AJvYcCXvPXn/PzLvji6XiO85xkja7vXrbRADNQkodB6fRTyDEYWWIAMXM9P20BH3avOOQULOiOU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwhyLRVQqheJLpHARNmgKcHC2fGccZ5CfAAH2Y2hmNXTi9luWv1
	ulIOIRZsffT7xhYi0P0ZK5MRbey6h8d6j6wpjLMqv48Qm3WFm7qtewA8gJ6sNKw=
X-Gm-Gg: ASbGnctXzwyLGlgzobi+2mmpw2xLLhZi/auKNPCMpglVytnEKeckkDDX7SDDxoQQ6Nv
	pF0EY4dOyW28GTBaKU/WP+aQiQqfVzl7x+eLrRrLgQoux9YiRrNkQfPBdmGKdionicKsVq8WIza
	PqhC5ZiUTn+scw6gq1ZvbbUmiO6l+Z8QXEYzCPb8BxBTzhcXa2AF1kE3zGy5wVNNgnYc97X7r+y
	P6Ya0LT7XJ+O3YACzy9dBmFyHsE5+n2Vy3I7dcq4gQ+/Ym4ihkG6RxX3rsaYDodWHc4yd63/51g
	w11TGZ59wX8xotFmzOGTUGZ+OAQ5D3+LKV6yVroTgeY9/l6jpzuHGXPypbzmUNITo7N49kJIvut
	IVbVJ
X-Google-Smtp-Source: AGHT+IG7e3Q3dj5KdFkcFK0kkZNsQ7n4rcyUNpetxzkW6OWRUCissFclqwW1aRy2urkwgRK2/F5w3w==
X-Received: by 2002:a17:907:c807:b0:acb:bbc4:3344 with SMTP id a640c23a62f3a-acbbbc43a1amr550390966b.22.1745388180459;
        Tue, 22 Apr 2025 23:03:00 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef9e7e6sm745234366b.162.2025.04.22.23.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 23:03:00 -0700 (PDT)
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
Subject: [PATCH v11 03/18] dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
Date: Wed, 23 Apr 2025 08:02:20 +0200
Message-ID: <20250423060241.95521-4-dario.binacchi@amarulasolutions.com>
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

Unlike audio_pll1 and audio_pll2, there is no video_pll2. Further, the
name used in the RM is video_pll. So, let's add the IMX8MP_VIDEO_PLL[_*]
definitions to be consistent with the RM and avoid misunderstandings.

The IMX8MP_VIDEO_PLL1* constants have not been removed to ensure
backward compatibility of the patch.

No functional changes intended.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

(no changes since v6)

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

