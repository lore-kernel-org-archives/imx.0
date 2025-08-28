Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCBC30ACE5
	for <imx@lists.linux.dev>; Thu, 28 Aug 2025 10:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756376132; cv=none; b=Z/9adjPmUaJZi/coRzUsd6EoAPp0eAayW7fB+r1vpYfsVq+Ry2hAUrzc45g+IJ5C9kEkFOWXARi8kzbEmmhDdN0VLhc2Lh25MWkZUZTijWXW2Ip3Ry2ALQB5c02YAVeUoXvh0/yjSgg8WYf+ddVHf0le2Ia03tphRQ5BCSHoeWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756376132; c=relaxed/simple;
	bh=TykPo4FEzszkEjBWuJuKm7lmZkKFORU7dcqQiaiy+TI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P8ZQdJ2ZGNLeAp6Ur0ZccslEUBVSwv8xIjNDqMVwyqelD90voNpugiXeHY9cQcS01tjeh8+7j8DNIz6yi6Q1eG5wO/KBdFITMHgmPnEg39H8GAZBXmtTUpijVP3jYGuoEwF+HmFEzSco+5RsAeEDoF2tsRdxqxcyYb3gRAFcKI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NxIvWD0k; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NxIvWD0k"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45b7d497abaso817265e9.0
        for <imx@lists.linux.dev>; Thu, 28 Aug 2025 03:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756376129; x=1756980929; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nQ9pY7TQE3ufolQ9TVb2mjFq264G6eCq3tJESmx13zY=;
        b=NxIvWD0k8xlIbk03OzBGt8T087i95p+50n7I2kkwfgW3RpkKaB591rlZlJqOcPDlU5
         GlFXEsnCKzxar/aevDRqPZGh5jK5GwQn2CJtHxB5obPTM4BtBUvhoXmq/hih3wwi2WsU
         54KrMaR719rqDWKmIMK3kQJffbMa1te6lKvq/HHoQRzLt8GELoqEPG1iCTMpttTEXLIk
         erm7cusrlI21tjqMOgCiUQamJwFTq18woQqYT4K1IXDxgXd2tygzxvq1/bi/HozI5sJP
         1/vBuSVm0Epi08iD4HUYHS1H89oZA2CWwkzgPSEFaAcLkVsvrtcwiajmqOQFyXwTa5ZH
         LEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756376129; x=1756980929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nQ9pY7TQE3ufolQ9TVb2mjFq264G6eCq3tJESmx13zY=;
        b=Gab1Qfa88P28a22FsJIienpBz1Qw2Ef8EL47garZdinqO8TJxE0+K2EgQC/pnFQlyx
         4WYuCXpzLc/mXo6db3MYMIFhc1No79Jqpe3Ou3ydKCFVTvpy9s3T91PEGqf4/hNPieSz
         bIUsPyO1iWISmGKSkN8OOy621mohbELYkqyCArEOdN2DCjClzLyScQ5QBPiRp6BRhLpy
         gzCYsDm9A13MtOsMk1xWq8BHjvl3oHlkK8RH1F+1GQYuXNgU/tTDanZHT/VpUqWuKDti
         aAwwjflRWJaRL+9JZ1Ai9uL5kM7rkUN0S4GWeMDk0ou48Te9lhXX+TVvPcbZOt9nLe8s
         YknQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNkdBwFRpoGbqB2QCI9jGoHptVFuMMPR9RrmU3w2WWqGpqciNHBl8NVmuhdG7xRw1TZPU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzJjs+dhjiobYoWyQahgPKL+IXXSAJe7PkAR0vd4pfShrqfrLRq
	LGB10hGm4aFd0D8LkoaIIrnpbDl1Vsg09PfqAvO70jQvUWbxy1UYAeszkN8xS1X11BU=
X-Gm-Gg: ASbGncs6+QPEENYeaYfaIyQFFWzTY6UETkj5QiTeRbA1p+iEnU5jlpGyIDwAM6cQdiH
	Ofd/QEeBskdn5NxWIRgVWD+AZXpjPQCOJ/8NhMhKOM9kJaAlG/axSDlxEa1YviUis/XUTkYlznv
	sqAECq+a0Osqn/JTzQ+461pDG/rQR0lirgOXXfT0OPIJ+IbORvVuICvkDFu+TwFBoAaHExOkV9z
	zlE0+1xQPEy38zNTss+9P5ZDQEaTyBL2tzWfbgLw7XoBEQBSa7YoV2AJSdzXDCtpZOP/va4cOKD
	fb7Tp/ogDg+QUu5z6oRW7nQ6vsZh+IjNv3O0I+1P8k5b+NRIcYUDdjCCTlCPALmOIEZreGHvCOT
	zFSpfa+ly8omK9+pIWv4efgOO7AGMBQ7s7UFK7thy5J/3NiLv7fL8
X-Google-Smtp-Source: AGHT+IEcoQuc6QzIvtKO6ABGbnE0SC0x96tO0hq5odZF7G8dxr0fq10f5k0rt03N5RbMj/NANFSoXg==
X-Received: by 2002:a05:600c:3b9e:b0:459:dc35:dc05 with SMTP id 5b1f17b1804b1-45b517a05e5mr203008615e9.9.1756376129159;
        Thu, 28 Aug 2025 03:15:29 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b66f2041fsm49976305e9.5.2025.08.28.03.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 03:15:28 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 28 Aug 2025 11:14:42 +0100
Subject: [PATCH v2 3/9] spi: spi-fsl-lpspi: Reset FIFO and disable module
 on transfer abort
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-james-nxp-lpspi-v2-3-6262b9aa9be4@linaro.org>
References: <20250828-james-nxp-lpspi-v2-0-6262b9aa9be4@linaro.org>
In-Reply-To: <20250828-james-nxp-lpspi-v2-0-6262b9aa9be4@linaro.org>
To: Frank Li <Frank.Li@nxp.com>, Mark Brown <broonie@kernel.org>, 
 Clark Wang <xiaoning.wang@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
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
transfer is aborted. In PIO mode aborts skip the reset leaving the FIFO
filled and the module enabled.

Fix it by always calling fsl_lpspi_reset().

Fixes: a15dc3d657fa ("spi: lpspi: Fix CLK pin becomes low before one transfer")
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-lpspi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/spi/spi-fsl-lpspi.c b/drivers/spi/spi-fsl-lpspi.c
index 5ea4a306ffa6..e50261e9a1fa 100644
--- a/drivers/spi/spi-fsl-lpspi.c
+++ b/drivers/spi/spi-fsl-lpspi.c
@@ -733,12 +733,10 @@ static int fsl_lpspi_pio_transfer(struct spi_controller *controller,
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

