Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FD023AB95
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 13:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761571823; cv=none; b=jU7MTLEIGkJoh5rGrYuyLgi90iaEiXDp6Q7/5L9fFzBnT5ts56Sny8jkeCgUAEa1qwvyinDAYnxwWBUFVb7yVxIxi/tE+vvkfwd+lzboTJvTWH0GaS4plZZ4j9IBhl0wOD24jice2CnzMjOnk9xE2PbZG/GG081xR3EJ7v6oRsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761571823; c=relaxed/simple;
	bh=vPwr/+nlNs0manNxtZHH/pbOcpE14vc/oDM+DidS90Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HJedVT2/fkzr28EfdS+9zT+0KBE3cgRenEuHoB4dT7TkMpyrWd3xm/SSoCGvRE6aGS5JifxPCWM4NXEARhzPUcZWR4bf4Zf/tdvS5qbqFUleFlTpoNELRg9jTeiFyU3bqJ1gixjPvvKq00/Z1ARWgYdwO+/g26lsGOtbSqcU3sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=dKvVFafw; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="dKvVFafw"
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-940f8a73275so541826739f.1
        for <imx@lists.linux.dev>; Mon, 27 Oct 2025 06:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761571820; x=1762176620; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59JPfJxdtbZVN0/1a3YIl7OOO3eshWQJw5UtvH1ggXo=;
        b=dKvVFafwRHBcdzzgKYAtCs2bhE27hjEU+d2eXa4WWLw6uFkghq8GuYI7Aret2CTq2J
         TRh7LSCEZtrjNuau+Otu8GkePmC9GjruMBjRGgFTaZwOhXzo0M4w+ebPxKQaHVhS7YaV
         K9L3VFAqmeNP2gFfZtgry3zCCJs+z4GtbmY4ftZMporWMUPSgBv0iUX6md+WX+kHyF1K
         0NRDdTHnV5IJWcn2LWBuwJknw0IctbB5f5ASNDj2l1bxSaF4xnmi+aGa0dbjlwprbyBE
         K5hYjKx4VcIOnyaLDYAPJ7s0sOgz+5BJwf159MkEG6bVwCS50GmdyXReSImCEym0SgEG
         c0hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761571820; x=1762176620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=59JPfJxdtbZVN0/1a3YIl7OOO3eshWQJw5UtvH1ggXo=;
        b=O1/iPVyTr+U/vWMVCWqXgTsCNRlZDgv0DXkU9VaTt5/2Tgp9SynjTDnY8rzvNeyb4E
         mlG+nyQ+o0s6fNnFPMOkknvSuMpAho29jOGVYJ48Avlh5QaWZnFHdUp7Dw0zTvQs6sX1
         CRAFB3SVPjRTdSzB++Yv/WXfb9C/FSXK/wkQArZpklTdmovYNPNxjJOTf5crr0xFAikz
         Vq0/WLusWpiK5HUEGeT9YB+R1tY7th4nTvSmVVvrlVVoawqsfDLRMJfQvaPeOTvWMUTt
         IwhY978BR5RhB1unulBaQ66Qn1YLZv3h4ETfP3aPmFcnf9ud9wHcOgnCOgt+/nlfzXLK
         Qjrw==
X-Forwarded-Encrypted: i=1; AJvYcCXDnwVLLiodaKu2Lwy248Q5AFHhkdJSG2uDJFy6crBy1b+YF6SxRq9gDrZSQfcXlNMzxHk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx295XjyYnaNL5wDVX1/MqbqwphQeyr+zQ55BgjRApUjG0lZy/K
	LrlgYQl9pLWP0HMGfIiIeFOdNmuT0YW6BAB/6S+QnYLvAlmZCAeyNnHWlaxHkGGrgIo=
