Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4873285624
	for <imx@lists.linux.dev>; Thu,  4 Apr 2024 12:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712232063; cv=none; b=hrc0Xsuvb2DdPqsERRTCudxTDtO317/ayscfJ8AnmTPwweASUmoMqC8rgkA49JhjTpaZb+lP9+l0jzSO9cfan+z+c9wqDjxjv6/GcAaCHYpA4Na5oeTVoBvvrrUCFPbbDVzQC4GZx/bB5LPYEvUEGdhmbiOEcwAf2n1UoaELCRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712232063; c=relaxed/simple;
	bh=Aqeqvw4GrvT18e980JUpO21rtv2qBW15mhfK8EzHsvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Na70TxuYkDB65Z8YXOh3vy92mefAWhEj5//XqXSqj9GsXYtBhPVYw1EPzlMDCjvH8mK0kABP+cbVKu8pT6cJT9f0xYDMLZ5G1ycMcTTcVa9QN2SQd+J+gC+bpVukooMYf8+Tpe+yGLqSHKgnGZpE6fC7N2gwpCFdKOMTIL0NVU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aq2Vpy2J; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aq2Vpy2J"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1e2178b2cf2so7866405ad.0
        for <imx@lists.linux.dev>; Thu, 04 Apr 2024 05:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712232061; x=1712836861; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wL4i2rxVSO4Dx2Z9A/DMCu9nioCZUVI1YGXCUgVZyec=;
        b=Aq2Vpy2J6IWNXARVbFufQAFtJQY3O67/DWe/eKTnq6NznpxTZhqk4Wk423TpdZu8gR
         Ww3tHVXthZFpXO0ZAH1hl+KU2+ALyCVLMFLfUtW8qwJp927H94AYrLKGYTdB029SdVv2
         1ndPcl1ObVgXE7TxwPXVFLQevXiu91q/ktGDUUDU9Nobih/KQhoNETq/WSi36QmmsGec
         hcwRkOPgPsbYKz9589jkvWyc0G1snD3ROX7UNsbb+PjBBhl9WZbaTcw47j7SemoQtP4v
         ZgVgAaT/XvGkPxcogrphhwo9c70vnsVUO2bTj/IqHQ3ZmXbgw0nTgNVE+gZeQhAONXQb
         8olg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712232061; x=1712836861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wL4i2rxVSO4Dx2Z9A/DMCu9nioCZUVI1YGXCUgVZyec=;
        b=ZDosZheuiG5w9bUdMr0B2c99PMQlVPreQ0vf1sgHhYbXjQueRC5Lwq1n5jA+NZnxre
         04nZY3bSdhgd8bvKQJkUIBXoIDGeo6M5nhRjFs7lMv7TEWmxi9eaV32V3NbDeRdj5Wzs
         WBqMNbFS3NjF3IlFsyYcnkLf4w2pxBOzXohddJbxDd8ECvWYaV4Nc6uYMIKN1PYe4/jy
         eLXK0ETD2XizO+z7zCHl7d3wusO9x2YtMovGRAxtdiJXBMnrmZo1aHq+FQ1PHsZ6CAVG
         4+exgF0OG+qxTO1eKhwVqX+GGOeQEr+ZSJmUqr8OeyU9ewonpDyQn/0NZM4yXtFY9Fsb
         PacA==
X-Forwarded-Encrypted: i=1; AJvYcCWy6WM4/3c4WKHLShHe180nWrU1zEXuShkId+6sUAJyf588BwP+42pO1V7/FSBVjdnI20zheteFa/utzRtwKTzndlw4
X-Gm-Message-State: AOJu0YxetfETvKVbWs8c8HocWzU6N8oZC3QvCBxWAsfjPj9IV99u9KJT
	3wKSm/2rE3WVDbgZvX2iiHa/yzFy9SAVUb/Mvw1dqmok2MYrus2aeOEAWYzh2mASBQaC12HUGgU
	WAQALiqwW8T0Fw2Srp5ofD3ObwgY=
X-Google-Smtp-Source: AGHT+IGcM7phzQ4a6LWlb+ZbUy46QOrWqPtD6hZ2VF2T8uxuZk2nkBNtUNgHlEIleOyY0tflROY1ahFFF1Z2hTRU4SA=
X-Received: by 2002:a17:902:7282:b0:1e2:7356:aa31 with SMTP id
 d2-20020a170902728200b001e27356aa31mr1882050pll.34.1712232061199; Thu, 04 Apr
 2024 05:01:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240305004859.201085-1-aford173@gmail.com> <20240305081816.GF12503@pendragon.ideasonboard.com>
In-Reply-To: <20240305081816.GF12503@pendragon.ideasonboard.com>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 4 Apr 2024 07:00:49 -0500
Message-ID: <CAHCN7xKwScoXouUHyH=dPZ0fgibmEUXRFwFPUF8mdKMf8YNA2g@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] drm/bridge: adv7511: Allow IRQ to share GPIO pins
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, aford@beaconembedded.com, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 5, 2024 at 2:18=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hello Adam,
>
> Thank you for the patch.
>
> On Mon, Mar 04, 2024 at 06:48:57PM -0600, Adam Ford wrote:
> > The IRQ registration currently assumes that the GPIO is dedicated
> > to it, but that may not necessarily be the case. If the board has
> > another device sharing the GPIO, it won't be registered and the
> > hot-plug detect fails to function.
> >
> > Currently, the handler reads two registers and blindly
> > assumes one of them caused the interrupt and returns IRQ_HANDLED
> > unless there is an error. In order to properly do this, the IRQ
> > handler needs to check if it needs to handle the IRQ and return
> > IRQ_NONE if there is nothing to handle.  With the check added
> > and the return code properly indicating whether or not it there
> > was an IRQ, the IRQF_SHARED can be set to share a GPIO IRQ.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>


Gentle nudge on this one.   It's been about a month, and without it,
it is preventing hot-plug detection on one board for me.

Thanks

adam

>
> > ---
> > V2:  Add check to see if there is IRQ data to handle
> >
> > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu=
/drm/bridge/adv7511/adv7511_drv.c
> > index b5518ff97165..f3b4616a8fb6 100644
> > --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > @@ -477,6 +477,11 @@ static int adv7511_irq_process(struct adv7511 *adv=
7511, bool process_hpd)
> >       if (ret < 0)
> >               return ret;
> >
> > +     /* If there is no IRQ to handle, exit indicating no IRQ data */
> > +     if (!(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
> > +         !(irq1 & ADV7511_INT1_DDC_ERROR))
> > +             return -ENODATA;
> > +
> >       regmap_write(adv7511->regmap, ADV7511_REG_INT(0), irq0);
> >       regmap_write(adv7511->regmap, ADV7511_REG_INT(1), irq1);
> >
> > @@ -1318,7 +1323,8 @@ static int adv7511_probe(struct i2c_client *i2c)
> >
> >               ret =3D devm_request_threaded_irq(dev, i2c->irq, NULL,
> >                                               adv7511_irq_handler,
> > -                                             IRQF_ONESHOT, dev_name(de=
v),
> > +                                             IRQF_ONESHOT | IRQF_SHARE=
D,
> > +                                             dev_name(dev),
> >                                               adv7511);
> >               if (ret)
> >                       goto err_unregister_audio;
>
> --
> Regards,
>
> Laurent Pinchart
