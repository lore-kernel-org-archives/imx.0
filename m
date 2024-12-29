Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC44F19DF6A
	for <imx@lists.linux.dev>; Sun, 29 Dec 2024 14:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735483859; cv=none; b=VQiwOAzLyBalTGFgX7b56Nav0BF6f6A04jHelldXvpB7iQbLgHCpiRqQNXPXHxJD4T/TbdA7GzN6uZX9jzZwrVa3b/2EhFy6d0DD+m6u4tDEea2rvq7VdQVWQVM5GZ3sV0dnRwMvrmcIFuGD+odAioN9KqqVqPe02MBA3yPwXN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735483859; c=relaxed/simple;
	bh=PC1buv5hYG2W3S8/eU+2VA2jywMzm7Vv3xQppQcKsGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BWwwdrnh5vPbrSiGilCvBvBb40teFkAivgjrpJGkDuO5I4PSr5MB2dyDcmAxI48TzM6Ek5OzWCa9zC0EQo0OybDVcOhJZCZqNwQ1kPhIdJFJ9tHMjzGo8AVjGOfO28jdN9c6Z39434I8Win3X5t/NPOOHm6gq+Oef21qGCoOgUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=camy7etf; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="camy7etf"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaeef97ff02so714221266b.1
        for <imx@lists.linux.dev>; Sun, 29 Dec 2024 06:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735483856; x=1736088656; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KTPitaOd10kqEMh4mWJPB1Bs0wTX2XDIfABV6gUcV0=;
        b=camy7etfedTEvsV4Zrpm8B2gGqkBCS4QZoUJ6Weg4tCjuCCP4W1dsCWuS/CmKQ2N/d
         B9dTFFyzFATZtzNRwgcByJ8trXWKwgxAB2m+5V+xlnhNpb08wHXXXvdMG42k7b2egXGR
         qPLakUrZEBPMjzCa9Ah79g/nkfFXmY43B4EaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735483856; x=1736088656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7KTPitaOd10kqEMh4mWJPB1Bs0wTX2XDIfABV6gUcV0=;
        b=l96XwYs4LdPBhHvGaUHHUqST8LV6nNKXjtT2cefldr00390q+x92fFmYTPEHgg9S1E
         i42QsE9FNhlHHkdHHzkFAMbKi2BfRFAeIrUBlBGGNdcdEMYhhg3gVrRVIfclT1oEp9tN
         GC8sUHzLddULLjX7HmbTmRRbhorF912K/DL1/a9kr27fgGiIJ7FQFyXN2Z0Nz/L+WJb8
         IMWpy9GLkxMArhjIHa0iJMyDCWqVbMmD03n2orGQWPLtAa8CRTROMn/HxEqAX66Vf9jt
         VjNkFV351dcfrS4SMHZc4AJpwROBPEPuykvK4PNfDS7Y6PeegZDOJsEXnM/6JdsgEjpM
         txHw==
X-Forwarded-Encrypted: i=1; AJvYcCWP5iFr8KmgaQU+Tx2IMTkPNkvWslb2WtQCUk4Wr6x6qsblBwppGK7hK/Kyq0rweqBDQsw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJDGi/VJ7svpXq3YRcL66YZzdlqdP0VC9KEoZQlTrItAKEG6Uw
	xD0XjKs9dnnJyL9oiKr0KWjrDvJX4KqQIQf4XmW2/5aWeqcTIsMaAEWm2hUeMes=
X-Gm-Gg: ASbGncshA5P3zcZJjVX7RfTTJjgEN7ilWnFe72YXfxhEBUh2pauOBCplRr2RsEKPFE3
	Up++5PSZ7YNkc7eTKkC4WNPivUncQL661xYker18w2029b+IO8r3o797Am2Vp3j3umjUs830P+H
	agDmNCSOrlivxl9bGWNuKV9nSaLNTbxp/TRQtFINHSJ82SFYGuNSwV+vsCXGYMA3Y0sVgomjz7y
	14CtJMl1ojvujxZ7m+KV14FXBOLvDVNxqvozrl9pcQsL0fWrKI35WRqRhKALGyfVpuT3635+RcS
	dFHc2pGQxQOvpaRcqPotvw==
X-Google-Smtp-Source: AGHT+IHvQXTsCcZJ8CU1KhAq/G5BDJIBlqOMAEAV9YW5qQI6LW38CUK2eUxP4LJJg+eZZRtCwN8OPg==
X-Received: by 2002:a17:907:c1d:b0:aae:ccbe:993d with SMTP id a640c23a62f3a-aaeccbe9ac9mr2338346966b.35.1735483856193;
        Sun, 29 Dec 2024 06:50:56 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e895080sm1362084466b.47.2024.12.29.06.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 06:50:55 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 15/18] arm64: dts: imx8mp: add PLLs to clock controller module (CCM)
Date: Sun, 29 Dec 2024 15:49:39 +0100
Message-ID: <20241229145027.3984542-16-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
References: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
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

 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 0b928e173f29..eab05170442d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -751,9 +751,14 @@ clk: clock-controller@30380000 {
 					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-					 <&clk_ext3>, <&clk_ext4>;
+					 <&clk_ext3>, <&clk_ext4>,
+					 <&anatop IMX8MP_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MP_ANATOP_AUDIO_PLL2>,
+					 <&anatop IMX8MP_ANATOP_DRAM_PLL>,
+					 <&anatop IMX8MP_ANATOP_VIDEO_PLL>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-					      "clk_ext3", "clk_ext4";
+					      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+					      "dram_pll", "video_pll";
 				assigned-clocks = <&clk IMX8MP_CLK_A53_SRC>,
 						  <&clk IMX8MP_CLK_A53_CORE>,
 						  <&clk IMX8MP_CLK_NOC>,
-- 
2.43.0

