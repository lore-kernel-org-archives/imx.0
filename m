Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7171DD0D6
	for <imx@lists.linux.dev>; Sun,  1 Dec 2024 17:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733075257; cv=none; b=UQTAvqQX4o8YACRhC/83i7YhgNsqhAU/egOR3F5fd49E3GiD2izDRPCwL/YI7vgxy0K1bn3FeEwq9MIhGY+MqBwGYTAFdL9J1UocO7Qj3ubuASKa/4lQVlB/KJIINZWSmEWQWP53+T9wNW9UV08sGMqH3cbE+mNKGAMNM+mtSlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733075257; c=relaxed/simple;
	bh=tJv9ZhHsklUT4QeD4L4dHSFnzdweH1pqQf74mjhikPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g0nDrupBY5zyHGLUuYg3doCLCFCfSKtUY7DH1N+PuAFvfmTrsmLKMLLiVkS+Hs/BK2OMyN9FYynCghzm9quJZeVvbVuqlg2ybXlCCZbdXQR863mUFttQv/OYDZVzdBxKsmNbLdCbNkIkFTgyXLCRyhEtgcCi4W0m7eyS903e+O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=N0QbaHB2; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="N0QbaHB2"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a9f1d76dab1so631625866b.0
        for <imx@lists.linux.dev>; Sun, 01 Dec 2024 09:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733075253; x=1733680053; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oLhcLywhuJhFOiraoxYfL0OnvzBa/3HuAHL0GSCsrJE=;
        b=N0QbaHB2wJK1s5H+ABj+6qef5YoFMPFBo4qg6aK5c8dEmuCDRu8s50x5B1uH7Bq4Fh
         z2PxkL71dba5w+AGiyHkgCa4SunHkwOyqoFWFq0O+RHQZ8WMJT7Gw2CspWxBQXwUu6Ee
         BABwpPNd+1ERQLa6eg1OPcQedCqk8+S1PS+Cs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733075253; x=1733680053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oLhcLywhuJhFOiraoxYfL0OnvzBa/3HuAHL0GSCsrJE=;
        b=Bsct8U5qEOk6Q71ZjQL5MWe2RBeylxy9/wkWziWD45w5ij7u7rA2Ee6c6PHPqQAZA+
         bPbugYh05MGkTQcxwgB4esbyqqL2r1YSAqS7pPnNrwgQjmEvdVEjf+fmE5i2ZmAJ5YS2
         gZNM/szWClH1X52cUYzs1tmtrt9xbE15rceQUGyfrs2Hd6k+XNTYxOUz64vMSQcPqIR1
         8/uCv+/IXP1WoMW/JQRtPEEX74gn57tslS8Rj1znEAfClKbJ50zMiMo0rC7M5PTp2Grn
         0zY1C2dq1H+nMpvG/DpxYEpKEcZOTAqEZs3dNrdXjfkyNxCH5HkfI5kfVq56eHvvl6Xu
         P2SQ==
X-Forwarded-Encrypted: i=1; AJvYcCUl/qHjRyVcUeoP+3j4ChpCWMrwHWdMtCGOVsvsNaFeetpEh19LG9agnMAt+84A8Er0jXw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzqdCqRFpF6HyPD1g7OblcvoNcfUrDKIV/KNheDBk6k2ZaYsZ7m
	hgiJfydn5NefDHUcEZWHi9AD4xhFzmn+aGurx9GbXWvXZzpnB70LanHTxODr2h0=
X-Gm-Gg: ASbGnctIwfEfu+IluydgwUncuCfx933TCte4I70B8fJLUEY/DSO7PaI8h1X4W+1iYUw
	i62F41B9JEt7S5evgPz395jvF+QswlQHTz5E7DCVyTrk9BthksRjfNEAlpNEIP8xWz7M3ZGpqej
	7PndaH4bC1pkanClZoqfz2djPGgI1Fi7xoF0r6mjTF73kQ4P2JhqFBTKrvYoBA/m3Keg/VSdiuK
	x3sNcGduo2r6lPVxaxcR6615slWlvTQ8pugP/JRSTatX4uNQvNtUPpT5fYc3hlqfvQ3w3N/Sj5S
	Vo9qoBnY2e239MiaOjIqzcdue0Dp9OW/21e2NpxCfwEaXcJEwXCArMGi4A5Yi5mU6u7DDDVsb1R
	tqaYbxqhRylkoDk/v
X-Google-Smtp-Source: AGHT+IGn4/RWVLL59jddxhSFtsf5Or4ZQ8VOnVsID7RwbBkW6zIOVCAero1gEw2gjSwr4s7DcORz6w==
X-Received: by 2002:a17:906:3090:b0:aa5:1ce8:e4e0 with SMTP id a640c23a62f3a-aa580edfc21mr2238279966b.10.1733075253130;
        Sun, 01 Dec 2024 09:47:33 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a78esm415220066b.163.2024.12.01.09.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 09:47:32 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
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
Subject: [PATCH v4 09/18] dt-bindings: clock: imx8mn: add binding definitions for anatop
Date: Sun,  1 Dec 2024 18:46:09 +0100
Message-ID: <20241201174639.742000-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
References: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the bindings definitions for the anatop node. The patch is
preparatory for future developments.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

 - Added in v4

---

(no changes since v1)

 include/dt-bindings/clock/imx8mn-clock.h | 67 ++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/include/dt-bindings/clock/imx8mn-clock.h b/include/dt-bindings/clock/imx8mn-clock.h