X-Gm-Gg: ASbGncu6eBmVeJh9HeoHccn4KQo1zaTuNGWYPssavzSdipX5WlINekjrMy1Izsr7cLU
	rTDk1en3HN0VdYGiUzECMHErclqyU9wTxMR5qRr6geudtGcZNkeNYFTnigHHEZJCJ59BhqPBzid
	0hjO2YddXp70wwve5vSTl6GoxraDNP9fBt5MjXWguYwWyzjumG8t7zkpC90aln/RUr8+blHiz3F
	jaMMptAG3VdFRgD549VxCPSTfx8IQLX9HMmkyI2AfP2q3Kv6AHqQfTyu+W1A9R6qOy0xPxJIRMe
	aH0lhcvOwnlvUpIVbsLUZq91udMMLMX5GlZ89/gfK/wTsgxGtgz2+JF11z7pd3w8XqlH7wNRRrd
	2EASbGuLA7V7tFPSrtuLj1fdCEfMsH4JVCxVw538+KnXHEh/K2sszxyuDC/G6v4H8IyRlMwy8iZ
	NIkUfWZHB8/GvYgyMDAgzQ60volqKCN1RHL6t4Jnx4tUcuKxwNnG5nMg==
X-Google-Smtp-Source: AGHT+IEOMq9HwQy8lmaiH8m2VohckOU5pzhBNmgtnKE6agpQoWegyJcP4IEG3hVlkqulKDQU9Y3jXA==
X-Received: by 2002:a05:6602:29d0:b0:943:5c52:f802 with SMTP id ca18e2360f4ac-945b7d9fd42mr24171239f.0.1761571820080;
        Mon, 27 Oct 2025 06:30:20 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5aea78e2fd4sm3093057173.26.2025.10.27.06.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 06:30:19 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v4 4/9] spi: fsl-qspi: switch predicates to bool
Date: Mon, 27 Oct 2025 08:30:02 -0500
Message-ID: <20251027133008.360237-5-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251027133008.360237-1-elder@riscstar.com>
References: <20251027133008.360237-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change all the needs_*() functions so they are no longer inline, and return
bool rather than int.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v4: - Added Frank Li's Reviewed-by

 drivers/spi/spi-fsl-qspi.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index 1e27647dd2a09..1944e63169d36 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -276,34 +276,34 @@ struct fsl_qspi {
 	u32 memmap_phy;
 };
 
-static inline int needs_swap_endian(struct fsl_qspi *q)
+static bool needs_swap_endian(struct fsl_qspi *q)
 {
-	return q->devtype_data->quirks & QUADSPI_QUIRK_SWAP_ENDIAN;
+	return !!(q->devtype_data->quirks & QUADSPI_QUIRK_SWAP_ENDIAN);
 }
 
-static inline int needs_4x_clock(struct fsl_qspi *q)
+static bool needs_4x_clock(struct fsl_qspi *q)
 {
-	return q->devtype_data->quirks & QUADSPI_QUIRK_4X_INT_CLK;
+	return !!(q->devtype_data->quirks & QUADSPI_QUIRK_4X_INT_CLK);
 }
 
-static inline int needs_fill_txfifo(struct fsl_qspi *q)
+static bool needs_fill_txfifo(struct fsl_qspi *q)
 {
-	return q->devtype_data->quirks & QUADSPI_QUIRK_TKT253890;
+	return !!(q->devtype_data->quirks & QUADSPI_QUIRK_TKT253890);
 }
 
-static inline int needs_wakeup_wait_mode(struct fsl_qspi *q)
+static bool needs_wakeup_wait_mode(struct fsl_qspi *q)
 {
-	return q->devtype_data->quirks & QUADSPI_QUIRK_TKT245618;
+	return !!(q->devtype_data->quirks & QUADSPI_QUIRK_TKT245618);
 }
 
-static inline int needs_amba_base_offset(struct fsl_qspi *q)
+static bool needs_amba_base_offset(struct fsl_qspi *q)
 {
 	return !(q->devtype_data->quirks & QUADSPI_QUIRK_BASE_INTERNAL);
 }
 
-static inline int needs_tdh_setting(struct fsl_qspi *q)
+static bool needs_tdh_setting(struct fsl_qspi *q)
 {
-	return q->devtype_data->quirks & QUADSPI_QUIRK_USE_TDH_SETTING;
+	return !!(q->devtype_data->quirks & QUADSPI_QUIRK_USE_TDH_SETTING);
 }
 
 /*
-- 
2.48.1

