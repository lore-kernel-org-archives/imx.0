Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA2719D88F
	for <imx@lists.linux.dev>; Sun, 29 Dec 2024 14:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735483856; cv=none; b=hKp8zLzjDl6dCxqiyhEQbkmbWF9DDnXEo16nPusYLoOdV81TozbwdPzBgck0zRgmYyjqLo8iDooJc+1ZJEkQEJ87cCksWtZ0s2JH4g9m2tCI9FxW60Z75yvFSP9wAUDxmXAP2lAdW+hfHDKVNToV097FEIYLxUjJjzH8TSlY6fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735483856; c=relaxed/simple;
	bh=gzAb8Vev7F0m4l48I407MYxa8qXR/pteEzI03GTE0HY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=crq1I2Z59KwXZxwIZ44SqgImnUxV4hdAQTQHxnPO1fXJZYZhUCjsFNaVs3/veIxSKtY0k787mJjmFMyyobzxkwwD+xOIWV5TSYcNW30zlz0ZxlLJLF3iptGOkDu12jxwWP5tl+p7eSvrt6EnDCeb4EPzPLSstoJnROBnMHy7QWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=M2df2QhQ; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="M2df2QhQ"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d3f65844deso13688091a12.0
        for <imx@lists.linux.dev>; Sun, 29 Dec 2024 06:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735483853; x=1736088653; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FS59gZd32BjVBMnl0y8BuCd7aMfa22x1ZHu9pei4qQQ=;
        b=M2df2QhQqB8kFRjtiJ9fhwIIdkfBCsOND8iQQIq3HYY19xf/RQ8dLYyHtZm2eB7Tgz
         FtvemGXatoKAd+8dsbznGyZ3zc+MAq4crKLIl2IGpDLDk55yfLIX/Jty4qh6DirROfWH
         VSL41zLntM+sv/6RNioXDqVrZ4yad2JRJaG6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735483853; x=1736088653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FS59gZd32BjVBMnl0y8BuCd7aMfa22x1ZHu9pei4qQQ=;
        b=ONtxr6eXMWmroDxelZGNGTnszih0sCzUYErULrRG3s5uhaNocBiyrGLIh2RloVpBUE
         VWjrhQABp6mDYQBiCSet3YmNdBvT3JRPHhZMj5/ok8pbEh8iJqVcCg20WPo11TLCjfgZ
         LDmn+72ou1AcT3X4euBt+MyWUv2nLu8F/bGG57V1s5AN2DcErW0nNH+xtsZUDixmCBML
         GdslHFjbRJRjPxQR6pmiv9FJZnBL4Bp4K3RJosCmqqHUGDbfad4OxEZA41Y24+WNypXN
         +dxxtuYA/A6bVcUveSA8FtVzkYLV+oXiDyrqMzBsGgchdG8GHFXDxwZUc+Re2LNqsxnk
         sq+g==
X-Forwarded-Encrypted: i=1; AJvYcCVFAqx0UmQXT7L228KEiaT5g1bqKx9TUv1X6CjfkwQ6rPUlvyyoPfAS9WzQL6I0y4Dn6KA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy78wPwgp0rWxj/GF9Lvbzs5ylcNDk9zc8dY85ikGRNrJjhegbD
	dABO2J3wbLlphkwfDGM9GwFcBl1egNwmJY8Fxmm4CTL+GLqag4F7CRh41OmLaAg=
X-Gm-Gg: ASbGnctTdRz/HiIXMLwJTrWQypd0G0ILS0UYvmcSg7UQRpjcOrNfVBKZ11GLn/NzhfA
	Q7vCxfKT/mH63+S+7eSF+CSkcU7qz/4I0lLX/1rtlTbllScNzkrNmKwJnPE0AEn9DzJASCJLU+s
	BOeV8uIb0tOvjxEE7TRZhRysH0ntIDIthRwy+5ZErgX4t/1953Lwt634YXDZ+hpKBXe+NahGRaa
	PB3AyRz33KNLBOiUmtzUTxt02c9DRSMUWUFhDrIh7B/IixfHUkt8TLYNfx3cT6VHvmA7/CBfkkf
	ZzOHOFjzmmWsc2klqYs1vw==
X-Google-Smtp-Source: AGHT+IGAr/fj0/FxvDNSF3QhklUe5PsXkRgWrVEt4Z7yfy8kv6dXfzAqgAyAuWRdOWj4EIdZF2KqUg==
X-Received: by 2002:a17:907:3f9e:b0:aa6:7f99:81aa with SMTP id a640c23a62f3a-aac2d446f68mr2704157366b.6.1735483853232;
        Sun, 29 Dec 2024 06:50:53 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e895080sm1362084466b.47.2024.12.29.06.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 06:50:52 -0800 (PST)
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
Subject: [PATCH v8 13/18] arm64: dts: imx8mm: add PLLs to clock controller module (CCM)
Date: Sun, 29 Dec 2024 15:49:37 +0100
Message-ID: <20241229145027.3984542-14-dario.binacchi@amarulasolutions.com>
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

 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 597041a05073..79f4c1ae7d8b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -642,9 +642,14 @@ clk: clock-controller@30380000 {
 					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-					 <&clk_ext3>, <&clk_ext4>;
+					 <&clk_ext3>, <&clk_ext4>,
+					 <&anatop IMX8MM_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MM_ANATOP_AUDIO_PLL2>,
+					 <&anatop IMX8MM_ANATOP_DRAM_PLL>,
+					 <&anatop IMX8MM_ANATOP_VIDEO_PLL>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-					      "clk_ext3", "clk_ext4";
+					      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+					      "dram_pll", "video_pll";
 				assigned-clocks = <&clk IMX8MM_CLK_A53_SRC>,
 						<&clk IMX8MM_CLK_A53_CORE>,
 						<&clk IMX8MM_CLK_NOC>,
-- 
2.43.0

