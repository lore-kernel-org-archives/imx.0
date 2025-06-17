Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208352EAB94
	for <imx@lists.linux.dev>; Tue, 17 Jun 2025 19:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750188970; cv=none; b=IoaWJXU6vftdPOJkP6mHVsR5x5WhjjvtRj4u1a1eKYblCeqrZF4lTnBd/oEIKaFjR1pG6Ln7ukEY/SVEO92D54aRozQWr1o+NmWpECeLGpSvylwYL/sBGl7h6jPNbHr+V+k2cKff2dY+XHHV1Frj3kaaWkhXKIOme0RtCUgHGRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750188970; c=relaxed/simple;
	bh=KpSwTl4wyM18BdoPd4qTfDpifdr5k6KgAwhnWNQ3dRQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FUQQUerxpyqfTmxZKjF7xb1/HuVloaxYLmIfyvcouEm4vQvR3Fb+pvbnbNtAyPzxj7S02Qkp1qrq6N3wbHiZl6QUBZ07GOeOdVCHvopniwFh22v4yk4GQfMQngYMtZF0uPRiSG1+5fNvybXgURvH3IoNR8ypQt4glBIcuHa3iVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cV7+vs10; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cV7+vs10"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b26f5f47ba1so5096991a12.1
        for <imx@lists.linux.dev>; Tue, 17 Jun 2025 12:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750188968; x=1750793768; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1scGrWmFNF+u0XSYuCytdGqLKRqsOgk+ZZqdhXd5JD8=;
        b=cV7+vs100/42gMW5r4/Xcd0Q0SVX8lwUYYJqEQqoLYrWTjP6h5HrrTAlEszyWYw2GU
         IABtwmtmVjvke7QjajfOvaeMMz1NUYY6yMoRETZbselx94B/l9KaN06FOf52yMfN+r9q
         XhE2JoI2O9NnXuOphwEg1bZBBxFE0H1CIAJ2+vc/rLaSL+Q1809XSRsbMTlm3LNdWhKY
         j98h1d8kGdAtV6Dep7xHZRzawYoAQN8B2mka5zbYhZnn+ILASFERFJK4U1T9FudpWjTe
         6u1oqFeNPOYvy2E+KZ8KI9gnF9mh8RsxRLK4VOfsOc9NGwXeDR6da1s8JOfFkSnohgKU
         FQsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750188968; x=1750793768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1scGrWmFNF+u0XSYuCytdGqLKRqsOgk+ZZqdhXd5JD8=;
        b=v1//c0wJeotcauvLtlnWgFb9htu/VnG7TSaw61E49AUXClmJJ5bbH0VLKxqyWHq5HF
         5TM1hfYyxMq61X/4z5epuFwu9bdMMOwJtzxMG2U6XPf81dqiau4Z8qHQ1WCVva8K5/3Q
         52BBJA03F5ob5JGJ7R/68NbAmHoPV6UqCZ+wF3U79bMq9JaLU02HnK8YmOIBNFyEdrZ6
         nVBSPXQnTG5MqpPMPVQIg6CXGkJUr6FoyngtH2gEdJrdKklcJH23FY/DHqGuLHzdJZ34
         fitRmwOrLsDPs6MgAntTC8CNmCX7QC3Des66i3FpUD6PvtqC26Egjz9O/HvRaE1ivW7C
         nncg==
X-Forwarded-Encrypted: i=1; AJvYcCVUwL+6oa121q00pR44vmLwp1Wn7Z6okxsN1+bERbPosWFxkU0E0kTqI7qs2yAe+jPWHY0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzpg1Bsn+iNCpLNrfUkmwY17aTNsVkFCDHhfKufeXrMz/PUzE09
	y/7bShdU+7S4B0TGZCXPoVzfhrGNStb4m+ZldZmOFmMJC6ARzCM0GvT7
X-Gm-Gg: ASbGncsv5ICM0u9p+E9zIbnwMAcZfH0XRaJtkw0V1EEnYLggLLdM8SR8mRy7We6U9CT
	7Oahh5MvFE+xUnF1jbZ6Jtuc+MSv5QciQhJm+ozQQX7b55Z3Vks1Xlgt9LP9Ep0Dn2wAc1jzqT6
	dhOujZ0PfeobPb3LE/lZ4hWnKhZ1QrhDW4lGOIf1AtnlYbatFhHhkHKzbYKXIs3VyvDp8SoqOcS
	BXUvMpI6sohMXOlAmUzPtFsPG1kYDr3xDWiE4Ds6lRzVK/cMwCzVg3Kzr/K9ZOZgbVfEeA60jyd
	mcMHu8YmA+IK815pzuQafOI3YBnqsedk8bZAh4cREM4mFc6UshUccXepKN6U+EXl7caxqAqlkcc
	jN0Vl+7PS
X-Google-Smtp-Source: AGHT+IF/rndT3pqVzap/b+BUcpqjMIETJYig28EKMkQ28U1cw4wJ+jDydO+2ebPcgPtnZZvK5fdPAg==
X-Received: by 2002:a05:6a20:2591:b0:1f5:769a:a4be with SMTP id adf61e73a8af0-21fbd59fb65mr24359112637.36.1750188968258;
        Tue, 17 Jun 2025 12:36:08 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7340sm9648582b3a.179.2025.06.17.12.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 12:36:07 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>,
	daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v5 2/3] remoteproc: imx_rproc: skip clock enable when M-core is managed by the SCU
Date: Tue, 17 Jun 2025 16:34:49 -0300
Message-Id: <20250617193450.183889-3-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250617193450.183889-1-hiagofranco@gmail.com>
References: <20250617193450.183889-1-hiagofranco@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hiago De Franco <hiago.franco@toradex.com>

For the i.MX8X and i.MX8 family SoCs, when the M-core is powered up
by the bootloader, M-core and Linux are in same SCFW (System Controller
Firmware) partition, so linux has permission to control M-core.

But when M-core is started, the SCFW will automatically enable the clock
and configure the rate, and any users that want to enable the clock will
get error 'LOCKED' from SCFW. So current imx_rproc.c probe function
fails because clk_prepare_enable also fails. With that, the M-core power
domain is powered off when it is still running, causing a SCU (System
Controller Unit) fault reset, and the system restarts.

To address the issue, ignore handling the clk for i.MX8X and i.MX8 M-core,
because SCFW will automatically enable and configure the clock.

Suggested-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
v4 -> v5:
 - Unchanged.
v3 -> v4:
 - Unchanged.
v2 -> v3:
 - Unchanged.
v1 -> v2:
 - Commit description updated, as suggested. Fixed Peng Fan email.
---
 drivers/remoteproc/imx_rproc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 74299af1d7f1..627e57a88db2 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1029,8 +1029,8 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
 	struct device *dev = priv->dev;
 	int ret;
 
-	/* Remote core is not under control of Linux */
-	if (dcfg->method == IMX_RPROC_NONE)
+	/* Remote core is not under control of Linux or it is managed by SCU API */
+	if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API)
 		return 0;
 
 	priv->clk = devm_clk_get(dev, NULL);
-- 
2.39.5

