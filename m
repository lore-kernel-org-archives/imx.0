Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D2020D513
	for <imx@lists.linux.dev>; Thu,  5 Dec 2024 11:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733397610; cv=none; b=L5S8933InRUm2h/zfQpkT1d+PTriaKgCaAfqyTGI7utibgkG2CiuJDsHnBFID+bSzKlP5riUNE7kP3zJEHrwdSMgbfn+lftbywgWvkexjYCUpwE8ZQgtkl8IMGC0AxEpbPLtmYU1jRT2oB1Go4poiIMl/PP7mmwOYMtfZVw6NLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733397610; c=relaxed/simple;
	bh=UMdg/7HEARC6ZgU2mWDyh9m6gc8+etDqX0OWe/Oj1Is=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vBv9B7tamXU1jQOZvFO4eJ2S06eeGM10KqN73GLl0m2B0BLEO5lIMHOepn8PFIDl73UkLhsyK9R5sgP6+lbgs86x39cxDJYrTx5X+s3aF0C7kM8uJjhZy3SXtjKHE4XP77hTCrzE5dM7IR7yEGndZEabLkp3pqyP7KHGQArZ8hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=aEUcRihM; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="aEUcRihM"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a9ec267b879so147021566b.2
        for <imx@lists.linux.dev>; Thu, 05 Dec 2024 03:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733397607; x=1734002407; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=deJRTkp3cj8LQIAgwHRGE8nfXmDlGN+dwLVOnyJ9CpQ=;
        b=aEUcRihMlFecQWWmiQUkOrqxOFEBnH3grzxQGSoozbidrTFbVd9SUN7PLodSJNTsaJ
         NBuPrvNt8OCya1kSAQTxBiUX7xwFiT7rjg+xwEzlCx+yLvcVVRE0v6amn8yrdoREfXYA
         NQvzjJuvEO5YJ7ivUHFYdcYGxkNW/u0IFL6fU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733397607; x=1734002407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=deJRTkp3cj8LQIAgwHRGE8nfXmDlGN+dwLVOnyJ9CpQ=;
        b=ArnEy2B+ApY2T3VWj95uq8SixYILOAeq9Bn3APvXfy+rU/qn6P36RzR2ihxmRts+g/
         qQ/PKqPPu8TZYV4IgFhj43YyAnQpNWeQl6GTicBjVSlfugU71N5Ww9Qouh3rq6Ztbp58
         rPrtc4PSrcr5JkFFgTxKTGcLB1XwzIpEVzYGmRNRG6g95wLbHMVOCs61nUwPquYQd/fJ
         oSSqpKaALE1clYxErCWRSwUvQPeRV04qjQ8cqWKk3YEDcbdbru5qFk9PD1OwPpAftoGK
         vFwcFKZr78rmXJ4flB2MmWcolr3MJGQAT9GJ3HHVkdfBNHBjx/1PLQ4nkEh3cRR3av7E
         fOBw==
X-Forwarded-Encrypted: i=1; AJvYcCXjIxthYuEVEwa9fhN1LCbtHC3dBJO78+mKlSu4vCNxPQd6LXv+AbPmzGOsgb/bp5MPkRQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzE34V1z+m0ewJt6+9OAq25CqZFoKlE/yuyHyiMkqakgYEifaPo
	1AMJnclwu7IM77FAdnyjC01QRBTtv/+YzL/NuLxcHTLuoE+6MTGWYCzbd+VUd/I=
X-Gm-Gg: ASbGncu6Xm36aY83bVFZHfj5pDamLYI/jWYrbR+5CIJy5yd7A8yBTBtcKyaIzaMEX0g
	fpEk6aCcvQMeBH6pnILMtcPbtWgCCMCGWC/pSRp0dfx1B76HcYYaRvr4nX8K2JBlkYFIdzfdKEe
	Sgsdo36hRQqb65vWkx30tEJnNuV41D5DHgmNa+34NVqFU2mOtBZQg94z+WOSwTe19fJVGU0v/5G
	QLutjmKh8PLAkJOHWRpAdsIHJiNe19+x+u6yctO8TebqEpoM/wSJBg8lsAIPd/jFt8t/GMNK02Y
	1WlXPfo+ucwveyAV5U659yrRvcV3QwVJF38EMERFR/RQQg==
X-Google-Smtp-Source: AGHT+IEDfHJCy4mKgveNLG8+12l0nNuJTsz+6IEw9fSTRFtpyymfLeQoj2SsxUuqEuLQtMZgkWDydQ==
X-Received: by 2002:a17:906:328f:b0:aa6:25c4:7a71 with SMTP id a640c23a62f3a-aa625c48787mr161327966b.16.1733397606942;
        Thu, 05 Dec 2024 03:20:06 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eedcd0sm77505266b.87.2024.12.05.03.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 03:20:06 -0800 (PST)
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
Subject: [PATCH v5 17/20] arm64: dts: imx8mn: add PLLs to clock controller module (ccm)
Date: Thu,  5 Dec 2024 12:17:52 +0100
Message-ID: <20241205111939.1796244-18-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
References: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
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
index 49be492b5687..aaa179784717 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -643,9 +643,14 @@ clk: clock-controller@30380000 {
 					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-					 <&clk_ext3>, <&clk_ext4>;
+					 <&clk_ext3>, <&clk_ext4>,
+					 <&anatop IMX8MN_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MN_ANATOP_AUDIO_PLL1>,
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

