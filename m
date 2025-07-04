Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F47382C60
	for <imx@lists.linux.dev>; Fri,  4 Jul 2025 01:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751592044; cv=none; b=Z7ksPGINhPl+RnM5TB6bd7vHnVKm7BwCURiG8+ANispQXBXon7mobyr11mNiy5wBfExsrLTw0mDcRMOM5BdbSwhDABVdgmmy1yhR4GxFi376G+jOkK8ZOkhCKSchq1wmHUkS4DOYTINBf8P9tv8aDjUavcd9aXPkTVvuIGQYr70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751592044; c=relaxed/simple;
	bh=SvgUT28YQtbYTyXeSDYnGb4dD2amcrqqud8uqK2y2Ec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E576bGXtCTgATljSL8GS57dIWA0ogVVFU6Hcih9f1g+hU+8t2jG0wc3PVeY+5IuDoX7XcAenJuVxH3KfQdPB+il7x2fkP6alMks3Kjzi1oPe9Sfbnun9fFISexN28I37sOkYKMQKOzIz75slcRXsYLR5ZjQV/BZUmWYEWVNvPKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YwMXUSRR; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YwMXUSRR"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-735a6d7c5b1so349871a34.2
        for <imx@lists.linux.dev>; Thu, 03 Jul 2025 18:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751592041; x=1752196841; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5zByC6Bd1xD5NQdxKZlsMbHMCFrJLh3d5i7fkNR6uL0=;
        b=YwMXUSRRC0rBH7HxEVW0sr5exXovb/X/NV56GAJgU9gcEcF9eLhAnTsS7JuJfnkeW6
         549lMAYyXV3HYAd12UtTf0HTOF/A6iWzdcDe62OBvSlKn+ZeE8khzW+ltD0WMDrMZNju
         /ELDTHUDK+TbgLKn4+2/fKyXsj6R1RNP9U8Fi2QMKfThSzMQpuLPAi8UDt8c3cogyixN
         wJIarG+jUjJrKM99UEZraUmgMYGqta1vquMqtTmH9SeX9W78NdUf3tv/5LHsYTm+rp1i
         jhnSO8+0HWzqadbGm7A6DPE7pih3YBxjQclzm3NO7ItBMpFWEXlVkarjhz4kywlPT3L7
         LDoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751592041; x=1752196841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zByC6Bd1xD5NQdxKZlsMbHMCFrJLh3d5i7fkNR6uL0=;
        b=f9kkiZu/a0NAmfnvlaPlpK+txeXpxRpYs1h+riyJ0UbrjpJ5t/mf+SM8yztPPVuL/J
         IoDiYgqP7fkwZO3o3TevAORa9eJ3MyhKoKuIY7BVpWSdRbri+AGyVv9ulRTgop+2fKfY
         uTGR/drzcC6QRAfCS8KU/YEKsJGPZjrghlwHB9nxOQQ6HASsG77IoXudI1Mk0QSF5kIj
         OfxkWDsVkpnyMVvuy87uKPYuZQySmjbAh+cIXlmO5sb/F8UfxP6P06eccOwbwM1K3U5b
         DxBfUrMXl+d/y9pcffvN5qSR5qIGV0g44lzG4xVdcsu74ifkTml1jYtCzOv/HNwLCt1j
         GD4g==
X-Forwarded-Encrypted: i=1; AJvYcCW5/+FOZG2pvzc4vuVsjDevjGZtGK0MQk2TS0b9cBzYCfUgWBLMLLxXv37tkdsrKsL3xU4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1xNZIZFXh5bp5mxMrZJS+Vc/j+cHVgl4kO+eySy/kgeDon/J7
	xR/SxLDXkU67TBLSzMSAhMjq5IzOILlgCjsapJnMaRICQy0MHesgBypxEW3GJvvzIaU=
X-Gm-Gg: ASbGncsbRqDcfuYWonFHL5YHQD72KhRQGBMwc8b1HGPl285nePv37gLLWVear6by6Bw
	xYIFw+3o0GCcmoLAHBnAnNZnsBmmn8l4hZDPwsUTL/cSQqm+FNOZ0wUogv3fkMu9Lu+3IDAZloc
	irk2SiG50d5aL7Omg32OLy5iO/dwiL0LZhvDkCXzY/nrgGneyw+Whrk4XLVXNreEzixS+klsbDQ
	YR/uiTDL6RPZdoNzmOq7y8Vx/gwQ9L/ARFUeQrU5Zo8ugf2VIinptKtu7cdB3PUYKYHhiQ4HVx7
	PR90yDQNXJZKIvE0yUTEmL4ehcvNW5llqtOM0p9zFbLhqWbFPQiz3jno08KQznQ/SgHP1g==
X-Google-Smtp-Source: AGHT+IHh+how27xFPi3jlyY66JrJHeNp1IVUr1F4gL3pyWo/92sd3tMtxnIq687N17nvaqy2j2xmcA==
X-Received: by 2002:a05:6830:2b14:b0:727:24ab:3e4 with SMTP id 46e09a7af769-73ca48e3741mr340463a34.9.1751592041579;
        Thu, 03 Jul 2025 18:20:41 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1ed4:f8f7:2a8d:77d5])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-73c9f9628d8sm203282a34.60.2025.07.03.18.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 18:20:40 -0700 (PDT)
Date: Thu, 3 Jul 2025 20:20:39 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peter Chen <peter.chen@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, s32@nxp.com, linaro-s32@linaro.org,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Ionut Vicovan <Ionut.Vicovan@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: [PATCH v3 3/4] usb: chipidea: s32g: Add usb support for s32g3
Message-ID: <1733ae21-7257-4fdd-8249-7eaebbf769a2@sabinyo.mountain>
References: <cover.1751591078.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1751591078.git.dan.carpenter@linaro.org>

From: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>

Enable USB driver for the s32g3 USB device.

Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v3: No change

 drivers/usb/chipidea/usbmisc_imx.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 27a3127db4f6..9a1c97ea5463 100644
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
@@ -1200,6 +1205,12 @@ static const struct usbmisc_ops s32g2_usbmisc_ops = {
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
@@ -1429,6 +1440,10 @@ static const struct of_device_id usbmisc_imx_dt_ids[] = {
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

