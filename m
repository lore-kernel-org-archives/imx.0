Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649F13BFE3F
	for <imx@lists.linux.dev>; Fri,  1 May 2026 14:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777644003; cv=none; b=Jp8WfQvmgvfV9C+uzVqMrKlfBILX4mLEe+fSJ5Zg8CllYr4vUwalZwTouvQaWIHVIOgOsML/AxLqyNLF76ft5lbQNSGxFbEvVHLo+bEgE5zP5mhp2qKxClkZSy7BVxEdP2Y19xIvgF8eiCydgFfnYNhquFKWDet6VujQ6f5CCbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777644003; c=relaxed/simple;
	bh=KyuZZJR4P+3viFsaf+3v9ITJ1YxHUVlIISu9qYGcGWI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pHlR8owoJRQ/dKYvByO93ropg+21Kjt/VxOFH2bSpeLU8z7VZYBG5s6J2QiSwZ64zMdHpfJYUQk8hLstMm2ko47PV3YV5Jn4GJbFfdbsRyvlkRP3R2KaM0PoJnV7/yFoO8qetYPh+mLxujF6bGNzkjLZGoiUe5TvhnkDwQoU670=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QtBWTF8t; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QtBWTF8t"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so16088075e9.0
        for <imx@lists.linux.dev>; Fri, 01 May 2026 07:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777644001; x=1778248801; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zNOGLSnwE1t6HIl67zIcI4mTCSe3nqPHRh9GxNxgyWw=;
        b=QtBWTF8tczvN+dIvBewQEa3c0dNXB4RNy60RaKUq1JKf05JDGpIgLaa2OiBDiUtVCh
         64UK8ivy3g1c8Dbkg/LiDDvULP7yR8yUwIR4Ru9dPkxO9r+faywetRlqKpm2KxWdwzBP
         sRQJVTsMCPB+/6/v8svoO2Qi2xcsHxCBeeI+kgtE8sXO3q22VRT6zFG3gviYM34Cnoqw
         eEFIvbqUxZjMpTfcZ4YBebn38V5iEnks3z3kdaXfkmgNipjPwODfPAmveGdtfR7rUp92
         tIx1hNgeAmZvUMGflGATnPagyao0RhQkrqEcAT32pLCSVnwLfDRpuSVIYpbXgXi8MDc/
         e3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777644001; x=1778248801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNOGLSnwE1t6HIl67zIcI4mTCSe3nqPHRh9GxNxgyWw=;
        b=kB9bZd7atQsX5o9In2/F+znf2ZBA0yB+ygarRmU1D2YFJPrYKmmuOLhF+1XYnJEuEc
         0y44kKrOXSs1063fZdqko/cJUGaGjZaup8JnAG3LEd1s6C0i4xpUnRoFtOEPOvCc+qJH
         YOaG4JeHfZHVlGya6bw0KkmOzyNp6AGhxvoNxF+TiiI/woF0s303zsWtbwKSqrDCkS+x
         N4jr3OpzVrToPchEmYE0l+M7b2UMX+Z8+EwFDYRuDP/Hp7yjL49QVE3zW8s02AJxLC7A
         ddMBekeUfP2ueOl7fYI4tnEIiOx7OEVcJA2WOZAfceBzYRcXwyrOUmwDBuGPZULSwz0c
         uw1w==
X-Forwarded-Encrypted: i=1; AFNElJ8/8ksTRS5WQq1Xk4uf88Vi5EoIRYD3smQ1yaBp0FQQscB2Nk0iCzplIHcL5uD2Wq6Fc/o=@lists.linux.dev
X-Gm-Message-State: AOJu0YzkqDkpXPbWo6vQd6uMdGLhRZWuEf6SEcRz9HUI4U4OZe4ShXVb
	eqVo/QZXKdeRpofvuN555oEKqKUL3gCkKUv8g6VxZwlPj6fSi2vQzmpl
X-Gm-Gg: AeBDiesjd0wYV1LFC7vH997gZWQjHIFSZkDk7bqHbFiDkvxNVPhJhCzgxNCy1+NVuFA
	4ZORtmSdfPZRMbiZdAIpcB/fx5oOxSoGlBjDTiN1WTRKjYcf8rrufQXvqpkjykxNe3Q9N8Rpw+6
	fQZ0uKcnfdLr9TmCnVxO7SrTyeV4ELm5yRq7u77FrK3fgjNZ85szTwsI9tXcXkq27CHRlROQFg9
	mn3KzvmPiNB2cGXpQyWVfii5X9sR6+LRiWbkSesU4ngVNPPPWHNdQXnEPTfwD/P4W3bhJSybFBE
	CJOGD2r6ClDti2phFnim+QYsyTRDUEL/qSNiMk9b21oRsPw25raNXGKDORYQsNKBGdZ4i6ZUv1m
	8lvjE85qvVpShRB/Fgtslaq3KcvRvWwZPlrqUV6plV/FmXhk0vYSAAqc6VcKly0HcQlFS78bOgE
	McPtHOsBo5JT0VLeRl+DDBdieHBRH1eDLOrMjbaRVKJ8exHLniiAFl407o3SoQ2j+z2ixbsqx/g
	uJ8
X-Received: by 2002:a05:600c:4ed0:b0:48a:54a6:b29f with SMTP id 5b1f17b1804b1-48a84451fc2mr106947765e9.17.1777644000526;
        Fri, 01 May 2026 07:00:00 -0700 (PDT)
Received: from localhost.localdomain (ns31537009.ip-141-94-163.eu. [141.94.163.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a98b768fdsm4823539f8f.33.2026.05.01.06.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 06:59:59 -0700 (PDT)
From: John Madieu <john.madieu@gmail.com>
To: broonie@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	carlos.song@nxp.com,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu@gmail.com>
Subject: [PATCH 0/3] spi: imx: Three fixes for the i.MX SPI driver
Date: Fri,  1 May 2026 13:59:48 +0000
Message-Id: <20260501135951.2416527-1-john.madieu@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All,

This series independent fixes found in the i.MX SPI driver.

These are:

1/3 fixes a precedence bug in spi_imx_dma_max_wml_find() that makes
    the watermark-finding logic effectively dead code. The function
    currently always returns wml = 1 because of how the !-operator
    binds to the modulo expression.

2/3 fixes a missing return on the package-1 failure path in
    spi_imx_dma_data_prepare(). The error path frees the
    dma_data array and the package-0 buffers, then falls through
    to "return 0" - the caller proceeds with a freed pointer.

3/3 makes spi_imx_setupxfer() propagate the prepare_transfer()
    return value. Currently a -EINVAL from mx51_ecspi_prepare_transfer
    (e.g. on a word_delay overflow) is silently swallowed and the
    transfer proceeds with a partially-configured controller.

Regards,

John Madieu (3):
  spi: imx: Fix precedence bug in spi_imx_dma_max_wml_find()
  spi: imx: Fix UAF on package-1 prepare failure in
    spi_imx_dma_data_prepare()
  spi: imx: Propagate prepare_transfer() error from spi_imx_setupxfer()

 drivers/spi/spi-imx.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

-- 
2.25.1

