Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C4A36B99A
	for <imx@lists.linux.dev>; Fri, 24 Oct 2025 19:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761333364; cv=none; b=R45yi99Lc7aiywse8L5PwFM3vzbBGBOcOh9Ke2CMD2AKSh2g1zQ3LTNtfcXmEIzy/4ktswZt+d4/fuxL6oYPN9vWxGUNNtMfTTGt/ucZRccrXuWQ1Llq3rqtXm6MB5LkTaUUIMvmxIje6du2XS1NOn3BwHriIuRlQnvWlL0ndT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761333364; c=relaxed/simple;
	bh=GdKb+Uk6ps8nMgwL/qeWK8J0hHUVDxnEmafXGXdT8Uw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LInWD9CDoqx00zoDQcQs2uQGH8jG8HbQT6WZMBQg/D3c97Ikyy/TjjLL4PgDLDZDWg7oowmDq3YZ1PPMr3DIy2lEQekR1OwbSc+cQaBM7EDP3tiFzQ3MLo4zGv6fl4GRX9FPBjIan5YrhreunvWC21zgjL6PohctDdWZ/Kjc3Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=F6FEB+YT; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="F6FEB+YT"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-431d2ca8323so12767695ab.3
        for <imx@lists.linux.dev>; Fri, 24 Oct 2025 12:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761333360; x=1761938160; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bdm2X0Uh+6QoNIFH/yUFpeoxSayQYwUIia5PVqWIucY=;
        b=F6FEB+YT9MJ0CVf2SoNefdYTpJfDCP/LaFqBULYJcpr99YrVhuliGA1bMWHqPhfAmj
         6rARaMbQFKL8hfEr2YAG3zSPhWj9r2zhdickYVvEmVfzFwJ5R5+GKFRFWdmLzatMpM1K
         n9ZcO8St1LKHT2SzpQZGrxaRypjfINM8eL8mxt93pYKetm5vmVNm7IMm4HiNCxTzR9OK
         AKLj5oscu2e+zwLoVfqMtp9iqpblyo6uCmzI3PQqK9L3ABLmfKRSEM8rG1bIHWmcydSL
         cYMhCzhV07rT/7DMr7UQ6GXcJOL5vATD0Tj2UeNj7O4Tl1G+3Rm/qA1Nrl1f9MEu5pSa
         hGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761333360; x=1761938160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bdm2X0Uh+6QoNIFH/yUFpeoxSayQYwUIia5PVqWIucY=;
        b=h4UAFwYOt8dpmEp3FFjQMgt1xP39zyMeFYIMUVYvoQgE0RGakjCDnS8pRCtvdSXOR+
         nMWDUB+MCwMVoFFyaaJWL4MECEurFK9bZNAv+r0XruXy1N4FeBueTl6jKxop0jsO4v0+
         zGfE/p9p53cuWt0j0wZrwl43KZzgVAz/Z766mVL02on14NizW9Doidip8fHIiaUSE80/
         mbS2B0SFBinVemoN1QQYO8JVQgiE8qgJWIBZkie80yy/cEbK0Yji8snwfoVlZF36f17L
         L/LDAsQO9W7VggUQDPaibfvzZd36lLqYgN70//byvsVkABAMdDtw7faqs8/8EHR003xH
         W1TQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfxsUvbLHGRcVXzdoaaYBjzge9Qh1ZUNu9tW35D+eiUoByT4HjEFLuXGwF/a5cCZIWQYI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyQzmFfp8zaXuuNhNCxinMcsXjrbTggUEYlL/RIT5zwbHoRjTv0
	nkSQmwg5CgO3wae5uDUT0/uBwMper4SQm+UqkK96aZrd1cwC/n9ktn6157GJD4uQg34=
X-Gm-Gg: ASbGnctVsNMR/mVQLWiTdDh9ogXz9INPM0UIPArSFDA1fZWByhF5Gyt7UaueZs9ZI5n
	LfhWuZUQngY61Avu6HvQbKux5qty986VmOctMunSTmwe+k0AxphhyzeYTlBJB7cgZ65iLbMSPjf
	xFr7fQgdUyynk9kRlMWTHXeZ2L2Ejo/pf3fyQ2Jll71Ry+Lh81yISmZfl2O2qMfr2Z+rEtiOy+j
	8xINQ41/emhfwaOhjM+USQA04u52JfJ+KpL3gbxm3ZBESDBtx4Xq38Xcb40TwHv9u6P3jUPwyQZ
	nWxgqOLb3U5zlCyCESIu8Mqm6QyAz+tYURSFU6g5/mY28VZLJ9bJi5zYpciJcGyvBZBK8kg/8oM
	W6bExAubvgYY66H3XFIw/hXklpb5OTsRS2aGN3TVGy8DOxW0GPU+0dDAMIJXRf0a3oerSdBu/9A
	r6WW98KU9PLZKkR9gSNhyOnGyqe8SrDSbbdXopMrK8lDc=
X-Google-Smtp-Source: AGHT+IElepsQIkPTyqRqx2ZlqiV2TkOUrhFpvX3uGDnya5yADO7YFKd2LUmYcqJ1EtE3DJar2SatmQ==
X-Received: by 2002:a05:6e02:144e:b0:42f:9353:c7bc with SMTP id e9e14a558f8ab-430c5209537mr363720175ab.6.1761333360521;
        Fri, 24 Oct 2025 12:16:00 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5abb7fdb7c7sm2427824173.44.2025.10.24.12.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 12:16:00 -0700 (PDT)
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
Subject: [PATCH v3 5/9] spi: fsl-qspi: add a clock disable quirk
Date: Fri, 24 Oct 2025 14:15:45 -0500
Message-ID: <20251024191550.194946-6-elder@riscstar.com>
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

The SpacemiT K1 SoC QSPI implementation needs to avoid shutting off the
clock when changing its rate.  Add a new quirk to indicate that disabling
and enabling the clock should be skipped when changing its rate.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v3: - needs_clk_disable() is no longer inline

 drivers/spi/spi-fsl-qspi.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index 1944e63169d36..2c030dd6facc7 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -197,6 +197,11 @@
  */
 #define QUADSPI_QUIRK_USE_TDH_SETTING	BIT(5)
 
+/*
+ * Do not disable the "qspi" clock when changing its rate.
+ */
+#define QUADSPI_QUIRK_SKIP_CLK_DISABLE	BIT(6)
+
 struct fsl_qspi_devtype_data {
 	unsigned int rxfifo;
 	unsigned int txfifo;
@@ -306,6 +311,11 @@ static bool needs_tdh_setting(struct fsl_qspi *q)
 	return !!(q->devtype_data->quirks & QUADSPI_QUIRK_USE_TDH_SETTING);
 }
 
+static bool needs_clk_disable(struct fsl_qspi *q)
+{
+	return !(q->devtype_data->quirks & QUADSPI_QUIRK_SKIP_CLK_DISABLE);
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

