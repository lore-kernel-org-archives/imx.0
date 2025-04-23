Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1C4269CF6
	for <imx@lists.linux.dev>; Wed, 23 Apr 2025 06:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745388207; cv=none; b=Hk5ILslIn/2Z1dj5oALAQ6vVcYyV/spkrlb45eHUy9yoZGZWduu0eHtGYU6YVlhH9qXTS2sW4b6MU7v2lG1PIbCNr+ADER65KSTHxN7qzvIAO7RgXtuvPF1LUAkxT187bgO9HoqcFJigSRnxFJXSuVKOgookqgUUe0ZIlTQnJ6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745388207; c=relaxed/simple;
	bh=7yYZJd86bIYU+vT8RAjY7wEp1oq0Xfmfy1RQITDVRe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AG1U09MsmS8hdqQRfCAb/Mb021gVz1PWW8M44iwp1vYvguVpxhpubtcvpS2ZBms2LUBQfI26NOEZmYv9m/XTlMwEiAYVs20V2XiQ7SKUg2+XnPSYFRA1DYyNM13FlPyIu3+9gF8sq5YATO4pifezz+ud7FSkwvs0EA0Z/0EgA2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=ghxx/aLP; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ghxx/aLP"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac2aeada833so119417666b.0
        for <imx@lists.linux.dev>; Tue, 22 Apr 2025 23:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745388204; x=1745993004; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8grfYWwIX4hpiA7jlx82Mk2yoAsYJcNHuOuvJvnYwRc=;
        b=ghxx/aLPRuW4rlJ4DO+teh/ciqWSFQ9BX1iiumvIAANP5HmKLsbiyIDQ0fkL1QnDZK
         o3IDlh3bKD8PsT4XKciOTrTjH9AO2EUhvMJwyq+HoBB30ZV+4+GvBoQbzv93prQW8n+S
         Gj3Zrq0TLfAYH+Q7NqPkpyqbKcPzBx0Eonn3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745388204; x=1745993004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8grfYWwIX4hpiA7jlx82Mk2yoAsYJcNHuOuvJvnYwRc=;
        b=ehUQD/3edOnUqQliXw0QgX6ubJ8uckTRGzGQUwXMnXoqEe0qyPIoAXA42M5znI9V1T
         88LPGMSNj8t55Es9YQ1KM4pcsljRSZg1JZy+9VfpF6L8KBscr9+OdovWhzol0bl4jUST
         44VjLR8uMUAGKONfyyXn9YEgIk3+8j7wp3yyrztApftBELqk+lpkRYbbFyE6o9sc9d0G
         9Nb5hCcuPNTP77y5hxfOOH7EtwutQQvU13BAoyronm6KEBCLc2TDhDK4E7adBirbpasF
         MJdQtROJa0O9OO/4Y4gXKjiar/lypIoLVVtwlC5crH2YVqgkROyvIiNAMrLsR8KiQYEs
         MxIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmNIUjrk4O6aC+Ul5WGohNtgHuxe+JQnBVVgeX+fGeURJ1nuNjv98HOi+atTmTFFTSc/Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YzsmcRcLDLl5dMHIMUlnRJ098CTcYHJ/bp438JCyZ9I6cFFPDtw
	eM/54iZyzr0SwRNnfgxBTpggzgfxP2/J64Pqqs423Hnu1WVaiaD86LEzfD722QE=
X-Gm-Gg: ASbGncvX+J6ne9gm26obISB2TRpuwxM95f56t3cGODETLsWCQ7/FMKrLclsInTTmIal
	b2UhYTUFWKXe9pYrGCl4x3xWcWNmiX/DXBTl/iyl2SdJ0GqJBk9PJfBZUXHznNIaCWDayp+iWyL
	TXLmXAEXQoNVEolKFvEBNiGyeQZ8dkIrLflWlJh+YPrxBZo2T7pllILWWjYnVGDXuzQedoIWAD7
	xxBgebgIpsjpYfka6SbOUNB1xHEM1tVh/YrkflFJkzjZTQzxDGngta1Cz8CpquHkSEZxiwBguzy
	IeBphtARe+Ff8sJznXMom8jfFi1jV+vlz1Tp0J7F6A308nJ3391XXf4XeevRwUBzMuaLx7DpwX+
	+Lay3yzNVnkP5aPc=
X-Google-Smtp-Source: AGHT+IFZSf+bG+KI7r41cPCeoQNA0TACINpcw/DiMJU59t/n7F33j98DIG9obiHLOdT98I7Ur4zh6A==
X-Received: by 2002:a17:907:1c94:b0:ace:395c:124d with SMTP id a640c23a62f3a-ace3f559e71mr99328266b.25.1745388203852;
        Tue, 22 Apr 2025 23:03:23 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef9e7e6sm745234366b.162.2025.04.22.23.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 23:03:23 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
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
Subject: [PATCH v11 17/18] arm64: dts: imx8mn: add PLLs to clock controller module (CCM)
Date: Wed, 23 Apr 2025 08:02:34 +0200
Message-ID: <20250423060241.95521-18-dario.binacchi@amarulasolutions.com>
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

