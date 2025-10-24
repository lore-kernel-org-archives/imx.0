Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8464336A606
	for <imx@lists.linux.dev>; Fri, 24 Oct 2025 19:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761333367; cv=none; b=QSJbZ+2lUqaQMkTb1xL/17EOcNeN9VK0TkrTGgeqxTSCRCz5FmdyP3qmlOwgE4/F8Aj0yGFNuSwe6hE3tWPBWTzQ6xMSf4v5Nthirs0Y69+C5xwsJpHTHdAJFU4v+z+1D9gceyG+AQtOofSY+0brWrBXVR4uCxBzDotDuNUZQt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761333367; c=relaxed/simple;
	bh=fJYpRFRILxdNLkxi4Dero+aiC/WPnQUq9uXWEscfpMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dBIA9OXV3sIaSVG4+Wsupd6EnjhNYwxbwIKZx5XPv8mJLHTHWeicKIIRdS6k395BAD35JLC6kTD1wo59WOJ0cOHXcin48m3QNYyA37wq/MUodnCKGxBk/l2COhf4iQmFP+Io7V8yP/dEL+gj8+65wGQC4r7LCeSkx7xSCKtNsIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=SAlv8e5i; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="SAlv8e5i"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-430c151ca28so10864275ab.2
        for <imx@lists.linux.dev>; Fri, 24 Oct 2025 12:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761333363; x=1761938163; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPf7dJcoXU9s785ZftOfTSEvtOpAo2Z85GYUpq2DxVw=;
        b=SAlv8e5ihW+ztMZ26W9h9WfT1Y1jG/PgUcnqIRvkqOUBPV3C3YtNiNuvjNO5k2J8+i
         bysYFNKKE/ggcAo2q59vYpGy/PP53cF3db2qFRszRASF3XBB1AP6JAL5MQJ8FfXL/c+9
         4vQXjFaWf8d2endntX8pO5G218oJ2Thw4gAO5Odje19oAAd3Ir6+QwLdzD8GgWoqD/5C
         ySpTLd1fP2SASsn1YMob0DBJQD8MLCTkAdJ9k6dYMmDjW1hmb2u1kqfmrr851KfNUUsr
         99yeUPewzKkFCn1o1dAvfQUQ4oRsOdSUBLmGx3/1cleVqH0GQ88u/r8U0BK5GHYVSQ9B
         +6Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761333363; x=1761938163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LPf7dJcoXU9s785ZftOfTSEvtOpAo2Z85GYUpq2DxVw=;
        b=GCDn2z6RTO1ZUU7t+YfNoL0RHG44mSzr/kGSiFpxdnkywA39iuQJzin80LazDXao3K
         QIJ+yQyT0kjHfmPHjULyqYYlFTuK3ZV/OmQjEkjS1HfAhQVe41eRNiLfu0lWF0s+Hd3h
         2vR/MlonEWxPfF46JNoNNSAeqhbTuoF1RczxzUgg+KyNbWhjCc9JyETU1jIKCAASPmfs
         F8CDjXcoWezQL4MET9rgrG4xcJvTkDRKkf/qqtc0IctAr+DKTW7bkQjx6fOi9XZHoIur
         K677oxLcGF4YIgnTWD+3n3IKb2FQt+HcH7hNpw4k7T/KfBmcBLRlHce27uYq6u0IBZ3R
         1OJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpFtwCjnaihKPsBBxHYPaACLbFqlSihwoYuLT7fKJX5mBUcv/8kaNkWcNPNOYd79vR4vM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9OwXGOo68k0jsK0X/ksr9YkYqDddZLBJ6AtABPQdG68EDNs93
	HRhwof1wzl4YOzAf7pGTffQlVnIXzgc7lPxKrOSYbbRKv+oOj+xZYuBUgyHdOT+4Pv0=
