Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BA934B66F
	for <imx@lists.linux.dev>; Thu, 23 Oct 2025 17:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761242372; cv=none; b=BuocC79xyPqGoPDKXUvQZ1PE7sQlvAcHhRRTa+4wLk38frTd48AKt43nRf33QQiwqmUMfr/5QN/a1EqsCM190A5uPHxK34VT4x+6HuS3vB7pUjWD7wgJCAaFxLkpqvad+jxZMyfUi6bVPlfyAAWXKSQHXrNROKaKxR3k3epTIzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761242372; c=relaxed/simple;
	bh=7ez/6EjkIlh33htYKjsePGy3T2mVBjoqatOtR9I8D94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DGj/gZ1CqbfNJ+E3/aIkrIgcJpI7yhFdaPIVw+3Q3U/aV4GALOn+RrmvWNG+kvh3sPXk/H/s3q+blYJbyiN8YHTBlkdM6DVUH1VORUKSdX6jknG0P1dO9PQPye/EAJclDkaOP56aYt7NC8eNPRewqQnOkNq+eKie8Fk1HrJwkLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=hAskuTf2; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="hAskuTf2"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-33bda2306c5so1161423a91.0
        for <imx@lists.linux.dev>; Thu, 23 Oct 2025 10:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761242370; x=1761847170; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mpdAYbWvJ67Pq6SWW8TZBr3xHWfsprNvetly1iKihCo=;
        b=hAskuTf2rUlYOEmEpEwm3SKo9dfoehVpAuaTMR3NUbzc9aB3hnmOx7XO5BMGeWTiNs
         vW9/SD+tBMDXI5uSEnIf6Lxu2BCYKxUACiMAdbCTK2p0EJsDRic082XzuVkB3XFiEcuo
         SJuZsRv1ypSfZlrbRdR4lIvqw9d0URPV4Jnh9+4Pwat3dMAs0jisqlarpCmWkoVs0VXp
         VNyiaoF/yKiolvsbz6Iv67lnkDaBEp1nvCODAKqEVKEBvZdUnqiHqW4aVIjbPnYsHopq
         0WwyVcoQvs5hWykymlGeegpRp5UNH6rstHSmt5krKdrAMIa2Si0jgE/swaqJ44UBnR51
         vb0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761242370; x=1761847170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mpdAYbWvJ67Pq6SWW8TZBr3xHWfsprNvetly1iKihCo=;
        b=dBaRowrWqVg7JpDhyYxAFF0Fe0liZ/GNVyEYH2NUNG4f+J6NFnmM+IfxM84RuBC3Jd
         7csGjn2Pt+3KdG69551MBx5mAF8YFxHVbjLj1ao+ns2o0NyEBLg5lRIMdukcif0QAiJA
         AwzRqXiMj3SHjLifUpTffXvgYFPwrgd8t2TcT4lLxXgljpptqHXZxHfUWV20dFR5QtMx
         z/pyAixrMOhAw7cPuwTFkjOebaSkfx/BIA4po8++XlNDlYNRRnIWhBu4ZepeyL/lBP/8
         LLC7umpKV6QCgW6pYM5Lj2rbWJQo9gganI54J3UoxGq4NDL+1iNgBia42XA+Kmw7Wic7
         KQ+g==
X-Forwarded-Encrypted: i=1; AJvYcCVaZ2AxiGw3bcuh+6H0a4SJJ59aynuuNER5RMsJdDzQiuVjCoL1HGL4hgZ2fy2fUsXqMmY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxuwcbKqIiYZq9Rm/e3SWeSSjmtgE/QfsUrz3cugvm4QQyp/aLc
	9EKJ3W4atjPOUPRyYHvE6DRdQWsAMr6HR7kShFfTGhfiYEULRgB7S8gAv844enX4jVQ=
X-Gm-Gg: ASbGncscg3UspnpNl6rubRSVBNe5P/r7IaepmaugO0/xj/KkWEo7OEWrCJ7i+gMlXnI
	mspBXnWe+I0DyoZfawBrSSmq0teT1pQ/EFLhmwAYGtpwY+wMCxD6JpMsJFigevWQpYULEFxadhY
	6K/1LohAudJYbCHlth3hY1iGC81u29HJU6UTWR6xqx2B88x2dCWKrYtwOxQHwcuOrec+llAkVBf
	L8UMw8MSxwRcYoqra1hMsxNVGgh2lbb/5JnrJt+W0y7CZEj3hF8sL40MhJYP9VUfGsmpbFgddKi
	YdAEVu9iFfNxLZoqE5INQIBTmFXq3UKC8gPhozpnJrVszJ/WE4OsqAyeNCeoHi7DwnZbYo5QNqK
	N4nUarleZ4sRhgHKqJHZXw0JYF1ZB5T77NnnC3tfBEkzrlxAPemkfJI6iLcH2Gnf4DF0W2qpnew
	mBMV5HtSZK59nQbDn4UecxdRU=
X-Google-Smtp-Source: AGHT+IEsHCRIEchVGl1aiqwGIr3m1P1UsY5mh0aI0l1e28xrZb5I36C7fTVFMh7HosCXyjh0AUoMEw==
X-Received: by 2002:a17:90b:1c0e:b0:32b:6ac0:8633 with SMTP id 98e67ed59e1d1-33bcf8743c0mr34004618a91.16.1761242369714;
        Thu, 23 Oct 2025 10:59:29 -0700 (PDT)
Received: from zoltan.localdomain ([208.115.86.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223d1265sm6447431a91.3.2025.10.23.10.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 10:59:29 -0700 (PDT)
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
Subject: [PATCH v2 4/9] spi: fsl-qspi: switch predicates to bool
Date: Thu, 23 Oct 2025 12:59:16 -0500
Message-ID: <20251023175922.528868-5-elder@riscstar.com>
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

Change all the needs_*() functions so they are no longer inline, and return
bool rather than int.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - New patch: predicates now return bool type and drop inline

  patch (patch 4).
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
2.43.0

