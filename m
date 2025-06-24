Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F60223DE8
	for <imx@lists.linux.dev>; Tue, 24 Jun 2025 10:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750761397; cv=none; b=ZA9Mcs0RdpEXEHw0H3gvy+xfVFksUNr4C0qMZnYTDYvrANEuC4gi1/gB6A4qYPX6qWkSiEI59cN+kV/XGKuulrtulZ35W97PFJjVZue2QTUkCGRLZnEeTlloHiOrP6xL8FwLQ0sQxzlvtvD7vdPJ48EjVqSiX3sq9jqozEACoKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750761397; c=relaxed/simple;
	bh=s/p1Xv9n0I6aRsXvJfI6PtEEVZffpXSQRtqTJvgA7bo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LR8zXoMawTgXRI/zDWoyf11Xzo0p5THPUTKLBGVkcnM1iVA69xHSWIpvEfHa7NYnxvnwGmdu/iJJ1Xb4p8gP8u5XeL/+CBwmc+bFoOOCBPFebpWS7wHnpT7hug7LToK5dQQvm7HRUB2OnLGmUPA9+Qe0ouwZ8PugxLbiXKwB0ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ejctJu9x; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ejctJu9x"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-453426170b6so36757155e9.1
        for <imx@lists.linux.dev>; Tue, 24 Jun 2025 03:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750761393; x=1751366193; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mV2F430M3zf1QNtT0HJo3gDR7bQHbqH+Rduaa+AqTs0=;
        b=ejctJu9xaGUeqGjpNeLmN6HVnQFXq46RH+kiSPivJLnbsB80i+/ORT+4TPnfWVD4yj
         mPpinsi4oITEurBB3k39Nn53iSoirODDLEQWqJiXfQiJRSFUNFgD1LUhUvxlOoShdiJC
         s/1li6TGUgpU7kGhjOYjp+qL1J5Abi/lcS0qxa3iikOHLEQJ/r0zoED5ao/+ddM4TGJB
         KUDCPlJDr2K0Dx/JWomibZqJ196vBA0bx5vJZH6r+x9LxgWUQPll4fD3BKVCm3YPRGXl
         yRsY9Ma+CUmPaBTseZr1BpC49ohDRmFsxx9Aa0TgAL7gonkBJtaSsTtxxo78sHDCaZAE
         92zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750761393; x=1751366193;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mV2F430M3zf1QNtT0HJo3gDR7bQHbqH+Rduaa+AqTs0=;
        b=C5q3cB2wgkl/Gcjg9/9/Uaor7PviExCV9tdITiQFn8vEQ6Ip31KJhbJEeqfxPFZn9Z
         hZrawEYp+deJfcDk1s2gsU4FHoVQdpfTl/gDqtJ4XiYY33bLh1gu9Qo9CsIt4geaPomq
         iYSTM24szQSKJbF/UCjG/xrzo0uVJwsPSArbPCh7NgWORzM6iXcixWX+TQDkLhcrpmRv
         tcCyiqqhwXw+WKvz0JKcRxGTUUmSR05fUTXoJgM9CmkbpOYy3qX477LqhRpwTK7YDeWK
         ZHfYGho5GzTO0bUR/V9zpYu/ImsSTjYs9kuVcoXoXki+4hHAGZ4YqR27DPvgzTpX3T/D
         T2AA==
X-Forwarded-Encrypted: i=1; AJvYcCV5PWR5C4zr4cCRGcquH3vbQpGvy7+2oTo72OJTQL0jJwEX2X3sZbpvubm+iLJ71f6h7bM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzWy3fn/5OQ+CtwrBzL80V/EwyK7z1LNY+9iW8IsMPt51wKXrja
	phA29SyMnKcGUmwsMa2qB6vrsVmCYbPR37ne7VEWGmz0b9ZUKJoU/sTTfnbX7lTGs0yanVDNwlh
	cKUPJ
X-Gm-Gg: ASbGncvbkseNuqqS7pypN1z0kSBJysIuq/lQeyUB/TgrCWKvLA4zwuONQRLrxVzyXof
	pgfkiQ+tK4q6oKNMgD/+3okoCDZkinEeeuP1XkTYtqBgTO9wOmbchsaO8FT6cMveamCWkYsATtA
	McywmmNrLm0tryA8rJ1nKkhwBRsFTmjkB+gQGibzxThyXc0a1rnYf2TEp1BXwV3X1pF1O0CWTxA
	WZH3lIk+Xq07wShazo9uoCN6VJIhanbFrx96mIVCtQ9nxtcol39cznPCuiMy+JKy5E5532m/EKV
	VPiIAmI//HAKRR3Dr6cbC91YL32/hOhcMtDGLMhPU8R+zrtepDgeMO/RifyXwe7RV0Qr0+U=
