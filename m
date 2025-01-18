Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C29818950A
	for <imx@lists.linux.dev>; Sat, 18 Jan 2025 12:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737204060; cv=none; b=HaqjNPu6UDdJ3+IwthgV9rEQoYqPcp3Kzu3GI9PYgGATOYg+Tk/v0dbfTxIJgzt2cOhMtwYvvpknaGQxdsZDIvOSNwkq7FkCMHMXcnweH4PwsEN/2ZUFYbFQDj3LrtY5vwgOTfiV3mGoBeieBRCKNPsGkLE92Uu049r0Jqkmouc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737204060; c=relaxed/simple;
	bh=+1wDCnUf6V6waC2u4F0CjceMoJUJQ3m5duPgNX1wMjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aXwgI0kQiwDjtOeGat6OCndQJ6xvjR5EfkBu8EWpaaeR9ELegYlZCoX52LPGVDZAh4UvhapaHymxgFKYEPMHwa0RYDUcRM1w7dK9Ge61k8jmjX/WBT9hNANoOFxsxIPNjmfRdLp8m4xp4zXROrby3pQ1mGTKsHeChYzEJ6ty3CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=nujqjDvo; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="nujqjDvo"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d3e6f6cf69so4771335a12.1
        for <imx@lists.linux.dev>; Sat, 18 Jan 2025 04:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737204055; x=1737808855; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0D3K2ln9Lb+MNQxN4twGUjq+Zn0uEKE9IsRwsBI/jVw=;
        b=nujqjDvo2t2tTlv6w7VCxEAHvo/xwFFLQxGyzZdZOghymRtYXtVXyuHeOV8otIZJsT
         cn8LYaY+VObDhqL9YRu9IepbKGI2wWQ+EZS+GM8YZKE20g3GRwdi7GvIJhoEB5HdWA+w
         HQGN6gY9Sclyu0V5YZgRcN+UnwonADs6Tj+JM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737204055; x=1737808855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0D3K2ln9Lb+MNQxN4twGUjq+Zn0uEKE9IsRwsBI/jVw=;
        b=bD+qN4m9k9eV2Iaz+4J0dk17tUXjBa5Xcfp5u/kD6H04HkgMN8kgX4Hnjpj5PZFk/e
         hjXIygQk/Qa0fkMwgSLWFHxCx/Esz+bbk21xkE7f0nNfsUWw5z1uU+9B2w8HzdDHIE3A
         +30tp9ePM6DLi8j5dQTDEJxr4X1Qifpr70OyqIGV7IngbvaapKsIOonWuzJDUMcClRjX
         cN7dMbSJUpmWcQV8Wp2PHqDK75PtOEcAKmof+et4LOCEJVy1dDrJ+MhTUaMV5cVOr9Im
         3fBHrQjao/tqE6C5UgAn8sefZGaVkzJZGXkWUwFBhZo8uUOB2IAVvpw7YEoq6xKLxcaR
         JLuA==
X-Forwarded-Encrypted: i=1; AJvYcCXf7jtfFjMRrcl7lSEbj/3YXyB4UpM1v7VgFYdImUq1Dh3cgL2ShbxdNlXfhsyLnMKQjMM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4NwXWbE0H+3SDmQi7YfMl1cJqoDclfu15Fuz1RRMBSlDP4Mb8
	/KNSpQMizD9W03599WTpNcsM0R3hI9zBmRWmeX6DP/fjatNKcMRifp9UaadqyDQ=
X-Gm-Gg: ASbGncv8ClAl6HBZQA/0LuXAwpjezppV6yGRK6K0/wPd2ifv1GBt/fHWdHvMxAtXKr9
	+vpgsVAzgrvFgExN+Q+DMuYvOhwaxdlEuW9TweXvgOMtgZSqm/Y0xxZxne3oV39tIQ94W74qZi/
	uFoPmv4oApNLbqlQpHWHViMqPIa3pbPAcXFHvswYETxJzD033+sT/xtk62Ll0h6944+UwX3HzY6
	AeuGhiQZSvZSiZtoc2QfRXRZCXpWY3/ywtBEEd01wml90W8NeuCs4HOFSLlzwyzZgFFnU5MtetG
	EGO120fbWjSXNk2dyZEkvdZrrlmLQ3JpScRSnTMlwRW4y5e7p4cWzSc/km1Rs/4DyRbFsc/ZPzw
	WXcSQfJslJa3s9PlfSNCqtp6+lYqz4CZ9p2vl
