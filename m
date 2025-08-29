Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8243B284899
	for <imx@lists.linux.dev>; Fri, 29 Aug 2025 11:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756468046; cv=none; b=NEckKIw/kbiHlKv5dLzvwr1bxa+6rcg550nfNVlG0dnA/mKhG/S0MP0StdiADy8EdgMox7fbM/IPfT2Gy1MMakkt33VGqZiUTap+/bbv8T5LciiGI+UUUp1r22rhUyKs3X9ZE1ySvaS5jlu9BXt7tu/nO+TSS/vB/6+PHEmaAyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756468046; c=relaxed/simple;
	bh=nH+7SyLbGXXqvFgRv8pQOol512xjM5XrGIqVoZmP1xI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gma1htlXeb49CrfeAGOfpG1/QYIg4kcT9Y61pNLXQ4tO2+nACe+LUVWtCheTKkNZlyddIdYy52fN2fKofZRhg7oRTNCaSaDtOsC8i8gZ6mquv+1Icha8ejhWAkM90apv6BPr7aDohEscbBaV/YUinNfNVTV/ZRD84OTSyxgWfGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qeKI6S8G; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qeKI6S8G"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45a1b0bde14so12384995e9.2
        for <imx@lists.linux.dev>; Fri, 29 Aug 2025 04:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756468043; x=1757072843; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KX/IvhXAlhsi61CJEzF6AyA/gZBXATfTlkMgbkVbOHU=;
        b=qeKI6S8GfgpScBidCquT3dEftm60RDhWurkw1k3q8pvfLKUJZhnL04AKmwDZenSHyF
         WZpepKeIWpolwHhrR7KZgiy5RhCJSTX69Gc20BaQripBRvd21jMil2e7gieV53nnN9OZ
         lZia4qGocZLARhZ9tg35qOhJILv9Lffb/udh+kq5g2YQ+PXg/GgpKaojfiN7w2xZN61f
         xl0/sNWI7M8hWWnN0lCLf0+EFtaKsLyTxieuezho5OjWSWiT/wDcTcTpwZae6x8pVw1i
         09wO7fzaMauC4AXZnikd68+1sxiSPBU1XszJj6492H30QZyabt/uRBB9XsqaUV4l+uU8
         XPyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756468043; x=1757072843;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KX/IvhXAlhsi61CJEzF6AyA/gZBXATfTlkMgbkVbOHU=;
        b=vIaUs+iESqt3j6JWR8GjCIEpNbCxY5nt0Nm9tN8JysJG25Ko1RbYXgScggKxoNozk4
         kf11livcdrcbk9Q1XXCmxaf1exloPubb+5sgn1PCHKWJZZkEIl5zXXh+ki03wk0OdLNn
         4WWZVIY9F+296ZgKtHWUOBQZBmKQwCgsxJB9C0pin68u0ISxSpETUxcGCDl8JxgyR5bX
         8WsRoCqxLn8aQF6s35FbLVybYbKoR/O5UPAR5H2VlnqrD2G6M47p4S5z3RcDuc5jAZU6
         VZO/nKRcnhYfwRgOObdfKHygwGDdlErFthFuSyg7+9XhAb7GRJAK4RO3nZNtrld3iuJO
         UiDA==
X-Forwarded-Encrypted: i=1; AJvYcCVSCZpSRWlV7b/eDmRkAWQSyS4F6cpZ23r2Zvamb1GChz2I4IZCJeQDBNrgEhnaPn/cDqE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzt9XLKbLG/aPtxbAwSjT/6GFs6mVAzC57ecNayNh22gLBk3V5y
	L2zYw8GlegHk9tRrV6YutUbu9OM93sDCgplJ3y2KKlIPDmBhIe+JMc3k6HNp5KOI7Gs=
X-Gm-Gg: ASbGncuMLeq2JxGgQD912TvsU1+Ve1BswGgzbm0XjO13qDluQCeH9NFz6qzd8kuL8as
	e6NdeuWCZaYLLEnFlfV3O9XsX8fvpW0VAKXFSvpA4T+voygwGam3Kg9O544a94FC2TAyTRKoZ+S
	GfDdzLZYhK9hZ4wB7HerzN+j7CvBiex40dVc7wHJsZD95usgluuV8jWLE/2PCwFEP3GHibTsp75
	mXGI5JYbMwSsABJjlEXnzxbkfyldZ07tgrgBoW/IkmSWdLBa1hJvTshw4dZwXoPwx2ja/3FsDEt
	MDptzOLmx0IxlobjXzfgXvRbp6AEi94rmfxSxOOJ4+iIfuabWzsSEaCMG/W9n/BFR5zoz8tReu3
	qWe+x9dBXQplPnlOYBS/9jXBtbse4HD4=
