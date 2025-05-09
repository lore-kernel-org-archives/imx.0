Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050372900BA
	for <imx@lists.linux.dev>; Fri,  9 May 2025 11:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746788826; cv=none; b=e8BWNwY7h9k4Kmps49beBNJVGDlir5pO6puCc7FHo6EC2xe69uCwj3g6y6cqtnuXmbTKteZtm+KK+CsyXQy39nkE6JwySfXs752gD3hVaJ9H/VnbWA0KpJ2mjwYU85SZV46JuZa4xaxLsciYnAEuwj+JT3/bZfFNkPDj+RBcytI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746788826; c=relaxed/simple;
	bh=/FAuRPFC8ORDoN/VXflFQ2NEMxezE2lgdO50IWKPdAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qPvMMNCKHHz25OkqTZJzirIYpCMFV/sUkcCoFpc+UP98l8k0yb24w5g4TuqvCALZ15Q/yoQYxx/to9TwzjK8aa3Yk53MTI4lvbgDORUzFZBnu9s8ns+srTevZgLm6IGA1Yjy11c57tlIuq8gIqfTYm4i1u8oIU7GQJFV3EFPy8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RkDwAZEs; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RkDwAZEs"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a1c85e77d7so799024f8f.0
        for <imx@lists.linux.dev>; Fri, 09 May 2025 04:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746788823; x=1747393623; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z83P5zYL5aiqJ4xhC2aD1SNehmR83/wjYJwbnC4UTJU=;
        b=RkDwAZEsyRI5rcTizCKawH9LVtonjhLnny6pGNfJKrAOQfIqsrbE2MTYVjZNYzWffA
         JLDO9F9Q0ENSFZhGK7zaIV7y+LrnkzGEq6aF/gS/oLyItrARUZZ4kComQZvu9LIN8m45
         ZvQrliUeN4YgaBADSFJb4+snv/S+F7enPjmtM4EUc++JrSNmwzUOgODCSTfzVF4aKwNG
         TTDuWm+4XgWUf8E4lvIY9m+PX5fO8DbQbcuvZG8DOuK0DnDwh6gwA36KCoxmBTWXGTFS
         tXS19wujyc4ggCM+6VMYzVeOv22ZoWWPn4VWlaU17mZyY5LzEIa1kQ3/GRSrOsWtTyfl
         mdqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788823; x=1747393623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z83P5zYL5aiqJ4xhC2aD1SNehmR83/wjYJwbnC4UTJU=;
        b=EejGj0yDDX4/SvhaIvDd+hs5e78JiBt10ZXsWkXWE2y43lNfkWXHWWsMPh877O8LT7
         +k6QBWo80pdWhdzSit2FgsV+OWn1a2q/Yj8g1ZEbBc4ysBtLO78UsVLPUHCtDivxyPBL
         9K8/cTKS9TO33VAg9xkFVhwVh+gvX41hbpnK5GTC0/lKqZS6AQpnfqDjXevncSy+eYa0
         fp4hOE/xMrKTjjWlB8OZQXFhPWgHManp2dJf8glSM8F/ULiIJQ/Q/jGkD0KH4prCQBue
         bsv4PWJbPIrxC1Mi4QXUKeGT4jsb0BybLKgfMbB93coSrt+64ks/ouk3vn1Cdty/wsOr
         bRbQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4q31lGN9VitXLaPA+2Zuq7hIfTi5yJfzrgt/hgGA7DZKH/DNgrH410I0zAHgA2Rhs0FI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzqu35232DC5UmsQCbt4ggskPEN58iBj9wKhlbvk3TIE4qTlefT
	/pyzNw2OXbdCJKzQNyLqQX2lMLCRhNCo/E/LlFXAcC4ObWBV2X9y3L9plZheh8k=
X-Gm-Gg: ASbGncsXHoKJgmPG6ge1xCCfPbBcQZUKtRChUyROhyS+j0wLmip6RsVXXf9HdMWhqqT
	/kKSZVQb7+YsNB1frroOGRfNq3RqJkvqudvSo1/pkp/4fLUeibfsEF7U/lIF23ejzgoMuVV5I/I
	JZ+fIy1WgsLv9JPqKPF1qQxhuyZcPLvQuwAGWUhuvnAJMku45DQ0Svjp2x16mXQFW7971CflKVR
	AYjlgkNoHazM8tFGHAeXbSgChKidBARSZCH1wG/C6nMWlWq3KxaI7rRq3EuJ2dEkH8ZwmYYrcdj
	Vwv7KeM8RITsLdXF9K5BGDgeAnTlOcTLHVsr7mzETSw89wc=
X-Google-Smtp-Source: AGHT+IEzZyvVmE0isCL1qd+GE70rpX9DLtjU5jOZ0ngvIzyhV3E/BibSqbyphaSiycReT9JsLKLk1g==
X-Received: by 2002:a05:6000:2cb:b0:3a0:b8b9:6b2e with SMTP id ffacd0b85a97d-3a1f64a430cmr2498885f8f.34.1746788822979;
        Fri, 09 May 2025 04:07:02 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecadfsm2914797f8f.22.2025.05.09.04.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:07:02 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 09 May 2025 12:05:53 +0100
Subject: [PATCH 06/14] spi: spi-fsl-dspi: Avoid setup_accel logic for DMA
 transfers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-james-nxp-spi-v1-6-32bfcd2fea11@linaro.org>
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

DMA can't repack the buffer like the CPU can, so skip the accel path
which may change the word size and break DMA assumptions.

Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index f7f9425a19e1..902bf23d276a 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -849,8 +849,8 @@ static void dspi_setup_accel(struct fsl_dspi *dspi)
 	struct spi_transfer *xfer = dspi->cur_transfer;
 	bool odd = !!(dspi->len & 1);
 
-	/* No accel for frames not multiple of 8 bits at the moment */
-	if (xfer->bits_per_word % 8)
+	/* No accel for DMA transfers or frames not multiples of 8 bits at the moment */
+	if (dspi->devtype_data->trans_mode == DSPI_DMA_MODE || xfer->bits_per_word % 8)
 		goto no_accel;
 
 	if (!odd && dspi->len <= dspi->devtype_data->fifo_size * 2) {
@@ -859,10 +859,7 @@ static void dspi_setup_accel(struct fsl_dspi *dspi)
 		dspi->oper_bits_per_word = 8;
 	} else {
 		/* Start off with maximum supported by hardware */
-		if (dspi->devtype_data->trans_mode == DSPI_XSPI_MODE)
-			dspi->oper_bits_per_word = 32;
-		else
-			dspi->oper_bits_per_word = 16;
+		dspi->oper_bits_per_word = 32;
 
 		/*
 		 * And go down only if the buffer can't be sent with

-- 
2.34.1

