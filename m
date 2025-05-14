Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A12207DEF
	for <imx@lists.linux.dev>; Wed, 14 May 2025 07:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747206356; cv=none; b=OXEGp6Pli/lyVHXcCelSjDDmeUSkMXtkcs1dYZonqw3Ft47fOj9JOEvb7V9fpd+/OA6RIiXjUYAZPKcMgdRG7AfrvZJBig/OdwNm/5Ey36o1uBWtjTeTtWm7H/ZmILCbowbkAZCyZ+sM2fwSGnu4LCWIg7/xn04gxpxLyjVs3G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747206356; c=relaxed/simple;
	bh=grtG+Hf36RQgBxi3RgtBygizeBbvhLU0VbgEFlTLRYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oT+E2u2ZKUO7LKbEHNDcBF+lgof41sGb/2vLUxZmW7s/Dtd+kCydKi7XFR9JlMVEwaDI/W/vNbCyA4h7skp4vtOqPwMo8GGKxt6xrfIZ7abj+dhhI6N3qBkfYFmnWw76YjWrii9ARbBLpgqGm/Q6XKk+glmRMUhynOVKJ0lpbc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=UFm0cjxJ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="UFm0cjxJ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-442ccf0e1b3so74161715e9.3
        for <imx@lists.linux.dev>; Wed, 14 May 2025 00:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747206353; x=1747811153; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=asjqK4k1HFHU07fICU4xAQQF9W8B7Lab4LvrCMUtqn4=;
        b=UFm0cjxJnLCmRwS0pYLnDYtNRpHnWKTqszjs/VU56OgFtuTnb+FDnWBw7X5weE5lB3
         p98IMuZbpsKHy5kx2VolK+5YgzQAYJxHRedtSraJSrlvM4+/xmt/9ApcMe4e0Rp0NXzr
         QqO3wE5HEdecQ51anE6AJT/a0wIUswxZtYKpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747206353; x=1747811153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=asjqK4k1HFHU07fICU4xAQQF9W8B7Lab4LvrCMUtqn4=;
        b=jQlu6rGPZt+pktFcMQ1roJXW09vk+9XpUa0dR/WnWfT7m+W8OK+2qAweF/DQWEiyUo
         gj7POsjDYUTUXO6wEVGm0FbgS2g2WuZfcClgP4sRSsR8LJKLd9jKuhd6TxYOwA02LNdB
         WrKH+Hj4GEmOfdYhEPqvQviIBm8ojyDxq9QKyHWEtA8lvtygpw5hkN6fOs9LbQnWQHuL
         1ftWkq29Rr27UH7ZIvVYilTaImXys5E/ktwZvs7LaSH9lgjVxmmX6iz9rYav2Pu1f+WB
         /l3ALRh8wyHc4t2JauPjSa0VfA87wvbIb5XnoE0iNSEXpo8mfIvIqCl5KMmnycao2s34
         zRQA==
X-Forwarded-Encrypted: i=1; AJvYcCUP0WQ8hb0wjQAaqhte06m6ef9FZZAbkubH/1FHNC7VojjujY3dEYmlpJzDXRSvZ6oLL/s=@lists.linux.dev
X-Gm-Message-State: AOJu0YyxfrREsScKNdCHWgjEECDy85/mZ2Xy6qT392jRN+0Tn83+46bG
	lMSElAOCUP1Ib5O3THXIJZeOH/R4O4UVMnXODfVQ+A4DbEvAEdE236JPRAPr1X8=
X-Gm-Gg: ASbGnct0VeSZazUZG3+KI2ZXGmwnILuZHdXTGgLJblnWc3mGpkKS0ognm6XaPei7rzI
	gS9YJqHJkpxJqTPFqRt3qC6SgaoCudgtCsyUGy/Su5mH/89Xx00nkFhe1i/larRFQOupvfMb9vf
	bZF2rwUqE/y6RDqOYHnSHy4etN1B1FcLjTlGzIJCr/c2LaT4VnCuZVVjLVc2zqCmv17Vq4bDczo
	Jp0lLYUAf15+OYmwRJ08SU5cZNpEKeghEUo7eBVxYavxqPFLEd32AG3rtgBOpNGPyF/dQ49vdEd
	wWO+LtQ4S8+fWImYLyG4ddc+Tfo92N2GkkmGj02dyLLpEFU+rVFlCZAhqIauVfS2ONIvlHQJT18
	IPgx1Ureg/2z+v66KKt9m3du1EJmYLZdX+NmXA6FbiJA=
