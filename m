Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1703C2FAC0F
	for <imx@lists.linux.dev>; Thu, 14 Aug 2025 16:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755187632; cv=none; b=Sd5/2j7QU/Kzu4uYaVmw6Snktp4D3gKPBFcCXYIGvNw2fcb7C+hUJyxpO/CXkTcADK8r7klGL6TytZMR/dXB12ezk2I5jUfKRW6tmeNUdivzUB7UJAAJcaj4JtfoRyff6QZ5Id9hrxRPvZ6OjxLS+0Xbdt5h7ebw97/zjbNQ4Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755187632; c=relaxed/simple;
	bh=kHiusdNohinSSATnpMTFXT3o3848Vs6qfqTYwtpUuZA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mfogZnBlrcwOCZqq5JdBCmf0OJsv0h49dWIkIPqsgTfCGab+UDYrOgiZTo0RJgrI3bpMHsybBJaERwk2JZOKL7jKAr8lIcMRaE6NlLkgzVlYKqoVdIjfH9c6OrqpNM2/GDeayQ+WsHW6gXv3xLxd9JGS7TJLYyzUthLbPECMeIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vDqi/3u3; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vDqi/3u3"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45a1b05d252so6930465e9.1
        for <imx@lists.linux.dev>; Thu, 14 Aug 2025 09:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755187628; x=1755792428; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zzgs94UaPpR4eiZY/A2IoO5J4EqrnU9/y/7GbaVqos4=;
        b=vDqi/3u3Q7cRtCsweFCVPZ3eSLXxnkhdmP979p29aASQwgBhJMa/hTbFbRVf+E9fZk
         AR9Xr8i6fQ3WUkBVoLbxSJR2zXZkz+GtqHQ8+xOnogu5i+BA0PKaPDDHtYHC2SQaeqU4
         OnLCFqR09bi7ztUvQEjG8NAKcnoEmSJU/wK5BVxT2Qjwbherby75mAgGrkdW9PUvzq1D
         tHCiRC+cD2E4VFjBCAdTxz6Fz7/mAyNAz4NVmZ/wt6HWKcBGUubYcHOW7q1kLi8fZV6Y
         XkS02W0P+ooxXc/O9R1q9xyHgOe/NxTBe25NwuJmtU4GL1ggkcT/us7/kejc4m/CQFsd
         sKtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755187628; x=1755792428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zzgs94UaPpR4eiZY/A2IoO5J4EqrnU9/y/7GbaVqos4=;
        b=bUwObUviV4gl95+QBjywv5Hq+oS0Xg+HDmlA1QfK3DzIPSVUdMZz9dRFbNs4+hves6
         GXllIP+YKlbpjq/0Xmui5/JDtPwblrRLhdGxHM8dHC1vq3La2+q5UCULTdWug7OxQpEN
         RjPn+TkVCNXugsH2O2DK5N+0Qm78idB+Hq+Whdny5rZSYrz4sxi8p+3FeGXcr0pZVWbC
         VUlDERm2vy14kYaLw/0IHeVc9jwKSo6C5tuebrlwiDIm/H3FQppGNOyjdpRrctA9b4wZ
         q7TpfLwJ/s08rnlft/9tbZ+sbgFo/wNcY0slIyWOS+mcAQW5PHqobrz/WcHKVKxdhekA
         7n3w==
X-Forwarded-Encrypted: i=1; AJvYcCWK65DNj+zU553gD/PmX7pZt4swtWBSNilh5HHsWg/B8leB+jK7cyM/QFExNvgHscHxFcM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxmnFp98xL95J1lZxxjdh/WPnUG0EO7f+aexId6mbbSjdSqc1rM
	6rYYYHhMKqIiDsbx7OgSEqOZ6k6WM7bB2EgjLSF4rphD7m7NvJyBXZpDMnr4EC6a3tk=
