Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC44A253B52
	for <imx@lists.linux.dev>; Thu, 14 Aug 2025 16:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755187636; cv=none; b=OEiG6K3uNzKO4CvdEdCZy+ZArXcLZog05O4IUq8jBulXDT9vfArUkWKM/T/kdUYndqKAyw4Z8tacppc3UzyDcgOStagoRf4zfZ4p7QvNbW/sE7hDR1v20evCig8LbP5PVMzB+/cR5h+dZCqq6unKs9qDmGFs24pwjnviZWoY/Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755187636; c=relaxed/simple;
	bh=SFon36ABMtRsmD5ilgjDyUKNSBjeuJpo2bI25Qgo1Ko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b7vQwVohM9WtDV7688oM1PeGDppxNo+C2Wr+i9668AWdXPKuMxDdpiEObjSw8+tQTs3WQR5XoTIwOvFxUuZl9DVGBXRjY7GXiDvcCQksM/Vck5GgUuIM+Bhw4DQFibcI7WZW8FmzG/3b0xYwASUmA/s3ru/PRGXxG+23GVtCc4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZxgFV1nx; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZxgFV1nx"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45a1b0b6ac4so5506935e9.2
        for <imx@lists.linux.dev>; Thu, 14 Aug 2025 09:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755187633; x=1755792433; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VfumknsBYh2IzrO2lYrQcKgYbnTHwmFJ/9yneF90CH0=;
        b=ZxgFV1nxOVDdAartwNpg1EPkojBRfE/8U6udh6PT4CUItH3lJVDo4tlhAXNU/1A689
         yigSOnelxfl4tP0QyFrINEWiiLtu0Wts7r38Wp2alveOnKLavlB7g51CDKQ5bNA6Xkjj
         ndNepCc3hz3z60ghvmSa6CKSymO7if649djZcnT2k2dj3XPz5/7GqjWodnXC1DO2whzD
         fJmK4PUrBBN7jvu3R3uN1oYcjzJrXa3eJsqOJ/8bKfu7gkhveddzJld1B5oI3/wSoayO
         v80EilI1+kZosZCtNqpnf3pOdczr2fZfrkxcn6+8Fby/xAb1Qj+/vl1gnnm6aiO1GILE
         A+IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755187633; x=1755792433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VfumknsBYh2IzrO2lYrQcKgYbnTHwmFJ/9yneF90CH0=;
        b=ucnScrkgA+2GYmxbqV+6cjLXCKjIuGEm9yTIr8zq8YE0GXxnNBtcePhKeAGG9kVnk6
         dALG1txAZbEN1CCwkTUYgZlL2Y6Z+y6IjyHbbZr8Yw9ay1C3/9uQAX2f/7JKxwU2ZtaP
         xNh/iRTzmzQVtudzZpAX9X4N8WKq5BAnpsiolsNrkgeBubkqvPh/F4oLjjDxxyU3LEMT
         zgFX4B5XeOwxyiuajpGbEgLLm94bGJDqAvvWfoYHLAls5y389g4AAx9pO0EOf/de7jnb
         d23FGZftwQNEJ/UsdDpbJ3Q4iLg2Aj6zlL04rb2EPn2fH7OhIeagkTopImXB1yu6BOGu
         MXsw==
X-Forwarded-Encrypted: i=1; AJvYcCX4Liz1OJ/cNJdLXZ1EZpSS2mRr/Nv6r0PMOcN08FRLwkvkbuN/MSH74UBR1sIMJ9ad8hQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzsveOJ1w5SvIAV5eu/BedHDPh1JZxvQNjJXVuPjf6YCOxaVSeO
	ko/uGzmpibcTTeQVc9Y+M06Zc6uXyrEIbDY+WvnlIgnySUnUT/dGux2+nkCg7wKLCVM=
X-Gm-Gg: ASbGncuNCZxkL3O3J3VqmYZYb6a5eweS450ZwhoMgGZyl5CUDnNCbL6mlvz+S8XsePm
	HifncMZnRhKgDhAjF3uZdvlZIfdrgYIWkPUB3DXla/kCFTdTkqpWPcfDcO55J1rtDdUPhwpkngw
	wIjx7wwNcc6gQk7AJktHTqnEcjh7u735+/cbNVVglqRseExG+wg9EuoCQmelmu+zLzh0oDTgyGP
	j3kpYvJKeyAjSp9D3EIaN3Ddk9JpTXILoWrQ9pSE653q6cnqEpo+JRPtMXH0kkwrY4P3D1sSMjx
	Ly3eNGrkmrY/TzW8xr/ikp7bcwwU3ZwxoozgrCTqjOoHPKHocglwcQ9lUeLDftumdGeAh4FEuu1
	P1r4SgStX+PlveZQziKnPQeXfEvW2LUQoNUS9bzrqgQ==
X-Google-Smtp-Source: AGHT+IGmcHiTNvo2snzvvx3pgNCl27xtRPoj1Whp77k0Jwwx8FV68OpPTATGMjohvUNhCC5M4Zx3aA==
X-Received: by 2002:a05:6000:24c2:b0:3b7:974d:537b with SMTP id ffacd0b85a97d-3b9fc3597c2mr3324954f8f.35.1755187633092;
        Thu, 14 Aug 2025 09:07:13 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6bd172sm28363495e9.6.2025.08.14.09.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 09:07:12 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 Aug 2025 17:06:50 +0100
Subject: [PATCH 10/13] spi: spi-fsl-lpspi: Add compatible for S32G
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-james-nxp-lpspi-v1-10-9586d7815d14@linaro.org>
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

S32G doesn't have the max prescale erratum and it can query the max
number of CS from hardware, so add those settings.

Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-lpspi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/spi/spi-fsl-lpspi.c b/drivers/spi/spi-fsl-lpspi.c
index 6d0138b27785..a4727ca37d90 100644
--- a/drivers/spi/spi-fsl-lpspi.c
+++ b/drivers/spi/spi-fsl-lpspi.c
@@ -159,9 +159,15 @@ static const struct fsl_lpspi_devtype_data imx7ulp_lpspi_devtype_data = {
 	.query_hw_for_num_cs = false,
 };
 
+static struct fsl_lpspi_devtype_data s32g_lpspi_devtype_data = {
+	.prescale_err = false,
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

