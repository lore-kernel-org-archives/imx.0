Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714D97482
	for <imx@lists.linux.dev>; Sat,  3 Aug 2024 06:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722665625; cv=none; b=bOu4gYhzsyzL+w8OazGqLjM1wWXpdYps0eT3ZgDuLr3muEIOKaB8QVcnBXpI//jvMjoWrVmqtw3LiaqlQ6WNbVNzTkwjhRRX2T1oQ2ZZdHX6ygPkMxKr1XA13A652e6GbD+87bgMGULy87LQQIofIbu+7R97nCK42PzR44emDH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722665625; c=relaxed/simple;
	bh=f3SsyA0A03ghx59fpFfz4bnYCHxtXxzbra9YDmRBIeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=efDG/BciY+F8+Bh586iOMiTpxXkqaQXA6nUEDy0q/aQHnro6I7H9bPjAw6CB5NisIDxQjAZk+LWxY2vMeAhOpeGqOz9KSWBA7v2hVrPdbJV+wG0C2piToIc38YOnAo7+NEL29LfNEYYg/Ylj4KV6zlBYyfQxRO+D0bWRZXuH4xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H3u+HLB7; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H3u+HLB7"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7b396521ff6so3658749a12.1
        for <imx@lists.linux.dev>; Fri, 02 Aug 2024 23:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722665623; x=1723270423; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hXMFhCUn5D/KqrMjKOKnbi8o/0EVbx6C+turhkcsq08=;
        b=H3u+HLB7ZBOr+rdEWxDGXjG42S9dgRfum/3WM8cyFS7DHcvi4nf7mIk0veqO72lQg3
         ISVjIuqxg7q07aVzcnBN7svvDc8R6pmSDOHH1t43gpboK3rpI3Rm8S+tLH5xqP7+nzzR
         nG2Yg98j2SUpxHdELmI755TucroTs5ZEx2bDiseJzShBAWl6wWEOjcqHt/ZmszByct5I
         2hWVed7V5KEGi8mL2em36LeIv1OaFH/kcA5JuS9vAsy+toJCeKvKNTLTTNL92EKPq3/2
         Okp+D8cjM9PxFUW0GarrJ7k2ZPXJWOklmDdDuGFCysgoe0+8NUVp3KI0tGJEa8Sv/ZwC
         9Uzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722665623; x=1723270423;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXMFhCUn5D/KqrMjKOKnbi8o/0EVbx6C+turhkcsq08=;
        b=eK1TpxnXhrUlDcRsxJo+uP8J20LabC+Qs6XgeLROLtE2hzkFPRF4D/iyRhEFAObmMM
         DyJ/6mwBo9lJDDpn+4XAgiTjbBRnwiHPOS96vmNrxvZ67R2MyzrzE1dD+ulCeRsQreP+
         mF1nAVLLoQ1F2nDnd3cgSciWv6uBj8GD5SdkSPneEcXvBLvBOfoYzVX4HaZmcCp4A/Uu
         Gt51usVjEhqwB4WW8uMNqnJKFVoIR/Quz3SxTBALOrIFD1A66g9kHeB1N1knQEPwFAQM
         vl2EryoUbM3AJ44wSysbMIQKiMqq+RNuG17MEzVT3rPH2Ay19eh3LMQ6XLLZ2UFU0F7/
         fYEw==
X-Forwarded-Encrypted: i=1; AJvYcCWnqw3ks/ZiF0Km71RtYXihXGjt8QZS0rgApYNH5esQzZTk5smFnomPGif/WxH89th784YwDjx/sq8Pnu4l1rGiNkWw
X-Gm-Message-State: AOJu0YzyPsqtmRz9FbWCdeIvgfGdOhEKy6VdF7Kv7pR1GKHRRKy8nDkd
	EwWHCZMITnRWomsdEPd1xVBKEUQy5VLUVx/P8WU0J1N63AEfvOF9
X-Google-Smtp-Source: AGHT+IGgAjO3iklC0xXjAakpcmHNCbSd220ilCOUTPiEuu5dLNSN0mr4009Uq6sYz/UQhR1i8+qevw==
X-Received: by 2002:a05:6a21:8cc5:b0:1c0:f323:1b9d with SMTP id adf61e73a8af0-1c6995a1a4fmr7777869637.20.1722665622623;
        Fri, 02 Aug 2024 23:13:42 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:47be:b3e2:7c00:141c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ece0895sm2164970b3a.125.2024.08.02.23.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 23:13:42 -0700 (PDT)
