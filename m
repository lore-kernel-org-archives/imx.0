Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F10D30C616
	for <imx@lists.linux.dev>; Thu, 28 Aug 2025 10:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756376141; cv=none; b=ZQbBr63SXEakHOkfAmNrfJ4Ndi22lQrHivWpTvflJdILbh9CNM+Lo6WhZSQ105a4ObrJ6Iq5jwLJ9OSkqisEV/Wb8ylHKFClf+w0N8liRXq0FC1symCzSWt3xuf+toghLABGaRto4XTy9JBddOi+L3e837sq4hzaOdsMs0tWVpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756376141; c=relaxed/simple;
	bh=DUL2bJxMgqW72KZYcQEl8qxFnW9WLPKvK26PzfIBBY4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oU6ign1460vi7aMMXflrT7FOb3pRjtd/SQlRRrJJCj754l9xdU93fbHhlO0Ysny3q327kqsCVOqavlQ+Cr1MpmWHl/RU0ZelF6pB16dGi02b0ouocN6RXPriXP80ZY8MgYOWoY8gpbUHw2BB92vfzdrrWEdab+0kX8kCQZNPwog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PAWPZ4IH; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PAWPZ4IH"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45a1b0c82eeso6242485e9.3
        for <imx@lists.linux.dev>; Thu, 28 Aug 2025 03:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756376138; x=1756980938; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=twA1DevhQnABtZ7AE3O2A15G4iJ3iu3xsP8XB6FKzM0=;
        b=PAWPZ4IHT0y4MAb7H5xR5HXE9LPazUVn2Jv66TR3hirxKcyeknahPeAg/fnpoq2RCG
         4mMC24plAVXMqin8qdqLdiPsYrIB4QRA70m4HUcUQXF0J1N2uOYM+GWXWCIKk+TyEGhR
         3qCMAdQE4F0SX+BKGdotHuc6t93S6RdoimBysw0P2IylO5XZIx/LbDxlwIJLHlYlBCkO
         mtZT0lSnYabF3MWZ9X43Djm4kdQhgvPpzTNjSCVcc0AB9BEQY5AJyo8qcWLJCQteAZvj
         ucMGsADA/dV//4ZJ5Qjp8r0R4cnExf7oMLhjxX4Wr6ucWjHXV/creNXu8yItPCxHik8u
         C9PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756376138; x=1756980938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=twA1DevhQnABtZ7AE3O2A15G4iJ3iu3xsP8XB6FKzM0=;
        b=EKFmk1Wv7SrCj7gp78oD1MmC3lyppf/MIGTxFtXJenv8U8YrLQMHrUSGPQKtSPc+1M
         A83DoqN5tMA2ev0RRhTH9207elGoj/7+a+QmMf+7pQFv+i0ETFYNMAAdU0Eq9nmXcxSg
         U9jYPnhaCp2voxo8nRVavhpNgSha1n1xUpN8ru8o4POrJJrOQrDLwcRJyryKlFGpccM2
         kN+oAAfgfXcrCmCJngeJYTkWMNjFE+SnnHVpm008PpcETo0Irj/C9FOf6UuNe/83XBon
         GAX+t7TPbeNsJ1PslDwbuga3BGC7JRqhTIJ/fEo3iHuKf/hP+WnAlWnPSAhYvY1cVs+t
         tNnw==
X-Forwarded-Encrypted: i=1; AJvYcCVRmODNBRVg2Dv7qVxc8vsKZcy7l/h+8KVdu51jBdiIhp1EzLWmKTe9ZDtewegd+sfZr40=@lists.linux.dev
X-Gm-Message-State: AOJu0YwnJ46bETidIA+yT4K7USpTN9I5qVwbdvT0l2YsuMfsVUELBPk/
	+4kVJ015MsP1oN2SP1dUu29tH/2p73ZUK4qcahSBsw8Zzp4fp3E3a8gONA2nFeRsO3jbg2w0w/U
	sPOSDteo=
X-Gm-Gg: ASbGncv7T1M4RDeSA7gEJZSi+oUou9MemKi+Kp3u4dqMBHjsilld4qnTMQGk8ZQH9LX
	P7JapnJRTHd+W8NRf5e+D5P+joad2B/9G3f72eEcbKt6SZ3i7dCqkLo7lTROvYLoK63Ha+52ez0
	mhzhnEJJmrq8/f3MD/uz0N/sEHOBT5bOqQh+/g7b+BhYhNbwFGlqIyButIXKxhVREaICy6mPWp2
	nw4TQmgKdFIKVz7GCv4BhE2rZTtn+A7BRsML+5j7vRobIM7s9W7lcSXZx+ICHCrhnsW9Hb7mYZ9
	146CcyP3cB/plTQ5+p9YQApvi+OHdkrP/e2FMEEshHIV9BSLesiuxvNyd70nSCuC3tLW1BeTjwD
	TYEjDcXyezVioVJHXgCcswZP5qsCzI8dZWleCW7YAng==
X-Google-Smtp-Source: AGHT+IGnwrpzezgJXIVPIURZAHVNyOiUW87JNySJUaEe/V4TYWQ5vU2ILUn3A5NCE2JjHClrcg+0dA==
X-Received: by 2002:a05:600c:1389:b0:455:f59e:fd9b with SMTP id 5b1f17b1804b1-45b517c584cmr224745325e9.24.1756376137717;
        Thu, 28 Aug 2025 03:15:37 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b66f2041fsm49976305e9.5.2025.08.28.03.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 03:15:37 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 28 Aug 2025 11:14:47 +0100
Subject: [PATCH v2 8/9] spi: spi-fsl-lpspi: Parameterize reading num-cs
 from hardware
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-james-nxp-lpspi-v2-8-6262b9aa9be4@linaro.org>
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

Add query_hw_for_num_cs in devtype to avoid directly checking compatible
string "fsl,imx93-spi".

No functionality change.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-lpspi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-fsl-lpspi.c b/drivers/spi/spi-fsl-lpspi.c
index ea25e8dab0a4..ce347cdbb009 100644
--- a/drivers/spi/spi-fsl-lpspi.c
+++ b/drivers/spi/spi-fsl-lpspi.c
@@ -87,6 +87,7 @@
 
 struct fsl_lpspi_devtype_data {
 	u8 prescale_max : 3; /* 0 == no limit */
+	bool query_hw_for_num_cs : 1;
 };
 
 struct lpspi_config {
@@ -137,6 +138,7 @@ struct fsl_lpspi_data {
  */
 static const struct fsl_lpspi_devtype_data imx93_lpspi_devtype_data = {
 	.prescale_max = 1,
+	.query_hw_for_num_cs = true,
 };
 
 static const struct fsl_lpspi_devtype_data imx7ulp_lpspi_devtype_data = {
@@ -932,7 +934,7 @@ static int fsl_lpspi_probe(struct platform_device *pdev)
 	fsl_lpspi->rxfifosize = 1 << ((temp >> 8) & 0x0f);
 	if (of_property_read_u32((&pdev->dev)->of_node, "num-cs",
 				 &num_cs)) {
-		if (of_device_is_compatible(pdev->dev.of_node, "fsl,imx93-spi"))
+		if (devtype_data->query_hw_for_num_cs)
 			num_cs = ((temp >> 16) & 0xf);
 		else
 			num_cs = 1;

-- 
2.34.1

