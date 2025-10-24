Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7327236B974
	for <imx@lists.linux.dev>; Fri, 24 Oct 2025 19:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761333363; cv=none; b=JhH4Io8S4KzV1z6tfpaCsK8V6d/AqQ1twmlfrultUn7KDu1/a1rwj4q171tRhUbM90KG4IGX/0vjaNdGsVd8kAm1iVEtkXwoVlhpR+8LWQaY/EOUqDvhRp84HY3J1Kfj3jTbo5AcVm71bwbiTn9yB3jB3VtQCNy/J5AS7j/kUYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761333363; c=relaxed/simple;
	bh=ywZfSSvOtu1gmb3PxLYzxkGY1zcq4rrHofGqdsSxizM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VDCJ+oq9Jo6Fo3hpKU7v6fJCfIW/TEGPvF1qPXFGFvUNSjAPZtvimLryotFEJr6RBJ59Qgc4Tm9X+7CLosiCt54YyEMrCSmCqdi6hDQESiT9guek/71BxFlwcNQ+L4BjPh8MPq2Tb1ycQNb2gykKcAtli3+D3KOyQpU705BYzxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=JAO9Ghba; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="JAO9Ghba"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-430abca3354so23140775ab.2
        for <imx@lists.linux.dev>; Fri, 24 Oct 2025 12:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761333359; x=1761938159; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whAVJxDDZqUJMj7E4dlz8n3sScKT3peLB8arm+VC5HI=;
        b=JAO9GhbamaB5T6BTdhL8xncs7nenm7djH1cJ5YBiiafQQ3ciBpJfyHs25WaEig6V93
         NWtPDjfk5BlDhYS8wy4F9+SxnruXs6O6nV4ZRIJ3RkEnZ+FpbL31iBLm7DiZ00ECh/zr
         /e/RoGr0BFseCvCzeJFcxXMHwuwXa1iDIVTaPHC0Cbx3rop4kx3oBnVgWAYd1EBm0ooV
         q7jyJ6k6qei5wimVSUf+9K44oABYG25vVGhK//XJpjCwZRbSS+Z9vlUsx0SB0iA8hdDN
         jr9gVRytaYfqIPgiicnXvFvrxdkzpGQ2u+NFCbQtlLPqpYVRt75vbngy68a92gpq9bTB
         h6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761333359; x=1761938159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=whAVJxDDZqUJMj7E4dlz8n3sScKT3peLB8arm+VC5HI=;
        b=ul7c1aoKXe4RkinyEuYyVi0YFcbUim3iAQn/qRC23BqnbKeIkwHczupj1nGmiVD6qZ
         9DDRgx7Yur1wdsG4he1sLbgMidlyKATGLobtFdQqlWVo+qBzPtiZwdsd9iC1OmuBf3//
         Su1wD6viZo/lzUm7t3L4Y4xu3Ji67m+XQmZfnhSczlzvnEA2ziCp6FmojQPEbmVTha1r
         sshzFfR43ue8e2JVNjwS17x+v4jQ60FQzuSYcGa6eQhTwLjhHWF8tOwba5QuPQ3MkduG
         pLl+b8HesdqifD5RJmZNsERReZzqC+ZRSY8Pw7r77WYq9dqBAO9Nxr3hYMONRn0fm5vz
         lSew==
X-Forwarded-Encrypted: i=1; AJvYcCV2QcO8IQ1WmgrN7KncZes6U45fTv6YRhNoEnhS0TgiptejD4G5qKjbpeKzrrHVfJ6oKJo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwtsFcfEdpsd9tGwOvGqA7BI+/NYd6UlA2wtgKy7epUSWfwt4+B
	ick4D85oN0cOX4XNDSOt0y42DbQmYGOO9sfccaTnA9yp/dIka3NOYZa/u9BCcOyy6ko=
X-Gm-Gg: ASbGncs+DLbvMobeKo9Eee7T/kQ4c1xieDADjYzCnQgcTO/QVDMw2LZ58ZF+S+42c7w
	RBxEFujWPg7D3Fbx9pt8/+0540mZ/gzEr9ahO54CnibB3B+SE4Gu3i0CMvsV4riRfNjvzeOrdqs
	IpeGOgJPDUbMVjI4MDe+gnMGyoUZZ1t3G/Znq06/mXbo2GfeRxRhFGHC5hhKdIcWHIn85vk8N+d
	3Ug8yrypz76kxdFefphryvzs08bBFqKQfrm+j7Nm4+GDsGxEW5kTwusJ26dFhPbr0EWdDMTPfp+
	f/w2FWhxq2Zrr0x0lwOpTp0nst3rfVOAYDzPpvQAMCZeqWMAxac8GNXYgJiJhQHtM//csRIRPhn
	5FjY2QZbPLYkrSDdt+LDAoG4zJ2sGgluVcZr5J/QolV06eCgHMQtusKiRYyS9TaekyboDa6dMrz
	3GJZ44QW2/4lrs6CB6q84UT7X4AX35ZV/mIdFSGEDqui9K+9TIsMj8DA==
X-Google-Smtp-Source: AGHT+IHX2zRIoMsUD/QzZWZVb8zmLNqKBEZdZKIdnvVZGFa0ldz9lbQJW3juwmiEnXtXUSBt9XGehw==
X-Received: by 2002:a05:6e02:b2b:b0:430:bcef:e0a8 with SMTP id e9e14a558f8ab-430c529fb9amr413408425ab.28.1761333359510;
        Fri, 24 Oct 2025 12:15:59 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5abb7fdb7c7sm2427824173.44.2025.10.24.12.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 12:15:59 -0700 (PDT)
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
Subject: [PATCH v3 4/9] spi: fsl-qspi: switch predicates to bool
Date: Fri, 24 Oct 2025 14:15:44 -0500
Message-ID: <20251024191550.194946-5-elder@riscstar.com>
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

Change all the needs_*() functions so they are no longer inline, and return
bool rather than int.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
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

