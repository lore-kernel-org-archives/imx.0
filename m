Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C23C1DE4CE
	for <imx@lists.linux.dev>; Sun,  1 Dec 2024 17:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733075272; cv=none; b=kpajdnijuu0Q4j+OioFfamgqDC1+pL7X7vjwhh1sg8yKCU6wYNRCWfyyGCw7ZVIk6fwYoi2lfZtjkmGLMolua01QpDCiDRvj1oQ274YzN9VBlV/GLQzJ8kpc7XgqoqI3Jq0mbM2M51KdXqLG2slz+UlkMmPBGWJQZMxs3YxDEf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733075272; c=relaxed/simple;
	bh=FRFUyZwPX4G/0Cai4GmO9ovi+nkQmDVraCIaymyOQS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sHdtapwlcBOOV0qNJZG77870XLiVaoNmGZlVEeFdxcdfD3om3PUsZDiWT8o1XnUPWYk+sDiWvLBeHTDFICFXq2U+jVyuZ4lDZ6Mald0BKOAWdI5fBx6AJHty86HmnFel4i51KPLnZoaQfhiWohIDHK+YHENzGN/VOCnZW5TssYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Y2wzS23L; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Y2wzS23L"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aa5325af6a0so494522066b.2
        for <imx@lists.linux.dev>; Sun, 01 Dec 2024 09:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733075269; x=1733680069; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C+h8roym6BKL4klc060XmQbisU15KKTnjExLT+vczjQ=;
        b=Y2wzS23LR1iGZc/e+2CBeaijc3/QpokLisz22hwS62TajBRwT8XgDl5r7sMHiZ6ENE
         rs28lkz2d9EDl8IXtjMPFY5yQvQgiy83cTHB+Yciyat+OeTAkzFAoc6wTlKtRLg+0mhC
         IDKZ4LUpDJIxU5qhXgggHnZ0+Nxbp2iQixZGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733075269; x=1733680069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C+h8roym6BKL4klc060XmQbisU15KKTnjExLT+vczjQ=;
        b=n35quLaa/IRGT2qzvaSJdvDCyxi3S/ZTK3sqLfo90rPY4fKQMymBL/NHOSi6j1/5dL
         M8RtwNUSpYW0IPTuhGAE94nUInTPj3+5AII6E9QwoFPdA/tjdyl0C4D0h7dY0W0cD7LR
         PsArX/DrGuaN6pQqzloeFiIY/7n/hCWLg/0hb1Xqwcnk6KYe58fBjbD207neANZ0KEgJ
         /kbpEWoQsOCSl2wywpXAOj7NlHfloHrVikCYjf8H167fyzvxbTXpkXz81zkcrCRs7/SO
         bW9sWfOtxQboS8a/E7MAOkZlC89X9pfQFmFmsiO7F3ukEYw0lSoZaSB1vn4RlVgDptb2
         LFZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEr5VSMZJmcpz4BDIW7zUSPe0bV+tzlIvvYksv7yVUaMic5ukam5JVJwZGWKPy1x2mpZs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxwWnY+n2ec1/pPfmtqAaJHYpbAYScFdaokCxEAygOWssOn9oLB
	FKtk7msIuCEYo/B9MRZ1hsjJ5zNwZwrpNpi5XB7FZ80eIQ7VQPqRaMEjoErJ/no=
X-Gm-Gg: ASbGncvWGgaxcpeM7xfDbQYiTY8Jh9ZI4RATCcwZ1yzx0lUYDUfX/eupGjj4mTr0BNF
	sGhCnUdzofj9/32/k7B7nJZ87cfnAao4IMpPkt8vX/jLQwxa3/MKmpdM5CHGD+mY8FtxjH70p0K
	ZvsZAkrO0wqiEJNcO2Qx9wEOXMUFPBKG7tG6JcMnPNzRqqJqCgtMPCExNzz6g80MA9rdpByBV7v
	nFmOTq0f8BfzsE+Jt1hxnJ8Ro6WEn7XpbzkZU8hUr1kfr7b721hPMn8Lwr2Vtz41ckW4nFQlrdf
	3xRzjLpsIyuOsW7gtg20uJ3uKfmP+XF6Z1V37vz7HQ0LebZDnU4UiV9T0AgJNecK320qimRKsKn
	5lotrSwpc2B6Q5OE1
X-Google-Smtp-Source: AGHT+IHcG2/XEmp2qpnejnJb7rN8m4vpml4qw4y1T/GeofPNf27UqhM/khEJJ1uq/MGoaT5KNjmbrQ==
X-Received: by 2002:a17:906:3145:b0:aa4:9ab1:196c with SMTP id a640c23a62f3a-aa580edf60bmr1451047166b.9.1733075269496;
        Sun, 01 Dec 2024 09:47:49 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a78esm415220066b.163.2024.12.01.09.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 09:47:49 -0800 (PST)
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
Subject: [PATCH v4 16/18] arm64: dts: imx8mp: add PLLs to clock controller module (ccm)
Date: Sun,  1 Dec 2024 18:46:16 +0100
Message-ID: <20241201174639.742000-17-dario.binacchi@amarulasolutions.com>
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

Add the PLLs generated by anatop to the clock list of the Clock
Controller Module (CCM) node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

 - Added in v4

---

(no changes since v1)

 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 0b928e173f29..861bd4f4dced 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -751,9 +751,14 @@ clk: clock-controller@30380000 {
 					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-					 <&clk_ext3>, <&clk_ext4>;
+					 <&clk_ext3>, <&clk_ext4>,
+					 <&anatop IMX8MP_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MP_ANATOP_AUDIO_PLL1>,
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

