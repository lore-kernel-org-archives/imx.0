Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DBE221547
	for <imx@lists.linux.dev>; Wed, 14 May 2025 08:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747211121; cv=none; b=XzTjrH+lwRfNVdowATDYnWFvQsBNZ5uQWvgv2DyC7TR2WB4Y9Ce5RmPCa6hE6GMMMs5KtuFWrwVyB0B/Z8wWgaFHKqjNdqaLEWvqK3Tj7JfF5su7xsaqDCGgauIyUcWOu8HstGoTJgcAyGDnlvHHAZ0O0uqLY8NhuWqnX81tcD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747211121; c=relaxed/simple;
	bh=7oQJKT0hR0eKb35E3LfSQrJKLp4aFEfnTRpv18T+szI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fp0Z8egSfY+S4lRpv8gm3vz7EMNjDlXTHI1E6XD/6z4HsIZJiUvSquAaDWFEsONaETYAnkOc0WCkUWSEJ8AU/VaNuhFKSNv+x03IWDoxvdu5BGmpCUhRBx+zlSTkGRzicurzkyr1sFUJ53XYf6gnnLbJvx7W84uHlWYCkUiomiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Qd86UjLI; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Qd86UjLI"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43d0618746bso49984105e9.2
        for <imx@lists.linux.dev>; Wed, 14 May 2025 01:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747211118; x=1747815918; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYagY+dR/IQMge1Auis5M2jpDPCa31Qjss93MGAu7M0=;
        b=Qd86UjLIWYsVI512hh1oi1nw9nVjCXsR8ydDxkbpO247vaHnGOGT4URE1dB/OM5TvR
         5/lhB+SRKwoLMn92HECdvHJhMmm5gO+KLsSbVH9xwPtqcH5PpYae8Z1UnT1n4cJtEpRf
         k3+Dhi8d0J9rX4KbDJIQixDIlAvzbA++rDmRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747211118; x=1747815918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CYagY+dR/IQMge1Auis5M2jpDPCa31Qjss93MGAu7M0=;
        b=ig2foP9NOf+VGZZAPjL+R3SaRsVHSzK+rfZhs83s1uBJWnb4/1OYYeZzEnA5i321hM
         Ol3wFafdYnAH0KHpkFrVI87y5y8rbbTVw7nHGE/jLLCuXhF50kZPdFsx9iAIlwNzDHHu
         TO1YNrcMmCSFm0oyKW5PnRI4fw5nyp1w7qB6e2gakbhHTFc5nPQLLyTcr0SM4p7zJ5//
         OPPAYFlT+764ETYJIp0TXADH5Z4DC3+Wi+O55DYFCAo38+1Mr2WAYJ2TDVNwEu6umIDW
         nZtXbIhxxO6wT6pjM4onHTpfUrgeA9f8zpHclrQM4hiLG29R7rJLuOaVsGORqnVdpEeG
         T83g==
X-Forwarded-Encrypted: i=1; AJvYcCV2JS0wsywvenRwoEKzbH9vdHAiLvhh8H13uaPjVbkerR+za5uCfwJuNKOrWQIomZa0i+I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6d1rNprZhDnR2HTCJkW9zQjTfeK5MMJGfXCmWjlqpW7GwwhfL
	wAAnM2U29NVpCTgpG9VDAPS5wgvMhtvquTi27EV4z8C0TxzHtDWGhHo7IOE3g6w=
X-Gm-Gg: ASbGnctHRrbKenVkpQH4GTSMOeulkkHMBs54dKeYWJYUJ8q3E9haWL2lfCgyDdBlF5K
	9p90/P+GJMM9b4Sub7dG4HYSYFh7LGhgI38UMmn7SKrMJzKVHl3q986lnn5fg0T0kuIWbC1OolV
	Y1rNQSdukVFgRrZlmWRL4I6vThGSrIMemTQxxZSZxS2dcABKuQ5DZtAW3QudA4tW/+Lv1Nk4ZI4
	0f9IcbuFbjRkGYPiIsXQGI4AGePzuGr8euvSko1ejtOMQDmcMwuU+EOpRO0Qz8QoIiwy08Kh2gR
	6fVU2g/aIdqOvp5qmLbkNiMVthiXttMzWQ9W58gNYSITJ7nGQGPyohHRZgSwf4k1oZDwUVvl0Ie
	ayKti+7iiPMzpP6KZJ/1Qx8UOcV6U5U9zCkY8m5Qo7tE=
X-Google-Smtp-Source: AGHT+IFleRd326SrUnZHoqkzu6suoQz94DWWC/XeS2n9NtmmwCPboKZ/eBmAx4ZEBG6Ntfy5At/YEg==
X-Received: by 2002:a05:600c:a09:b0:43c:f513:958a with SMTP id 5b1f17b1804b1-442f20d65f9mr19154735e9.13.1747211118349;
        Wed, 14 May 2025 01:25:18 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.client.m3-hotspots.de ([46.189.28.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebda7d2csm30987365e9.3.2025.05.14.01.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 01:25:18 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Simon Holesch <simon.holesch@bshg.com>,
	Karthikdatt Anantharamrao <karthikdatt.anantharamrao@in.bosch.com>,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Wolfgang Birkner <wolfgang.birkner@bshg.com>,
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
Subject: [PATCH 5/9] arm64: dts: imx8mn-bsh-smm-s2-common: Pull Up Console UART pins
Date: Wed, 14 May 2025 10:24:59 +0200
Message-ID: <20250514082507.1983849-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
References: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Simon Holesch <simon.holesch@bshg.com>

The UART pins are floating, if nothing is connected. This can trigger a
Magic SysRq (e.g. reset).

Signed-off-by: Simon Holesch <simon.holesch@bshg.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
index de70cd3a392f..fd12b97525d1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
@@ -386,8 +386,8 @@ MX8MN_IOMUXC_ECSPI1_SS0_UART3_DCE_RTS_B		0x040
 
 	pinctrl_uart4: uart4grp {
 		fsl,pins = <
-			MX8MN_IOMUXC_UART4_RXD_UART4_DCE_RX		0x040
-			MX8MN_IOMUXC_UART4_TXD_UART4_DCE_TX		0x040
+			MX8MN_IOMUXC_UART4_RXD_UART4_DCE_RX		0x140
+			MX8MN_IOMUXC_UART4_TXD_UART4_DCE_TX		0x140
 		>;
 	};
 
-- 
2.43.0

