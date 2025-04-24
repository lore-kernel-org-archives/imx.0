Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDF7207DFF
	for <imx@lists.linux.dev>; Thu, 24 Apr 2025 06:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745475756; cv=none; b=okV0rQI1trr+cD7/5DjKTTVo7NYzE6x813MZ9Jt+giCd2c/ZVk79xqmBzn/DxVp58E3pOTSeYlOpw40ntztFhC/Ea7WhjpUPXRkWvTfKxX8XJJI2B9GN8PV/jo7ghP5hbMMc8GmvyaFGTSfQ7daHDkt6YkoYC1+WBwLeS5l1qKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745475756; c=relaxed/simple;
	bh=7yYZJd86bIYU+vT8RAjY7wEp1oq0Xfmfy1RQITDVRe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d5mQnI/TkPKSSDRwSbAMirwkFoYeI1WC7XiuErAhlNUk2thZ7q60nAPyqlViSTCOfYAR/+lDRcVq/FwDZ2OPMuBzZkq7x+TSkNA0Y3GnhMDuO4VYTA6Jd3g7ASgyd/0Da2Wm2+gQurhyZoXt/w61oHTsYD5SEEodj49N5aYNWkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=MjiG4gIJ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="MjiG4gIJ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso5005145e9.1
        for <imx@lists.linux.dev>; Wed, 23 Apr 2025 23:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745475752; x=1746080552; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8grfYWwIX4hpiA7jlx82Mk2yoAsYJcNHuOuvJvnYwRc=;
        b=MjiG4gIJKaSDy2eT81ZgtpqWaqXevc/Vb1klANSm3AmDddu/3kKd6+dm/EBstCx8DQ
         bwP8pDsoZdeOsZ1A1Ic79VFFG30ABQqQbmGggGnYgF9Lj4ZuETQnpkf6Ih1UtP57I1Wc
         Qkf6TJZ+KXccHoxJFd8RcrPEjOvrXJK6O6Lyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745475752; x=1746080552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8grfYWwIX4hpiA7jlx82Mk2yoAsYJcNHuOuvJvnYwRc=;
        b=HrkFsFKmHx3WkDKcqljxan86VjHjqkW44y2j2sgQODpb3K9+Rthj6/NYSnl9VcWPQN
         UIcBmV6yifPsKnPUJDoYz9zefUp3Zles364sh33LpqYYUgG5ANZne6SoVcgTd8TSTVwm
         +0kl5iSaKHKUqWuUB9xCZsgGc4gXsSTWJeNIrYOE/CyRqOWKeHDi4udjbAzPJh5s5WtM
         9sKuUVI/g/IBugKxcYBiXzf57cUCS+ZxVknKLtAo27RjCESsghW+d82hv/zTIChB6Sgi
         g/+Of/WMSjWWE0WNu7DYLeq+VUvBkCH8vTqUOrBHqtpkpJGcuSSp9N5LHgYjrxHGLutj
         qHtw==
X-Forwarded-Encrypted: i=1; AJvYcCUvF39iYOW0uHfKM9e68ufjUWtGofwv3GNlKJznNTo8NzkvMaiuz7deHRMVBfjXuvyJWRs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwYdMLE76L0WvOBmoFz6n+R3Y+qfvDZx1oOgow6IpMyn0XEm8+t
	Ho5VJ4pZcdwxNJ+1YOjBiX3vBMUns3aJ1anQrMmC3riIUEcQkbP67aimuUufl6A=
X-Gm-Gg: ASbGncsGw5Jv8yQeemaKp9ArcMYWEoIYCifx7/jpR2U1UbS3rAAHqIbDfgl4QPlBPpV
	opAx95DN9WJ58tFskELT/bU71eUu6faOgdXtUxzEp0p4T/gE9g1RCmgp6wtbK3vwOv+txGg9Zep
	I7maKB3HHUMlFrntcuGyY0AY94y5maliu+yAjR2eDz0ECSaNpxF2NHzB3dOPozJSmwndoxkdXTu
	11kxQAsi3Dr26sKQ5Nruofy9PphDUbTwpfr4rqA/NOZITf+7rWGwJTdKLWInJfqdn1wRTqzIcny
	8Xl8eA98DFwDE4PkksmhEBOYFwrJ2B9vKgVcsSmH9ctnNFiIvYbgXiT3p3JEIlzvRPjjbD/bYeR
	1LWPs
X-Google-Smtp-Source: AGHT+IEM0/VMCcdJocFhRZ/eLD26SRY/PzYxq7+AJZINwcLXa5TSv1nOFj6pBR4AmZJ1H3dAT+70rw==
X-Received: by 2002:a05:600c:4693:b0:43d:b32:40aa with SMTP id 5b1f17b1804b1-4409bcfc1f6mr10567655e9.3.1745475752419;
        Wed, 23 Apr 2025 23:22:32 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2bf8dbsm7243435e9.35.2025.04.23.23.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:22:32 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v12 18/19] arm64: dts: imx8mn: add PLLs to clock controller module (CCM)
Date: Thu, 24 Apr 2025 08:21:48 +0200
Message-ID: <20250424062154.2999219-19-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the PLLs generated by anatop to the clock list of the Clock
Controller Module (CCM) node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index 49be492b5687..01013c1fd61d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -643,9 +643,14 @@ clk: clock-controller@30380000 {
 					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-					 <&clk_ext3>, <&clk_ext4>;
+					 <&clk_ext3>, <&clk_ext4>,
+					 <&anatop IMX8MN_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MN_ANATOP_AUDIO_PLL2>,
+					 <&anatop IMX8MN_ANATOP_DRAM_PLL>,
+					 <&anatop IMX8MN_ANATOP_VIDEO_PLL>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-					      "clk_ext3", "clk_ext4";
+					      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+					      "dram_pll", "video_pll";
 				assigned-clocks = <&clk IMX8MN_CLK_A53_SRC>,
 						<&clk IMX8MN_CLK_A53_CORE>,
 						<&clk IMX8MN_CLK_NOC>,
-- 
2.43.0

