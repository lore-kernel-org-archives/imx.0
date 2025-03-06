Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D57220AF9F
	for <imx@lists.linux.dev>; Thu,  6 Mar 2025 11:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741260638; cv=none; b=FwZh0JlVyDw3f2kY7POXcD9OoaqKhCWvPfWXV7sOknPpuKN7oKF5x5RLxkuI/uyo1oo59R63Idqa/eG3jGnoafMir7V8pmcfLb9H8LNHDMVkDW4Ba2E7BmgiENXbOKrDCyp5J+cc7TJCJUukwdf6y98apVgvIGYA3ML5DizUh3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741260638; c=relaxed/simple;
	bh=+1wDCnUf6V6waC2u4F0CjceMoJUJQ3m5duPgNX1wMjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WhorprIiBJZyWXpPJjTH0P2ps3fce9q/1guulJCUNaSPPvFoNlHldNmpub3nZEp2jyyHsRBvE5ppnUTrHoV5Xz6giAZj6v82yLlR9a7qjjiqWKF6toJCb61PwEqTWR7MRUT5udDxusHHMLEPTxGDfOBYLqYXlWBM6NJsQfqS4yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=heTX/YFf; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="heTX/YFf"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3912e96c8e8so225261f8f.2
        for <imx@lists.linux.dev>; Thu, 06 Mar 2025 03:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1741260634; x=1741865434; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0D3K2ln9Lb+MNQxN4twGUjq+Zn0uEKE9IsRwsBI/jVw=;
        b=heTX/YFfmS+LMke99hm+CTnFsNbfIqkBq3nd04T1FXiqkCMArbmob/AThJuIYhiY44
         azfA77aYXHbb5HbVU88gbXJ01N3OYzVA28atpOOX8cgbsX0O6Z6Vg2xN8QFwE1O8y235
         m7HRHW403BJH/oQ/7GN2bFyldEta35KsMO1Ls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741260634; x=1741865434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0D3K2ln9Lb+MNQxN4twGUjq+Zn0uEKE9IsRwsBI/jVw=;
        b=f3FJqBcEz/xahT7Qtzost+C24KFj+q2Hlm+eNwbQH4X7C8ktPJCqa4G13mCqA8bxeW
         ww4tJ8cs5H3799mH7gdThikrzDLTBRQ8XvAbuRmRhei9WI4sAmxqsVJnm7VUVyb1flFa
         3gwJweXUQ5JjSFZ4MdN+wsDZzyBupxPfccuEkC2e/FB/dcYgq4Nt4Yub9ASRyn1qicep
         cJQ/G/a1RM37eQRvmg0cx8UTO+Ixvy2px+FBOrnD/MMnzzGLiTWWp/SpxJ5pDPpvNKfj
         eBB9OGLOmxHeDjm6eG7f5E7stapfPW1px9lkc3j7VnRxnDjKl8A780S49R9HNzdVk9zr
         5VCA==
X-Forwarded-Encrypted: i=1; AJvYcCXRyOYKqW7u5tvBb8/c+KTgnUXurRRZx/RAiwJOLBfEbDkYbrkgYogQQUeFRy2YZC5Nt0w=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/GVm+QmEL0/dvyk8wteNdTGsgZbKRzXb2zDGejuTxUAE4XDds
	lrWNPETasoO7jud37zSLF8m4bhhrK/+ZJ0c6nRM7IwjkzFrqGNY4uzRUPCKBIiY=
X-Gm-Gg: ASbGncvBj0qh4obBgJzqRVCM1jO0SNe2Dz/jn7Akz9BwRtplq/ez25wzISuDX3cEeB7
	Ne3Nr0tmltIKqiRWxNRjOlKpHuUKvWxbbWTWSSTGA437aHE8R8i/04K8tvf6Wu1NBCnP6/lPMuv
	ydnCTSWmVluiEFiPfPhmg0ZACEvF3VCVFf9XpvrKMkWcPbwHW3yttROjLsub0Ls3RmO9JMilzPR
	OGTg2z/gEXNtiGE2J+VcP3b6Fd4AiyH3bAGbqxNIOybg6bLizXl8AdKAElaz+xnT+JkaGEJJdms
	T1BI9JqUKp7Da69WonWIYilOK0Y4MZToKq+qcE5K8JpnRsgopvdQao44sgkVAUndOi3rmadBtrJ
	Nzz/PEg==
X-Google-Smtp-Source: AGHT+IE/gkxbTJgrx5WsPeKouxumhVaFZMtJX0zav5Vxl8++ByMzD32+sUdGSHcbzM+0gAmJx3MEGQ==
X-Received: by 2002:a5d:64cb:0:b0:390:df75:ddc4 with SMTP id ffacd0b85a97d-3911f7cba2amr6815821f8f.44.1741260634196;
        Thu, 06 Mar 2025 03:30:34 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:4703:aa8c:6eab:8161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb79b9sm1749650f8f.3.2025.03.06.03.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:30:33 -0800 (PST)
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
Subject: [PATCH v10 01/18] dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
Date: Thu,  6 Mar 2025 12:27:50 +0100
Message-ID: <20250306112959.242131-2-dario.binacchi@amarulasolutions.com>
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

