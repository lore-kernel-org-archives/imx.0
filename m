Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CC7290D85
	for <imx@lists.linux.dev>; Fri,  9 May 2025 11:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746788828; cv=none; b=M8jL6kIHTNfl8VOS9SpDkMitzQ/5uHsyFKA4tRizSahhuqkwTPPO+gX+6Dc9W1A6u1RAp0ESe7477oNyF+6DfVAB6QbVrtVpNmYBAB+23JvnXn7ZwgjHgLKI8vnqVYDMlY0rNgcgLHGgDftHu5EYensFo9ML37JvQQT4bxChwWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746788828; c=relaxed/simple;
	bh=xranPDn1OkC/NMUiO3u7jz/wgKrHQyAzstGTneAYvJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TvD6//FFec6Heuyojey6BIkpJfbhXXOVeXDACIzyaYni0fsMmEcSSfhpGEICXCX2Bp65gxiVOPl0p23rqBnO/tijhJzCfCg23lo5AiVGhC8xYW+ykKbRUhhoylPfF7sz6L9xIrinkxFNR0SpSiHJCd46eLgq+VKxPI6jqvLDixk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gzM4oIKl; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gzM4oIKl"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a1d8c09683so774519f8f.0
        for <imx@lists.linux.dev>; Fri, 09 May 2025 04:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746788824; x=1747393624; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0/ugUs7fJj63IN/MNSKX5UMLi4/fRK7xsOMmgdlrCl8=;
        b=gzM4oIKl9/dM4UIlRomzsGykA+qyx6CgnVsNP150fg2hReXhVJ6UUO8SbMuVywNhKb
         P0q/kkabW2Hd2Lhwz8/5AFx8HfSw+YEuEIva3J2PwqQ314TRuSXIGAj9pOodmWz0hjVC
         SmbEBxs/igVYHf13a4CClG66jxy3/sZb1Cdrf6ZKgZY6bZb7mB6f812jVphPWJzASMlz
         uSzJW6ecNrXjFTa0QuCQso/S5081ZJ30vUh1Sp9kd0BoEV0l2hgCakPtNR6pRNXZMgzR
         jZmtzEkFx3NR74nljE6RFpEKw7kT5ASgQTyHvbMHaIvDzDB8CSkR/wtCZSkOa33WYaky
         KmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788824; x=1747393624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/ugUs7fJj63IN/MNSKX5UMLi4/fRK7xsOMmgdlrCl8=;
        b=bX/00o1XHxrfRw0zG1B1xG9qlfQl+z9ouNdMcjYQx+w8lcTipsei/ypMzFFQFW6t/g
         2hKRYzXhPiidhLr0wwxvTEgaWkUEe8CiQAN/Tg2x0miOIUQeBeKKkCbMexP6DjGdPomN
         bLP10nvPiJGuf6vbZ0p9bbMikyVQkVQ8+KCI9Qg9iv8ryonbVnQMu2NRBDO8zVqfgR5W
         rxRxM7tgoRHU6Ba9cftHd3E69s9xdM0+mCBRFFJCSzYtzNzvvGnzs0pVe8ShBJVt59V0
         p5PmSj1ynebkGVil3zp0WwAgeS5nw7Za8Rew5sFLrWc4vSoB9PmZuPkfq+C4z9B++4eD
         HFHw==
X-Forwarded-Encrypted: i=1; AJvYcCUwG51RGy5GcZ4hFQf0sPlT9IRfsjpv7aQNFaB+wZ9ZMNx/8JbELjkcxPqyI3Mux5moSH0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxVHZzgBvp3I7+w9mTI30QOMjVtmxsMenG7bViBN5Ab+0CWvC0s
	dGN89VD1fymoLHVo9b5m6/bVJ+yePV+hJ8TCpwX6ekTjk1Uf0UKMqXS6OKMwx9I=
X-Gm-Gg: ASbGncsDC3sPbiOF+e7NSgkXOV3U8Jb4odmmguXG9j0fkscEpi3g0Fpj1aGvUP+rpIa
	zoJ333sFbwZI8Vwi3iCwmBqgYTOyi9Ss1Hc1mHNQ8szuApMaxp5kl5TbIeoCJ8WKgWLL1z/Irco
	2+VmwdQxmF94fRN4NhxUU6Z39u4L8YT5GaVMYdYeJqbYkuv5bVvDVKMscb+1kp4pGjBwOnZ1Wve
	KlWONFcNObkGXkuGhayktZ679G1NxWtI2uXOfdWoi20BzrWkkk8YlRhLgOZ+zGS89NWsdlz/SsT
	Ew9GhDEdAqSNiM8yae4RlXHxJmTcJfru8Y+iaxZBgcz5DS8=
X-Google-Smtp-Source: AGHT+IGt4VaJbNHq9FNQxWvc/835NhTOA2iiwAH7rDv6mlJrY9Iqd6PFdsksfuN5qOW+kOzhHmEEPA==
X-Received: by 2002:a05:6000:2404:b0:39c:c64e:cf58 with SMTP id ffacd0b85a97d-3a1f64ab930mr2978779f8f.55.1746788824315;
        Fri, 09 May 2025 04:07:04 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecadfsm2914797f8f.22.2025.05.09.04.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:07:03 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 09 May 2025 12:05:54 +0100
Subject: [PATCH 07/14] spi: spi-fsl-dspi: Reset SR flags before sending a
 new message
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-james-nxp-spi-v1-7-32bfcd2fea11@linaro.org>
References: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
In-Reply-To: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, larisa.grigore@nxp.com, arnd@linaro.org, 
 andrei.stefanescu@nxp.com, dan.carpenter@linaro.org
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

From: Larisa Grigore <larisa.grigore@nxp.com>

If, in a previous transfer, the controller sends more data than expected
by the DSPI target, SR.RFDF (RX FIFO is not empty) will remain asserted.
When flushing the FIFOs at the beginning of a new transfer (writing 1
into MCR.CLR_TXF and MCR.CLR_RXF), SR.RFDF should also be cleared.
Otherwise, when running in target mode with DMA, if SR.RFDF remains
asserted, the DMA callback will be fired before the controller sends any
data.

Take this opportunity to reset all Status Register fields. This is
required for enabling target mode for S32G in a later commit.

Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 902bf23d276a..b7363cfc649d 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -1063,6 +1063,8 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 				   SPI_MCR_CLR_TXF | SPI_MCR_CLR_RXF,
 				   SPI_MCR_CLR_TXF | SPI_MCR_CLR_RXF);
 
+		regmap_write(dspi->regmap, SPI_SR, SPI_SR_CLEAR);
+
 		spi_take_timestamp_pre(dspi->ctlr, dspi->cur_transfer,
 				       dspi->progress, !dspi->irq);
 

-- 
2.34.1

