Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8D91662F2
	for <imx@lists.linux.dev>; Wed, 26 Jun 2024 09:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719392868; cv=none; b=WZ2NSY65xpIm78xG/JAGXXovKZK2wzVrfDMhhcfYKLWCklwiywEF7cc0RexCDL5Tmu0OPLwqSCmFp2Ei11ua/6yV+TG6dyhDWQ3sFG0g0FUTd0kEL8R9cS0hncP+fD2E08H2X3+Y/3RDpt39kT7fkQk274JNC2GJXLtp7PrvX7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719392868; c=relaxed/simple;
	bh=ssH+6iURMN7zx64iT61gWIWA5rPqCh8kGeC+MevKIHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DpVDtXl6d74AyS05M7FlcpHJZD8blgUVsURxdhmG8Kbbl3qyDVNyTWrS95gUuXjgHsJGXdDypTGygl47lp4KVJh+oFmVHJ3fpOoZ1VxTzGf90jmZ+6gkuAbrt/m6mfDj2I/9GrnF/3el+piI/mVl93D0TQqCYzE0744gBtYv3uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=A59rjof7; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="A59rjof7"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-57d07464aa9so6640671a12.2
        for <imx@lists.linux.dev>; Wed, 26 Jun 2024 02:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1719392865; x=1719997665; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lxJDkVp4n9+n100SOtMCWceyFBnjbdm10d/AO3Twck=;
        b=A59rjof74swhIINQaaZN/WgCN7szrtfp9gAhe7EManbXQOrtJVKQhxMmvyIhVgAhN0
         qRYiQSZG7Ap2zHISpkHrrQPgdZ1lyWMb7hXKHB+B8fj70XupNlxQ5uZPKxgkkleNRJE6
         ikDB4MCHAqivFyc7idA4JfuoFfOHUTSsUHAP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719392865; x=1719997665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6lxJDkVp4n9+n100SOtMCWceyFBnjbdm10d/AO3Twck=;
        b=AfSyhM6hwlrLJTGGrH7jbOf8CA9z1jms+FRqZDMJ3utDlEfrLPj/XQ+/L0sQEdIKDH
         x3ksbdj3fM7ohJ8AwCw1dhgFWMI+HqtE3lDULVDiqVKmoUpTt52u8zATWydbfp7crjis
         gxN/HSTU7KoYCZSx4bal10+OIt7G5C9o+nreKIDpTGC2rHCPusX/Rftby7kP+upI5DM3
         RH0lgJ9Q0QDAH7fB2hMl2nzkcXB/LLeYUAgJg2iQy5LufsprKFoSUUD7+MfmJh5fi5RT
         pkBd/G/b1wOsc8S5FaEZZ33BfbqIlubtVWqn8hdMLRKGgaGASPIL/jYu5o1/X9QkxE0q
         qImQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKpERiQrfEf4nohOlWvP1+EEgJD8C3NCxplTJvvfW9KiQ8oP12/yuIuXAH+iqFwikB+mSuGcevrPLGqiaaVHI9jZg0
X-Gm-Message-State: AOJu0Yz0x3qsmFjo3hMp7jf7z7MMWZlc98dLkbWxnlX6Nx4mjT1eVo8M
	M+DiEY1a3IIDmVYUDR4PEqp/NW39jtylEazmTbJY00qn3eTIanQz8pJaRF4+KNZFT3DgG+J0V40
	ggNqeN8bJ0puEdbZi0zENpLEM3iR+bbiNG7DGjA==
X-Google-Smtp-Source: AGHT+IHykAPt//reChktNIqv1b8u1tQWErhzQtFS2JSTQpUaKUXwg3goKPI4W/qQKafT4xUP3B30jIrlQPXEK6H9lgE=
X-Received: by 2002:a50:9350:0:b0:57d:24ce:cbc8 with SMTP id
 4fb4d7f45d1cf-57d4bdcedebmr6248778a12.31.1719392865433; Wed, 26 Jun 2024
 02:07:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240626084515.2829595-1-make24@iscas.ac.cn> <AM6PR04MB594141B66F1DEB2354ADDF7B88D62@AM6PR04MB5941.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB594141B66F1DEB2354ADDF7B88D62@AM6PR04MB5941.eurprd04.prod.outlook.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Wed, 26 Jun 2024 11:07:33 +0200
Message-ID: <CAOf5uwkrGGPrfAcHO_hDQEZMvBHZ5JR9B=7=COSJLGjQV307SQ@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: mxs-dma: Add check for dma_set_max_seg_size in mxs_dma_probe()
To: Peng Fan <peng.fan@nxp.com>
Cc: Ma Ke <make24@iscas.ac.cn>, "vkoul@kernel.org" <vkoul@kernel.org>, 
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Jun 26, 2024 at 11:02=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:
>
> > Subject: [PATCH] dmaengine: mxs-dma: Add check for
> > dma_set_max_seg_size in mxs_dma_probe()
>
> Please read
> https://lore.kernel.org/all/ZiocjS6tbeTt2mPD@matsya/
>
> Regards,
> Peng.
>
> >
> > As the possible failure of the dma_set_max_seg_size(), we should
> > better check the return value of the dma_set_max_seg_size().
> >
> > Fixes: a580b8c5429a ("dmaengine: mxs-dma: add dma support for
> > i.MX23/28")
> > Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> > ---
> >  drivers/dma/mxs-dma.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c index
> > cfb9962417ef..90cbb9b04b02 100644
> > --- a/drivers/dma/mxs-dma.c
> > +++ b/drivers/dma/mxs-dma.c
> > @@ -798,7 +798,9 @@ static int mxs_dma_probe(struct
> > platform_device *pdev)
> >       mxs_dma->dma_device.dev =3D &pdev->dev;
> >
> >       /* mxs_dma gets 65535 bytes maximum sg size */
> > -     dma_set_max_seg_size(mxs_dma->dma_device.dev,
> > MAX_XFER_BYTES);
> > +     ret =3D dma_set_max_seg_size(mxs_dma->dma_device.dev,
> > MAX_XFER_BYTES);
> > +     if (ret)
> > +             return ret;
> >

If the function returns an error then you should check for it. If it's
not logical to have it, then you could
make void the function that is called and WARN_ON on an illogical situation

Michael

> >       mxs_dma->dma_device.device_alloc_chan_resources =3D
> > mxs_dma_alloc_chan_resources;
> >       mxs_dma->dma_device.device_free_chan_resources =3D
> > mxs_dma_free_chan_resources;
> > --
> > 2.25.1
> >
>
>
