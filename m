Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7834225291F
	for <imx@lists.linux.dev>; Thu, 14 Aug 2025 16:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755187627; cv=none; b=ZTzKzoKSltwyVoK0MimLjjbks5zy2yXk0FxlgoDUKOJjfyjo4Eh8buVJphiwWHmAUwsvxGpetMN/gU8UJ+u/I99W27aUI5LkAzToody6JKOtgQNmNSdRvtvg3iqWX8t7UmtdOq2IK/Q8mNOxJ228ZHHQw/hf2VNEjTNKx8UwvBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755187627; c=relaxed/simple;
	bh=CLq0x//RJ1+g8/wsiBtMX89qchTr6zzzAuw6KnvXyPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G4AvOjhtFskpNxigWLdQTkB/45nTddZ2XMgBx7tn5YITR0bNUSqUyXmS/xL/mARpcRENwVSCcsN8d72/xbXvHidaFuJWFnxlcIkHu6V+SxpWpm7ReYxT+es1Zc9avpft5TbBXPA9EoAjFdzDiT6D+pp//WsV3Qyfid+0JYbRUvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b3tcQZYH; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b3tcQZYH"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45a1b00e4a1so7447685e9.0
        for <imx@lists.linux.dev>; Thu, 14 Aug 2025 09:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755187624; x=1755792424; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G4vuRjFCf3vC4nZa1AB/3PAeoOAW0nxzKRYHE4PiFcg=;
        b=b3tcQZYHNQFcfnOHZbU/O4W2Razq7ODp/Z/XzWQpVVcZBlSUX0AvGnT/kMFoX7zgGu
         CM4i3wyc/GtpDzSBpqV7qrX04HN0lLa2S+MO00sgqm7hq35kSQZ+ZsmfYxs4nNrD1Ram
         GvUqb6ykYoCjFAiJP/Rulo3qTanFqCi47Clv+9JRuyM8fj0TGGSrvpURvxV4aXy+mvg9
         Osn3CqlUUdm3DaNkOdQFEhLKluuUzaS9rF/HlyN+iW/ni4PPf1wh2OCjENcFhZvIRzVQ
         gHQolc05gW1jH7hq9LRse+XZtonlxP2oHVhtzaOUHgjD3Sh8g2cKOomiNOVhXAGCVFpG
         0hEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755187624; x=1755792424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G4vuRjFCf3vC4nZa1AB/3PAeoOAW0nxzKRYHE4PiFcg=;
        b=mg4s1ux94YzEoe4snyGIImaiIClA2HIuV/Yw58GXaygQ0I/OV+kXt14cgsPLVgjZ6p
         KsY3gF/KJFuLLqd6aD7Ms4yNNDU4YKhBLQQEosjjNCpRlekcjA5pAyjlyeKCGaQs+aWq
         MuaPRHBhT+cTCrQZ87XWcjmTHaLKaV69hjQt1VvQOv3Qjm1EYgqjq1SIof9TLwYoYt4n
         mik9hfSK+TL2p8ToFuTBVo85UedJi58qMNV8TlWLzwvm4WGObn+FA8wpefjlFXXnX51o
         cxb6Ofv5/hkq2xU8GMK6kRJkLJOWTUnDp7cEoyHlqaP8gWcG/6aE98+egDMBNjzSxaj6
         VRLA==
X-Forwarded-Encrypted: i=1; AJvYcCVs7gzzx/DvtWqiD6XZYHL9LzXlYpbeiAJ6LDMnCTR8xOvuFp8kDP4KMRqPPwCimumQIpQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyXtbo4u1qJOKpm9sTNnyjGxDa2IhNGSYGVWj4oRR8ZUeacAYhk
	vaeZdWeQLY4gqktSF0gHAMlOyahMP15d7pWy8OBS9YXUXFVljRgsTKtZVys0J//GeIM=
X-Gm-Gg: ASbGncuuyk0cCXmLgaMB3WEzGNypQl7SKszI3swf4piUgfuJBs+cE7fv+lK60ZFyfnk
	Uc/TOAtgXTYomsEuGlPEPIt0v9AeUIIhcZkSedQQdg72Z1cijFpF5IspKqjS1hYgoeNbGU+Qpsu
	MWLlN0A3airNtmbHiJzZZjQJK2mLYFho3oz20TXdIK2bWa8psZ/tdLsI+lKAxQzhIkalCJbIB/p
	h+VGYdB8bC7poIxSZt2YuhrA/JVC3oOXQhMmofCi1894SyFpXnwK0aiQFvFWx7WWvGa4hLYlSec
	gQxv5fRLWueSKnpyPW40B5WzEqIdNoLDDkN+j1TrVQgZWcOzwyEI/5JccTqY2H7OHrumithBrd/
	b4e7EFWJiUtqgfl7ujVTKM1R2LwWmjpU=
X-Google-Smtp-Source: AGHT+IH/+4jZEpKRE7MfihNgsJ2kDCK+C5ucKz6591vTGYsk5Mbo7reqdiCgmL0v7c+F3KACTVzlYA==
X-Received: by 2002:a05:600c:1c97:b0:459:ddd6:1cc7 with SMTP id 5b1f17b1804b1-45a1b597881mr34789795e9.0.1755187623699;
        Thu, 14 Aug 2025 09:07:03 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6bd172sm28363495e9.6.2025.08.14.09.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 09:07:03 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 Aug 2025 17:06:42 +0100
Subject: [PATCH 02/13] spi: spi-fsl-lpspi: Set correct chip-select polarity
 bit
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-james-nxp-lpspi-v1-2-9586d7815d14@linaro.org>
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

The driver currently supports multiple chip-selects, but only sets the
polarity for the first one (CS 0). Fix it by setting the PCSPOL bit for
the desired chip-select.

Fixes: 5314987de5e5 ("spi: imx: add lpspi bus driver")
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-lpspi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-fsl-lpspi.c b/drivers/spi/spi-fsl-lpspi.c
index d44a23f7d6c1..c65eb6d31ee7 100644
--- a/drivers/spi/spi-fsl-lpspi.c
+++ b/drivers/spi/spi-fsl-lpspi.c
@@ -70,7 +70,7 @@
 #define DER_TDDE	BIT(0)
 #define CFGR1_PCSCFG	BIT(27)
 #define CFGR1_PINCFG	(BIT(24)|BIT(25))
-#define CFGR1_PCSPOL	BIT(8)
+#define CFGR1_PCSPOL_MASK	GENMASK(11, 8)
 #define CFGR1_NOSTALL	BIT(3)
 #define CFGR1_HOST	BIT(0)
 #define FSR_TXCOUNT	(0xFF)
@@ -425,7 +425,9 @@ static int fsl_lpspi_config(struct fsl_lpspi_data *fsl_lpspi)
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

