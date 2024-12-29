Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2C919D8BC
	for <imx@lists.linux.dev>; Sun, 29 Dec 2024 14:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735483858; cv=none; b=K+1qlV7f6x8LdA3GBZVHvL5sZacU7yJxYA7Ga+IvVGeXjKrYmvortgzPCVZLypAjl8K0Z2YxKJIKEX37IjxBBpFGm17pNNkJlZ3PjJHbULQhPg2f/sVm4ohlm/QHHmhdxg6hCPWWbb9M/Fd22Ep9B0fSiIVngJa5SuLDLSsPoJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735483858; c=relaxed/simple;
	bh=7yYZJd86bIYU+vT8RAjY7wEp1oq0Xfmfy1RQITDVRe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qgmL0lq7dc1lS5+ggMLeW/NFp6sUU3mmrcNWuNWYIdHr7obXaSqWjoLAbup9qlaCaV0pHsj+ENEt9iVu6EBaILCIiW4AW7rjc9EtRdkhUa/yIX9qwIXpfFCpCqEuBP8HSVx38vpaPNTMDisok3aiEXRnpYNqnKHqCDBQGXMOJC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=RFQI2OWI; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="RFQI2OWI"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a9e44654ae3so1383548166b.1
        for <imx@lists.linux.dev>; Sun, 29 Dec 2024 06:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735483855; x=1736088655; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8grfYWwIX4hpiA7jlx82Mk2yoAsYJcNHuOuvJvnYwRc=;
        b=RFQI2OWIyrilvJQXeGA1Vg4y1twRsOq8BTbjWx3laIX8lWQKC/z1r7N2lwgEAVXR9G
         h1tFpKfFCmZZP7VgMX1EVy9VMSHC0/CkEUNKJFI5mhCR2RwLnYtX66gWexUqUYrN/7uU
         OilB9Zk/36Y/Gaz5I20Uihqvk3o4kZdK7ucW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735483855; x=1736088655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8grfYWwIX4hpiA7jlx82Mk2yoAsYJcNHuOuvJvnYwRc=;
        b=HqOPp3x0M2hQ/NzAGn2MCfRrDDtv1Ak8/P/IRT72q+HJT9uf3dVSnt4GH/3wKdIb3H
         nTLnRt73kbbIhmIA4+Yqjt5QkyHFJD4wbgHlZJsAYuke6nywf6kKviGjBgarED2CN724
         dKVBfVS3a/ZHw/nsZJUWFs7HJmXL0hhhOsJcge00z0VzYQ0JyJtttmUd/eUYbFnk13Ho
         r38jEFgP/g5ssNO6p38iUyXgcPhD4HSWDt1pHUzfTb5VCejdew/s3hdLofBOl2xlh0r5
         gjuOfVPcvdtBO2PvyDWjC/4kWoE1DpqfEDXE9WJHIF/AymADJbFKfEfcPJc5kV7LvJo4
         fJag==
X-Forwarded-Encrypted: i=1; AJvYcCX2nomaRk5wPYPxELNS4PXjPl8keTZHYDDK21ZjhXbceQI9wMzkmlcWoa9zMIKtJdcp6lg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yya7dYgfJhhl0Sjz9znTq6zUS3D+MfrXBbtKWmRAiu6a3vzZd2q
	fk0SPJ3Xfx+iq4N6rS7SnyS18dbp6EQDUhYIY4n5LUHEC8zS9jpFJBDBOzo1Pzw=
X-Gm-Gg: ASbGncuAWKhyHY2wkIH0opLqPng8ebBJEIcUcoG0jHtDx6FYZh5Cfg/vJv91tiSVGvL
	JVvVQSSRJQAtSUjNAdRLQPZU6FyELAGUpe4QWo7S6M5HLdtKAZtlwik82K4wLHLpq4jn8q2csqg
	pduh0XsQ2eTYVgz8T0OaC6C2iwYk8vQcfEhbcT//xuJ6zMRuJRDbpFb9drSOwLpaV8PByP80yfO
	dz/zz5Zp6DEz1RWeH5Cjp4wzN73FAkot3yNovganU24dZ9hzrpia3oPjADQYbtPixkFshp50tOS
	h+6qb2TOwp/AfMb0kW4xSg==
X-Google-Smtp-Source: AGHT+IGu2N+6ZD25BGmle+g9l4PupNH1HacLiS+Z1hhM3CuT2AA41uFWrZ6hOnOskLaUH72Ls045WQ==
X-Received: by 2002:a17:907:c082:b0:aae:93aa:9ac7 with SMTP id a640c23a62f3a-aae93aa9bcemr2063864266b.50.1735483854672;
        Sun, 29 Dec 2024 06:50:54 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e895080sm1362084466b.47.2024.12.29.06.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 06:50:54 -0800 (PST)
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
Subject: [PATCH v8 14/18] arm64: dts: imx8mn: add PLLs to clock controller module (CCM)
Date: Sun, 29 Dec 2024 15:49:38 +0100
Message-ID: <20241229145027.3984542-15-dario.binacchi@amarulasolutions.com>
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

