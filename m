Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5800B2D542A
	for <imx@lists.linux.dev>; Wed, 25 Jun 2025 15:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864957; cv=none; b=UOsA2d4TzBTGTXVYBtJEi+lIRPiU62WECOMCLBHZz5qJAIRpHfTrcW70S1FE8DhJopC3xsNtszBl9tDslrCtEJ3moV7QslmkvmE3IwCQ+FcdmOnxDUxn3qEEu+8M20hzJKKz6GHNvX6k29+iJbfXO4oDVZFGGyP8oCxBB6ILVM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864957; c=relaxed/simple;
	bh=yCYdZbO+dpu/mVZGwv9i1PkdqA5piWFDPL5hOs2zx7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qd88JCSdz1ChTSrtJNCI6sxR/+KsnRlJXGRrV7RXu7wBxlbXHLn50/jOCLajzJ4Xz3veauxj2J6N3KgIyks839Bj/HLyby6AJx7C5HH2sg/WdpCSCmcUHyr6XMfmTCUypXsX9uglCv+p9zaHAP0UQIFQPif6cMmkA1A0yFKPuls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eTNPwWvu; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eTNPwWvu"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-60d6303a11eso7468eaf.0
        for <imx@lists.linux.dev>; Wed, 25 Jun 2025 08:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750864953; x=1751469753; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nF0VBzbDTNCK1Xw9av27PYfa00tvOG6PAv4XXmzSQFU=;
        b=eTNPwWvu8bmESyzpI6vef5FZIN1RNKFsiMLGJTscexR/tdwTnqKO7yKNM4CrV5NT+v
         qXW6cjz9SwKVgPbxP0jm2ZFHUlIUAAaso4EL668tiKciNDo+9JeoCx7woZE8ulPDWyoV
         Xq7Aui1hOJWYgTYd8F07C9HrW/ZUANcm09Ng2oCjJAqHKGHHiQhwBlOnMMwtwC2naFwU
         A3vQZTMhFQpm0cyKKfDzc6QMXovieBcB3Dn0GSmbkEPcj1VhzKhSeLw2c1lWIjz+KJVy
         2ErflnpVhDnbO2jdBGbpfFk+MfzX4FPr7Bfxi2GABj5/TWNH6D8U31HfA9hQ7gE4kRNm
         jnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750864953; x=1751469753;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nF0VBzbDTNCK1Xw9av27PYfa00tvOG6PAv4XXmzSQFU=;
        b=wLVol6heNzJ2Bq4KUk+32P6vsdjW1d0bOgFvKPgWbCf3LiNmJlD2paBmU70RI8jusd
         EXMEB7Ft8uuaDkuh99KjuWR+ndfflxAzQ931HJ4HIIJ0ypJtxwRuImQEJQeCAXpsXDXE
         AzzJvE0mUyBcrygjsZLX5/pFaapzHt5s7+dMH6ryGGYeGCLBlDn5doHnqpLUyPh4iCVZ
         YBqA77k3PpuH68euOd4OKuzc7o8Czs+f2mbAYvZ6lXQv27CGwM0AXettHJsMEOqaw1VH
         zksm6CvXmLFu4nbSRjTrsgbJxOOm2Hb7qnCyTdPPsvaNcjBzgbXaJrcyc3QinMsWArCb
         LSQg==
X-Forwarded-Encrypted: i=1; AJvYcCUe5n1rTbJBITdxfAZ7dDra44YRJw3A55ah4pgiYDHqN3/IXKuU4aJ0aySpa76VaNm6sGk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwSuNtzA6+zxsbPoKfTIxpSCVsLJikICky84lTnqmGb/n1QdwOC
	lquX5926P8W/sV5brkPWBv9tOvFQrZgBhRb06HoEdwvCGCV6UV/hOaajxQh1n7mnG6c=
X-Gm-Gg: ASbGncunSALr7gOHrHHpIQp4+O37ruQgX3mLI9cquVh2LPP3LDJW4K79u+1p86Ef0Lz
	zsCQTb23VNiy1YsBKShpLYvAe9gLe99r+hQnU/b53DU2a6XoeGwAVzZ69dnBMh+pdcV+RofmnOp
	f3/eu8bpVe/kqzhbpZrM76IKQHAwypGqQhzudtYpp7rMKHNEP30mnnT+Yhbm9QuGYXfDd2wVR3G
	LreJab6NhwAwxE3CS/QW+WFjx3fk9nP9LA18wdhKSkF5eKGgT9ihaYYoigSLgMYUdIVz+Y+hJ6R
	HwmygTeqW+GPpAxQnSfRft6zn5WhoOTUTXUk+fsNwIR1LtbAloNy2BDJacK/9aFnIG6ilw==
X-Google-Smtp-Source: AGHT+IHuQoqa1u0DUHvl6z0O9mvk8424s2tdSOokLX0655c7GkLUoXhQQnFWEefCze0j3O7DZKz2Sg==
X-Received: by 2002:a05:6820:99a:b0:611:6fc6:e6ee with SMTP id 006d021491bc7-611aa3f4864mr221261eaf.1.1750864953563;
        Wed, 25 Jun 2025 08:22:33 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1fca:a60b:12ab:43a3])
        by smtp.gmail.com with UTF8SMTPSA id 006d021491bc7-6115b7f813dsm1629279eaf.40.2025.06.25.08.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:22:33 -0700 (PDT)
Date: Wed, 25 Jun 2025 10:22:32 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Frank Li <Frank.Li@nxp.com>, Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: imx8mq-mipi-csi2: Fix error code in
 imx8mq_mipi_csi_parse_dt()
Message-ID: <9b6c7925-c9c4-44bd-acd5-1ef0e698eb87@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This was returning IS_ERR() where PTR_ERR() was intended.

Fixes: 642b70d526ab ("media: imx8mq-mipi-csi2: Add support for i.MX8QXP")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 6501843ae72d..3a4645f59a44 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -966,7 +966,7 @@ static int imx8mq_mipi_csi_parse_dt(struct csi_state *state)
 
 		base = devm_platform_ioremap_resource(to_platform_device(dev), 1);
 		if (IS_ERR(base))
-			return dev_err_probe(dev, IS_ERR(base), "Missing CSR register\n");
+			return dev_err_probe(dev, PTR_ERR(base), "Missing CSR register\n");
 
 		state->phy_gpr = devm_regmap_init_mmio(dev, base, &regmap_config);
 		if (IS_ERR(state->phy_gpr))
-- 
2.47.2

