Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A93425525F
	for <imx@lists.linux.dev>; Thu, 14 Aug 2025 16:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755187628; cv=none; b=B4Iyd8jzz1xcblQaykWoAyTDus2fqPZP6sP2I7/z+bltNKJRW+x2EgJ0+HYbDsH+twFshB0DGafC4fgfw1Qdl8SsXFtmZepBoL0KHq993ZM+haeDERpBx7YkPc+U6z+nPC3g2oR1/9M9lUfg0+nQoDYCtjjOdMWRlMhRzeEdQ8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755187628; c=relaxed/simple;
	bh=tGr7ZdC9lWhIzCCUsw+rFlJmgOHa5c1oy9NRasjlofM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hg4PL+GXRKATMtbe+78lxE7iUMHmTfSP9UA76QjWWdRtZ5OKb6aUTZoI+9T288oWeTkoD2mO4IBmWK2dTPI9it89AYsoofmJ6dnZMl5FPhrm7SZRBoYSD/9GxUh3PWN0rLhAR5NV6GgJzEt3UiGap3TxCzMbHVn+Wd9bVLqzsjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s+eTWDR+; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s+eTWDR+"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45a1b0cd668so5602345e9.3
        for <imx@lists.linux.dev>; Thu, 14 Aug 2025 09:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755187625; x=1755792425; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kIP40WisTeT4zrEy6wQwK47oVAaa0UgJRrDSFCcyNWg=;
        b=s+eTWDR+gf2FhArvrTpjHYGq1BQ8ArspimU4lEEfowwrkMPD9Zb54QjImCJUlObtD0
         EKe7N6LWWDgOHoZ0UvsUnUak6rgRlQROvapo6p/mppWp4ExX42UQSsBEC9JraaioDDJz
         CZF+CagDxER2RRj+bmmBSqxx2dVFWn5qx6sMnFFLaiYwDn9oAO6IACouT2kaCk65q96Y
         TqtxiEyIh0Q+WAsjD4i3q1AMqUgwSmm3FjeuPQbKwL4rwkYcn5zsDduesReDpBaE5TaV
         nUSin4c2ynMTZslOSJ45qOtUANsz4fLDfDt9HftzZRARphQ+HzYxYGvXPUyQUQdN1znk
         VtxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755187625; x=1755792425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kIP40WisTeT4zrEy6wQwK47oVAaa0UgJRrDSFCcyNWg=;
        b=MhRqz9NLpHnzFbxUpQ9kfKZgivRVsnsa9dDw4+We6W9FtPUY0kb+1DeTxFkYcIpGyB
         DXDUGgGPkpZNyewcj3rmmdRdUalF3VsW9QFhPrn1IJShKeUMD/rYzljtCd2iZmnDZsAS
         uUKioAkazgQmeFwRh2pSFnSj9gRCxj4mMaWFuC+qpWcLggr6T4OPzs+Zo6ireZwKeY1M
         NcxtefCNTm7ixYSk+Mjm7fzMMvrpjH7oEnVudwGrFVAYyQ9X0SMezjYmDOvdug2v4Igj
         rXmBLgUXcHQz1NGpMBkppZc06WCDDCgWWtRRg8CKrJJ5ZAd4KgJ5D0OBFSnBxNWgeuC1
         nR1w==
X-Forwarded-Encrypted: i=1; AJvYcCU2iers3eCbwZvhCvJf1ywYNo9UeogDZHXDf32a0OBPyENniuEzAfw8JaGxJ8l6+wUwbxA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzUcNrwN+b3hlYag8IJqZTh6c9bgOIYYyW07bDuFkHvVirlzax7
	gUSsBIltKn7l+WjOkg09hT7Z2b/wVCc2Q4R8ffTMGz8lTeOpmb6CTpyWYkbQrAEXpBc=
X-Gm-Gg: ASbGnctyPqn2U1eu/KhH3XFSb0DhDn7B5h2YhIoPOor6FcDuZ/pm4IvWsUIjXt2AP1N
	SXu6UcL9/AzpmjDQG+jb5tRolJ/cdA2dKyKkJksxSSUwa8qSziHGOnwGuyajG/HZ2ss8eQ5uVFf
	sRvwYr3pi5c74cR69Dzpy97k9Rhhfp0zjPs3dexZ3RNqrmZr3XGuCO8MGflCMna6B0HP9+p7rDk
	lj7reIWDwvbIry4/Lt93v3l5mRd54iOqr36XniTTA+TJ+VXEjKoxYNesAP3UebXZNtJUaE8ApRQ
	AIYcGgB90T0VQRWV7W3r9/IqVKn2ueBUgq6nayboDr31SHJvuNaah2TmAd6ZZZJLLC88HT7uJy8
	F/upJVW7WisN6rnxg6ro8UAjFK/I6RDI=
X-Google-Smtp-Source: AGHT+IFHK7GjTXRXCwZAe8/WmOBTSJ+eME2lZCidVPBvgVxCWAF3s0hzjYhWMNTNHWm2p91GYyv0Yw==
X-Received: by 2002:a05:600c:4715:b0:459:ddad:a3a3 with SMTP id 5b1f17b1804b1-45a1b657876mr28054405e9.25.1755187624778;
        Thu, 14 Aug 2025 09:07:04 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6bd172sm28363495e9.6.2025.08.14.09.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 09:07:04 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 Aug 2025 17:06:43 +0100
Subject: [PATCH 03/13] spi: spi-fsl-lpspi: Reset FIFO and disable module on
 transfer abort
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-james-nxp-lpspi-v1-3-9586d7815d14@linaro.org>
References: <20250814-james-nxp-lpspi-v1-0-9586d7815d14@linaro.org>
In-Reply-To: <20250814-james-nxp-lpspi-v1-0-9586d7815d14@linaro.org>
To: Frank Li <Frank.Li@nxp.com>, Mark Brown <broonie@kernel.org>, 
 Clark Wang <xiaoning.wang@nxp.com>, Fugang Duan <B38611@freescale.com>, 
 Gao Pan <pandy.gao@nxp.com>, Fugang Duan <fugang.duan@nxp.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
 Larisa Grigore <larisa.grigore@oss.nxp.com>, 
 Larisa Grigore <larisa.grigore@nxp.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, 
 Ciprianmarian Costea <ciprianmarian.costea@nxp.com>, s32@nxp.com
Cc: James Clark <james.clark@linaro.org>, linux-spi@vger.kernel.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.0

From: Larisa Grigore <larisa.grigore@nxp.com>

In DMA mode fsl_lpspi_reset() is always called at the end, even when the
transfer is aborted. When not using DMA, aborts skip the reset leaving
the FIFO filled and the module enabled.

Fix it by always calling fsl_lpspi_reset().

Fixes: a15dc3d657fa ("spi: lpspi: Fix CLK pin becomes low before one transfer")
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-lpspi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/spi/spi-fsl-lpspi.c b/drivers/spi/spi-fsl-lpspi.c
index c65eb6d31ee7..aab92ee7eb94 100644
--- a/drivers/spi/spi-fsl-lpspi.c
+++ b/drivers/spi/spi-fsl-lpspi.c
@@ -734,12 +734,10 @@ static int fsl_lpspi_pio_transfer(struct spi_controller *controller,
 	fsl_lpspi_write_tx_fifo(fsl_lpspi);
 
 	ret = fsl_lpspi_wait_for_completion(controller);
-	if (ret)
-		return ret;
 
 	fsl_lpspi_reset(fsl_lpspi);
 
-	return 0;
+	return ret;
 }
 
 static int fsl_lpspi_transfer_one(struct spi_controller *controller,

-- 
2.34.1

