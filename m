Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807163093A8
	for <imx@lists.linux.dev>; Thu, 28 Aug 2025 10:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756376131; cv=none; b=BiFrE2UC0zVpOXx8fZyF6aR13HTTjn01JHdOzkzk+k0FYl8euRJQWhnqQyp+xkS8ZC+KlFnUOO3A7UPIlTVBNTw0jTiHJ71B3hRmsE9pFD7dJ9RcuTI/72K9qRT9xByyygbstM6ZrCGzCfmmZaJSvqUlFlkpGn5g/4NlIbDRrlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756376131; c=relaxed/simple;
	bh=vwAyXPvEWNr8LT9tnA25vDO5c9cTWlSyoxFCI3Eqm5k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JxvFhAx1dxqdl3liJbv9DciEof13Y8Z/V1QKn3RMYoXFyXWkZEFBSYHVWIQGJR0zyaPdqtonWQdrVkDYuZ756Q1t9xvLYHxObDZrJaIbP0KsL8D0XhOFY8c9rgJRPEByaevDvjQlrWM4iyI/PP8NKY4llosHb0N7JZYa40jy6TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BARXKZUG; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BARXKZUG"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45b4a25ccceso4283345e9.3
        for <imx@lists.linux.dev>; Thu, 28 Aug 2025 03:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756376127; x=1756980927; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hFyM4ThRAnuOrWqhdN303iEN0WDuqA9mWMtHiG3HC74=;
        b=BARXKZUGofVtGQXzgnG8XEtBsWa+9KHkOZUs34eRdHyOeDNFdE/m+cwSVbzZkzF6FR
         fDnDNt+QM9MGavuPF6OxnKIxpKoMg6g3MJGzQC/+T9eeY/y+K7pdxiNbxO3RlEqScvi5
         xpl3TOmAjWaq5TpTqn4sDb+MHcbkAg50AHr5IZKvWfAa7RlfHywnhzxhflifyKnzUTm2
         EybA87O6feAc3ZP4GopBQRL6wBEBQQ4QWz2OruZ44AIPF19ylHapq7PB91Q0EKrIby7Q
         Pnm8mTXQMG5hUA4c+1tHnAzHFY3w9hiMlp6g7lgbimq+xQJoTtYskg4HdW7YN52AE83V
         +dBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756376127; x=1756980927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hFyM4ThRAnuOrWqhdN303iEN0WDuqA9mWMtHiG3HC74=;
        b=o+CSZfj+16TytCjBb4fwvFZkhiX3xxq6LMLhiHn9/Cxy3/IvhTE3GLHndRBULfWXda
         wnNjByNmyKmc+SuUuJinVl7efhLG1HW+sCUnZ2kWSj18tuo25M20l//Z3TqZ1qErTFdC
         Byq/c7QGAx7xo2dm5vTrCPu3yDWt7BsyOsMX4Ktgv2JuuOCYhLr33wzqTQRBnL6mLeiB
         W27YAsBnberu8qTd0JGtwt4cj3rD2MR0oNm5t7etN0mwZfou9ZZkiOwo3DDPJJJqEDS5
         lvrb1rLHNiHE3Hd+avSJk7eNa+Z9vGUVWrh6FmXzzNI4qPEF/Vde0krtexvt7KlS3jLX
         osug==
X-Forwarded-Encrypted: i=1; AJvYcCUA6f0oksdGYxB4MATzrX76436Pzyb+kjoGsrnV1FHO5x+yaG7eRx32XCpG+b4gcW10O/k=@lists.linux.dev
X-Gm-Message-State: AOJu0YwssYXSegTIRTKCADbgJlhywGBXQc1TrHJV2q+fiEVVhMULhgza
	gMODNrU7vG0ucgmIskK4KpUgsZQ8TxStQLJ071d1zArnpOK+t8ojOQNNKtVR919vahM=
X-Gm-Gg: ASbGncv9DqJHWrieHXZEJseCEKTL/hGWRHCn6ay6+oa3dZgOVyX1X7wyI1qLWgUF5Mf
	jAaCI0+MiWhngKIWRLH1hzMiNKbGjKIL36PgYNgrrnZP2AcR7H0xuJBgj0Mnhl+KS3mVGrDvlXO
	FE4KayIKhUAcIiK0R28hviHgN0031Cp4lUHXzrm8n0I+kEAmzu85b2jyd+3p24NSYAj3qdUgnOO
	m6xUApSMfiUZx1MzS9qMJl5eEe9KX8Vpz23Zoro5xcMEBogjBcFRY7Q7IlU2AsD8qAZEV7W57nO
	eIustmyYX6fjR6E54/i+PAy+pBJcd2nFfrvIJjB9B5tRzKTvi0gHEMs84gEbWGIpCCa11OdnsCN
	sYZZ6XW3syGsDuyz0FGe3XD05rHNEqk8=
X-Google-Smtp-Source: AGHT+IH4dJDXOuG6Gex6qppq8O+/YSy8+QUqMDaC7Dq+UPsdjndG68BzyEzfoI8KEAsLq9qblHr5rA==
X-Received: by 2002:a05:6000:2c0e:b0:3c9:f4a3:f146 with SMTP id ffacd0b85a97d-3c9f4a3fee4mr9904913f8f.62.1756376126673;
        Thu, 28 Aug 2025 03:15:26 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b66f2041fsm49976305e9.5.2025.08.28.03.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 03:15:26 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 28 Aug 2025 11:14:41 +0100
Subject: [PATCH v2 2/9] spi: spi-fsl-lpspi: Set correct chip-select
 polarity bit
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-james-nxp-lpspi-v2-2-6262b9aa9be4@linaro.org>
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

The driver currently supports multiple chip-selects, but only sets the
polarity for the first one (CS 0). Fix it by setting the PCSPOL bit for
the desired chip-select.

Fixes: 5314987de5e5 ("spi: imx: add lpspi bus driver")
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-lpspi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-fsl-lpspi.c b/drivers/spi/spi-fsl-lpspi.c
index eaa6bade61a6..5ea4a306ffa6 100644
--- a/drivers/spi/spi-fsl-lpspi.c
+++ b/drivers/spi/spi-fsl-lpspi.c
@@ -5,6 +5,7 @@
 // Copyright 2016 Freescale Semiconductor, Inc.
 // Copyright 2018, 2023, 2025 NXP
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
@@ -70,7 +71,7 @@
 #define DER_TDDE	BIT(0)
 #define CFGR1_PCSCFG	BIT(27)
 #define CFGR1_PINCFG	(BIT(24)|BIT(25))
-#define CFGR1_PCSPOL	BIT(8)
+#define CFGR1_PCSPOL_MASK	GENMASK(11, 8)
 #define CFGR1_NOSTALL	BIT(3)
 #define CFGR1_HOST	BIT(0)
 #define FSR_TXCOUNT	(0xFF)
@@ -423,7 +424,9 @@ static int fsl_lpspi_config(struct fsl_lpspi_data *fsl_lpspi)
 	else
 		temp = CFGR1_PINCFG;
 	if (fsl_lpspi->config.mode & SPI_CS_HIGH)
-		temp |= CFGR1_PCSPOL;
+		temp |= FIELD_PREP(CFGR1_PCSPOL_MASK,
+				   BIT(fsl_lpspi->config.chip_select));
+
 	writel(temp, fsl_lpspi->base + IMX7ULP_CFGR1);
 
 	temp = readl(fsl_lpspi->base + IMX7ULP_CR);

-- 
2.34.1

