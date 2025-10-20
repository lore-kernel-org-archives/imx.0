Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AFB330D34
	for <imx@lists.linux.dev>; Mon, 20 Oct 2025 16:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760979128; cv=none; b=NyeftTdmc6sCUMKpK93+WIN3Imx5qgB7wfAHKctcBGQy8YT943Dzx3+60aPZ39aVzSZ0tLzocC+TOSNDRS7uPtUT/AIUoXm/45fGe8JfHEKHQNu59uYlFkxLFfMlrTHlmUSChJkWxWumAqGFY8dVd5mQ636xDRUcb9bZ4hMw7gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760979128; c=relaxed/simple;
	bh=4nbEQ8HptUqVap6SvzTvdcQnIWSSvjBtVAeIUe9rLpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S/fp73hsvyfWGgq9GQIx8dFSqGi0R6GRrWJmaIIje0l+rSrmo6lbdmEASrv2LQBJVH0DFml7+dQWlZejH4dWR7eHlYunoZ5AghyJxfHY1i+vV2i63h4+yy5ag/b3lw5dYZUjKyvrI/Ym6ICWcvlqwYGJyua06eNHm9Gigq6gN1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=QNrpe4GQ; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="QNrpe4GQ"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-430aeaffeaeso21023235ab.3
        for <imx@lists.linux.dev>; Mon, 20 Oct 2025 09:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760979125; x=1761583925; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZbkGMRUd18xqKrBxXTdlQugMN1AFOTBEWC3fjv7PzZo=;
        b=QNrpe4GQwtmZLz1bymYd5PetD7DmGdjWbgk+S0dWLFmvpnVU/ZqukcZGLlBRTk68DX
         hmmCteqB+tJ1W/1NhoWriBS4Xzk20cycxrxnak1RRVArynNeT16jd7jaKdkFRoYYyr+G
         LaZSEBJ9K3cCY2kcOTnveWmjiNC+T74Cqj1WCL27HPfCPBa5UNOOSeSc8tOyvFIcWM/b
         Us/AoI43DaHwe7/Qqj3m46MYZg+7inprg/pirYomO+jLTdEMBBtzLLYd7Z7xDLpq5r3R
         XMMloWGwGBk1IOOa2fovHZRxJeQeW7FW+K/caPKH4kqsqMZgYHwxKrJWveSha3/KF7bO
         lybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760979125; x=1761583925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZbkGMRUd18xqKrBxXTdlQugMN1AFOTBEWC3fjv7PzZo=;
        b=J2BHXbtg2/0VFFnbvgkEK0lW7FN4xb+v/CMilDT/ogm1Dh92zbQWCezvpz9l60RBmI
         Dcf06mWKss2uHIO7LlV3aRVepsRyg0lkaPOUVfAWDAYDd4RwGgVckMAuZu89+BbqF/ya
         Kd06xlfNCUbC8hjyT2xKZmpsOFYwPnz471Yd4sj09aYRidtl/YsJFjOfGlueFpJrfJji
         HQVyybRKSCmKtSaozzV45QU19Q89pnydIigrdV+l8AU5tKFrFlsnatwzN1Es/737aN6s
         ZTMMupftJjFslyVlCDV+rdtTFYgfWtjUHQjIkOGwVsi8SCKcuRV+6267h24zmw+ClemR
         zoXw==
X-Forwarded-Encrypted: i=1; AJvYcCXwCYD4utMCjeTWdtM1LI/wVreW0b+fIhHtBEdrxjL3IIUf6/rUy76DWkI7zlcrzV6f9ro=@lists.linux.dev
X-Gm-Message-State: AOJu0YyQxhGce4Pnp5th4kSRj/ulH7+K/kTVp4VAYYJvVn95m3Ci7rgg
	EtOE6pyltUb4Dri0EimLdPzA7+ZWCrv5xr8fnKx1tqJ9G0Xf9957WlG9LJyCH3i2dU8=
