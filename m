Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A717B218EB1
	for <imx@lists.linux.dev>; Wed, 28 May 2025 19:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748462267; cv=none; b=YMP8tmS3L8i0FbnbU30b2pY2oD5nxBq6Z6xNxbTza8oACCFJhN+A6bOGz85J5KpdjMysuHvrC752W4EhIkVzHmHthqBMyH03s57L70NOcdK0aN9I+iTZQhjYEH/w48aYEsqiTfsARSn3fapVdCd7yLxAOL1G51Br3NBYBYOXL78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748462267; c=relaxed/simple;
	bh=HxJNYY9IRB2fTnRgpeLfBfNMV4c9x5sL0a7Gxl/lSqw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=DYS1NpiS4YVaQm5iBAs+yfalCSydU4dxXLrD9lvSwufUnBuuQawHsv1E3bUZr75pk4y5TNHnQYvSOggJ7azZavBoxgZVSOXj5Zn7eNYjgXxU+BRzFo6nqNFj/kLrDPDaC4/tWzquI8d9MRiTaCLn8tYnvdlYu6kTVxKnlKFTEQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e9cZOAHk; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e9cZOAHk"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso1623005e9.3
        for <imx@lists.linux.dev>; Wed, 28 May 2025 12:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748462264; x=1749067064; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=daVisNFo2JYOWor9frp9fd1E3MXvxdVufApsYKXj4R0=;
        b=e9cZOAHk8ngrfnS5/P9qLU6v2twGDP35UYJ0B//F4nM3mA6KpO2mtL6lHHfzhdHDHW
         yz9KC+uWHCZQ8JUAFscsJ6+i+53mTFCCY/UcXjz1e8KrTZFqrFvKO+enWL9KIZto8MjR
         CdljfUpXS+nqSy6o8XMc9UPnNV08mN+HAWBgRkLhip7Xog4/g+GRj/Qr3kfml9W9r88p
         3GIrDCMbbG6L4zbLUVkaE+969LhvJnWnnCn7su7XjfuvWN05ODbQevpDIG0OGGj7J59v
         MQWNmaHlkuJOs2g/si7XI/2TbtwFa5+puOAwN3E4rEFSNjXUuVUI2ts6IomAiZO4FdPr
         gLnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748462264; x=1749067064;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=daVisNFo2JYOWor9frp9fd1E3MXvxdVufApsYKXj4R0=;
        b=P2UOh7QwftQ5cC5bHm7aklokyU/9Ij1WvG7XdSSCsTf2miFsjvGMX8gFFXgkj1CL7L
         WYIVhPkmKMJlzZykceJiC4CDk3jGK0A1FytclrJFMCw9rdZt4Uu4BaFp4R8EH2kEHNPz
         p5FuIDpuABkeUTU5EE+rCR8O9E6egZNqgGMCw6bQQ8dHm8kfUEjsHiw9fXRoLGWlS4yk
         3Dg7t10RlLX1CdTb5935zQQSyFtYsZ64oEFKnH7Y370T4LXl5xGbjelSuxjpSzSjQSXF
         XEvzQfn3OCE+t9U5YiEnjnQcuccHqXZ1Q91Xjwb0Xps695mn49pxRYIS9gar7I5bEW/j
         50Nw==
X-Forwarded-Encrypted: i=1; AJvYcCXuuVuQg69MPfX0xoeoVsJslOeJ+3/9HQ78vlxhX+0DRPXltACb1oAvL6toGSOt5lKBxeA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxY7K+PthkgBIUIIaocrbps38WsRjCoe/J0Td48IKviwwnBx9H7
	bg9JCmONEUDqaJ7jpha3UwrXvj4AkilrOiL5vW2qvD2lWXdysK6cF1/yt4zUnArkZrQ=
X-Gm-Gg: ASbGncvSAfkGq1pjD5LD9sUzpicj7cDmhDleEDsKJAPO3ocYhYCVXSQMhxIzA5w8wcC
	Hc/ZTKsTzz5uohR/UKHJso2cY6FyYt5hYFUZmd1VRN+ziMUDvpHARLKyCtLWc6pZmuXQhCxnagh
	sRyI4mBob1GxslO3ZvztmWdHp3Lp+oPM/kMNHF3U5eOkazWs6rK/ZQbmcR5nrCx01wS7I6Aww5i
	rNF7oAGNG/RP8kWAYJWWYanXToZBcncZYu+E1wOWP94NBnDSGCJ9F+IUndWCZ2S8ZgUxjErHcm0
	3Pr4435YQS5aC4IcpGGCf2+IJlek4QvECOtpHcAY9vcXXT0u828vueg=
X-Google-Smtp-Source: AGHT+IHg9XasKs+N0t/qumXHpJiiJ8sMTppJmHwcsmrYSwVnYilz8ut2u+dvhBQCw0zXqxv2hFdsXA==
X-Received: by 2002:a05:6000:240d:b0:3a4:d6ed:8df8 with SMTP id ffacd0b85a97d-3a4d6eda63bmr10797738f8f.39.1748462264092;
        Wed, 28 May 2025 12:57:44 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4eace3260sm2353096f8f.90.2025.05.28.12.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:57:43 -0700 (PDT)
Date: Wed, 28 May 2025 22:57:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peter Chen <peter.chen@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, s32@nxp.com,
	linaro-s32@linaro.org
Subject: [PATCH 4/4] usb: chipidea: s32g: Add usb support for s32g3
Message-ID: <c7c9319793b439cb35909621381ca2d4a78699dd.1748461536.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1748453565.git.dan.carpenter@linaro.org>

From: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>

Enable USB driver for the s32g3 USB device.

Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/chipidea/ci_hdrc_imx.c |  1 +
 drivers/usb/chipidea/usbmisc_imx.c | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index ce207f8566d5..d062399ce15e 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -95,6 +95,7 @@ static const struct of_device_id ci_hdrc_imx_dt_ids[] = {
 	{ .compatible = "fsl,imx7ulp-usb", .data = &imx7ulp_usb_data},
 	{ .compatible = "fsl,imx8ulp-usb", .data = &imx8ulp_usb_data},
 	{ .compatible = "nxp,s32g2-usb", .data = &s32g_usb_data},
+	{ .compatible = "nxp,s32g3-usb", .data = &s32g_usb_data},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ci_hdrc_imx_dt_ids);
diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 43098a150e83..34fd26faa303 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -677,6 +677,11 @@ static int usbmisc_s32g2_init(struct imx_usbmisc_data *data)
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
 	.flags = REINIT_DURING_RESUME,
 };
 
+static const struct usbmisc_ops s32g3_usbmisc_ops = {
+	.init = usbmisc_s32g3_init,
+	.set_wakeup = usbmisc_s32g_set_wakeup,
+	.flags = REINIT_DURING_RESUME,
+};
+
 static inline bool is_imx53_usbmisc(struct imx_usbmisc_data *data)
 {
 	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
@@ -1432,6 +1443,10 @@ static const struct of_device_id usbmisc_imx_dt_ids[] = {
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

