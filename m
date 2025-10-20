Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C19330B15
	for <imx@lists.linux.dev>; Mon, 20 Oct 2025 16:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760979125; cv=none; b=NvQlrofhevme1Gqu2n2JBQzsegxi8TuqNCK5csJjsmLCRgqDyhDayPwBZp4KpytDCbqQHe5NpxTSoS35+ZAjO1lvleydkCvsZZk0Hx7KIKejni82WqfRIazO0FGHw7YIh9CrmOWUBIUktOVPqWHGxTw9knPKKunAi+7Pg1DQPB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760979125; c=relaxed/simple;
	bh=uePi/hbf6hWUzA21sUbV+8rs4D8g62rLtBk48VZwAjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TM3sxTL1NKbd2SwWacQej67oUEy8/+76Nj7neYnFMp7v6j6qY0kXc39seSJ5heO1EyTnIMiTPYh52rBNug7NVwhZbxHWQsRJvi+DCxEN+gzeSm9F1VTnHBh9tO+jQX1tMuaNyLbcBKwAGXx4iTUBlYDnSReYDudXe4kMflKxoVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=MvhwjQ8B; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="MvhwjQ8B"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-430c97cbe0eso27188145ab.2
        for <imx@lists.linux.dev>; Mon, 20 Oct 2025 09:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760979122; x=1761583922; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQXVbISA4WvqnIZXTg13FJ7YaYjfMgMauMrkyToUbl4=;
        b=MvhwjQ8BG1zwHwwMFkwfYd7iCgqNNLGb9yrDnL/5A0M6obGoKKOfAv/EMRlHjL/LTx
         G6MG2+cJ5EHbljqxURZ9nsBGAjv3JkQvbnrzstaRcUW3Bx4kk4rijZrYCX/w+GO9WLTO
         rFE6U3KIfwVVXwNtWk8B/Ye57OoBkRpAJBCQTwlbENk9YVP26sBZqTTtQ53BGobBiqlT
         PbnqQT25Hr1XbwaWJtosFbmwsAkYRFu8VcD/H5Pt7H0wLSKaZSwVHER+6pg0r9xD4DSb
         T0wFHswVoYzOz0aO7k500ncfzWDGjaz7yBqdcQNAyq7U9qLF/SrLXa3j0E5bmopEnZRv
         02sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760979122; x=1761583922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UQXVbISA4WvqnIZXTg13FJ7YaYjfMgMauMrkyToUbl4=;
        b=FGew//2x4v7o967IG5R3ZEpKzXVKoBh9dsvwgFEki9aoVYqPp5eXoVcmER+EHYWOWS
         Pi/WaMQUx71UHrJBKObcsZfgdxntzurRy/IIbqKyf3Cx0eqA6vySBohh2oOXclavBrbU
         NvGVlXbZCPnZPP63SXe+lRaG0LiIhGhrGeLz3BI2AYirQmYa47Tte8PCmO1byvSWh9Un
         BM0JhM2IkNz34heoGsye/llHDvaHu9mmEQiTfJFY80soHuZPxhPUBEBkqobPLoSgHPGJ
         T4D7nqyF0J7tYQxVcE0waPxTQEpNoclS7oQ2wR/KzZyo2BLRH/19jQ+bD5ppuGUommkd
         ARCA==
X-Forwarded-Encrypted: i=1; AJvYcCXt7rJJiN1i0DnzmbeE1a+NW/tjzbbfEB7E7xj+rSNKFLfJEO+Faw3lxoE0rwyanRb2dC4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw18n5UHJmKFjHgU2ktXA0KSADGqLBOw2dNlfw/9j39zZgSdSZw
	5BX5YvN5EgbD53XpAX0081BUmlq++UGoUwk0ui6MKCmpzcM6eO7GnTDtnXmVXgE5Zb0=