index 04809edab33c..732ff87a16c2 100644
--- a/include/dt-bindings/clock/imx8mn-clock.h
+++ b/include/dt-bindings/clock/imx8mn-clock.h
@@ -267,4 +267,71 @@
 
 #define IMX8MN_CLK_END				235
 
+#define IMX8MN_ANATOP_CLK_DUMMY			0
+#define IMX8MN_ANATOP_CLK_32K			1
+#define IMX8MN_ANATOP_CLK_24M			2
+#define IMX8MN_ANATOP_AUDIO_PLL1_REF_SEL	3
+#define IMX8MN_ANATOP_AUDIO_PLL2_REF_SEL	4
+#define IMX8MN_ANATOP_VIDEO_PLL_REF_SEL		5
+#define IMX8MN_ANATOP_DRAM_PLL_REF_SEL		6
+#define IMX8MN_ANATOP_GPU_PLL_REF_SEL		7
+#define IMX8MN_ANATOP_M7_ALT_PLL_REF_SEL	8
+#define IMX8MN_ANATOP_ARM_PLL_REF_SEL		9
+#define IMX8MN_ANATOP_SYS_PLL3_REF_SEL		10
+#define IMX8MN_ANATOP_AUDIO_PLL1		11
+#define IMX8MN_ANATOP_AUDIO_PLL2		12
+#define IMX8MN_ANATOP_VIDEO_PLL			13
+#define IMX8MN_ANATOP_DRAM_PLL			14
+#define IMX8MN_ANATOP_GPU_PLL			15
+#define IMX8MN_ANATOP_M7_ALT_PLL		16
+#define IMX8MN_ANATOP_ARM_PLL			17
+#define IMX8MN_ANATOP_SYS_PLL1			18
+#define IMX8MN_ANATOP_SYS_PLL2			19
+#define IMX8MN_ANATOP_SYS_PLL3			20
+#define IMX8MN_ANATOP_AUDIO_PLL1_BYPASS		21
+#define IMX8MN_ANATOP_AUDIO_PLL2_BYPASS		22
+#define IMX8MN_ANATOP_VIDEO_PLL_BYPASS		23
+#define IMX8MN_ANATOP_DRAM_PLL_BYPASS		24
+#define IMX8MN_ANATOP_GPU_PLL_BYPASS		25
+#define IMX8MN_ANATOP_M7_ALT_PLL_BYPASS		26
+#define IMX8MN_ANATOP_ARM_PLL_BYPASS		27
+#define IMX8MN_ANATOP_SYS_PLL3_BYPASS		28
+#define IMX8MN_ANATOP_AUDIO_PLL1_OUT		29
+#define IMX8MN_ANATOP_AUDIO_PLL2_OUT		30
+#define IMX8MN_ANATOP_VIDEO_PLL_OUT		31
+#define IMX8MN_ANATOP_DRAM_PLL_OUT		32
+#define IMX8MN_ANATOP_GPU_PLL_OUT		33
+#define IMX8MN_ANATOP_M7_ALT_PLL_OUT		34
+#define IMX8MN_ANATOP_ARM_PLL_OUT		35
+#define IMX8MN_ANATOP_SYS_PLL3_OUT		36
+#define IMX8MN_ANATOP_SYS_PLL1_OUT		37
+#define IMX8MN_ANATOP_SYS_PLL1_40M		38
+#define IMX8MN_ANATOP_SYS_PLL1_80M		39
+#define IMX8MN_ANATOP_SYS_PLL1_100M		40
+#define IMX8MN_ANATOP_SYS_PLL1_133M		41
+#define IMX8MN_ANATOP_SYS_PLL1_160M		42
+#define IMX8MN_ANATOP_SYS_PLL1_200M		43
+#define IMX8MN_ANATOP_SYS_PLL1_266M		44
+#define IMX8MN_ANATOP_SYS_PLL1_400M		45
+#define IMX8MN_ANATOP_SYS_PLL1_800M		46
+#define IMX8MN_ANATOP_SYS_PLL2_OUT		47
+#define IMX8MN_ANATOP_SYS_PLL2_50M		48
+#define IMX8MN_ANATOP_SYS_PLL2_100M		49
+#define IMX8MN_ANATOP_SYS_PLL2_125M		50
+#define IMX8MN_ANATOP_SYS_PLL2_166M		51
+#define IMX8MN_ANATOP_SYS_PLL2_200M		52
+#define IMX8MN_ANATOP_SYS_PLL2_250M		53
+#define IMX8MN_ANATOP_SYS_PLL2_333M		54
+#define IMX8MN_ANATOP_SYS_PLL2_500M		55
+#define IMX8MN_ANATOP_SYS_PLL2_1000M		56
+
+#define IMX8MN_ANATOP_CLK_CLKOUT1_SEL		57
+#define IMX8MN_ANATOP_CLK_CLKOUT1_DIV		58
+#define IMX8MN_ANATOP_CLK_CLKOUT1		59
+#define IMX8MN_ANATOP_CLK_CLKOUT2_SEL		60
+#define IMX8MN_ANATOP_CLK_CLKOUT2_DIV		61
+#define IMX8MN_ANATOP_CLK_CLKOUT2		62
+
+#define IMX8MN_ANATOP_CLK_END			63
+
 #endif
-- 
2.43.0

