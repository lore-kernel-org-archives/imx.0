Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3DF1ACEBF
	for <imx@lists.linux.dev>; Sat, 18 Jan 2025 12:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737204079; cv=none; b=ILi3yN89swqr09O4E0WTsVoGgGf7L8sopFPPXI7WwgNYOnlWa533trif2A0SrYpNCxCDC8Qr/Hy6NbXPXWgDkCMkY2LZ4aUjWJcRMi0TAJnbQFyxVmNME4+hK4LG8NIk30yeKaBnRvZ+HND0R+kExo+AF1047rgKybpXLWr18CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737204079; c=relaxed/simple;
	bh=7yYZJd86bIYU+vT8RAjY7wEp1oq0Xfmfy1RQITDVRe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TIlcHnjdA3Wx7zOlE+nD+jPOZfZRTKKlozcXU8bdgfE/N/qobkeuJ/KuhUM2JTkKJAlfjIBT3xmP5DomlGOJUVGB9k/CsPppkdBl171tpMT2VQXn2ERK6k3bcKBKjyJfWmB9JrrAEJk8wyfD4QMDNsfbxKgZZbTh22jh/C/JKiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=hT6rrgHK; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="hT6rrgHK"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aaeecbb7309so566096166b.0
        for <imx@lists.linux.dev>; Sat, 18 Jan 2025 04:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737204075; x=1737808875; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8grfYWwIX4hpiA7jlx82Mk2yoAsYJcNHuOuvJvnYwRc=;
        b=hT6rrgHKQ/uGLx7UEIGaSlADaW6nh9jXY+VOi/BLqn5ayjDQy8fjSC0kLOLUgo7BeE
         zmXqw7xfp9lgTuBHggsKHXoZLSorRWFwJ7H2onJHVH53euw37i2ISM+Uw8F7Jq04y3ZF
         uWwoQz4ZCqZXrkDx7IFapXwKvOnxuKYO/anPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737204075; x=1737808875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8grfYWwIX4hpiA7jlx82Mk2yoAsYJcNHuOuvJvnYwRc=;
        b=AkCD370FC2IjXWOYQPJmIkFVTV5oOckqenDA396fgOuYj2RBjRDNvCcv7uXy3YxhsA
         tldhjuBAK6mTCHce8PM7wz941800etybKpYcNXh6RsBBLgyuynSxBfPltqBiHTbhgxmt
         5Mq5NCDCHJLH9j9ld0LxNFYV1MmcJ+BJirL18dAd9lztJ1khDno/noKMn8ymuds+e654
         N/60j91IUONEqn6c72E6jj9sQGOZuc2bDIW9f5IUMSptcy1naCfE7TjeGiBA2bmOa+J3
         D1IMG6z83cRlsTUXIYOhFr/lcAnvc/DZDtxCyTJf5n0T8r8YGn9vyx2QXGuoLZZWgFRu
         8zAg==
X-Forwarded-Encrypted: i=1; AJvYcCVSRl8a14WRlyg5NvwWfFtM22hFF6fKIvHGk8FFQgOjORH6w0+KrEM1Z0L9Nd168LkUWdA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxoNRX1CQCYen442jcjOrIAdn01lNVR/Q1nkf288lNEa/o53SZf
	T8+dz1SGXO/NgxclZOOgJPAe2XgcKV1K70UfVuZoYszTxmCnuhjVfFIQCrSI5mg=
X-Gm-Gg: ASbGncszgueeGa03F8z7n9aPZjnqWeEZRzpr71F59tOu3ghyuOw4HMRaPq3UkBXbA/8
	KQqVti3KHGHhPnLzWdqOPhLyvSCUr+kzO5GbjltDSRk0MInhBID+KCN/QZuWJ9Ns6QJJR0n41/v
	1Foc9acqwJgIYSkrAetNeav5G7zkOlEWUg7izOG51lbMk1SnygnliamuHNzI7Tmse6EO0NHOp4/
	cghB02ZGge510qx4kACxoIhTqawwmlv6U575QldzCHWlaJO+EZzbLiaoV90Uy+UHYxakaVaoYof
	juIT5nLJ8qcsZo+MIrJj6EQK51N/sJxFOvbwQeH06t58ywjAyd2+RXGXtEy+G9IEGiRVzH1uNxE
	mI7prgBMrxg06/FgC6sDGhtcdd6cLVDn3m8OW
X-Google-Smtp-Source: AGHT+IGrdiviIu6q9fiYP/RGOjIY03KXNIsY/WbK/qC6yiR83TyBa8iDeXj/6LQlS48GivuMZ5bWmA==
X-Received: by 2002:a17:907:86aa:b0:ab2:faed:e305 with SMTP id a640c23a62f3a-ab38b1b2689mr549230766b.10.1737204075606;
        Sat, 18 Jan 2025 04:41:15 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-30-28-209.retail.telecomitalia.it. [79.30.28.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcd73dsm332562366b.178.2025.01.18.04.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 04:41:15 -0800 (PST)
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
Subject: [PATCH v9 14/23] arm64: dts: imx8mn: add PLLs to clock controller module (CCM)
Date: Sat, 18 Jan 2025 13:39:57 +0100
Message-ID: <20250118124044.157308-15-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
References: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
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

