Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27FB22069A
	for <imx@lists.linux.dev>; Wed, 28 May 2025 19:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748462248; cv=none; b=HXoIcCxBJnG2ysQNS5dKYBT/d3ZRwB/1FxpcY21o1JegcbxvymOzgwUS7sTjJC8lXRVZUxmAVJ66qdIdkZhzbOFvNYQoPSfLAlBIes1K04rIup8jjWo2cmOXv6CiDv74Q5FGJVcQFTE3c8Ni+8fa3rUbibHS/bjACLbkj0sLVjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748462248; c=relaxed/simple;
	bh=NSe9RzYFBpq47/dJ5qqWUOPu2I/KiKwtwt0jkoCunaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qyEUH1BAwNmlPWQbRRf2s/esMthiPitR4LcmY5nYpsrcgAuwJZZLTI2l+MT3pwxU/A8MqNYCO3bMDoNfymdDtorysBr8tpGVOYT7Ub5UZbwIjgszzCKjLaGICkboEEw9P9u3t4lYz+nnIrpST0HwJQGQs8FrMaiI+kmEwQd8tss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BtrReA4g; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BtrReA4g"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so2797825e9.2
        for <imx@lists.linux.dev>; Wed, 28 May 2025 12:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748462245; x=1749067045; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jox9SekNR3rtKHNYCobALo8p2iBIaUa3VzzVOakwrMQ=;
        b=BtrReA4gwuEjU8fCPnwlvxiNUaGVNINsdh5SbEvxGLDYwTW+oWtFsaLH//FEcoh6QV
         VvhdLJ7bzb5sk7vUAf49Z+joY/XyPVmXN52omtPYWCfS2xtOE7T2pAvpczvHfvkPEiv7
         28yXwc1gjA7bIrgZycCmr/Xn1mvN1zW2fog3s2Wri2A/YjXjWiFStXuur4GaIlMWPRrM
         0t+oOrJ3p1j1HwdcjoqVLUYJgNIPoOWrYyC/NsGH81crS50kHnMI60fDSrGcz0/Oye0Z
         pstknqCSXcnUnyse78YuVVJD9uMbSzhsfOH/b48ukEtDdtWtoXlMSVYl4w/jO14FPRKm
         XOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748462245; x=1749067045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jox9SekNR3rtKHNYCobALo8p2iBIaUa3VzzVOakwrMQ=;
        b=NFJ6WmIoK/eYD7KFtVw4+mFBhYWkCwn8CYimHt0+sC6lqkQFlUEHsMTvxKHSBwIHnA
         HZHcElKVbcvgnXJqk/T0wrf3kO3uhsrBdlbglmQZB8WO3yhX2d1r/4KDJe6d/IFdhLBm
         WyQZQZZMqJYKos2feCOiDO5VkxZ8MzsaJUHz+zc0Ac/j79Z2az8vrre/QhAi9UQp5Fwd
         uXuo5AIwuTAYP7Zc0z0r5KNNSi7YyZVp83N0enaJZK/6vT50IWqeY823zkZj/j0Zc4FQ
         a8TQaUbCKWasEgfovgePGU1rcKIU3UPcSPidxhp2HWM8nHAdNnygtOh16F78iQIss9aF
         oopw==
X-Forwarded-Encrypted: i=1; AJvYcCUzbnXSTdt9iKsRrl1y+V5U/yYsP9uho5CenrjoQIoRhVzbeNGXW5KOgcroNHmHKeZVIMU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyM5EhlKvkb1V22zMUb4UqY20VN++qoCMWPV5N2mTD3P67MtjXT
	ojx+WeWshsgUp2gbvkI2gdpQhUO0rntPMyZ5pNLUMhu+MJJlWUK9IhoYt3jikZU7Wjo=
X-Gm-Gg: ASbGncsQl0rTPess/h7FH0oqNUrxHMFi2sAVJOu3ipsRy6rKCbznXLPHLt78KMJQpTW
	czkW5TJa7KGPRLxWhuGdQUr7IFdpN+o5b81KVsR68NNx1HIvIR/uuPMSVX1P5MXB8YufRv1M0Wv
	Yc//1xuXrSmkL2/7hLd45R85PSSigyxl1TNuANBBrIR6j6CcDrUVNBU3N6haU5ve4H+7fiBuTrO
	DmdbB+uYjkcnQI434PLuKGq6nvbK+ikH820yVLfw5iiVX1E9KiLXuNc9c335BytyqygkCF0c8N8
	0FNqeyAVtU1dKdLsHAI/XIqIsvszmHieEIofPejnUoQHRvYyKWGHmCgJe3tcwCLE/w==
X-Google-Smtp-Source: AGHT+IGFimIQlDKktgw+rSB1HgWLv0+JQH4Uvai1EVQNKILhkigc431Q3x3/98hg2t4hXWqFBll7vg==
X-Received: by 2002:a05:600c:4f43:b0:442:e0e0:250 with SMTP id 5b1f17b1804b1-44c933ed7efmr166096775e9.29.1748462245206;
        Wed, 28 May 2025 12:57:25 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-450cfc2d383sm586565e9.32.2025.05.28.12.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:57:24 -0700 (PDT)
Date: Wed, 28 May 2025 22:57:20 +0300
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
Subject: [PATCH 2/4] usb: chipidea: usbmisc: s32g: Add a REINIT_DURING_RESUME
 flag
Message-ID: <b1ddbc5993b2906cf916d023fdf27b07088a9672.1748453565.git.dan.carpenter@linaro.org>
References: <cover.1748453565.git.dan.carpenter@linaro.org>
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

The s32g2 and s32g3 chips will need to re-initialize in the resume path.
Add a REINIT_DURING_RESUME flag which will trigger the reinitialization.

Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/chipidea/usbmisc_imx.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 118b9a68496b..95759a4ec60c 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -155,6 +155,9 @@
 					 BLKCTL_OTG_VBUS_WAKEUP_EN | \
 					 BLKCTL_OTG_DPDM_WAKEUP_EN)
 
+/* Flags for 'struct imx_usbmisc' */
+#define REINIT_DURING_RESUME	BIT(1)
+
 struct usbmisc_ops {
 	/* It's called once when probe a usb device */
 	int (*init)(struct imx_usbmisc_data *data);
@@ -171,6 +174,7 @@ struct usbmisc_ops {
 	/* It's called when system resume from usb power lost */
 	int (*power_lost_check)(struct imx_usbmisc_data *data);
 	void (*vbus_comparator_on)(struct imx_usbmisc_data *data, bool on);
+	u32 flags;
 };
 
 struct imx_usbmisc {
@@ -1266,6 +1270,9 @@ int imx_usbmisc_resume(struct imx_usbmisc_data *data, bool wakeup)
 
 	usbmisc = dev_get_drvdata(data->dev);
 
+	if ((usbmisc->ops->flags & REINIT_DURING_RESUME) && usbmisc->ops->init)
+		usbmisc->ops->init(data);
+
 	if (usbmisc->ops->power_lost_check)
 		ret = usbmisc->ops->power_lost_check(data);
 	if (ret > 0) {
-- 
2.47.2