X-Google-Smtp-Source: AGHT+IE0oRQNwaJh1+Up/aJBnSPbbAIWGlweTCtCPOeJbMewjs4LOHGtQALu971QtWWJIuf3LTdG6Q==
X-Received: by 2002:a05:600c:8b16:b0:43c:f509:2bbf with SMTP id 5b1f17b1804b1-4537b7b9f4bmr27625885e9.15.1750761392859;
        Tue, 24 Jun 2025 03:36:32 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646cb641sm143398245e9.3.2025.06.24.03.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 03:36:32 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v3 0/6] spi: spi-fsl-dspi: Target mode improvements
Date: Tue, 24 Jun 2025 11:35:30 +0100
Message-Id: <20250624-james-nxp-spi-dma-v3-0-e7d574f5f62c@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHJ/WmgC/3WO0QqCMBSGX0V23WI76tSueo/oYtMzXeSULYYhv
 ntTiArs8jvwff+ZiUdn0JNTMhOHwXgz2AjpISF1J22L1DSRCTDIWQ5Ab7JHT+00Uj8a2vSSyqo
 qUKHSSigSvdGhNtPWvFwjd8Y/BvfcJgJfr+9auVMLnDLKmSgRUmS1Fue7sdINx8G1a31TBav+q
 aDKlGPBM4Xwra6fBPisC57uJSAmGC8Qaw2ZlOonsSzLCx0Ml+ExAQAA
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
 Larisa Grigore <larisa.grigore@nxp.com>, Frank Li <Frank.li@nxp.com>, 
 Christoph Hellwig <hch@lst.de>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

Improve usability of target mode by reporting FIFO errors and increasing
the buffer size when DMA is used. While we're touching DMA stuff also
switch to non-coherent memory, although this is unrelated to target
mode.

The first commit is marked as a fix because it can fix intermittent
issues with existing transfers, rather than the later fixes which
improve larger than FIFO target mode transfers which would have never
worked.

With the combination of the commit to increase the DMA buffer size and
the commit to use non-coherent memory, the host mode performance figures
are as follows on S32G3:

  # spidev_test --device /dev/spidev1.0 --bpw 8 --size <test_size> --cpha --iter 10000000 --speed 10000000

  Coherent (4096 byte transfers): 6534 kbps
  Non-coherent:                   7347 kbps

  Coherent (16 byte transfers):    447 kbps
  Non-coherent:                    448 kbps

Just for comparison running the same test in XSPI mode:

  4096 byte transfers:            2143 kbps
  16 byte transfers:               637 kbps

These tests required hacking S32G3 to use DMA in host mode, although
the figures should be representative of target mode too where DMA is
used. And the other devices that use DMA in host mode should see similar
improvements.

Signed-off-by: James Clark <james.clark@linaro.org>
---
Changes in v3:
- Stub out DMA functions in the driver so no-DMA builds work
- Link to v2: https://lore.kernel.org/r/20250613-james-nxp-spi-dma-v2-0-017eecf24aab@linaro.org

Changes in v2:
- Store status in cur_msg->status rather than adding xfer_status
- Show exact underflow/overflow flags in error message
- Rate limit error messages
- Add a comment about resetting the completion counter prior to transfer
- Rename dspi_is_fifo_overflow() -> dspi_fifo_error()
- Add performance figures to cover letter
- Rebase onto https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/for-next
  to avoid some conflicts
- Link to v1: https://lore.kernel.org/r/20250609-james-nxp-spi-dma-v1-0-2b831e714be2@linaro.org

---
James Clark (5):
      spi: spi-fsl-dspi: Clear completion counter before initiating transfer
      spi: spi-fsl-dspi: Store status directly in cur_msg->status
      spi: spi-fsl-dspi: Stub out DMA functions
      spi: spi-fsl-dspi: Use non-coherent memory for DMA
      spi: spi-fsl-dspi: Report FIFO overflows as errors

Larisa Grigore (1):
      spi: spi-fsl-dspi: Increase DMA buffer size

 drivers/spi/spi-fsl-dspi.c | 221 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 160 insertions(+), 61 deletions(-)
---
base-commit: 4f326fa6236787ca516ea6eab8e5e9dc5c236f03
change-id: 20250522-james-nxp-spi-dma-a997ebebfb6b

Best regards,
-- 
James Clark <james.clark@linaro.org>