Date: Fri, 2 Aug 2024 23:13:39 -0700
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
Message-ID: <Zq3KkwhB89zUfAjn@google.com>
References: <20240731-imx95-bbm-misc-v2-v7-0-a41394365602@nxp.com>
 <20240731-imx95-bbm-misc-v2-v7-7-a41394365602@nxp.com>
 <ZqpCwOhXiLzxK43-@pluto>
 <PAXPR04MB84598B36C6721748FB98905088B12@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Zqp0IZfUobg6dq8G@google.com>
 <PAXPR04MB8459CE89FFF5662AED66D9AA88B22@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459CE89FFF5662AED66D9AA88B22@PAXPR04MB8459.eurprd04.prod.outlook.com>

On Thu, Aug 01, 2024 at 01:36:10AM +0000, Peng Fan wrote:
> Hi Dmitry,
> 
> > Subject: Re: [PATCH v7 7/7] input: keyboard: support i.MX95 BBM
> > module
> > 
> > Hi Peng,
> > 
> > On Wed, Jul 31, 2024 at 03:37:18PM +0000, Peng Fan wrote:
> > > Hi Cristian,
> > >
> > > > Subject: Re: [PATCH v7 7/7] input: keyboard: support i.MX95 BBM
> > > > module
> > > >
> > > > On Wed, Jul 31, 2024 at 08:56:11PM +0800, Peng Fan (OSS) wrote:
> > > > > From: Peng Fan <peng.fan@nxp.com>
> > > > >
> > > > > The BBM module provides BUTTON feature. To i.MX95, this
> > module is
> > > > > managed by System Manager and exported using System
> > > > Management Control
> > > > > Interface(SCMI). Linux could use i.MX SCMI BBM Extension
> > protocol
> > > > to
> > > > > use BUTTON feature.
> > > > >
> > > > > This driver is to use SCMI interface to enable pwrkey.
> > > > >
> > > > > +}
> > > > > +
> > > > > +static void scmi_imx_bbm_key_remove(struct scmi_device
> > *sdev) {
> > > > > +	struct device *dev = &sdev->dev;
> > > > > +	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
> > > > > +
> > > > > +	device_init_wakeup(dev, false);
> > 
> > I do not believe you need to reset the wakeup flag on driver unbind, as
> > well as in the error handling path of probe(). If this is needed then
> > driver core should do this cleanup (maybe it already does?).
> 
> I just check the driver core code, you are right, there is
> no need do this.
> 
> DevAttrError:
>  device_pm_remove-> device_wakeup_disable(dev);
>  dpm_sysfs_remove
> 
> > 
> > > > > +
> > > > > +	cancel_delayed_work_sync(&bbnsm->check_work);
> > > > > +}
> > > > > +
> > > >
> > > > ..so in v6 I asked you to add a cancel_delayed_work_sync() on the
> > > > removal path, BUT I missed, my bad, that indeed above there was
> > > > already a call to cancel_delayed_work_sync() associated to a
> > > > devm_add_action_or_reset....so now we have 2....also you should
> > try
> > > > not to mix devm_add_action_or_reset and plain .remove
> > methods..use
> > > > one or the other.
> > >
> > > Thanks for your detailed reviewing on this. I will wait to see if
> > > Sudeep has any comments to patch 1-4. If no comments, I will not do
> > a
> > > new version to this patchset.
> > >
> > > If v7 patch 1-4 are good for Sudeep to pick up, I will separate this
> > > patch out as a standalone one for input subsystem maintainer.
> > 
> > If you remove the duplicated cancel_delayed_work_sync() in remove()
> > and unneded device_init_wakeup(dev, false); then you can merge the
> > input patch with the rest of them with my:
> > 
> > Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> Thanks for your Ack. But I think patch 1-4 needs go to arm-scmi tree,
> Patch 5 to arm imx tree, patch 6 to rtc tree, patch 7 to input tree.
> 
> I put the patches together in a patchset is to let reviewers could
> get a full picture how the whole stuff work.
> 
> For patch 7, I will send out it as a separate patch with fix and tag
> after patch 1-4 is ready in arm-scmi tree.

Right, but to accelerate getting support for your part into the mainline
I am OK with input piece not going through the input tree but together
with the rest of the patches through some other tree, probably through
arm-scmi. If they are not willing to take it then we will have to wait
till core support lands in mainline and then I can pick up the input
piece and move it through my tree.

Thanks.

-- 
Dmitry
