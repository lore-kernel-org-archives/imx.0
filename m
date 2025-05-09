Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5121328FFEC
	for <imx@lists.linux.dev>; Fri,  9 May 2025 11:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746788826; cv=none; b=Raf0wtFHi7kOURGMJG205PfXOgb38tpp2gJoW8sP3/3+pLwZPzUddpKRROA9vYQ8DhNfRSwQCg/wjJS+l6sx1aTkgGaj5kqogfQ2gyc+Jssc+x7TT3rxeGh09PvGxXaVZd4oOtpvOjrrCqhB5HprHvX+U87KhNF3IwOscldrH0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746788826; c=relaxed/simple;
	bh=D+fL2YJhn78smRy/FVA67pJck8oxKruZt+xjNMzmkhE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fu1GH9P1V45U0dR3jOX5VEPxjKhoAdth47XcIPM/wUWeS95vxmikhTUmZwuEbjS4kfmtmsC3VLN224gL09NCx3PnR6Rq/Ul1KbJyEQGWIijQ76eqkHW9Vz+IVmWMTGokvSPNGcRHvMiQWdB+6JcJDblHdxDu4VQ3tLUyumob8Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TE2FRZU0; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TE2FRZU0"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a0b6aa08e5so1820270f8f.1
        for <imx@lists.linux.dev>; Fri, 09 May 2025 04:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746788821; x=1747393621; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=82buFIB+rtX6lyncKzfqQ1BjFEonYyuZcyA3lmRU5C8=;
        b=TE2FRZU01QKb7qRproFKyWW47xJrdVwPSDJBLAQUyi2PJ8kxsuxuqyUgTzi6nni/dw
         RcEIgS90HKigVy4BrdC1wHJ44PNbDNESD8v/MLwJHKYk2NpRDOGv6gaJrNYxITEx1dS6
         7G2tpB3neaSUMEzm2cKqZPPauXGyH/0uxwNt+FoOOygUR4rRCeII/s9h6bJTKLPTSxJ5
         9uBuFQSNlwIHFEk5E+wJufzsmtL8oET4W3zcEOqmDmf0PB4iMajNxmitrvbNJP3jQxix
         +xIJxs1G7OwTMhIAsFw0/J36UrpX8vTaszP5BW8FQm5G21SfDKU7WDMzSF08GXAxcClO
         sgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788821; x=1747393621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=82buFIB+rtX6lyncKzfqQ1BjFEonYyuZcyA3lmRU5C8=;
        b=h8bAkdjPQFFfVLiGxhwrPWgiVwSDHia14bt18MLtpsE5XDvuzsWgK+fFfBKQsEEPCI
         mkuesV/3fE2+t1+saNe1PsQdNVV+JcBjFwoOqgACj/fxu8XXC37ImrfP+Q+yBDnYG7xs
         rchkh+KpXW8MV6RYoFkr5lxhUNPcA0U1a0lkKFHdVNiYwDWkyRiugHqxaWnKw8UEiE08
         S+Vd9MypMEemcHG5ItId5drPtC6P2ehDmn+IbeCVXbRMPmYAN97zHMpvt0JoWeltuGvx
         9R0YHxA5PkUgdJSVtuCeoQC2emV6ZwojsZ3wzHiHFuyKJfyAa2gV3lILl+ZLeGCF5QIF
         OQ2g==
X-Forwarded-Encrypted: i=1; AJvYcCVsWQmAQzbjFMlwKEDbZ5bKQXQPuYB59pGbNU2C9H0NI1SjPGAWEq534Odh0S3uIRV7ED8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwGimNCz4mrNBjGmep7CiS6aKbM+wAys4F4cb53XHxnefQYK4jb
	fTjIjEuH+rU54vRlITchoUsAeuaOkFH8R2dw1MYYys6S+OnLHrDzZE139VLR/z8=
X-Gm-Gg: ASbGncs2UlELq696Wn/90uGvKjSD6kGnQFHNGil0w605Fa3tZxnAAwXdPtqj7Qfyj93
	in6Q0t8kDQP+/PIdDXkwVsPJkDtQDY22aPo79SlNi2luPYIYw9uNd8DQfgn8Zn8Lz/tdUfxlVjJ
	xTFkbcjUX1+Se4if8wLFNJJkG8uaoI7uYwqC3idBwpay8nzrTsRL6D1xcq6vhExaZYMVQWIRIk3
	9JGkZ6b2DRbMv4mpCJrsBfwwbKxjBrsRKI4pJ0p4ST8oeOcxwew+uLJLg0KtiQabJJzJSLDDC6e
	YtuGneaxcKaqh3HtFJAs4RohBOGuicZd5cpC3EqCy7TwwGw=
X-Google-Smtp-Source: AGHT+IEE94+EF9/8yZCVzM9YnUpAQNsIoaIC6oYQfj4cjZjT31gCTBuncCPpzbHVyG2nFW+mquupKA==
X-Received: by 2002:a05:6000:220c:b0:3a1:f5d7:b041 with SMTP id ffacd0b85a97d-3a1f5d7b0d7mr3035935f8f.25.1746788821614;
        Fri, 09 May 2025 04:07:01 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecadfsm2914797f8f.22.2025.05.09.04.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:07:01 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 09 May 2025 12:05:52 +0100
Subject: [PATCH 05/14] spi: spi-fsl-dspi: Use spi_alloc_target for target
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-james-nxp-spi-v1-5-32bfcd2fea11@linaro.org>
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
 linux-arm-kernel@lists.infradead.org, Marius Trifu <marius.trifu@nxp.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

From: Marius Trifu <marius.trifu@nxp.com>

spi_alloc_target should be used for target devices. This also sets
ctlr->target automatically so delete that line.

Signed-off-by: Marius Trifu <marius.trifu@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index df6f85122bfe..f7f9425a19e1 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -1340,7 +1340,10 @@ static int dspi_probe(struct platform_device *pdev)
 	if (!dspi)
 		return -ENOMEM;
 
-	ctlr = spi_alloc_host(&pdev->dev, 0);
+	if (of_property_read_bool(np, "spi-slave"))
+		ctlr = spi_alloc_target(&pdev->dev, 0);
+	else
+		ctlr = spi_alloc_host(&pdev->dev, 0);
 	if (!ctlr)
 		return -ENOMEM;
 
@@ -1379,9 +1382,6 @@ static int dspi_probe(struct platform_device *pdev)
 		of_property_read_u32(np, "bus-num", &bus_num);
 		ctlr->bus_num = bus_num;
 
-		if (of_property_read_bool(np, "spi-slave"))
-			ctlr->target = true;
-
 		dspi->devtype_data = of_device_get_match_data(&pdev->dev);
 		if (!dspi->devtype_data) {
 			dev_err(&pdev->dev, "can't get devtype_data\n");

-- 
2.34.1

