Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499EB1DF73A
	for <imx@lists.linux.dev>; Wed, 23 Apr 2025 06:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745388181; cv=none; b=Bc+LBfaugCAcDj2r+abChmPBZgSKq/o9BwHd6QCgcL7n2okdtBLvrCW12XPkppdZ4it4+rBeIUZZCnIPxWPFxkEFjqgddgAxmbpGedaCnlZk7jkVN/V9Lx6x/8AzsNaha97A9pO/s+txNVwFWW5RDrQsnzLKBvG7CXB3p8Ghubo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745388181; c=relaxed/simple;
	bh=+1wDCnUf6V6waC2u4F0CjceMoJUJQ3m5duPgNX1wMjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ieNaNmRIIbOk+dgmTYiyOxkYiEXnKmb7AFWHh8kT2CgYhXr4OZjW49VgeYJ/nhrlzemfPl35HF3fhk/YH5fpFdyHCsLdTSizjrUv/hQpy9ILAUPxGLwUi9HURzxIqwV5ap5kz3cYfGf10Dm2Ll7Q0Gm0q6/y+jBiIXCZ9iwUgX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=CW5VPv8R; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="CW5VPv8R"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac3fcf5ab0dso912005066b.3
        for <imx@lists.linux.dev>; Tue, 22 Apr 2025 23:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745388177; x=1745992977; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0D3K2ln9Lb+MNQxN4twGUjq+Zn0uEKE9IsRwsBI/jVw=;
        b=CW5VPv8R+qKeWbYR2JFAlB9q/tj6ZUos5qMcAwi99ljOxRm9B7AvhUtE6Sllc3I4HA
         Sfr6hiQ/TyybzLhFsRDhzHN0xTTdww+E+9HNfxkXUIYV3Xs/R+y4BnlCJOXdPlZYIOiW
         r9M7lrN7DB0xoreIQhfUOkFK+Kq38zsm8jvHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745388177; x=1745992977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0D3K2ln9Lb+MNQxN4twGUjq+Zn0uEKE9IsRwsBI/jVw=;
        b=Tl2dz7LcdnEH3G8UYjgeIjkzghIsrLJDyzS4vzC16IPGNNs5LOoLAHa5rre1QFCDmf
         1qmxZ8E+ZKTrlBFR/R/555TlIZLxslXpdBOf47/jow8xvfxmYujjLdoeboKH2QYZnfzg
         GNR+SrXeI1VVsYXOqDzLwsfwSq2rFVqvybqQc0bd3camKMslGzMt853KjTa5DyhaAm6b
         RZBSodioq40xt0kjDIUyfft7yRQrGDfqQBcvqWGccOy3yG6O0mVZ7qehBI73zsq8Nzpj
         cdz3cGW0pQJd348deqC1EKMjixOQovFCMzw/mPT345a/UqXH32sFPFA/kEUB2+I6bk4g
         FQwQ==
X-Forwarded-Encrypted: i=1; AJvYcCX71NR1J7zKmPbmbCUdgQZ4xyRkrMn/vsN9Unx/IINauR3+jKWYAxpEpyA/2CuWZfu7rjs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzyCeUdxXdTBO9gYN+YvfK06n7LGpfOYqXg+HnvvzM/ZGU+7YAM
	l8eMy/VoTHz0NqgmZI1/Q/9rsHilW7YvWbDFfdW6y5e/2DL6UPV6E31INlbkvxg=
X-Gm-Gg: ASbGnctZwPSiy/Pbcms9CJZWdUO2Yd0hB4f+Ky1pVJnkS1EjD4pTzcx1itmZjX2brn8
	VqKXcJERxgz7iNfXKdHBc8zwh4mydBC8Y1eE2G4d5bNgGc6QjJamkgkJX5JsisUH7ufBxv70NRf
	kpNwsf3b0fg79NYOwZ4/qV7DvMcRQI79E4b6i/uQ14yxx56PKE5pAnmAvDSDrOv3chhDT91Q4Sp
	WTUBmkEWE6VpNq+j1cOWmJqum3EfCBPQuEhj1WaNgACqUi0wLWL6pK/iH968l5ej3nDwH86ETgh
	mm/T9kPngASIn7qDrnUapccxuzR2MCkLTsTiUsghMgEerQIfGOG7QV5k5i+7famZsmNyaTQOmvI
	8+NdWFoQ6b9OOT8k=
X-Google-Smtp-Source: AGHT+IHHI/Ae0cN5rkqgDoL4MALbmLyqGqjR8G5Zysx6M9ySgMiQIXVA9Mcxb72+usZBPZS4gYqX6g==
X-Received: by 2002:a17:906:ef05:b0:aca:db46:8170 with SMTP id a640c23a62f3a-acb74e79d11mr1536173466b.60.1745388177443;
        Tue, 22 Apr 2025 23:02:57 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef9e7e6sm745234366b.162.2025.04.22.23.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 23:02:57 -0700 (PDT)
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
Subject: [PATCH v11 01/18] dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
Date: Wed, 23 Apr 2025 08:02:18 +0200
Message-ID: <20250423060241.95521-2-dario.binacchi@amarulasolutions.com>
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

