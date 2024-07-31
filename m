Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31B01AC421
	for <imx@lists.linux.dev>; Wed, 31 Jul 2024 17:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722446887; cv=none; b=SxF/hMOoJ3xxFkGNh3sL2j06vsWWOF5JWrwrkDxTf37BxiHYaN5dWlO6Ru9hmn387OdIx0yQZYmP+MgdfDYwdyNBQoBXpS0Ltrc0XzIcYsOOz07h8zZ+Uxr3IK3G1b5Y7U9rDp8OOeDuILqBZFUVRFmmrG00259qkW/sOFP3Z2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722446887; c=relaxed/simple;
	bh=v42xTc0oCCwicMaNmmOfMJfqEsCKrbNyJaEIMbAOXxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GmAkDb3tUMKSWAUm9EMcUTC7zTPUz8YpAh6397Xt1FFAOY4soIBniNnOB7Zj7u9auAfs9hBb6bl0IuevEyBWBxRWeG0K7X9vbGJxPiZU8RUlbTlVJxdrAfGLl1TaWBW+VIHVzG3uENRUB+Itl7BFekdHbnAf8O8+VLue1c2rnnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IBKw1Bkm; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IBKw1Bkm"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3db14930a1aso4107983b6e.3
        for <imx@lists.linux.dev>; Wed, 31 Jul 2024 10:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722446885; x=1723051685; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DRt+wirySSP/0rxSfCYSdxmXJCuEIe74VBuQeagotrY=;
        b=IBKw1BkmH3uikMHppdTFSfTfItTUEDbG/kPTefBPFhCl+nLyGDe3ebQZwghdiRJe+E
         UrpklNcVNM/ZZETXSV1xzM7/+mRoNI32r6/DWKhQeGdMWIj0VQqVmrK2FlzCFnhreXpM
         l2NgxZnPx4wzO1FZSHZj5fjUeD07oqzNY4ZCbtilH3ahbtoNqCPbokdaoqO/yNnTMHLu
         dleEnFB3aDO0aMxJCKA3K+zd3EXKiy8GP44tT1IznZGHZI+pPgbjSQT9wIapfPDcuGO/
         Fo6TvaotzN/MkotIOfyrxOk6RSREVEbcrsO/5DwRgMxaulzU486nhdDXo2QE0wkwml/O
         gD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722446885; x=1723051685;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRt+wirySSP/0rxSfCYSdxmXJCuEIe74VBuQeagotrY=;
        b=a4gdkjKqW2eX4r6wmP+hiDiLNH9E68uEy6PWM6s9RdIi2cVhuLxs72JSEQgXscA4SH
         XOL+WARY3ons21CA3+zSRpvgPJav+Y9jBUpVhJ0/sE+2ZBr6ckdmKOfJRBOstw2QqfCl
         EExIYzh1fVTzWzkAGJoObGfziY3pnJ1a48WpaNil7IVp6cAMTSjyI/v7KVJWsDQhd7S4
         D7kSX8cAdFGTpk4CtOI0FKP2duKW8WndPNiIqaBD0OqhPuJU/4VzRri61N8jl1j0uH80
         4b6dTDySFHdge0lzjumzRnnvRVNXrfBcY3cORkIwk0Ddm9SOeIfoUzxQQNqfkB56ABZk
         CxaA==
X-Forwarded-Encrypted: i=1; AJvYcCV2k69PFziz5x2EbOjoxjZlQG88GqOM2YWdAhL14y+wBhYUUPXqFhk47SGBlAeign+3b5XE0+scYIHHly48iC7537kE
X-Gm-Message-State: AOJu0Yxq+CAmu0jWLGOhcOBOetSfLwiwHy8XrLP+fj2UFEABcmJBfo/v
	JEQ0EfrDAiii5COFtEZHoVZwdCuiiZGrlHwGLFl7lgFLHedJl2Jy
X-Google-Smtp-Source: AGHT+IFJbEbhXaPmjuoxCmR+/hmNt9JvEc6afSJEmUV9Ud116y5IbhnecHFxJGgYOSL+laQhmm8OlQ==
X-Received: by 2002:a05:6808:30aa:b0:3d9:4147:4e38 with SMTP id 5614622812f47-3db23cb417fmr16579228b6e.36.1722446884744;
        Wed, 31 Jul 2024 10:28:04 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1da7:72de:e91f:aa85])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7a9f8273af7sm9200866a12.30.2024.07.31.10.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 10:28:04 -0700 (PDT)
Date: Wed, 31 Jul 2024 10:28:01 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [PATCH v7 7/7] input: keyboard: support i.MX95 BBM module
Message-ID: <Zqp0IZfUobg6dq8G@google.com>
References: <20240731-imx95-bbm-misc-v2-v7-0-a41394365602@nxp.com>
 <20240731-imx95-bbm-misc-v2-v7-7-a41394365602@nxp.com>
 <ZqpCwOhXiLzxK43-@pluto>
 <PAXPR04MB84598B36C6721748FB98905088B12@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB84598B36C6721748FB98905088B12@PAXPR04MB8459.eurprd04.prod.outlook.com>

Hi Peng,

On Wed, Jul 31, 2024 at 03:37:18PM +0000, Peng Fan wrote:
> Hi Cristian,
> 
> > Subject: Re: [PATCH v7 7/7] input: keyboard: support i.MX95 BBM
> > module
> > 
> > On Wed, Jul 31, 2024 at 08:56:11PM +0800, Peng Fan (OSS) wrote:
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > The BBM module provides BUTTON feature. To i.MX95, this module is
> > > managed by System Manager and exported using System
> > Management Control
> > > Interface(SCMI). Linux could use i.MX SCMI BBM Extension protocol
> > to
> > > use BUTTON feature.
> > >
> > > This driver is to use SCMI interface to enable pwrkey.
> > >
> > > +}
> > > +
> > > +static void scmi_imx_bbm_key_remove(struct scmi_device *sdev) {
> > > +	struct device *dev = &sdev->dev;
> > > +	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
> > > +
> > > +	device_init_wakeup(dev, false);

I do not believe you need to reset the wakeup flag on driver unbind, as
well as in the error handling path of probe(). If this is needed then
driver core should do this cleanup (maybe it already does?).

> > > +
> > > +	cancel_delayed_work_sync(&bbnsm->check_work);
> > > +}
> > > +
> > 
> > ..so in v6 I asked you to add a cancel_delayed_work_sync() on the
> > removal path, BUT I missed, my bad, that indeed above there was
> > already a call to cancel_delayed_work_sync() associated to a
> > devm_add_action_or_reset....so now we have 2....also you should try
> > not to mix devm_add_action_or_reset and plain .remove methods..use
> > one or the other.
> 
> Thanks for your detailed reviewing on this. I will wait to see if Sudeep
> has any comments to patch 1-4. If no comments, I will not do a new
> version to this patchset.
> 
> If v7 patch 1-4 are good for Sudeep to pick up, I will separate this patch
> out as a standalone one for input subsystem maintainer.

If you remove the duplicated cancel_delayed_work_sync() in remove() and
unneded device_init_wakeup(dev, false); then you can merge the input
patch with the rest of them with my:

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry
