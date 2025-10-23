Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39E334C804
	for <imx@lists.linux.dev>; Thu, 23 Oct 2025 17:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761242375; cv=none; b=aI1Ui1TfilG8TvmCnIgQO4LHw5J9R+ibM9PHmbGhSnwbqLABL+NVaTb20SInwbbs85zeVi6nqc73h6+LCsF3545cSr7+7Gc1sqCLM56WpJ5LZa/DhaJ1evjY511bKKWk1k4JN0K+bxaj8NwqwKQjaQ0ZWzbw3VS/aPOfbXMq+do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761242375; c=relaxed/simple;
	bh=dnCGB01wbbXE+/x5ZL+8+es/jtlarQfWqAKWcy4NrUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M/r8V6sx444lnKBVbO8LjuSfqoeigQ+E1Uzsiv01nbs74X7W6k8LSHRj7HeXpwO9GNuIHWudxFRaeKh0ee0m7lpgzWimjCGDfhqI9XBHJdFf7P1L6r+DsLsrgqtW2dejqzjdraLjZmOMZnIi2+BQ0ApQufPtKu44B9HAxZj1Enc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=VHvZws83; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="VHvZws83"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-33d28dbced5so1514876a91.2
        for <imx@lists.linux.dev>; Thu, 23 Oct 2025 10:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761242372; x=1761847172; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0LXU+r3p2H3OLM8MjqTR3TSPttnWfeamJ354G5+nCPs=;
        b=VHvZws83S+8cMajnO+OsUw7r6lg50ySXNpXsDHAnaomUgr2Zf3mfwgbojfMGFo/Lbs
         x3q8jD+sbGPErFKX3Y60PFUyd69cLG1xtmru+l2IxLmDgtREY4VEnVwf6+KTraRfrJyi
         amuxyuIWnjPtbyGWKuBh885OobkuMcdrXM1De+eNjuSJQuNw79y/RbDci58B6WhQEZG3
         K0x/pfFDeR31RGK00FUpY40QA1G6Uzhrx7v0eJLZwMmSpbPIHygcb3tjtLRlLUQeFVXj
         Y71VNygpwvq+kKRpXfKsrIaE/ptMn4PrIQ+Oqh2Eqgsoyo6qS+3R8WluxNHID81Lrvdq
         FRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761242372; x=1761847172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0LXU+r3p2H3OLM8MjqTR3TSPttnWfeamJ354G5+nCPs=;
        b=N9TnmrfwX2YbV2aQ8456Ylq50M6a2BlhIWvRHkH4uM+TvPCql3h7+ifUxDiFXrA+Ua
         Z/0LGk4MfS5Gy5UGZgdmN1SwGNcmPQHDebNcRkhL59UI1lGYebn6HsWt374xc3kSpNtb
         qvEB5b3+aGCdmiLi2Rh5a/JB/bsRGhjSs+zULimeLmmBC3tsZiYYNKWT/bvJCRvBlC4m
         0Eq5Ki5KTus/+j0g16gNWgKBQIkQpRx6WaicRg9CJnQVgT+AuWuBbRIRvBvyz2CMAbRg
         jOFIncskKH0bRenpS76MoO91Aw92ozAOSdcZgaoGsOtU0AvsEXMQ2DuT5d63vpaMWrpa
         WNyg==
X-Forwarded-Encrypted: i=1; AJvYcCW7H8HeuVPUA0HYdkwlu74RwWlGg3gjGSoccsG7dDNX4oVWJTHMMwtegXWALHc3h1B5MSM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxthLNMJeyZ80UYffxIZoateJxCbNvV7z4waeyou7FfgY6G+wMM
	cgZtJj3ICQ0mt1PJnwOdUrCJTzoAFCF26LNwupBKcjxYciqNRcMcvsTWjr6MaFuUxHo=
X-Gm-Gg: ASbGncuu78PvWHbWgvVdCF7fU2g13R1+ikpWyIGq7ayvGnEKKfH+VpgrDi5qhzhh8kb
	Px6RsIiF77UX7hMgA8GYcDxinYQihxQqklNMEfiPR9ZjNkn2Ri74giMA41YjT0qqbI2V5Khjydn
	P3sTcrt8IG4wsXXeE6qu8g82EP6hzjfrOzEYFd7eg8NA8v7oQpjFG88udufBIaOQvBBycpSHLtN
	t/tIXqDwMI+GNo0KS/0nB57tmP0R/zV9vpMzCulYnVapnckS2Z393JFjZh4TTdzpyx/0NjMgnFP
	vB+WW1Vpc3SSUKD4Lz+tTomw6fb68XQB2WRV8urUmOS4usxtossidi9AbfFmhd2dniTxRLPXbLz
	RVQUfKCMj8GRAmNEdCuV+EX2qmuTQ1bU2E1xX94gZD3m7m+78/TDgFozX/zTRmoMTKB01AiyMqC
	haBKFDoAPaboxjWzZXAqMRCvMgmDydls+GtQ==
