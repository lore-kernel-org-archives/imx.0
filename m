Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EADE24DD1A
	for <imx@lists.linux.dev>; Fri, 13 Jun 2025 09:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749806965; cv=none; b=nf2pnkTqbVQsKUFgMUunz0qhM4FYfCnCGzyaVXt4E8ErdOoCO2VVSv6CZCv+hgkastplI421SKBhZlHU1P9uq5fIPpOJUrGgU7Sz1wKwQ3UDJDEPWld04gsZ0PUhrJucBlFUC5pJOx/wiyrrUiWzArW7GI5a/zU3paYcIHMuySU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749806965; c=relaxed/simple;
	bh=7p1mVSNV29y4bRDyz82Q/GbdEY/tcWDm2Ne86B3G/wc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=E4kpJ9bF+hGxXP9d2geeamgQKi2DN3a5b1Urie3KzSFqx7ZkX06FB0GMz+/XA77tm0qolFlHNksLY1VSlKZ8aNAyOwehLgYrfk9IWm7YEMQiQl3Hb7/olhWjptrnDWBTfb1wI3b96aAD0nDOUOZs1aqDQzHSc/vhxttzq3Zg1YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LWuLjdnV; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LWuLjdnV"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a531fcaa05so1099999f8f.3
        for <imx@lists.linux.dev>; Fri, 13 Jun 2025 02:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749806962; x=1750411762; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aXXFdWVcp6O0/7ql+/EjZalJcJlxIhnM45D+Krf1y+k=;
        b=LWuLjdnVYcEjXexAb6Qx0ANmcKkoZdAHJ3bJqEARy8zUDdqeikRjPOCbm5/L6dAjkx
         QOx2TmERhyCicOdqneGa4u1IRSyipQHMfLa2GvTCZhwRIvq26uk6Z2A49sdWKQ+bvId6
         hhOlz979IOOoYdFwuqdz9kCbAEJ+HPX0+B64V7vs6xxU7QseflF/W9AozbGfCQ1soWef
         7njpgx3p5mygrZP0sBO1AJUfH2eDeKOwA9qKFr8CATU/mLPBewK8f2iTm9OgGN8Sn0s8
         nEI4Y2bxMjk7jRBe6OpOMOkDwlYtnio+4AahpofRCmR2xi3chKVM0ubJ4QJNpBiqYg01
         5Cow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749806962; x=1750411762;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aXXFdWVcp6O0/7ql+/EjZalJcJlxIhnM45D+Krf1y+k=;
        b=JhZN0s8+jbQ4N1+Fink/NqriqVCamF+6SDrulc+1xwzXVcA2u84S+HMzVqYTOTlApP
         e8OMwCb/q3ZuiRVLsN9xNihorhHVtIpjyebIv4630P/SmZfCn0pRN9zgsyEeNzqjPLgJ
         D0GgBEB12PvMASm0UgbozYOUCUNbbfFifksGijoY5n+qWrktG2bHWHrsqV/q7/KsN+Vz
         DfBmfEcTvtSuFnnjG6Ra5Ik+bHIrMa/bkpT9wsz7ktnKg1m9eh97np4RCS1LP5q6Jqs6
         0Q69IN1zPukNQhWWpchQa2fvOLDTLJUiNP8OqNOa1t9fA5ZokdE+DEFJsmFFwACPuZS+
         qD/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVkEGGwV6g84/CJJRs2iLi3VSTj1jVXII8+adM00zR8vOrhQcYSPiR+s4kZqLl/Yg5nb7Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YyPauM03h7H3sN1cRd6uouJans+OL2b70ju7A1NFKyGXMvp4AwC
	Ra/qBB+aJq9FG3QOok4slKICHjSHVSccQnfehi5RhtR1vGAhdCzFsgt1959DQ4RRz/o=
X-Gm-Gg: ASbGncsIKgrlkpyuh0psTqDdMNHM1g/+tOCyhYNjr0LxnRBNhlrkJg+jKisIPr7xkZh
	20pbzIrd1wXwaErwqoiX4Udy7ESYHh35WEyKHCjSIU76o9gD71ktRaTy4/TYbIjmBM3wmEXY0LP
	ff0U6wwrCNlLOKnQBhYtTjHW2cye6pPdbRezs7uFPMtF9kVFzxmRxo61ef1f6aNyjPaMpsBON3Y
	BT2mK7LJPCHgHd2FAWurxks4LkBCWcun2iBbOmrdbbuewkrEQ6Bq2TUPQzaaayNPrOApb84cnGG
	UJ7ktlULRPuZWTekOkmurVGYKy2CDrI4p2YT45rDYH7coi8W1RBVeay2KZuwWnP4YH5wSd0zKev
	FEAGvXA==
X-Google-Smtp-Source: AGHT+IEf7+ii7ddVnHoaRI33MyA3PGEpFJri/RW3ePQZatTIPD6EJ8REtOXCa7Ftpau/vL6emVs8iA==
X-Received: by 2002:a05:6000:310d:b0:3a4:f6bc:d6f1 with SMTP id ffacd0b85a97d-3a56866f804mr2073713f8f.14.1749806961939;
        Fri, 13 Jun 2025 02:29:21 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08a2bsm1805946f8f.62.2025.06.13.02.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 02:29:21 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v2 0/5] spi: spi-fsl-dspi: Target mode improvements
Date: Fri, 13 Jun 2025 10:28:55 +0100
Message-Id: <20250613-james-nxp-spi-dma-v2-0-017eecf24aab@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFfvS2gC/3WNyw6CMBBFf4V07Zh2kJcr/8OwaGGAMdqS1hAM4
 d8tJCYudHlucs5dRCDPFMQ5WYSniQM7GwEPiWgGbXsCbiMLlJjJDBFu+kEB7DxCGBnahwZdVQU
 ZMp3JjYje6KnjeW9e68gDh6fzr/1iUtv6qZU/apMCCUrmJWFKsunyy52t9u7ofL/VdzWX1T8VT
 ZkqKtTJEH6r9bqubymLa4/uAAAA
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Arnd Bergmann <arnd@arndb.de>, Larisa Grigore <larisa.grigore@nxp.com>, 
 Frank Li <Frank.li@nxp.com>, linux-spi@vger.kernel.org, imx@lists.linux.dev, 
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
James Clark (4):
      spi: spi-fsl-dspi: Clear completion counter before initiating transfer
      spi: spi-fsl-dspi: Use non-coherent memory for DMA
      spi: spi-fsl-dspi: Store status directly in cur_msg->status
      spi: spi-fsl-dspi: Report FIFO overflows as errors

Larisa Grigore (1):
      spi: spi-fsl-dspi: Increase DMA buffer size

 drivers/spi/spi-fsl-dspi.c | 203 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 144 insertions(+), 59 deletions(-)
---
base-commit: 3adf5ba9ad767e33db2d6aab01bbca396bcb614b
change-id: 20250522-james-nxp-spi-dma-a997ebebfb6b

Best regards,
-- 
James Clark <james.clark@linaro.org>

