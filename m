Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9632D3EC1
	for <imx@lists.linux.dev>; Thu, 27 Nov 2025 16:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764260597; cv=none; b=WVdTm3xW11L9wKBpVI5yQWoyG81LAQYhbhb47Pt7LwloAL0/vyrx0NetjsxFHvPr0zv6UcojTEQHQxKSIdSJsgZkmkmYd1o4G5b6e8OxpAlqYMWfcj2I/8DtYqhe1QodcbFXvYfeUz1WJ8wLMbVE/2dSS1E2H2qjuJjL0+eMsgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764260597; c=relaxed/simple;
	bh=5w4AUQuz0dGdw5CdD1rC201z9FXIhHuXRPxTOAxvqIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MguofWnkhvoT7jyxVV2qNEpwgLuHhSGxpif0QFOf+kV3hVzfcVnYzBAJJn7HAwaQbUPiPPi/maPw+XSpJRBI4WxAE+p2lopTJ3XoY6cBYqRd63ZQmAFrtMp8G05+RoQFYNqcxlESR9vUuWxhHapkEisS4qu+sE1Yu9AI40yRK/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WuDedMaz; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WuDedMaz"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-297d4a56f97so14531455ad.1
        for <imx@lists.linux.dev>; Thu, 27 Nov 2025 08:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764260594; x=1764865394; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bYD9XqhUHtt4KPRx0lwsto4qlMl73VNVsS41vyaBbjs=;
        b=WuDedMazMkxLqGG9eQJqv8FsbmmuYmSmi8nuJ0K7/2BIQU9OHRQ0ij9kSdPkDWzMwS
         5kQL1Wyoxk4mqDBKatSXU4Nh/67Wb4wSMlKgYvuI7hjTEfi7iW8IgR4y5EkUy6PefCC8
         NjzL7JM3neemMeuVMtFdWVfSKiiZSbzzMfyio/qWr0UsftNlo4Bs8/+f5b8rDVqNm4MB
         A2I+E247VaL11owXSigM+c3Xey5fO1cH0WYMChbU/8BpFFbOSF7catIB28jR4gZJ0L9w
         CMnl0jyZ5J/+lj/cMvn/kOF6EC+UFaQpTWlN9Zj047iI4gHcFVTdLt8/Bd2ci3gNMp4E
         611w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764260594; x=1764865394;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bYD9XqhUHtt4KPRx0lwsto4qlMl73VNVsS41vyaBbjs=;
        b=JALTmlzb7cWus17FVh8u/r8rEepUFVBqIPvoiVwFWzRyckRJu0O5ffVivPx+uTpzUL
         qX2ErcCE6xc/Ept29FpYP5Ib2KySplnQ0k3iqP3sk38c8IZX247/sWeoahdKgK3XcdKU
         QwrDgXWKzqgsFA6Gvf/+oUvATbhsPwhPXOCOFIazCPwTGkHAfYcHaQ/e4j3DSJ5k8c/h
         YtiKfQszjbyhaD4jRRmGGHZrXd3FvN/XhfD7vM5qzyyI+48OYmSWhFvbb6qyZADOMx1W
         pDghQpyJgrPxUAM6wHm+kJwT7fz9pQW99SXjVTbuxmZbPFqTGaHWNU5K0J2/655iAjZy
         Dh2A==
X-Forwarded-Encrypted: i=1; AJvYcCUC802H7+EEAaLcZxhb+gN/fpbTYR0N+4k0ahXU8LqozAS6ZSlFEyRZdUhoxTPtW8rfsFQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxts27I4yOoZECUMdZfSGf7zjUrbWUrHNjqJbyoFa+Trx0jkpTQ
	kFpmHS37cmDAY0I4DVp57+0m/ApCicI+Ld2odBLYOVnRRn9hbv6je3TcWSduAajWcIU=
X-Gm-Gg: ASbGncvBXzUI0XxPBZFdk3jkEAPS6KdbjImlEPw0ZI0kigNxiRqmbdWD3Hslny9U5R1
	UIBOqrRSmhqtbmqqfno7gsxBQsdhB5XmTAW51x92kdKeFfk5Lop17MBhLJX8yc6dhCwPdO3jLYf
	JgaA62PRTrrEkuOPzb1u0bBb3/PIQ+lwfaGu5jBW+z5Hqpgv0NclLPV6rTybDZzPyYzgu/uQgBd
	fmLSJdbfpMpG5MUwWGh4PkRlU1tw6QsVA1xIRpReUrf31Y4rhgdPo1NKPdI6vCYbQ/L/3tC5ZOa
	IDR+zxo6XxZ9r++x52WMGjLcDbkt2rue7g1WuxnwWP3LbjsEpPoMqqjuBzOiNAGPpnT9V6exvtE
	TMkG815iUx2nATCPWpFsdVcQ/lFiDpRIONxXiY5czR/XO9Lhf6XuKCO1JGXr0YSEuGH4d+zYr6W
	cf041JtG2K+FKUUg==
