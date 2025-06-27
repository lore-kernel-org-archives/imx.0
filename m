Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F2229898E
	for <imx@lists.linux.dev>; Fri, 27 Jun 2025 10:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019733; cv=none; b=GhuVPULsq3+MY88GuqdJOJKehK8Zwd67Lh1iF9w5NK500vN7xjCkOUmwazntI81WwgGOdyHB/WAUeX75/p5qVlsN4Nggq9D/BBrr4kKF4J2Llc1v6KdjY+aIEjipTqftNUiW/lS25cvXwPs9sQLbxCG+7QCxbYAkxUaL+uzMjM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019733; c=relaxed/simple;
	bh=+eXi3DiHzgQsYWud3YipBZFVOyps3/W6L3tl11/2HAU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oL1feKSAuo7vMOP3jTCyZc3f0J6AlaVibYMnmWAz5ujdR/lgiVVKlH9ZDFAWfN8rxNAckR4aTq4ydRok+fpQ2i+/zx7gav7R8eZORLKjrnKYyLlc7m5fGySXrutxJue24db93WT/FSxLOq8YRYYSjuYE2XN6Sic+OqGVRsOa/Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uqv1TMkZ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uqv1TMkZ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-453634d8609so14320455e9.3
        for <imx@lists.linux.dev>; Fri, 27 Jun 2025 03:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751019730; x=1751624530; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UkE+u8fu4iyuqxNowVgVLUi88LeAKltjfpkNJ+TScv8=;
        b=Uqv1TMkZatSnLlGLq6qYf79awyxzWTLHFDzuX2kZsgGTo6Itji3PX4cVDmHKtSI0Vv
         zPDmAL0itxEQIH7OvChZvWLbFTqhUNbSopBcflVy3FoN5dz6BPIgZXd1BkuecvxvPByF
         /Mn2OseG80eiL9oKhRVw8Yl9ecwOZecJijOInxs0VDqm0SOH2LklVa1VHocj8PuQdLsi
         sfW7M4bdANiIlRho8diaEiulxCCCa1zCpztrx1SFiYpKh50qJ/4IV+iQOxuBkBGZJ0AC
         /ZtNQ2/XVNcwssvOIUoo9kZJ/YGz0hx81foyiaLz/79OwcFO+6PsBDUvwx8nJd8w4vVg
         q3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751019730; x=1751624530;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UkE+u8fu4iyuqxNowVgVLUi88LeAKltjfpkNJ+TScv8=;
        b=v3L/bmYzNuZ/jXKpZiO50Kg6uedqFuojfk75uh9vV7pu7z3jsoPFUBBhIPPmvzp5CD
         wCN3ReQeS5Ss8SXhUOM3M9I/QwfHK5mlPFAYMPrc/cyvCPvZJw8kzXjO81jc+5rol6QR
         WSTCrRgjSyzqR2QyURNvH9vsNQFY8airavzIl6hkvmKI7yIJIJ7xrY+ljndTAc77NZlN
         WgSOAbdoUrdlr9wke819k3IoFN8LtTdxPyknQngpAk7k0q+L4fs/zD3dr1Q8aFhCFPCk
         OcgNmJCUcm8j3sRoQRKQ5+klZwjIYvsCK5thSZUPRFc20S9uCpVuf3asd4niYMBY3IwA
         zG6A==
X-Forwarded-Encrypted: i=1; AJvYcCU/WIkQGmnDSwhv5r/vWW7HAWhdYfSiZqbAAI0Gwcsoe8rX7Pn0SkY5tX2ITyKvn2a5H1I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7Z4Lc3NJt1nICLPgXItz6BfZPF2/KQvCrN52G8FxrMQ9gXlzg
	jS0/DiCJicwY9jjzHC1D1nkS3E6l4Y9NBTj2HtL9mzW4knrmOKmSA0JucI5DGGpSxew=
X-Gm-Gg: ASbGncs6xgy+XdlumRaLowEqkFlHMllysf5N/+pLa2fS13gLB9KeR+Dw+Br51ZqVA5R
	T51kseDHaReQTEOfanoW1Vq1vZq73iR6vpt3PmuhXNRp+3BncmFouTTqOH9lI+27RFQYDVKxEtM
	0xn4+w2CKhmnlRquk0OiMUuoNB1eom53mnqxEUBVGk3+Fq1BpGob3AW4FZiwx1unbeWHA/jOygv
	SW25CJxk7uiy2oX5dNCNBp05+A2zL/kiJYRxx/ccIjMNkPcMhDHnDVpG+X3/yDqWH7kiv+RGCUf
	CzRT5+73MIjwDIkTY+LYgx+5LaMP5BxgJE4eJkOM4LPKDr4NHnxNzVqNhubG5Y38Mi0LGOU=
X-Google-Smtp-Source: AGHT+IG7QxsvZWl/3ydeZ4Pv3VBNO8dZz1Djzdjybj3GGWSc7o2t+AVTgzQIN9QyIjzq1OREsAK8vw==
X-Received: by 2002:a05:600c:8b52:b0:43c:fa24:8721 with SMTP id 5b1f17b1804b1-45390699e19mr20404765e9.17.1751019729592;
        Fri, 27 Jun 2025 03:22:09 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3a5599sm47250955e9.13.2025.06.27.03.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 03:22:09 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v4 0/6] spi: spi-fsl-dspi: Target mode improvements
Date: Fri, 27 Jun 2025 11:21:36 +0100
Message-Id: <20250627-james-nxp-spi-dma-v4-0-178dba20c120@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALBwXmgC/3XOQQ6CMBAF0KuYrq1pp6UFV97DuGhhqjUKpDUEQ
 7i7hcSIEZd/kv/+DCRi8BjJfjOQgJ2PvqlTkNsNKS+mPiP1VcoEGGQsA6BXc8dI676lsfW0uht
 qikKjReussiT12oDO97N5PKV88fHRhOc80fHp+tbyFa3jlFHOVI4gkJVOHW6+NqHZNeE86XNVs
 eJfFWwuOGouLcKyOn3SwWddcbFGQCIY14ilA2mM/SHEggC5RohEoK4yLV3mFJRfxDiOL2uwYiN
 0AQAA
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
James Clark (5):
      spi: spi-fsl-dspi: Clear completion counter before initiating transfer
      spi: spi-fsl-dspi: Store status directly in cur_msg->status
      spi: spi-fsl-dspi: Stub out DMA functions
      spi: spi-fsl-dspi: Use non-coherent memory for DMA
      spi: spi-fsl-dspi: Report FIFO overflows as errors

Larisa Grigore (1):
      spi: spi-fsl-dspi: Increase DMA buffer size

 drivers/spi/spi-fsl-dspi.c | 233 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 166 insertions(+), 67 deletions(-)
---
base-commit: 4f326fa6236787ca516ea6eab8e5e9dc5c236f03
change-id: 20250522-james-nxp-spi-dma-a997ebebfb6b

Best regards,
-- 
James Clark <james.clark@linaro.org>

