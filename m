Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6455B1F707D
	for <imx@lists.linux.dev>; Thu,  5 Dec 2024 11:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733397609; cv=none; b=V1WjfJ35Ndp6HGsniVnPvTwVvnrNYbem9/FPrnLt2yr9AF3XKq8HX1t5U8WLgSp3PIJBxB7xumQPHJm4PuYoXoTJy+8+gr+Y1iTh8USB2NdddgIfJ1TWrk1VbkvG45ust48ntAnJrc75nzgtgeJWR030tIFJpaddUH4Nqz3gAac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733397609; c=relaxed/simple;
	bh=2JhFTNbz+mPx9HqCC7mp/y2AepFst/c//AlKmHPYdgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E4jTVL9OBm8w/8aLNaaoJtQIMACvQBIc7VAqSm75qE2azmBfn4hbOzW9SHw0gw8F9N5uAgq34raWDOWpbrk+uUlNLYm6NSLpdnLiQ3Vmahx2WJgaBpkP40pvl+14YsVXqO3/IYCNoxZG/Ir+3cgQ79lu7KPwGrPkByZcXisVic8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=ZK4PlQWi; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ZK4PlQWi"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5d0bf80972dso968810a12.2
        for <imx@lists.linux.dev>; Thu, 05 Dec 2024 03:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733397606; x=1734002406; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j2hCs9DBY1WcnrRGyr88Evw8OuCDQNrA4ENDf/4vgOw=;
        b=ZK4PlQWizE+Bv5OtiLoofqsDmIyngzLpUcRcaVbW3Agg9elaZW+LTsEl/m0FZevNJa
         /QYIxrASjnndF06d3HuekufiZm5gIu5EC3/1rDyu+ZciQJ29JoWuljxKAueAhAn6jW4b
         XwuAMY82aOirn1rVM8nvToQP1JI3r74iYFu/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733397606; x=1734002406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j2hCs9DBY1WcnrRGyr88Evw8OuCDQNrA4ENDf/4vgOw=;
        b=RwyAPpsqgJZD4aNRK6LGMYJ07dofhnjrEHn4dQjRccCTwrHojx0vRVKVxnccsGcH0A
         /DgiVZP/IzJhB8feRvX7SleuGY0b1wMt3tAB779UsRw3C1DpmwNRd8VGPdtNJigtu+u0
         Q2/yxn8eNYwKKTTVGFesEZgpQlkhK4sqRPALi7RzW4d22GXaAdbx5KhqymLtAz9LFmC3
         +Ndazfx33egi9R+j1SA3srTQzda2aZgp9J4SDtJD/mkYLaC9HX+xwD0tyNOUnKasCGzz
         e66msXm+fTWPpbFFy6TOva8pKj3Xs06QdsGYCzrx5QEBMCTrf3YHlHWLu/Pt/hjrewA8
         spyA==
X-Forwarded-Encrypted: i=1; AJvYcCU0ApcuQmzNX72HQq9lWC2l6TV1yG1HphW2+Tt/IXwXbUji2ug0pmItHzg1q/xzMN3AJF0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwRbSs/tAPoLnuOL+09FLUxGcq2NzjjWom5plYRaz4W4gQNFMOj
	cqdPHmyKqs7ZsxOKnG0xVzuwTdkC+Oo/sB4793e/R6X0xTrJbwflvfis35u+8kw=
X-Gm-Gg: ASbGncv4k1hlK1QjFOEMdQDPUFMYqz9NaQS3khvK6R3X6+tjjfPr4uqvbMskyQuYRUy
	2bIDg5wMEq/8BP/gouaifF6NcBvYCBVx54C7zBfCWcDsXGmDXnAsGJB0UiJVWq35GrTXPzMpnBM
	8lef1ZbB8sODTlgxKGOAq4XVdbMH1joobKbdQCQVUVN172Q+EZriGoOE7uFVrPlgNNyiglWNZRN
	kSFHzKXkB8eS4opcQNq8YRe9VICFRhkAAovRqP6WqW1lXTJDCKNsxMO/2t2bX/hRTbxGzsbfDpu
	DjicTJmZ+MPm7YJHVT3yBgq0pkF/RGcKm0O5vEiFLMj2SQ==
X-Google-Smtp-Source: AGHT+IGLZBaBqNRrXV0+VIf1ktSUUHHblEKAcaf8kiN8Y4lBfRjDCw12pclWyLXl1FgMMkHkUf47Qw==
X-Received: by 2002:a05:6402:280a:b0:5d0:fb1a:afe2 with SMTP id 4fb4d7f45d1cf-5d10cb5645bmr16989909a12.10.1733397605738;
        Thu, 05 Dec 2024 03:20:05 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eedcd0sm77505266b.87.2024.12.05.03.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 03:20:05 -0800 (PST)
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
Subject: [PATCH v5 16/20] arm64: dts: imx8mm: add PLLs to clock controller module (ccm)
Date: Thu,  5 Dec 2024 12:17:51 +0100
Message-ID: <20241205111939.1796244-17-dario.binacchi@amarulasolutions.com>
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

 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 597041a05073..0b35aecb6755 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -642,9 +642,14 @@ clk: clock-controller@30380000 {
 					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-					 <&clk_ext3>, <&clk_ext4>;
+					 <&clk_ext3>, <&clk_ext4>,
+					 <&anatop IMX8MM_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MM_ANATOP_AUDIO_PLL1>,
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