X-Gm-Gg: ASbGncsdb7mfSorpQE3++RScZVtWkSaPkVc81E9ieAW3EDkxOsC8OWbniHa5E6c+lGg
	I/DP2BIJacTR/XMwt/tNB76CEmGcXOA2G4F4pDOyImOEO0WRwOh2r1+sfVS2x2yFAxuHmwq1/UB
	Wasj65xfJkSTEw9eI6nFEqts6JwqMzI8KqR4ORuT6mgjXwxq0PhEQanvl51b05d+mO0/Cw/nNm0
	3vBxBdBwVzSLsQPgNG2a5QYc9sNBab31cz6Z9JpI+6M03kLSSS6B2EdisdvzyZmlHpX1f4zdTUN
	XFa5IszVaCR9eoudbidUsffFmbyRmvq++VtsMg8Z2jAB5/bl34pCBId23deSxVcBFsDX9wgGxbT
	aJ7gdiLnm7osDU5hCwVsFf+fr8T8hXg11vaCa8GE/vxWYmy0mImhVWdOsyFJy6BQbDkRqsTRMm2
	a4Ji4vAumQTptI724ofT3cCmRX2y2G1VfVTmobS9qOKdlWfHbdHvLxDQ==
X-Google-Smtp-Source: AGHT+IF2Mm9OQGidsZhPs2Ov77+yd0T2fLJcTJpQ1EVmkmzq5AdT/vC3cNejClhwLlxQGd1xeq/XeQ==
X-Received: by 2002:a92:c24f:0:b0:427:6e7f:89f8 with SMTP id e9e14a558f8ab-430c5263cfdmr219177275ab.10.1760979122272;
        Mon, 20 Oct 2025 09:52:02 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a9799428sm3116783173.63.2025.10.20.09.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 09:52:01 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: han.xu@nxp.com,
	broonie@kernel.org
Cc: dlan@gentoo.org,
	guodong@riscstar.com,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] spi: fsl-qspi: add a clock disable quirk
Date: Mon, 20 Oct 2025 11:51:47 -0500
Message-ID: <20251020165152.666221-5-elder@riscstar.com>
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

The SpacemiT K1 SoC QSPI implementation needs to avoid shutting
off the clock when changing its rate.  Add a new quirk to indicate
the clock should not be disabled/enabled when changing its rate
for operations.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/spi/spi-fsl-qspi.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index 1e27647dd2a09..703a7df394c00 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -197,6 +197,11 @@
  */
 #define QUADSPI_QUIRK_USE_TDH_SETTING	BIT(5)
 
+/*
+ * Do not disable the "qspi" clock when changing its rate.
+ */
+#define QUADSPI_QUIRK_NO_CLK_DISABLE	BIT(6)
+
 struct fsl_qspi_devtype_data {
 	unsigned int rxfifo;
 	unsigned int txfifo;
@@ -306,6 +311,11 @@ static inline int needs_tdh_setting(struct fsl_qspi *q)
 	return q->devtype_data->quirks & QUADSPI_QUIRK_USE_TDH_SETTING;
 }
 
+static inline int needs_clk_disable(struct fsl_qspi *q)
+{
+	return !(q->devtype_data->quirks & QUADSPI_QUIRK_NO_CLK_DISABLE);
+}
+
 /*
  * An IC bug makes it necessary to rearrange the 32-bit data.
  * Later chips, such as IMX6SLX, have fixed this bug.
@@ -536,15 +546,18 @@ static void fsl_qspi_select_mem(struct fsl_qspi *q, struct spi_device *spi,
 	if (needs_4x_clock(q))
 		rate *= 4;
 
-	fsl_qspi_clk_disable_unprep(q);
+	if (needs_clk_disable(q))
+		fsl_qspi_clk_disable_unprep(q);
 
 	ret = clk_set_rate(q->clk, rate);
 	if (ret)
 		return;
 
-	ret = fsl_qspi_clk_prep_enable(q);
-	if (ret)
-		return;
+	if (needs_clk_disable(q)) {
+		ret = fsl_qspi_clk_prep_enable(q);
+		if (ret)
+			return;
+	}
 
 	q->selected = spi_get_chipselect(spi, 0);
 
-- 
2.48.1

