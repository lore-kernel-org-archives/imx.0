Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9132A72629
	for <imx@lists.linux.dev>; Thu, 12 Jun 2025 00:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749688773; cv=none; b=eJuL5AfOg0U8oQVagLmi48ivyUbjCYKa99yakO5llrrMqEQHDRU1/+pjf1Y0z4+33lCgNQVMt+coyQuObIelhQgW4ORu27RNL1mUgCnuKIZtGi09maSHgMmrCNC004/3TWRYt7v0oYPUrso5AD1oVBqNRunuRHrYMkCvMDUNou8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749688773; c=relaxed/simple;
	bh=OCRJy48VjGjdt7maCoRzcrU0HXVOPhE9bV0BifHD7QA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EkWfTLV/LEBIFRIuzPRuD67UzroFaIy4vYheip1OfJF1DG6AKFCi1mp7iMzfKRxngWpAUu6VsthEQ/d7V0NM8En4sdv2Ti7gUBAxcX7MhLs05iGtoDYgF4djBfuL/S0IB1/lsS7UYB6sSOLj0KoJK5mB+T4CdDtl1LXQ4sfQtno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VtMRdojV; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VtMRdojV"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7d219896edeso40200885a.1
        for <imx@lists.linux.dev>; Wed, 11 Jun 2025 17:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749688770; x=1750293570; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/fZSTUHnpCdIkoln/SmuVNeKT4swv6cpg6DfKi1SYao=;
        b=VtMRdojVR9DL7e3sppmc3jwmr8CkvB2D1UwE1FeKzspnEgrD48/9GIGjmE9oHPaKwz
         k07jh3wvcbX1JEgUXiPQWYTk8KMU+6tCDtjT4xGip+vF9HNLvHxpX0QEi1wa3aZO6Fbs
         2kdp37itUmboIX4/jJZyxk1JWb/lYfvpYZhB/3CkcLotVj87EBu/RiQ59mhl4rI1p3AG
         G+edgIsmj+Z81fV7if5MymVvztsnmDWDaz0mqdnW9kawNI6/aTeUje5FjVZpppeKvh2e
         0YrWBqVAgW3JYijuHc2zDusEZFC0mH+loW2ODuZeG5UfC0dPeGmwSHtDZxJIpdgr9dJ+
         XHcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749688770; x=1750293570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/fZSTUHnpCdIkoln/SmuVNeKT4swv6cpg6DfKi1SYao=;
        b=GjVOoxDcSsQiQYgvwYYvvFiArm9FN9DtL0I1zDIGwLxUF3Ctd7UkGUNC+Q6MVVq3Ei
         xPZnof3l+4JbB3eCLSGyDASpmSAjru7TqBJvojBlNS44XnTIAwXCKyIsbv96lLEy0lnH
         tomKUNE/Z8QbmRRverEZHnfyiFWmV8lcFcerDMHd8I2TazqpKb2VjO3we6YR8r8tGTd4
         e3Yi+JCLovlg750gyB/qOpvU28uiQ9fn/culQv+rBhLNQ7UEUpXmbV3Ev3RZotxBgWKn
         C3Q61JOffikGv4Vhp+4dB2Bx+nNctpdJWHqWB+P3Qat8xx7mU7nZk5U5k1G1QXAVWxxQ
         7aNg==
X-Forwarded-Encrypted: i=1; AJvYcCUAcFgkmbYgM7S3hDHtZ5bj5bJuZnv9pPhtl5uK4LQpTDoqbIfVT1umn7GMIelobEvrsBo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxGg63URfzuHJ4h45BW19wVX5qw1fVCuThPoTmEaw4u90EgL2cI
	hSRca/U2qR/iYPwNbicdq0Twa189ks7CTgy76chHyTrCGkH/K7QFapac
X-Gm-Gg: ASbGncsy1nb4oEUQkMYvz7OvxKrUegdaxTt4vFn6O85Ovu89KHR5gyEX5xI85sw9TPS
	ihBQ2iD4EGDxHvlZCCAhoQUP85NQ+7iCRGDkp7ZcbPcnrDPj0U4A7M+3rDHuWtYgIoh/fAQava5
	DUOPcWXjQ9EKKGUB1meoSNJbWl08A5U1wX/IusVzKgbDi7t3vu644DZR+djZ2/7ASnhfCohVwHQ
	KsfIosxbYk5d7HdBlJC6VheXdVgxTKGzrJlcdShG6czrA3zxpxK9a7SOzZisuPtQBaEuJqbcgao
	lKOBlAHR56zi2Y9bNxW2ZVyh2fLLGn7hSR4KTOVT2Q6TZqHDD1sWXyZl5hgxOHzum1KUswyGWYM
	STGq5aAPFZPxpiYH9mqVkJtWA1YasO3fZ2p7LHrTFBxeKpwk=
X-Google-Smtp-Source: AGHT+IE0T4IWYcc2xUgd7VquqVdTsmUZWXLcctw/Eb+M2rfGp4uWepFmDd7rs2MYip49/yRfcZCKug==
X-Received: by 2002:a05:620a:1a21:b0:7cd:2857:331c with SMTP id af79cd13be357-7d3a893a2demr669978285a.42.1749688770447;
        Wed, 11 Jun 2025 17:39:30 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b528c300sm35935485a.101.2025.06.11.17.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 17:39:30 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	m.felsch@pengutronix.de,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 2/4] arm64: dts: imx8mp: fix VPU_BUS clock setting
Date: Wed, 11 Jun 2025 19:39:20 -0500
Message-ID: <20250612003924.178251-3-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250612003924.178251-1-aford173@gmail.com>
References: <20250612003924.178251-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Marco Felsch <m.felsch@pengutronix.de>

The VPU_PLL clock must be set before the VPU_BUS clock which is derived
from the VPU_PLL clock else the VPU_BUS clock is 300MHz and not 600MHz.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 1bf15c502280..909555a5da4b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2283,8 +2283,8 @@ vpumix_blk_ctrl: blk-ctrl@38330000 {
 				 <&clk IMX8MP_CLK_VPU_G2_ROOT>,
 				 <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
 			clock-names = "g1", "g2", "vc8000e";
-			assigned-clocks = <&clk IMX8MP_CLK_VPU_BUS>, <&clk IMX8MP_VPU_PLL>;
-			assigned-clock-parents = <&clk IMX8MP_VPU_PLL_OUT>;
+			assigned-clocks = <&clk IMX8MP_VPU_PLL>, <&clk IMX8MP_CLK_VPU_BUS>;
+			assigned-clock-parents = <0>, <&clk IMX8MP_VPU_PLL_OUT>;
 			assigned-clock-rates = <600000000>, <600000000>;
 			interconnects = <&noc IMX8MP_ICM_VPU_G1 &noc IMX8MP_ICN_VIDEO>,
 					<&noc IMX8MP_ICM_VPU_G2 &noc IMX8MP_ICN_VIDEO>,
-- 
2.48.1

