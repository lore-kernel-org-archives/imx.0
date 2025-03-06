Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96847207656
	for <imx@lists.linux.dev>; Thu,  6 Mar 2025 11:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741260641; cv=none; b=UAmGS40sOvKh6aEfuhSe09M48eA1KP3aKshWNTgi9tXwzBlapw1LKrSYUWXljSSL9AzMuNrRGYsP1O9nK0codzCFiZw4kkHQKIDujyUf8wYiJ6UUAEvxTxE57zi1rtAbBvEXwUJb1cCuRgderCjX2HJjD7dS5pleuAx5dHMyypA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741260641; c=relaxed/simple;
	bh=xUBRrkr1aLPPwLeMGNd5Xto6SUkG0PhtvIzCxxAX118=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ucreOrccRTBAwRfUfX6r6rpwT/SIqYDm28esaPWAGK8942uXpVQfEijF1/U2hUHsnuN1Jd9rNispcUnOe6VcVfAOTfB/UqYpsG/BFTcTYLbxesMF8TKdtdwN1vyrOJlZOhmn1AIypV5I0taT2FETYBFsKH+AzT+bwovioE5Y+cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=l10jfud9; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="l10jfud9"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso386357f8f.2
        for <imx@lists.linux.dev>; Thu, 06 Mar 2025 03:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1741260637; x=1741865437; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8/6J4AE7rdE7DvbcqL7lv8LvF8nVi/MJUfgoa9DfhY=;
        b=l10jfud9YKNkunGl/WVFaCDhqYYp7ushBlymcEp626aomk+bWLNKxBgMbX7m0Nmk7v
         SmAJjBDoXw0nQPX3syEn6S0abQSalJAi2vGwK3bVk9+z3O1HgQzjWqA4DrkQQQGSSF8m
         018GLITUE/lBXWerBQzjaIjSgqtwz2qvFOSRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741260637; x=1741865437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T8/6J4AE7rdE7DvbcqL7lv8LvF8nVi/MJUfgoa9DfhY=;
        b=iFCfTZbmkYLAGbZ1gR4kY5ERZU9x3hFaqUBWWPWLloGxChxNRklHDL6Lwr4OHWIEjk
         1X0DFlb13MTcSDgwDXiy19bpBydR20zFRQU6QZ/MXzw6JggqNAIdVGiUQmllRBHyZhrl
         UH4h0qBA7zvysW45smw+zf8nHSS0pmyAj6FDuqhisaXxR+jqgGo9X4l5M/VkNJe24V8+
         Lt1bygluKPOY4Hd81YzQBT1z41vn+S0FC+QEwGfjfxyu9e2juu0PqKljm8GF00chxOKE
         sO1QUn28CX5JtmrMyPoF2OPVHYqiu5xIHxyBnHOG5AfAOdYrOWHH46PjZHs8kddTr03Z
         bg0w==
X-Forwarded-Encrypted: i=1; AJvYcCXP0PcmdNyZQZ/D7dmhih8tA5dPnmBWf0stqislaV5M8C2aQcs2oVR3PJW28bgCQT0jsEQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwN5uGIM+/XfvXajGfZnWNSaQSA3qD8T3H25QB+WVs0FaRZVWA/
	QwCDpBUz+YFqiTUnyPuvSyT3RmyG0jhAd/0/ranT3BuOHaam4Esv1cGOdryvj20=
X-Gm-Gg: ASbGncuWRe1DlFve7JleXOIPS/33NAVY0JUoTMXIfz5KgidN/IhKkbie0d891nxEIae
	hnU5DI83NcjWlr8tQHwFrVEeCxmU/MOiEWczGVekTQxrINq2VTX3Wfn5IId8ZbZZkTBn309Shkx
	9tfwVTbutN+oyGrYzJTVsyNcBUjzGrO+QADbJgmKUp2UfBAuHC3nmpAwvFVIgiyxBi5f+WwD4mZ
	6VDQ27gLnHU/OY9QFTHec0j6ymPvTM2665IHs9WubOz0OfvUlOKuuqAvz28RC6qh7kb+sEZET0g
	7A+Rb041BQ1WqL1lCIkj1T6FcJyGaM+ntgufahisFYrXsMuGfZ8zdg7hv6no3Lq8+wrPiaQVCfB
	R4TT/EQ==
X-Google-Smtp-Source: AGHT+IGnwsNJxAKDrbK2kKQUMvhybDoBV/jgl1/I/PSi+Fn1DxAEWp8gH/c4FLNEhP/j536e3/gNkw==
X-Received: by 2002:a05:6000:2cd:b0:391:13d6:c9f0 with SMTP id ffacd0b85a97d-3911f7bd651mr6196780f8f.47.1741260636943;
        Thu, 06 Mar 2025 03:30:36 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:4703:aa8c:6eab:8161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb79b9sm1749650f8f.3.2025.03.06.03.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:30:36 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v10 03/18] dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
Date: Thu,  6 Mar 2025 12:27:52 +0100
Message-ID: <20250306112959.242131-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
References: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
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

