Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE5A4582D8
	for <imx@lists.linux.dev>; Sat, 12 Sep 2026 19:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789240353; cv=none; b=tnwoZ7MWp5RH3QSsjN4EW4mgoK9dWrqqakjEHtjPXnTbRcxAFBbymESPk3X+09SXExo29yRv7XB6SC7OLkCAj/wglwGPB5eD1XsU3FEZ1ofj33VtX4m6spA2U+oKb3jkMpTOfBrkyq+5FkRkMt3aAVb3eEcyGZESimvTJSdNSUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789240353; c=relaxed/simple;
	bh=HR71RBZu/09n4yHrzzixKqkYtfz1HyNns5gTwWCUaXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ft+VB+22U/z8mL3lJLhvgKcXbKrTVNxRaXCNbh5Eur3ivHFePFfXAA1xVU+vHzhyUb9EHSzJXPPHEswUo0fmOi2HVoW/LDa473pPAXnkuIACelgITLJUIq6+/bS3jNh4Sj+51Bv0SiXBVecIE/P2h4Y8NUFwzbiC9VZRorzY8ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G8QSYCEU; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8QSYCEU"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccc02279so796857a91.1
        for <imx@lists.linux.dev>; Sat, 12 Sep 2026 12:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789240352; x=1789845152; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UabZ98vj5EdaCQmaHDWkq9sH/9g2g8pmLq50Cl5sxiU=;
        b=G8QSYCEUfjussXdEuWVyUud/YTL3u8Nj6tA+tf5y88A8KRMyLs50+ZkgWxvzEq3Mjt
         QN35GXroPbu39Zfq/I8RR4Bfykclj/nhXaxj3er32eFi60cIPd+GKaNUFtArKk97a86z
         l4nnxcuEz/h152y8+o8EjEUiV96vYT8giPnnS3thgvfgGebXCp29Sho8fJiJBXz+Th8k
         4wlIxYr3BDZieX11Cs04y7F8r1+ZNDGcTDI2sBpONGTwWP0chdwDVKtvhWFBsNfnmGOP
         ni5pEYCOwxTU4stRgMrWdOs/Cce1DKKCBgTXPQ6e8jA7Dxn/kYmcI3oxZkEZJ3+hpk2I
         IVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789240352; x=1789845152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UabZ98vj5EdaCQmaHDWkq9sH/9g2g8pmLq50Cl5sxiU=;
        b=CJGw7UDJzXKzicTSYUDJLRvVMcUKNwqm4R7VxM4NlG4d6j+9eJmfPmBNYQ7sx9toDW
         i7YoP9XrhAOrDr/fHfQOL8p8p/if/haT5QcjyImopAFVmHZWIBk4nugCt914OVNY1AX8
         1Wju47NQoGGYh/M5NkIIrIMFVWg6uHyTsX1ZBhdFOJFFIZ/iMmU36PnNSCA/aVoOk20X
         sbvV4LOquyEgj1PjUOxQk+cXSv9PxJ97gChRVWU3o0pA9TbEeGmk8pjYL0U/dvl/ccKt
         JQ6lr2sSKPkDY4Jggebu+oMecokpYvUVxhSEE3EiHsaW4eHPI/bTGYvUJ7/mL6w0ebds
         7kjA==
X-Forwarded-Encrypted: i=1; AKwUvByH5OOPiLx8x6pppVWVZbfl7Ad6pJuCy8PKEwtuchc3prmAasbJvVX0MxMkoE+0c+Grjkk=@lists.linux.dev
X-Gm-Message-State: AFuF++nv94N+Tn/el7pp0RmdW3YMHH/g8AVWb/EG71SAmgD6QJ/pQDXb
	eNmjps9U9wx6mdJv51cU7raLcTCT83JZCS5MLRD+iEhYsNvLVdtZ6dqA
X-Gm-Gg: AYBFou2OrYQiuw+fr413y9LTayeu1qAGFMQ8sm+pIjWuYsDuPtqIGIzpCvalSIlnMjo
	Ttpd1vBoeEOadTdtmo3RLV8R1Dz0L4xJYjXx+DmkUIgKS1HWnaKVoyXtVX8nh+t+kdiTl86aIq3
	Nt66RVUA5Xm7I6Xh+XIKd2oCzJm4wUD8LhbcMPYcgerAo4YOR9OQIVcSgj7CDDyooKNIT8FJPEh
	enZD4qY97lQ3s7jH2i0Hcgyl4bdKAgChMzxNQkVkGIpl2DYCSPuRiuYPxlUnNlQK8zLJOCkq+5S
	vpQ9VHQ98DrZG6UzaoZ4N+eVBNBFCLfWC7zZYLWlxatUYa2OY+XEUWVj23BH56YK+BTOWRekVSI
	oFWsWoPvlqa/evBlV7VCviJrv4SNjTNjEULg57JsABNSLdJEiUWROIUmYK++JcGq7CcdSDPxVC7
	g4HMEAW0aYXsbYtdoHTRA+1sFCMfS8DtJ5glGoyFRlCf1hToLFyqh3YPc5dPX/Klu6KkWA
X-Received: by 2002:a17:90b:28d0:b0:398:9bd4:d18 with SMTP id 98e67ed59e1d1-39d9c3f2ba7mr19386123a91.23.1789240351619;
        Sat, 12 Sep 2026 12:12:31 -0700 (PDT)
