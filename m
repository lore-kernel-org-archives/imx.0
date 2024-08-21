Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2051CF2BA
	for <imx@lists.linux.dev>; Wed, 21 Aug 2024 08:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724229181; cv=none; b=FS+7iBEH6KrSse/YCMOt/nBwCMYXEbiVPfkD7eSRyIOaXgIcjV1nmtGMhAy4O4/Fxem4WeAW3s9KxZ1AlCRdVWg3EftoDDrKSxw/VgdOx+4Rnu/9KvKGUSdjkACHxb0gPX6hb84KuTpkPJMf/pjTxbKye6LS+YW29CYjoe835Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724229181; c=relaxed/simple;
	bh=NV+tOA1UOz/iTe4bNktGSFNe352KUkNmwar1CDbpCSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ktEKzJunJsS6NTzT699DhHWcert0ptaVbnDgBSl8//qth+x6iRNiPE1rND/aS4A9n83TYCgfZixGh8+7d7eJzyYaH4psgIV3ZscPklEgCWf2gQC9Ab4w3If+cwDrAIg5qs38q8AgkHlC2hjzdkSWId9MBGOgsfmLOq1WzKQgLi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TiNLPBzl; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TiNLPBzl"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5bb85e90ad5so4885820a12.3
        for <imx@lists.linux.dev>; Wed, 21 Aug 2024 01:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724229178; x=1724833978; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TiK+7G6dPv+jiLpJYq4uvWBTS2IB+9YYcX0z6+IsEsU=;
        b=TiNLPBzlNK6pHe08zigl9hRvSaL5w7/iq+VY4OE3UBOAiyG+Ufx7By37NjEn55zPoY
         rMKSVCJcDzLmWCnIo7N7fdDVQvAQbVJzg062qMCkmGWqFIxDRnPolfgHFr2U5OtgBVxU
         itmI+sW+fuDOULXREVnw6Ea7DVSY1eo0DpwvlyVoLbbSAIdi1D9BxThdBG3rRuLp2lYy
         KXPGAeJJt7VKXVCKUVMazWQloIQ59Q38ABV3ePNlWeiwBEoUqVO3bBM0aUnFg9ZzuKr4
         dzc2RO5BueyqMjE8VIvf+vU/REmWHvuwMgECIADpUg0q6LJUP23HWr2I8oSQaYb84Q6l
         L3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724229178; x=1724833978;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TiK+7G6dPv+jiLpJYq4uvWBTS2IB+9YYcX0z6+IsEsU=;
        b=bNkm1s+cNQvJlWpGesie3ttuh7kXKh+FR6cTJDdT/KeTmyfzLsAF/mAGhrgpXRJwdR
         MiRFu5pP7zOeAGt8EmLyALkdjNUiyXe1S6TjFzodM3daQkKdG5v3AJojGVlsxLo2/eBc
         lt/k41ESROdn/st7zp+HEhxubkElRN52y+kJ985C/SiMgdKiKAQVFfWu3T9GHOwNKk/c
         aSO7fnpgr9QIlYJP8xYXrRZ6E9pSB8RCimqDA2fBAxyFJk6SzC3wuJ8kyIVu/65kNw0/
         EIRULkjFS/eAfyV9vMExgDxigrLCIQVmB9/QF5DhEqDCvKKD7jYohGbKEmXkUBjExBGO
         SOKw==
X-Forwarded-Encrypted: i=1; AJvYcCVnF0DM7pvNAOU3kuhs27TZD4xZchCdb19Okyytrlq2sWyhVx9YDMNSe9N2vGYSMVScXLA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzAxciRIQe0afPXEMxnF5S7Yp8enlUhaZ38s7ICvrsUb8ylionO
	++WxfcgLS4kMA5ZK+bXEd6WHTI9UBKddtBWgOLjMRZ4nvjA46oQw6l3/skgyNChMeeeO9jEQ8px
	HEgIesa4ER59LJyLSA943eSy4Zrg=
X-Google-Smtp-Source: AGHT+IEpcPNclRlC8I8790mt0FWDo7p4bR9P71fXfJsWTMYcIsLtsjdEOLM3CNSH63KzkDld3TlrqtCK7Lo2s633mdQ=
X-Received: by 2002:a05:6402:190c:b0:5be:c73e:26e1 with SMTP id
 4fb4d7f45d1cf-5bf1f1666e6mr899972a12.22.1724229177227; Wed, 21 Aug 2024
 01:32:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240719-imx_rproc-v2-0-cd8549aa3f1f@nxp.com> <20240719-imx_rproc-v2-2-cd8549aa3f1f@nxp.com>
 <Zqe23DlboRPSXiQO@p14s>
In-Reply-To: <Zqe23DlboRPSXiQO@p14s>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 21 Aug 2024 11:33:47 +0300
Message-ID: <CAEnQRZC4Oqyks+ok0vdoFxW1v1s5hfbM8EtdP8nUqxTXRZsRLA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] remoteproc: imx_rproc: handle system off for i.MX7ULP
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Bjorn Andersson <andersson@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, 
	Marek Vasut <marex@denx.de>, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"

Hello Mathieu,

I've talked to Peng and if my understanding is correct I think the patch is OK.
Maybe we can split the patch in two:
* first, adding the power off callback with explanations.
* second, adding the restart callback with explanations.

And also add a more detailed explanation.

Power off and restart are totally different operations and are not complementary
as I thought in the beginning. There are not like suspend/resume for example.

> >  static int imx_rproc_probe(struct platform_device *pdev)
> >  {
> >       struct device *dev = &pdev->dev;
> > @@ -1104,6 +1122,24 @@ static int imx_rproc_probe(struct platform_device *pdev)
> >       if (rproc->state != RPROC_DETACHED)
> >               rproc->auto_boot = of_property_read_bool(np, "fsl,auto-boot");
> >
> > +     if (of_device_is_compatible(dev->of_node, "fsl,imx7ulp-cm4")) {
> > +             ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF_PREPARE,
> > +                                                 SYS_OFF_PRIO_DEFAULT,
> > +                                                 imx_rproc_sys_off_handler, rproc);
>
> Why does the mailbox needs to be set up again when the system is going down...

Scenario: We call Linux *shutdown -P * command to power off the machine.

At this point mailbox TX operation is configured as *blocking*. Power
off is done via
an atomic notifier call which doesn't allow blocking. If we do so we
will endup in a kernel crash.

So, at this moment we setup again the mailboxes configuring them with
*non-blocking* option.

>
> > +             if (ret) {
> > +                     dev_err(dev, "register power off handler failure\n");
> > +                     goto err_put_clk;
> > +             }
> > +
> > +             ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_RESTART_PREPARE,
> > +                                                 SYS_OFF_PRIO_DEFAULT,
> > +                                                 imx_rproc_sys_off_handler, rproc);
>
> ... and why does it need to be free'd when the system is going up?

System is not going up here. System is running and we do a reboot.

Scenario: We call Linux *shutdown -r* command to reboot the machine.

Similarly, mailboxes are already set and configured as *blocking*. We
cannot use the mailboxes
as they are because reboot is done via an atomic notifier which if we
call a blocking function it will endup in crash.

So, we need to free the existing mailbox and create new ones with the
*non-blocking* options.

I think this is really fair to me. The one thing, I admit we must work
on, create a better commit message.

What do you say? Does this work for you?

Thanks a lot for your help!
