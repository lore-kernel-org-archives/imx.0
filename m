Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440054DDB5B
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 15:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789659714; cv=none; b=ZcHcxBwMBVHvg0EPMN6fIQVecOk854Wwfm24GQsqi6s9wo2B0gZecmP9aWQ0blHGmwi/i5l5H4ggywHqilUTfvGt5S/cKao01oGeDh92gtXZb8p7feVG5An927r5wgYhrhE37X36c/6BN99d9p+lFBuCJTZmIl7cVhjANoqPpgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789659714; c=relaxed/simple;
	bh=VGQ7i0rsWlHK10W0mC5TJ9kvAaDRj77XeWPsthYR2k8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VOx5sgZOQz2EqqpXyP3Skat4Yqb00SxBAELMu74+0Xc9X8WYjAOEZ/SGL6t3ZLqHSv127NVqs+Zos/pF5nz7CWskDr/mtc2u9jup1b9coWOwJ96xsgBh1+LLARjNE9ovOiJomy+QZdpoXFroqEcXuagoTYGKvBDbfw1VUy/hzts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TIlMNA/a; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TIlMNA/a"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccff31419so8468435e9.3
        for <imx@lists.linux.dev>; Thu, 17 Sep 2026 08:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789659702; x=1790264502; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZTHVF5d2BHEGYh8wWAhHMVlO8LgEUkq4aZ2zQxWQOk=;
        b=TIlMNA/aXYLVa9/tcloXDNGx3vzXKTf5rfiwtToIQUu7EuzyEyBTwBfhJEu7BBft7l
         zFWRU3xoZFNHQ5pCINXPrAv1NMq8Jc8zLZ9znNCr9wD7pxQWkHoP5PgrtVnLU+HmTr3A
         1Kq87LjF1P622A8ysSynEUkGEPdEL8+3KhuPmO4e/t8LfxW8CXrdi5pEsfe124bxvD/w
         w2phW+iRWFDLv1a3Q/kHnU+cZp8ezZD0g15chsIjiCTBRf0Ou/GvWL547WWKcZY/Sttm
         dskT+oFwo9PbPlaILHwq2HO1jc7qlejqFEl/f30P+V3M4C7BMMU8Snyp8tjLRPBNhQbI
         CcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789659702; x=1790264502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BZTHVF5d2BHEGYh8wWAhHMVlO8LgEUkq4aZ2zQxWQOk=;
        b=MSSWUCwa2mFzMOejuQb7g2P9xaFpOgNtNgI1cguM/HMHlkZWUfHElsEXHVTmECwNC+
         82aNVPQeGZuR3i2rLG6mrLKfMQ+Q7X58bef9EEbZysAoKp5ch34kMOYSBlCco+VI6PjI
         u9vJj7U6+z3nawjf3n1oy261Vhfk3ZSOaUzdF1IAbwHAe9s+zf1EWDThAzf+7VTzcZNW
         4UE6XNdvsNLzQWMnk38FjuOUFicsRX8CxD1G44GbcvQJlDV32gtJuPVQjuf3f8aJbT1v
         eN4K4y7HkV6t13YDdDT+bh3EHHlI22MYnVopFlQ/+xVZUM/2dA4s4JE/mrdb6Rp5nKqE
         X5/g==
X-Forwarded-Encrypted: i=1; AKwUvByY+QmVuzWRGFsP+EL/OZf9Vxd+fppe8mtVZi4KBCjWm+lb9N3l/DTrzrR0e2ZStN5Garc=@lists.linux.dev
X-Gm-Message-State: AFuF++n180e/3XAmYkYVC6b6CjcZEfN2DrA4t+Gxx2opaWgU4aYMnPBy
	aOFryFL6zOZ1m9thmCKciPx63CajDKyvIr9VAxVPIwRbjZsi4Z2FHs12
X-Gm-Gg: AYBFou2lS1XpNHBXcHDr5jaFXMadHRC1nPaU8zviTr9as1SaoE/kbq1FWzDHSsAtNsA
	W1mzEu6mng59JyZLLz6c6u2m61UbTgB1oCs7JyT4m9Zedu9Vw9Nz8j5fW1FQ6ZWxGXOnNMA2a36
	pzEGPUEUJhi8UmwoRAYOQmVW6CZIdAn2iHY5a2ZZK1yxBuHhWBvo4ywG8uTkQppW+0oGHKjsLQu
	ILG9tpaEm9dgqgNVC44o2yymDRL5xupctHcGDdyNVFB/GtCXbG2bsu2bDhjkdA3hSM3h6VgxkrN
	VZUFNL9jIvQvM5u1baYTGegHVs6yVN40RlfZmplbqJqHcn/NC1MWatpjsKViV2MhzvWs3aBxM/0
	LAFms6ORMGte8WcE/hFt91pixrysDpkjLS/DkWSIV7kHz0NCGBjZHDDNP7rx01K6A+JoM/bxNkJ
	p6uy3E2LxOw4j5XSaz4O1adZx1u7zx/HJnRAUN09eWSxPkv+le3+ngbLC5zTKp/dXK+5wGQfsXg
	uhCL4z0r4WMXvG6ns5O6bVrZVu2nupo7wvimLz27I5i0bpBt3YSHpCqG484hmLjw9G/KkpyK5JR
	PWPgzaPiQwQ4DaoreM9xCQejDcK44Fm0
X-Received: by 2002:a05:600c:3b20:b0:49e:8377:c880 with SMTP id 5b1f17b1804b1-49eb733ba12mr88495725e9.33.1789659701524;
        Thu, 17 Sep 2026 08:41:41 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd227141sm100124235e9.2.2026.09.17.08.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:41:41 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Ferraro <francesco.f@variscite.com>
Subject: [PATCH v2 1/3] arm64: dts: imx8mm-var-dart: configure SAI3 synchronous RX mode
Date: Thu, 17 Sep 2026 17:41:28 +0200
Message-ID: <f155648a50185df5d273f697f10fcd7efb154364.1789659585.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789659585.git.stefano.r@variscite.com>
References: <cover.1789659585.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Configure SAI3 to operate in synchronous RX mode, so that the trasmit
path uses the receive bit clock and frame sync signals.

Remove the TX_SYNC and TX_BCLK pinmux entries, as these signals are not
used in this configuration.

Co-developed-by: Francesco Ferraro <francesco.f@variscite.com>
Signed-off-by: Francesco Ferraro <francesco.f@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
index 2324063f8fd9..c7a9eb23e5e8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
@@ -305,6 +305,7 @@ &sai3 {
 	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
 	assigned-clock-rates = <1536000>;
 	fsl,sai-mclk-direction-output;
+	fsl,sai-synchronous-rx;
 	status = "okay";
 };
 
@@ -446,8 +447,6 @@ pinctrl_sai3: sai3grp {
 			MX8MM_IOMUXC_SAI3_RXFS_SAI3_RX_SYNC		0xd6
 			MX8MM_IOMUXC_SAI3_RXC_SAI3_RX_BCLK		0xd6
 			MX8MM_IOMUXC_SAI3_RXD_SAI3_RX_DATA0		0xd6
-			MX8MM_IOMUXC_SAI3_TXFS_SAI3_TX_SYNC		0xd6
-			MX8MM_IOMUXC_SAI3_TXC_SAI3_TX_BCLK		0xd6
 			MX8MM_IOMUXC_SAI3_TXD_SAI3_TX_DATA0		0xd6
 			MX8MM_IOMUXC_SAI3_MCLK_SAI3_MCLK		0xd6
 		>;
-- 
2.47.3