X-Gm-Gg: ASbGncvkSktBkuG2ErShquuPTyJeyGPMp2SkN+nlc9lpp3JvACz/umXXN82wEcOfQDb
	XCEIiZx6qWIoTSVCEQWgvzztm2ypRlTzovzUt991mvFvvDvZPCnFFtJwmxytW81U+FAO8/A5MLC
	XT7YSv6yJJ7GcUI1y0eY9i0vVLunyu+qNGLno6f/M0gFgPp1LlA03momAn7EZsvMwEnsrm6smWB
	ZzTClZDINrJg0jf/Ly/Ghc9fjoBgVZ5+/rwpykT9E2GaYccMK+4tFaSTjZ54ZGR2u97obrpdoOz
	hEE/4iboOZqd1/RUQZ8+pIlyNAFwsnIMqhaxf9RGluIRaPEUPuxFsyjcEDMa4WaQJ/+hPPEFAFo
	vp9zfPzmsGzT4QoJaANeCjukzysLMCNpM8mgCoxrkoZLoiF1JNMqdc0NE7VVRUuqaQXVygxoYsN
	ElGNvtiKjeNnoABJ3PG2JFI1cmEbxUvUm10rsdMdpHYts=
X-Google-Smtp-Source: AGHT+IHCCXKGX40QH2SOOPyUbP1RmuEfte3N63LZWZHm5ASq68QX+HJbW0W+2yUOmNOCzqkQxIE7PQ==
X-Received: by 2002:a05:6e02:154a:b0:426:e20b:f5d4 with SMTP id e9e14a558f8ab-430c52200admr217203785ab.10.1760979124829;
        Mon, 20 Oct 2025 09:52:04 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a9799428sm3116783173.63.2025.10.20.09.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 09:52:04 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: han.xu@nxp.com,
	broonie@kernel.org,
	dlan@gentoo.org
Cc: guodong@riscstar.com,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] spi: fsl-qspi: support the SpacemiT K1 SoC
Date: Mon, 20 Oct 2025 11:51:49 -0500
Message-ID: <20251020165152.666221-7-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251020165152.666221-1-elder@riscstar.com>
References: <20251020165152.666221-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow the SPI_FSL_QUADSPI Kconfig option to be selected if
ARCH_SPACEMIT enabled.

Add support for the SpacemiT K1 SoC in the Freescale QSPI driver
by defining the device type data for its QSPI implementation.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/spi/Kconfig        |  3 ++-
 drivers/spi/spi-fsl-qspi.c | 10 ++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index 4d8f00c850c14..2e3d8bd06ceb2 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -435,7 +435,8 @@ config SPI_FSL_LPSPI
 
 config SPI_FSL_QUADSPI
 	tristate "Freescale QSPI controller"
-	depends on ARCH_MXC || SOC_LS1021A || ARCH_LAYERSCAPE || COMPILE_TEST
+	depends on ARCH_MXC || SOC_LS1021A || ARCH_LAYERSCAPE || \
+			ARCH_SPACEMIT || COMPILE_TEST
 	depends on HAS_IOMEM
 	help
 	  This enables support for the Quad SPI controller in master mode.
diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index 9ecb756b33dba..f4f9cf127d3fe 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -267,6 +267,15 @@ static const struct fsl_qspi_devtype_data ls2080a_data = {
 	.little_endian = true,
 };
 
+static const struct fsl_qspi_devtype_data spacemit_k1_data = {
+	.rxfifo = SZ_128,
+	.txfifo = SZ_256,
+	.ahb_buf_size = SZ_512,
+	.invalid_mstrid = QUADSPI_BUFXCR_INVALID_MSTRID,
+	.quirks = QUADSPI_QUIRK_TKT253890 | QUADSPI_QUIRK_NO_CLK_DISABLE,
+	.little_endian = true,
+};
+
 struct fsl_qspi {
 	void __iomem *iobase;
 	void __iomem *ahb_addr;
@@ -998,6 +1007,7 @@ static const struct of_device_id fsl_qspi_dt_ids[] = {
 	{ .compatible = "fsl,imx6ul-qspi", .data = &imx6ul_data, },
 	{ .compatible = "fsl,ls1021a-qspi", .data = &ls1021a_data, },
 	{ .compatible = "fsl,ls2080a-qspi", .data = &ls2080a_data, },
+	{ .compatible = "spacemit,k1-qspi", .data = &spacemit_k1_data, },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, fsl_qspi_dt_ids);
-- 
2.48.1