X-Google-Smtp-Source: AGHT+IHc0QtO0MfClvGYtNmSS0trJ59pgTJOhiVrzxjClwg6I7hvnE7Dqyuc9UcLulozaFc4dOaubg==
X-Received: by 2002:a05:600c:5125:b0:43c:ec97:75db with SMTP id 5b1f17b1804b1-442f20e3e9bmr15676275e9.11.1747206353147;
        Wed, 14 May 2025 00:05:53 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.client.m3-hotspots.de ([46.189.28.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f396c052sm16688175e9.29.2025.05.14.00.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 00:05:52 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Leonhard Hesse <leonhard.hesse@bshg.com>,
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
Subject: [PATCH 3/3] ARM: dts: imx6ulz-bsh-smm-m2: Update wifi/bluetooth pinctrl
Date: Wed, 14 May 2025 09:05:35 +0200
Message-ID: <20250514070545.1868850-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514070545.1868850-1-dario.binacchi@amarulasolutions.com>
References: <20250514070545.1868850-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leonhard Hesse <leonhard.hesse@bshg.com>

Adjustment of wifi and bluetooth REG_ON pin settings. Align them
to the production kernel

Signed-off-by: Leonhard Hesse <leonhard.hesse@bshg.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
index fff21f28c552..6e4d09bf002b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
@@ -128,7 +128,7 @@ MX6UL_PAD_UART3_TX_DATA__UART3_DCE_TX	0x1b0b1
 			MX6UL_PAD_UART3_RX_DATA__UART3_DCE_RX	0x1b099
 			MX6UL_PAD_UART3_RTS_B__UART3_DCE_RTS	0x1b0b1
 			MX6UL_PAD_UART3_CTS_B__UART3_DCE_CTS	0x1b099
-			MX6UL_PAD_GPIO1_IO01__GPIO1_IO01	0x79		/* BT_REG_ON */
+			MX6UL_PAD_GPIO1_IO01__GPIO1_IO01	0x100b1		/* BT_REG_ON */
 			MX6UL_PAD_SD1_CLK__GPIO2_IO17		0x100b1		/* BT_DEV_WAKE out */
 			MX6UL_PAD_ENET2_TX_EN__GPIO2_IO13	0x1b0b0		/* BT_HOST_WAKE in */
 		>;
@@ -149,7 +149,7 @@ MX6UL_PAD_CSI_DATA00__USDHC2_DATA0	0x17059
 			MX6UL_PAD_CSI_DATA01__USDHC2_DATA1	0x17059
 			MX6UL_PAD_CSI_DATA02__USDHC2_DATA2	0x17059
 			MX6UL_PAD_CSI_DATA03__USDHC2_DATA3	0x17059
-			MX6UL_PAD_SD1_DATA3__GPIO2_IO21		0x79		/* WL_REG_ON */
+			MX6UL_PAD_SD1_DATA3__GPIO2_IO21		0x3029		/* WL_REG_ON */
 			MX6UL_PAD_UART2_CTS_B__GPIO1_IO22	0x100b1		/* WL_DEV_WAKE - WiFi_GPIO_4 - WiFi FW UART */
 			MX6UL_PAD_UART1_CTS_B__GPIO1_IO18	0x1b0b1		/* WL_HOST_WAKE - WIFI_GPIO_0 - OOB IRQ */
 			MX6UL_PAD_ENET1_RX_EN__OSC32K_32K_OUT	0x4001b031	/* OSC 32Khz wifi clk in */
-- 
2.43.0

base-commit: e9565e23cd89d4d5cd4388f8742130be1d6f182d
branch: bsh-202505-imx6ulz_smm_m2