X-Google-Smtp-Source: AGHT+IFVLDpIcKBwO+dD+xXnPSPpQI/dJgVuL3F3TbrvT19fgtmNV4YfFeh1dKsUSaBkkFqT0HPP/w==
X-Received: by 2002:a17:907:72ce:b0:aa6:7df0:b17a with SMTP id a640c23a62f3a-ab38b29b08dmr748505466b.34.1737204055561;
        Sat, 18 Jan 2025 04:40:55 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-30-28-209.retail.telecomitalia.it. [79.30.28.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcd73dsm332562366b.178.2025.01.18.04.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 04:40:55 -0800 (PST)
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
Subject: [PATCH v9 01/23] dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
Date: Sat, 18 Jan 2025 13:39:44 +0100
Message-ID: <20250118124044.157308-2-dario.binacchi@amarulasolutions.com>
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

Unlike audio_pll1 and audio_pll2, there is no video_pll2. Further, the
name used in the RM is video_pll. So, let's add the IMX8MM_VIDEO_PLL[_*]
definitions to be consistent with the RM and avoid misunderstandings.

The IMX8MM_VIDEO_PLL1* constants have not been removed to ensure
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

 include/dt-bindings/clock/imx8mm-clock.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/include/dt-bindings/clock/imx8mm-clock.h b/include/dt-bindings/clock/imx8mm-clock.h
index 1f768b2eeb1a..102d8a6cdb55 100644
--- a/include/dt-bindings/clock/imx8mm-clock.h
+++ b/include/dt-bindings/clock/imx8mm-clock.h
@@ -16,7 +16,8 @@
 #define IMX8MM_CLK_EXT4				7
 #define IMX8MM_AUDIO_PLL1_REF_SEL		8
 #define IMX8MM_AUDIO_PLL2_REF_SEL		9
-#define IMX8MM_VIDEO_PLL1_REF_SEL		10
+#define IMX8MM_VIDEO_PLL_REF_SEL		10
+#define IMX8MM_VIDEO_PLL1_REF_SEL		IMX8MM_VIDEO_PLL_REF_SEL
 #define IMX8MM_DRAM_PLL_REF_SEL			11
 #define IMX8MM_GPU_PLL_REF_SEL			12
 #define IMX8MM_VPU_PLL_REF_SEL			13
@@ -26,7 +27,8 @@
 #define IMX8MM_SYS_PLL3_REF_SEL			17
 #define IMX8MM_AUDIO_PLL1			18
 #define IMX8MM_AUDIO_PLL2			19
-#define IMX8MM_VIDEO_PLL1			20
+#define IMX8MM_VIDEO_PLL			20
+#define IMX8MM_VIDEO_PLL1			IMX8MM_VIDEO_PLL
 #define IMX8MM_DRAM_PLL				21
 #define IMX8MM_GPU_PLL				22
 #define IMX8MM_VPU_PLL				23
@@ -36,7 +38,8 @@
 #define IMX8MM_SYS_PLL3				27
 #define IMX8MM_AUDIO_PLL1_BYPASS		28
 #define IMX8MM_AUDIO_PLL2_BYPASS		29
-#define IMX8MM_VIDEO_PLL1_BYPASS		30
+#define IMX8MM_VIDEO_PLL_BYPASS			30
+#define IMX8MM_VIDEO_PLL1_BYPASS		IMX8MM_VIDEO_PLL_BYPASS
 #define IMX8MM_DRAM_PLL_BYPASS			31
 #define IMX8MM_GPU_PLL_BYPASS			32
 #define IMX8MM_VPU_PLL_BYPASS			33
@@ -46,7 +49,8 @@
 #define IMX8MM_SYS_PLL3_BYPASS			37
 #define IMX8MM_AUDIO_PLL1_OUT			38
 #define IMX8MM_AUDIO_PLL2_OUT			39
-#define IMX8MM_VIDEO_PLL1_OUT			40
+#define IMX8MM_VIDEO_PLL_OUT			40
+#define IMX8MM_VIDEO_PLL1_OUT			IMX8MM_VIDEO_PLL_OUT
 #define IMX8MM_DRAM_PLL_OUT			41
 #define IMX8MM_GPU_PLL_OUT			42
 #define IMX8MM_VPU_PLL_OUT			43
-- 
2.43.0

