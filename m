Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B2A30C376
	for <imx@lists.linux.dev>; Thu, 28 Aug 2025 10:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756376142; cv=none; b=eBwV+OpKVY6mkn2mtYUcSgGdn40sOD6O6/pHM8uqB3K1NoiwYbYXXgA31JkwNz+WSGHr4pm9fdymFNUDdDfOpQ8mS6z9LVEKqumwlpsAYvCloeP6MrJJA1moTr4s5swHC7NPklk5ib8KQPn6uAoZHdh7VHG37Xql6uEjyNxWlDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756376142; c=relaxed/simple;
	bh=+vua32+ZisCIKoZtgwxULPWaV1MKJPVYFqaHRCFc2jA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uv0h3hvq5f9qZ9B354BUW3sjSTD9Q21F0/j7a7dEYIq+3eOBBsgOLL18lYCQ5/P1HmzkV73ud3hXVkuPK9G6qFh5Is4QM8pApbh4IHTAfDgJlRMhT2RQwAe/zKm+B/4LsyyZfEuKmajQGPf3DEjvz5OVcxkhXzFfvQryZzDtzv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DiezS/TH; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DiezS/TH"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3cbe70a7923so663835f8f.2
        for <imx@lists.linux.dev>; Thu, 28 Aug 2025 03:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756376139; x=1756980939; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yp6uP3SnVVC8UtclhAtZ36zVvCvjaZ1bDiL+uis450g=;
        b=DiezS/THar/HifupOVYyKNdfeElHNcTiGOaQnGD8LbvYtoi/7MYFpO0+Hb3YVonwD5
         /eje9gNoV1Ihg0n9ffK0jeQkmmEg9pZPpRj/848IrKWKHO5KfGetC71qGbGOsG3l790U
         7G0Iwqv+cU/7VcEKbiABpVsQdAGFaHNdph7vtB5e7mmPTFXMp/vcpoJ120Kc/Dq1Cl5n
         Ml3QBhFTKjK4PEN4QMr7GOUwiLA9tA/ruAMwYuBcB1P5e7qE22YCh0E2AJrECkf/ugVn
         wXVgsjgdlHhY1YuKzgxKAHN+h++HHARnPf1vdqWagVPMAfdgUlgxDJIP5cQpUxYrH+Kh
         mEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756376139; x=1756980939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yp6uP3SnVVC8UtclhAtZ36zVvCvjaZ1bDiL+uis450g=;
        b=k1dAVHF13KhUcEjS8j64dQhUiKyZuEjPz2KocluU+e87cRXk7TIP0MkE2HVdID4mgN
         tY2/jAFRcWD3dd6JFJbRXL5sQiwf0hgMmZUybSKtlgiAa3jbgMDU8aVZYiDFk1EgaOyi
         nKAwBrZgMtxWCsVfJhgyqa3jUpJG0E5nBAjEYiYdYjSzf8JdEkiPts++W9B8K9Fb0h8h
         0u30jOTpdnlpnGUbbMJIWRNTWAAqLq9IcCfaqCnjkxf4vz6473FxBAX1xqDDkJd/AwdB
         0gOqZ8G73hxl+tOSNvS5noXBPvJjstYR4RTw7wBX2XExaTY7ocDKLUfOETP11PtYDzpf
         cC5A==
X-Forwarded-Encrypted: i=1; AJvYcCXqf4dzyt07A0EoBemjP0Z7Ix2C0d8G+oiPdvCfRrkLbU7qZ3bCs1hnjpm77cf74aAALss=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzskm30oLAjAE7rXiyCbuNHBesi1ZHcqlOA/TpVgS09c/WQWPge
	uQZNPSkIHsP+2tyJjq/DPJIv7Y0Hll8RiD0Y0zcJy8piaKJQoK7pxAHNQO2VDZRMia8=
X-Gm-Gg: ASbGncs83MeF+s1lIP/fIkQRhssdPMS3hjtHAHd4Ud254+4T+ntJ8gc6CgF6NTxqR/a
	pc2ONVM9/+o7AyNiEk3icud8eG7oyTGokwh69lu6+06pKUPz8S/rvaBCnNQA4Namtub4XE8Fvj6
	MKnnCdDbTu4j1gxMTSHpDBaVMdEvKvsWQlrkw/AbW9lnAtjuF89u/oYbPCPujgfzd6RqtCGWcOx
	UdZMoATctM+GUV4AoQA2T8IoHZPU8DSxWSrTwIjt4YsFaOHNdu4lESm2ht8ai3k6OKuRtLB8hNv
	Fp/XLyi+UPniVDD3JGJcjpHJlf6qX2yA5vBU0bjgfn5jGr+r505P6X/Pifi6X59Kek6Yndpv81j
	oBVo5b9ZeMdb6S1gFhlXr5Sj4EU1tiWolonuaWbjpLQ==
X-Google-Smtp-Source: AGHT+IHt/hz7pSxKUT3aLdo/Gb/ZNoVM9J+1IsQAvEnajR37wO8sFmm+lOvT+aASpbunKjjiXbYm8Q==
X-Received: by 2002:a5d:5887:0:b0:3c4:2005:fb9d with SMTP id ffacd0b85a97d-3c5dcdfd700mr17926935f8f.31.1756376138965;
        Thu, 28 Aug 2025 03:15:38 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b66f2041fsm49976305e9.5.2025.08.28.03.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 03:15:38 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 28 Aug 2025 11:14:48 +0100
Subject: [PATCH v2 9/9] spi: spi-fsl-lpspi: Add compatible for S32G
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-james-nxp-lpspi-v2-9-6262b9aa9be4@linaro.org>
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

S32G doesn't have the max prescale erratum (default) and it can query
the max number of CS from hardware, so add those settings.

Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-lpspi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/spi/spi-fsl-lpspi.c b/drivers/spi/spi-fsl-lpspi.c
index ce347cdbb009..431439d4cdda 100644
--- a/drivers/spi/spi-fsl-lpspi.c
+++ b/drivers/spi/spi-fsl-lpspi.c
@@ -145,9 +145,14 @@ static const struct fsl_lpspi_devtype_data imx7ulp_lpspi_devtype_data = {
 	/* All defaults */
 };
 
+static const struct fsl_lpspi_devtype_data s32g_lpspi_devtype_data = {
+	.query_hw_for_num_cs = true,
+};
+
 static const struct of_device_id fsl_lpspi_dt_ids[] = {
 	{ .compatible = "fsl,imx7ulp-spi", .data = &imx7ulp_lpspi_devtype_data,},
 	{ .compatible = "fsl,imx93-spi", .data = &imx93_lpspi_devtype_data,},
+	{ .compatible = "nxp,s32g2-lpspi", .data = &s32g_lpspi_devtype_data,},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, fsl_lpspi_dt_ids);

-- 
2.34.1