X-Gm-Gg: ASbGncsH2EJcgvcfPVSC00Ojny+IlRNagMTHzNvZGjHO4GKrLjUMQuBzEuS+7vVn/Br
	VPiIMs/oPP3u6OyhTea3eBf+YCXUnJvxIBJQHgfRvgjmnj62ruZ4Qs1nzRHovEGR79hgCv4GZaN
	CDmKGfrYsCh+gRTFcHyrIokrtUymhMudcnXa7DS06bncWT7oBsujx4e5Vlb74G743t44BTAKOeJ
	QcmaqN17hcr40UaGWeML88YduayjnkLj46vbEx7bDBVm8RPoimv6ubW6NEdjkouvWNTlwgWrKKB
	+YbCtZQTU2vri1noUhZAvTw1IgeF3zDU12fkDaFCW48D1/kNL6AxT4CMp71PYgWZ8yOFKthuzRk
	HT+11rq9TmGPSTkECrthFAPYpffrcuZ1T1Nw423FHgw==
X-Google-Smtp-Source: AGHT+IGktcl8YaEWCqH4pc5f5bXMJs47KV7sRjWfK4gjUNrG3xeCwFQRXRTrSkxb2XHOnppAWphUiQ==
X-Received: by 2002:a05:600c:1c1b:b0:459:ddd6:1ca3 with SMTP id 5b1f17b1804b1-45a1b5a2033mr33274125e9.0.1755187628364;
        Thu, 14 Aug 2025 09:07:08 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6bd172sm28363495e9.6.2025.08.14.09.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 09:07:08 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 Aug 2025 17:06:46 +0100
Subject: [PATCH 06/13] spi: spi-fsl-lpspi: Add DT property to override
 default pin config
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-james-nxp-lpspi-v1-6-9586d7815d14@linaro.org>
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

This allows the SIN and SOUT pins to be flipped. Use an enum instead of
a bool even though we only support 2 modes so that the other two half
duplex modes can also be used in the future, if the driver ever supports
them.

If no property is specified, continue with the old defaults.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-lpspi.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-fsl-lpspi.c b/drivers/spi/spi-fsl-lpspi.c
index 816e48bbc810..98da6a5d7013 100644
--- a/drivers/spi/spi-fsl-lpspi.c
+++ b/drivers/spi/spi-fsl-lpspi.c
@@ -88,6 +88,13 @@
 
 #define SR_CLEAR_MASK	GENMASK(13, 8)
 
+static const char * const pincfgs[] = {
+	[CFGR1_PINCFG_SIN_IN_SOUT_OUT] = "sin-in-sout-out",
+	[CFGR1_PINCFG_SIN_ONLY] = "sin-only",
+	[CFGR1_PINCFG_SOUT_ONLY] = "sout-only",
+	[CFGR1_PINCFG_SOUT_IN_SIN_OUT] = "sout-in-sin-out",
+};
+
 struct fsl_lpspi_devtype_data {
 	u8 prescale_max;
 };
@@ -417,18 +424,27 @@ static int fsl_lpspi_config(struct fsl_lpspi_data *fsl_lpspi)
 {
 	u32 temp = 0;
 	int ret;
+	const char *pincfg_str;
 	u8 pincfg;
 
 	if (!fsl_lpspi->is_target) {
 		ret = fsl_lpspi_set_bitrate(fsl_lpspi);
 		if (ret)
 			return ret;
+
+		temp |= CFGR1_HOST;
 	}
 
 	fsl_lpspi_set_watermark(fsl_lpspi);
 
-	if (!fsl_lpspi->is_target) {
-		temp |= CFGR1_HOST;
+	if (!of_property_read_string(fsl_lpspi->dev->of_node,
+				     "nxp,lpspi-pincfg", &pincfg_str)) {
+		pincfg = match_string(pincfgs, ARRAY_SIZE(pincfgs), pincfg_str);
+
+		if (pincfg < 0 || pincfg == CFGR1_PINCFG_SOUT_ONLY ||
+		    pincfg == CFGR1_PINCFG_SIN_ONLY)
+			return -EINVAL;
+	} else if (!fsl_lpspi->is_target) {
 		pincfg = CFGR1_PINCFG_SIN_IN_SOUT_OUT;
 	} else {
 		pincfg = CFGR1_PINCFG_SOUT_IN_SIN_OUT;

-- 
2.34.1