X-Gm-Gg: ASbGncu1joMZz9jtRoeOTYRyJgiSzusTk1Syn4Aea3TdneXf4UAVe4YWnvsLO4kHMNA
	h0rENSM9J8yqnQj0TfPsr5XgMwlkkzlAkA5z6RHxY3giODY9uwH0X/NA3wkQhHOHuMxQtwSfZlX
	ttZv4g/vBCUTd6Bb19XYD3lJn3wpl/QSzGi/IE2tFAr2+apx54LJnq5V7BrQSMoyZgmpSKzgpc9
	XYTe7amugEm5Rp0cpeUiJoCl0Mzukc+46wj4kul1hOW8+SG1RH7mVsJlBXrkLRpTlKu2/ySZD5H
	3ETFd2Kj7qpmpZW49Fqf8a6FyYZqW/3xV81ZwTKAL4ZTRHuZ85tekELa4sQj8HIcBV9V1Z0IydM
	OvABVSbO3p49kJ/YRBtEHLfZQ++V2k9h/9JzlnqXPzYXcpM11TKF+RchB0TcOQ6EFHk3/VlRUhc
	fJuB1ABFZcOKSLEGzxtLHO0v0qqealAwWg09C6UulOrqd9pFouvUn1Hg==
X-Google-Smtp-Source: AGHT+IE7iOHD5RLmA2kk1MvUlsZ0DBgSjQiI4X5X30Jlm6cwRYZovCXte2pXzgLa3TLg4hmhyFE+dg==
X-Received: by 2002:a92:cda3:0:b0:430:b4ca:2696 with SMTP id e9e14a558f8ab-430c514e290mr430965745ab.0.1761333362623;
        Fri, 24 Oct 2025 12:16:02 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5abb7fdb7c7sm2427824173.44.2025.10.24.12.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 12:16:02 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: broonie@kernel.org,
	han.xu@nxp.com
Cc: dlan@gentoo.org,
	Frank.li@nxp.com,
	guodong@riscstar.com,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/9] spi: fsl-qspi: support the SpacemiT K1 SoC
Date: Fri, 24 Oct 2025 14:15:47 -0500
Message-ID: <20251024191550.194946-8-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251024191550.194946-1-elder@riscstar.com>
References: <20251024191550.194946-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow the SPI_FSL_QUADSPI Kconfig option to be selected if ARCH_SPACEMIT
enabled.

Add support for the SpacemiT K1 SoC in the Freescale QSPI driver by
defining the device type data for its QSPI implementation.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v3: The sfa_size field in spacemit_k1_data is now assigned to be SZ_1K

 drivers/spi/Kconfig        |  3 ++-
 drivers/spi/spi-fsl-qspi.c | 11 +++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index 4d8f00c850c14..592d46c9998bb 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -435,7 +435,8 @@ config SPI_FSL_LPSPI
 
 config SPI_FSL_QUADSPI
 	tristate "Freescale QSPI controller"
-	depends on ARCH_MXC || SOC_LS1021A || ARCH_LAYERSCAPE || COMPILE_TEST
+	depends on ARCH_MXC || SOC_LS1021A || ARCH_LAYERSCAPE || \
+		   ARCH_SPACEMIT || COMPILE_TEST
 	depends on HAS_IOMEM
 	help
 	  This enables support for the Quad SPI controller in master mode.
diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index 46a3187b33548..a223b4bc6e637 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -268,6 +268,16 @@ static const struct fsl_qspi_devtype_data ls2080a_data = {
 	.little_endian = true,
 };
 
+static const struct fsl_qspi_devtype_data spacemit_k1_data = {
+	.rxfifo = SZ_128,
+	.txfifo = SZ_256,
+	.ahb_buf_size = SZ_512,
+	.sfa_size = SZ_1K,
+	.invalid_mstrid = QUADSPI_BUFXCR_INVALID_MSTRID,
+	.quirks = QUADSPI_QUIRK_TKT253890 | QUADSPI_QUIRK_SKIP_CLK_DISABLE,
+	.little_endian = true,
+};
+
 struct fsl_qspi {
 	void __iomem *iobase;
 	void __iomem *ahb_addr;
@@ -1003,6 +1013,7 @@ static const struct of_device_id fsl_qspi_dt_ids[] = {
 	{ .compatible = "fsl,imx6ul-qspi", .data = &imx6ul_data, },
 	{ .compatible = "fsl,ls1021a-qspi", .data = &ls1021a_data, },
 	{ .compatible = "fsl,ls2080a-qspi", .data = &ls2080a_data, },
+	{ .compatible = "spacemit,k1-qspi", .data = &spacemit_k1_data, },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, fsl_qspi_dt_ids);
-- 
2.48.1

