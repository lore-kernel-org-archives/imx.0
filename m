Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BBA2D1F45
	for <imx@lists.linux.dev>; Thu, 12 Jun 2025 18:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749754276; cv=none; b=SZYKuvTh+LUwzrbqSo9/8NdItGJVURIicWJY30J0YIZpJrZGHoGiwNDaA35hXT30GcmjpioFY1Zzf+XHQhjcM3vLAox47ddMu4i3gfMK9ui0x2A1ic4Xr5tW2oqLvkMFl23YNRX31RoxaP6gzGEtdTHoEqkuf9rzebijdjcCtc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749754276; c=relaxed/simple;
	bh=IWlKY+BMG19gHf6CAGx0zr0/tTNrF1H4xaMS/LlJU2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SiT67J8GrLq/VjZoyeNjmjH2HcOk9K3RVjtNG7QDTMevX7hRcUIX3TJkVKPGQBxZHUZOqKnfPOG3Ay44H06RNod33eoH+TtlA/TrGmoQOnydyp/kK9+slBFKv8RKDChUdGuGrrEw5wvW5zOVR6l6FE76kZFgRLMfZdpcgwkZQw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t0XSzPyk; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t0XSzPyk"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso871890f8f.2
        for <imx@lists.linux.dev>; Thu, 12 Jun 2025 11:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749754273; x=1750359073; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RttzpPmx4+I2vFDRVVqMPeYipRESqQyZkl6IDrQJbiw=;
        b=t0XSzPykmZF4GK7wpGZ48uGsSlE8GSFW+QffFaE+7ySWDuYEpVVlIOuoCr1ke3LBDV
         N5M9OxFtTgSW+7C50uox6w5VzMVc39AsP/1SO1Aa86KZLj1r5T9bbdwca829gdAl9a1V
         AZJwHvJyf7/sc/Ey5K/F3dpPMeEBx/SgdaZWl8zGRrnDpFkyXVMAujyfABpgOIV1w/WA
         7GUKElniOwe9Txbl8Kodbuk9pCkeptwu0ZQMmHkSZmcD5PxDjr5fpwxg4rfYlV5BcUcO
         Klsf3oAU7wyufQ3aNFwh0tb2nP2PCmv0mnHzWwQ/fMmjQNZDmLVInE4K2RpTo9nqphjo
         CgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749754273; x=1750359073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RttzpPmx4+I2vFDRVVqMPeYipRESqQyZkl6IDrQJbiw=;
        b=ASMLqxAPPXfCB2GC9iNbAqmguoi7n9QfvercZcANoYqwICkKZQIHRJJ69rZ6+B5KOk
         XJuaKONo7DSVfhF3uMmAOr+yVqeiLkZDsjxW4+I2SqDy+dBjNSr28GNsMBXoVosr6bKp
         2s4d6qoQhYnGh65xEsxen9WoEsIs84wgc467l0Rofm6lXxhg6qGgbSPLixrxUOh5xZA/
         ub8twAxMwUMjf0llQnNMFoHZ3M2LyH7Y9AUTh+LfFskuoZVE1mnwJJEUB/YG9EnUQJvw
         2jcjhKxeK60gdXfeeemdFizPPviAKPgpJT5ykPs+XSfY+MjDoS9Cp42q2RVa3UDbZGAw
         UhSg==
X-Forwarded-Encrypted: i=1; AJvYcCVorQlOjpQwoHHNuSVDPcOCAPkomrd9kaKDuz38j1yubtCfsiWYULPHym4rQJpOQOABdIQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxLyPl3Jf+IsmAPrJDQzN6Rv75DJdIR0w13LV/hiXVMW0uQgNnn
	PzwwWA1upLeOZAVKA7ZRh2z88pkEqeMSwKToPPqi1S9EMvXPaPpVVkXlbKaOZuwZvUI=
X-Gm-Gg: ASbGncvhMEA/knyBWNg8fzC/q4ik90TZJ8Eh/36TVB/taJBwCXwHBjvz6TcvgI0Fixd
	XrFeeQTuC/zt/qDP8xQPtw/TlqkevvfhqbtXOp2fCA7U2oFPpRekMzcSBOPUox1LG9TrlQm8dl+
	0cC9tb30Kcq/5xb6jhe0ScrNgLNSHy0Heh4igB60HXokKJE12i25aaSp9q482TplGwvJ2gzdodw
	s9ongh84F3nPQ6x4SM/rhlsIEnZT5WlSQnOC4VQdbJTA1wnSk0npHVcdVOrJQT3cYwA/IR6PTYp
	tzY58iE7PZoqLbtY/CNQNSJ9Cn/nBeUaSqOowFIexApxj3ZCFIm2R9x2/yf76e3XSVc=
X-Google-Smtp-Source: AGHT+IF8J8y/ngnpoyOUShRv9/aJkdzYRnZ60F/4jSk31esEVM/l95MI9oTPjOP8gHOhRdPMBTj3gA==
X-Received: by 2002:a5d:5f91:0:b0:3a5:5270:a52c with SMTP id ffacd0b85a97d-3a5684cc429mr399383f8f.0.1749754273164;
        Thu, 12 Jun 2025 11:51:13 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568a7f8f9sm113600f8f.42.2025.06.12.11.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 11:51:12 -0700 (PDT)
Date: Thu, 12 Jun 2025 21:51:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peter Chen <peter.chen@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, s32@nxp.com,
	linaro-s32@linaro.org, Larisa Grigore <larisa.grigore@nxp.com>,
	Ionut Vicovan <Ionut.Vicovan@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: [PATCH 3/3 v2] usb: chipidea: s32g: Add usb support for s32g3
Message-ID: <957b91eb2270113a857474ddaa29c99198ed95ab.1749747898.git.dan.carpenter@linaro.org>
References: <cover.1749747898.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1749747898.git.dan.carpenter@linaro.org>

From: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>

Enable USB driver for the s32g3 USB device.

Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Changes since v1:
* Drop the changes to ci_hdrc_imx.c since that part is compatible with
  the s32g2 chip.
* Use the .power_lost_check() callback.

 drivers/usb/chipidea/usbmisc_imx.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 67ff073ad806..d5389156e157 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -673,6 +673,11 @@ static int usbmisc_s32g2_init(struct imx_usbmisc_data *data)
 	return usbmisc_s32g_init(data, S32G_UCMALLBE);
 }
 
+static int usbmisc_s32g3_init(struct imx_usbmisc_data *data)
+{
+	return usbmisc_s32g_init(data, 0);
+}
+
 static int usbmisc_imx7d_set_wakeup
 	(struct imx_usbmisc_data *data, bool enabled)
 {
@@ -1201,6 +1206,12 @@ static const struct usbmisc_ops s32g2_usbmisc_ops = {
 	.power_lost_check = usbmisc_s32g_power_lost_check,
 };
 
+static const struct usbmisc_ops s32g3_usbmisc_ops = {
+	.init = usbmisc_s32g3_init,
+	.set_wakeup = usbmisc_s32g_set_wakeup,
+	.power_lost_check = usbmisc_s32g_power_lost_check,
+};
+
 static inline bool is_imx53_usbmisc(struct imx_usbmisc_data *data)
 {
 	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
@@ -1430,6 +1441,10 @@ static const struct of_device_id usbmisc_imx_dt_ids[] = {
 		.compatible = "nxp,s32g2-usbmisc",
 		.data = &s32g2_usbmisc_ops,
 	},
+	{
+		.compatible = "nxp,s32g3-usbmisc",
+		.data = &s32g3_usbmisc_ops,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
-- 
2.47.2