Received: from gmail.com ([58.84.61.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b348cbsm14722239c88.3.2026.09.12.12.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 12:12:31 -0700 (PDT)
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
To: rafael@kernel.org,
	krzk@kernel.org,
	amit.kachhap@gmail.com,
	daniel.lezcano@kernel.org,
	thara.gopinath@gmail.com,
	talel@amazon.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	mmayer@broadcom.com,
	viresh.kumar@linaro.org,
	sumitg@nvidia.com,
	peter.griffin@linaro.org,
	myungjoo.ham@samsung.com,
	kyungmin.park@samsung.com,
	cw00.choi@samsung.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sven@kernel.org,
	j@jannau.net,
	marcan@marcan.st,
	casey.connolly@linaro.org,
	sre@kernel.org,
	wens@kernel.org,
	t.schramm@manjaro.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-samsung-soc@vger.kernel.org,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sumeet4linux@gmail.com
Subject: [PATCH v2 1/5] power: Use %pe to print error pointers symbolically
Date: Sun, 13 Sep 2026 00:41:51 +0530
Message-ID: <20260912191156.185448-2-sumeet4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260912191156.185448-1-sumeet4linux@gmail.com>
References: <20260912191156.185448-1-sumeet4linux@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace PTR_ERR() and %ld/%li with %pe and pass the original pointer
directly to dev_info(), dev_Warn and dev_dbg(). The %pe format specifier
prints a symbolic error name (e.g. -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME
is enabled, otherwise it falls back gracefully and prints the raw integer
value. This makes messages more readable without any functional change.

Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
---
 drivers/power/reset/macsmc-reboot.c        | 4 ++--
 drivers/power/supply/cpcap-charger.c       | 4 ++--
 drivers/power/supply/intel_dc_ti_battery.c | 2 +-
 drivers/power/supply/qcom_smbx.c           | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/power/reset/macsmc-reboot.c b/drivers/power/reset/macsmc-reboot.c
index 9fc36fa68676..7b8460a55e9d 100644
--- a/drivers/power/reset/macsmc-reboot.c
+++ b/drivers/power/reset/macsmc-reboot.c
@@ -221,8 +221,8 @@ static int macsmc_reboot_probe(struct platform_device *pdev)
 		if (IS_ERR(cell)) {
 			if (PTR_ERR(cell) == -EPROBE_DEFER)
 				return -EPROBE_DEFER;
-			dev_warn(&pdev->dev, "Missing NVMEM cell %s (%ld)\n",
-				 nvmem_names[i], PTR_ERR(cell));
+			dev_warn(&pdev->dev, "Missing NVMEM cell %s (%pe)\n",
+				 nvmem_names[i], cell);
 			/* Non fatal, we'll deal with it */
 			cell = NULL;
 		}
diff --git a/drivers/power/supply/cpcap-charger.c b/drivers/power/supply/cpcap-charger.c
index 34a57dd5c3cf..d423a8bdc0c2 100644
--- a/drivers/power/supply/cpcap-charger.c
+++ b/drivers/power/supply/cpcap-charger.c
@@ -808,8 +808,8 @@ static void cpcap_charger_init_optional_gpios(struct cpcap_charger_ddata *ddata)
 		ddata->gpio[i] = devm_gpiod_get_index(ddata->dev, "mode",
 						      i, GPIOD_OUT_HIGH);
 		if (IS_ERR(ddata->gpio[i])) {
-			dev_info(ddata->dev, "no mode change GPIO%i: %li\n",
-				 i, PTR_ERR(ddata->gpio[i]));
+			dev_info(ddata->dev, "no mode change GPIO%i: %pe\n",
+				 i, ddata->gpio[i]);
 			ddata->gpio[i] = NULL;
 		}
 	}
diff --git a/drivers/power/supply/intel_dc_ti_battery.c b/drivers/power/supply/intel_dc_ti_battery.c
index cb6fa8d88b43..5819df23a543 100644
--- a/drivers/power/supply/intel_dc_ti_battery.c
+++ b/drivers/power/supply/intel_dc_ti_battery.c
@@ -349,7 +349,7 @@ static int dc_ti_battery_probe(struct platform_device *pdev)
 
 	chip->vbat_channel = devm_iio_channel_get(dev, "VBAT");
 	if (IS_ERR(chip->vbat_channel)) {
-		dev_dbg(dev, "devm_iio_channel_get() ret %ld\n", PTR_ERR(chip->vbat_channel));
+		dev_dbg(dev, "devm_iio_channel_get() ret %pe\n", chip->vbat_channel);
 		return dev_err_probe(dev, -EPROBE_DEFER, "Waiting for VBAT IIO channel\n");
 	}
 
diff --git a/drivers/power/supply/qcom_smbx.c b/drivers/power/supply/qcom_smbx.c
index 67fdb4335338..c8e242341d04 100644
--- a/drivers/power/supply/qcom_smbx.c
+++ b/drivers/power/supply/qcom_smbx.c
@@ -613,7 +613,7 @@ static int smb_get_iio_chan(struct smb_chip *chip, struct iio_channel *chan,
 	}
 
 	if (IS_ERR(chan)) {
-		dev_err(chip->dev, "Failed to chan, err = %li", PTR_ERR(chan));
+		dev_err(chip->dev, "Failed to chan, err = %pe", chan);
 		return PTR_ERR(chan);
 	}
 
-- 
2.43.0