X-Google-Smtp-Source: AGHT+IHqx1uI/5nrF6nAELgHS8dwwRi8UkkNhUGcSd+x/B6tc1auqIiR26mDQUo8dP8rVSg7iApWFA==
X-Received: by 2002:a17:902:ef08:b0:248:ff5a:b768 with SMTP id d9443c01a7336-29b6c3c7340mr247945805ad.10.1764260593683;
        Thu, 27 Nov 2025 08:23:13 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:9ef4:efaa:23ae:f181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce2e676esm22111985ad.0.2025.11.27.08.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 08:23:13 -0800 (PST)
Date: Thu, 27 Nov 2025 09:23:10 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v5 2/5] remoteproc: imx_rproc: Populate devices under
 "rpmsg" subnode
Message-ID: <aSh67mvFB_00PywW@p14s>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <20251104203315.85706-3-shenwei.wang@nxp.com>
 <aSdMufLCeqvVyKsp@p14s>
 <PAXPR04MB91857863B163B3F38A26647389DEA@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB91857863B163B3F38A26647389DEA@PAXPR04MB9185.eurprd04.prod.outlook.com>

On Wed, Nov 26, 2025 at 09:46:38PM +0000, Shenwei Wang wrote:
> 
> 
> > -----Original Message-----
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: Wednesday, November 26, 2025 12:54 PM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: Bjorn Andersson <andersson@kernel.org>; Rob Herring <robh@kernel.org>;
> > Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> > <conor+dt@kernel.org>; Shawn Guo <shawnguo@kernel.org>; Sascha Hauer
> > <s.hauer@pengutronix.de>; Jonathan Corbet <corbet@lwn.net>; Linus Walleij
> > <linus.walleij@linaro.org>; Bartosz Golaszewski <brgl@bgdev.pl>; Pengutronix
> > Kernel Team <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>;
> > Peng Fan <peng.fan@nxp.com>; linux-remoteproc@vger.kernel.org;
> > devicetree@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
> > doc@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
> > Subject: [EXT] Re: [PATCH v5 2/5] remoteproc: imx_rproc: Populate devices
> > under "rpmsg" subnode
> > > +
> > > +     drvdata = dev_get_drvdata(&rpdev->dev);
> > > +     if (drvdata && drvdata->rx_callback)
> > > +             return drvdata->rx_callback(rpdev, data, len, priv,
> > > + src);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static void imx_rpmsg_endpoint_remove(struct rpmsg_device *rpdev) {
> > > +     of_platform_depopulate(&rpdev->dev);
> > > +}
> > > +
> > > +static int imx_rpmsg_endpoint_probe(struct rpmsg_device *rpdev) {
> > 
> > Where does the rpmsg_device come from?  Usually there is a call to
> > rpmsg_register_device() and I don't see it anywhere in this patchset.  I also don't
> > see a link to the remote processor.  I can't continue with this set for as long as I
> > don't have this information.
> > 
> 
> It is in the function below named imx_of_rpmsg_register_rpdriver.
> 

The function below calls register_rpmsg_driver(), not rpmsg_register_device().
I still don't know where @rpdev comes from.

> Thanks,
> Shenwei
> 
> > > +
> > > +static int imx_of_rpmsg_register_rpdriver(struct device_node *channel,
> > > +                                       struct device *dev, int idx) {
> > > +     struct imx_rpmsg_driver_data *driver_data;
> > > +     struct imx_rpmsg_driver *rp_driver;
> > > +     struct rpmsg_device_id *rpdev_id;
> > > +
> > > +     rpdev_id = devm_kzalloc(dev, sizeof(*rpdev_id) * 2, GFP_KERNEL);
> > > +     if (!rpdev_id)
> > > +             return -ENOMEM;
> > > +
> > > +     strscpy(rpdev_id[0].name, channel_device_map[idx][0],
> > > + RPMSG_NAME_SIZE);
> > > +
> > > +     rp_driver = devm_kzalloc(dev, sizeof(*rp_driver), GFP_KERNEL);
> > > +     if (!rp_driver)
> > > +             return -ENOMEM;
> > > +
> > > +     driver_data = devm_kzalloc(dev, sizeof(*driver_data), GFP_KERNEL);
> > > +     if (!driver_data)
> > > +             return -ENOMEM;
> > > +
> > > +     driver_data->rproc_name = dev->of_node->name;
> > > +     driver_data->channel_node = channel;
> > > +     driver_data->map_idx = idx;
> > > +
> > > +     rp_driver->rpdrv.drv.name = channel_device_map[idx][0];
> > > +     rp_driver->rpdrv.id_table = rpdev_id;
> > > +     rp_driver->rpdrv.probe = imx_rpmsg_endpoint_probe;
> > > +     rp_driver->rpdrv.remove = imx_rpmsg_endpoint_remove;
> > > +     rp_driver->rpdrv.callback = imx_rpmsg_endpoint_cb;
> > > +     rp_driver->driver_data = driver_data;
> > > +
> > > +     register_rpmsg_driver(&rp_driver->rpdrv);
> > > +
> > > +     return 0;
> > > +}