X-Google-Smtp-Source: AGHT+IEF41yHnh/Q9tj7kOyP7EkFl0s2frDdTCHx9ucShzUXPPZ2GVIgbE/DpmewAxUbKZPk9NMitQ==
X-Received: by 2002:a17:90b:1dcb:b0:33b:b033:d7e5 with SMTP id 98e67ed59e1d1-33bcf9186f0mr36102913a91.35.1761242371953;
        Thu, 23 Oct 2025 10:59:31 -0700 (PDT)
Received: from zoltan.localdomain ([208.115.86.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223d1265sm6447431a91.3.2025.10.23.10.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 10:59:31 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: han.xu@nxp.com,
	broonie@kernel.org
Cc: dlan@gentoo.org,
	Frank.li@nxp.com,
	guodong@riscstar.com,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/9] spi: fsl-qspi: allot 1KB per chip
Date: Thu, 23 Oct 2025 12:59:18 -0500
Message-ID: <20251023175922.528868-7-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251023175922.528868-1-elder@riscstar.com>
References: <20251023175922.528868-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In fsl_qspi_default_setup(), four registers define the size of blocks of
data to written to each of four chips that comprise SPI NOR flash storage.
They are currently defined to be the same as the AHB buffer size (which is
always 1KB).

The SpacemiT QSPI has an AHB buffer size of 512 bytes, but requires these
four sizes to be multiples of 1024 bytes.

Define a new field sfa_size in the fsl_qspi_devtype_data structure that, if
non-zero, will be used instead of the AHB buffer size to define the size of
these chip regions.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - New field fsl_qspi_devtype_data->sfa_size now defines the size of
       the serial flash regions if it's non-zero

 drivers/spi/spi-fsl-qspi.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index c21e3804cb032..a474d1b341b6a 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -207,6 +207,7 @@ struct fsl_qspi_devtype_data {
 	unsigned int txfifo;
 	int invalid_mstrid;
 	unsigned int ahb_buf_size;
+	unsigned int sfa_size;
 	unsigned int quirks;
 	bool little_endian;
 };
@@ -737,6 +738,7 @@ static int fsl_qspi_default_setup(struct fsl_qspi *q)
 {
 	void __iomem *base = q->iobase;
 	u32 reg, addr_offset = 0;
+	u32 size;
 	int ret;
 
 	/* disable and unprepare clock to avoid glitch pass to controller */
@@ -795,17 +797,17 @@ static int fsl_qspi_default_setup(struct fsl_qspi *q)
 	 * In HW there can be a maximum of four chips on two buses with
 	 * two chip selects on each bus. We use four chip selects in SW
 	 * to differentiate between the four chips.
-	 * We use ahb_buf_size for each chip and set SFA1AD, SFA2AD, SFB1AD,
-	 * SFB2AD accordingly.
+	 *
+	 * By default we write the AHB buffer size to each chip, but
+	 * a different size can be specified with devtype_data->sfa_size.
+	 * The SFA1AD, SFA2AD, SFB1AD, and SFB2AD registers define the
+	 * top (end) of these four regions.
 	 */
-	qspi_writel(q, q->devtype_data->ahb_buf_size + addr_offset,
-		    base + QUADSPI_SFA1AD);
-	qspi_writel(q, q->devtype_data->ahb_buf_size * 2 + addr_offset,
-		    base + QUADSPI_SFA2AD);
-	qspi_writel(q, q->devtype_data->ahb_buf_size * 3 + addr_offset,
-		    base + QUADSPI_SFB1AD);
-	qspi_writel(q, q->devtype_data->ahb_buf_size * 4 + addr_offset,
-		    base + QUADSPI_SFB2AD);
+	size = q->devtype_data->sfa_size ? : q->devtype_data->ahb_buf_size;
+	qspi_writel(q, addr_offset + 1 * size, base + QUADSPI_SFA1AD);
+	qspi_writel(q, addr_offset + 2 * size, base + QUADSPI_SFA2AD);
+	qspi_writel(q, addr_offset + 3 * size, base + QUADSPI_SFB1AD);
+	qspi_writel(q, addr_offset + 4 * size, base + QUADSPI_SFB2AD);
 
 	q->selected = -1;
 
-- 
2.43.0