X-Google-Smtp-Source: AGHT+IE6sYUh8BxMIMLLQlY8sdD0DAtWz+61SjvndENSWhM+VWl24xZTFdLXTJzV2n7T/jA/aN+mnw==
X-Received: by 2002:a05:600c:4e90:b0:458:a559:a693 with SMTP id 5b1f17b1804b1-45b517b957emr252723875e9.18.1756468042770;
        Fri, 29 Aug 2025 04:47:22 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7c461edasm29873255e9.9.2025.08.29.04.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 04:47:22 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v5 0/7] spi: spi-fsl-dspi: Target mode improvements
Date: Fri, 29 Aug 2025 12:46:42 +0100
Message-Id: <20250829-james-nxp-spi-dma-v5-0-3246957a6ea9@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACKTsWgC/3XQTWrDMBAF4KsErasyGv3ZWfUeIQtJHiUqjW2kY
 lKC717ZUOoSd/kG3jfDPFihnKiw4+HBMk2ppKGvQb8cWLi6/kI8dTUzBNSgEfm7u1Hh/X3kZUy
 8uznu2taSJx+98az2xkwx3VfzdK75msrnkL/WFZNYpj9as6NNggMXYBpCSRCieftIvcvD65Avi
 75WDbT/VdE3UpAVyhNuq8slE/5uN0LuEVgJEJYoRFTO+SdCbghUe4SsBNlOWxV1NBieCLUl7B6
 hlh/YpvMOIQiEP8Q8z98GczmFtwEAAA==
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
 Larisa Grigore <larisa.grigore@nxp.com>, Frank Li <Frank.li@nxp.com>, 
 Christoph Hellwig <hch@lst.de>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.0

Improve usability of target mode by reporting FIFO errors and increasing
the buffer size when DMA is used. While we're touching DMA stuff also
switch to non-coherent memory, although this is unrelated to target
mode.

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
Changes in v5:
- Change some ints to size_t for consistency
- Separate change for making buffer size a page and making target mode
  buffer larger
- Explain reasoning for target mode buffer size change in commit message
- Replace an if with a min()
- Drop applied fixes: commit
- Take Vladimir's change to separate -EINPROGRESS and cur_msg->status
  changes and fix the bug
- Get max segment size from dmaengine rather than hardcoding it and
  store the size in struct fsl_dspi_dma
- Link to v4: https://lore.kernel.org/r/20250627-james-nxp-spi-dma-v4-0-178dba20c120@linaro.org

Changes in v4:
- Fix !CONFIG_DMA_ENGINE build (and actually test it this time)
- Reword completion counter comment
- Reword some commit messages
- Reset tries in dspi_poll() for each transfer
- Check for fifo errors in dspi_poll() before checking for completion
- Link to v3: https://lore.kernel.org/r/20250624-james-nxp-spi-dma-v3-0-e7d574f5f62c@linaro.org

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
James Clark (7):
      spi: fsl-dspi: Avoid using -EINPROGRESS error code
      spi: fsl-dspi: Store status directly in cur_msg->status
      spi: spi-fsl-dspi: Stub out DMA functions
      spi: spi-fsl-dspi: Use non-coherent memory for DMA
      spi: spi-fsl-dspi: Use whole page for DMA buffers
      spi: spi-fsl-dspi: Increase target mode DMA buffer size
      spi: spi-fsl-dspi: Report FIFO overflows as errors

 drivers/spi/spi-fsl-dspi.c | 222 +++++++++++++++++++++++++++++++--------------
 1 file changed, 156 insertions(+), 66 deletions(-)
---
base-commit: 07d9df80082b8d1f37e05658371b087cb6738770
change-id: 20250522-james-nxp-spi-dma-a997ebebfb6b

Best regards,
-- 
James Clark <james.clark@linaro.org>

