Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6B22FDC23
	for <imx@lists.linux.dev>; Thu, 14 Aug 2025 16:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755187633; cv=none; b=K/utqjQevcz4eFLPtg6HOKGxZewUDIEgRiVF6j27HCdGkNWFyI5V2M67Y+7vZ0oEUy7xPcnhkKwOQtzLUxxH+2wO4jce9wM42aY0xPPUh07ddg/8EZ+XA5Ys2c2P5/r4peBbvNnfm3+5SrijZDZcenQ8jbFjPiqnBlh+8S9r8uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755187633; c=relaxed/simple;
	bh=x6+cgJsB3/bivyB/8CpTvAXJFzLNyeY5QyOEcAO/NHM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MK/6SGBgr9tYTEXl11cl4d330khrI7TkT5nllpxo52ggDufbLVYW9VjZSTdOdY7rlqB0l+IyWG0iC8S41MCUVwSSSiT9KFSCFDlUEgSAZZNotmEt8+jiPjMRiJqvOog0gDOJJl3TBGFBMYBT/vdcl4sIDSj0spBgbWA2Obcc250=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bTcekIGw; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bTcekIGw"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45a1b098f43so7598785e9.2
        for <imx@lists.linux.dev>; Thu, 14 Aug 2025 09:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755187630; x=1755792430; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WEY/dtRV5XlPcMpsbJUXrg5ckl8gnLAS3vBlRMh6s4M=;
        b=bTcekIGw7YB5tKLORJRiXJcXCVgZ9fTeQeL7/+jbcX/y9VKjV4eXOXQGi6MoKvFdcO
         dKx4Hvvy0/hbEXcrIQpTIp3BVD2jl616MbDzRNh6CshrXK+gM+Pgfk8j5TLmiy7syZgS
         qbCSJbVyfhtWAeQks0ipyFlQL1QOiCVeY1hv6DxKVMrbAWQz7H4V5ykQ/zxGkjDBA2PK
         g/9k7XVaNRJZo38j2m/o3obbhxpA8TMUdgmwRdiXfVisOr8ScyvWyRNNCTZUssVC5syL
         vY62ytDFwU9ayBg/OPqAQcsjqVWcedx/WNq5pMfUVjyjrjE0ujemU7kKtOP3+PI+HJ2k
         QOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755187630; x=1755792430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WEY/dtRV5XlPcMpsbJUXrg5ckl8gnLAS3vBlRMh6s4M=;
        b=IFNhf6BTGWizpIqup7YLVTYZpOggJToUmoYq9c1ERZTA+arSuUG/mlF6hnYdzz394E
         +A8A3B3CXI3lLR4qkYSvKTczktC2zSRiZYd82UVnb4/qMecyu2eFVgYTOLx90LXiTOHq
         I5J7YU25nF9+iprRqYUGiz+byrNQHoNauSfvGh/TXmmTZkybTrY59ERaAS2QUZ5F09OC
         VPn6P7adMpEdqeFhlZlLAizZTcBsKEj3XAl8ujgsOHNGvSfxkK4IPOlPGrg4Je5HOddn
         +wkCKem0H2eziEhzxchjlEMrbI5TjmJRScScVua6NUAvHrFK+G6XrIKtDR03I2jMl4PI
         pNag==
X-Forwarded-Encrypted: i=1; AJvYcCU1A80mk1WzHoMeSJH/GcLZURFIbso5HbmYCvGKn0y0RCr7Ib6ZRDvdc8KhGvZ9fMONMqU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxsFoYbxJRrTmRzCmpWbeTGVtV9VpwcXSkxw5IZ0oJfhJXLCddf
	CJS+HGF5M7m2OxujlLtJCbinOq9q9CFNWHzVAUSoZDKpb02kP8ma/Jr2e3mlz58pgdY=
X-Gm-Gg: ASbGnctRxRMPED/naZSOOIYdqbH6gdXca5onl30XocB/ASN/SDX+3WIKyw42YQtbMVS
	/kpPHJJGMzZEnc0qb0OCAOXwIveZn6INCcR/d4R3FfgSuz73RnsDXBpk4OLI5CW+q19v2AzQkod
	on7DmvNw/ultWtSqsP0+UAcZFrjZbPnHKO3AwBn+ofIMYXLgfabhTarff8SKgQZ98lijWt3YPxX
	MdqiPOcJvV9wh2OmhUdBLJaZoGH0kehgUIyEXpV784AF1kb42dlouI247DfGuJuSSAdS+en+9SO
	tTiBOc8RR8g8yfx/tOgPB5DF8LaQdEKoKoCvxbJFt2WsZIY3lfDnmAV6QG9KswtX/aWYBGNc09D
	rxalZIBmpUlY3DLqtcslq8MjS0WxCxBsv+Lsc5CeSQA==
X-Google-Smtp-Source: AGHT+IFs/lEP4IWVBoJgkpoH19R4IKvmXIZCDViCWIe4I0U2tewRdOz/LgHXlcznz0VkzRUCVVfEsw==
X-Received: by 2002:a05:600c:19c7:b0:459:dde3:1a33 with SMTP id 5b1f17b1804b1-45a1b66e81emr29035635e9.26.1755187629543;
        Thu, 14 Aug 2025 09:07:09 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6bd172sm28363495e9.6.2025.08.14.09.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 09:07:09 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 Aug 2025 17:06:47 +0100
Subject: [PATCH 07/13] spi: spi-fsl-lpspi: Constify devtype datas
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-james-nxp-lpspi-v1-7-9586d7815d14@linaro.org>
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

struct fsl_lpspi_data->devtype_data and fsl_lpspi_dt_ids that point here
are already const, so these can be too.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-lpspi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-fsl-lpspi.c b/drivers/spi/spi-fsl-lpspi.c
index 98da6a5d7013..332a852b746f 100644
--- a/drivers/spi/spi-fsl-lpspi.c
+++ b/drivers/spi/spi-fsl-lpspi.c
@@ -145,11 +145,11 @@ struct fsl_lpspi_data {
  * ERR051608 fixed or not:
  * https://www.nxp.com/docs/en/errata/i.MX93_1P87f.pdf
  */
-static struct fsl_lpspi_devtype_data imx93_lpspi_devtype_data = {
+static const struct fsl_lpspi_devtype_data imx93_lpspi_devtype_data = {
 	.prescale_max = 1,
 };
 
-static struct fsl_lpspi_devtype_data imx7ulp_lpspi_devtype_data = {
+static const struct fsl_lpspi_devtype_data imx7ulp_lpspi_devtype_data = {
 	.prescale_max = 7,
 };
 

-- 
2.34.1

