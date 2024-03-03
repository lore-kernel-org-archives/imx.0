Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C22267C43
	for <imx@lists.linux.dev>; Sun,  3 Mar 2024 15:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709480657; cv=none; b=SAkugvIVioWuETCdleBWdVLupIJ2B50bnF8NypR9sylE8psoMoDTrev4UF4SbPoP+n3YcRPncNqPL3R9eNlEgq/Lsn2TG9t5/qlqXDgdgKVquusA8fVmlPABOcgd5SwLowGFmhRv9NPYXSOE60+h+Qn+BtIZ+hMdyoHI0m0FWiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709480657; c=relaxed/simple;
	bh=Pq1xs9swixQ3S4BcqZ6BTxVKKAgiy8m15Wu0wILEoqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YcsIfFtUiDxQtgs+A+Ll1Nar8D+G0vB+Z7w+TvT2KcXG31b+90brmH2dKFJsOvZq/CGVL//OjHrGF26tBOo5PE5fgB2Krqbi10NAjaKlexBSridt+sTgWJYK+3U0nXG4lf6R+vkgaN2m5PJfd5WMAzA6l32Dp5zbqFuYZYP/cz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aBNGEL5L; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aBNGEL5L"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1dc29f1956cso28932715ad.0
        for <imx@lists.linux.dev>; Sun, 03 Mar 2024 07:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709480654; x=1710085454; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eS5rXsUD0/yP0O/b336cGPihzWh42DmpRxXHDyRlWmk=;
        b=aBNGEL5LXse7pGLmNH/uQhwT8alRKwh1IaWNFGBY0uSsMrwJCpHspauuiagJQjwLa8
         a1iSUSmOiXGjInbEA6n1hiqKs9wrpaLqNOND9pMHVftb6/78MCmhxttcMIs6GHOfbzik
         zw7ItkD0/p489Gz86Kd9MdUOhV6103BmQZDEvUcUtv1JMzzFrpVSalwBAWjBMCQbuXNH
         WZPPcr2NAi4P3PZCijW0xaFPxKkZApMQjnBcZT/SYceTB4gCp2AJOczVTdBOizljWD02
         ZovQ+jQMGu8YFymOaAVmfZ65wG7GS5MFqCCS+391t513THbpXOHMqY+dCc5+EEfu8iFj
         QzhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709480654; x=1710085454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eS5rXsUD0/yP0O/b336cGPihzWh42DmpRxXHDyRlWmk=;
        b=SAB6WX8MgLhRr1zc0ChaiFk47EvJmiVjzIqk32V+jYxxjBC1d90TKNlH66ZlZY7JDT
         mXTSBVe6tTNyw0h3ic4QUQH1osc6YV84W3+36/TbRMEy693x2fI2Mu1vV9SdwIo1TP0z
         +MO+/npswtLLacfQW3AtPJTfKLYGWZpLLHSSLgzcjkY4GV4BGfGycpAzBju0cvXsIEUC
         Ewk41UYnx2D7ghnJPTdD2hb0g/bEzBarP8ZF6xnqD3a0Lr0aHq5u3BhW2Y/Mq8eUGaNq
         qvvUCfOK5OeiS7jb9cEDCdEtyVvH6BATheuwW0SKYs74tiRWZDTM71wRDr02yKfnfNRq
         XyvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUnXOWiGY5yHyvzIhpYwJSg9FNBHmqgmxezakBM5zhvrYKHhr6F0BU2Lq6SXN81UZbQ3Kpx5daRXzMm3KYyUz0tFmu
X-Gm-Message-State: AOJu0YyXUL2Wzg6caadEg2MQ73dEwT9aoH1nsOa44sRgXUNNIxGuetzs
	e1RROkqMFXDFNuuIm5EKneeJQ4HUX5gesjshHAzhVwuH1oPMx/7HFy+/3OCsdbmSR43qJsDmvXl
	Y2v/vUWfRIb0dKoniYermamelZGI=
X-Google-Smtp-Source: AGHT+IGS6ew4nXt5BAU7Sc1tW8kxz61GMLFbWf8a7QA3VlraCLCBHo9R/O9Y4HzIfJGI2oHtZRtm2+wi4R98LC4v56A=
X-Received: by 2002:a17:902:db0e:b0:1dc:524:6da4 with SMTP id
 m14-20020a170902db0e00b001dc05246da4mr6348460plx.8.1709480654469; Sun, 03 Mar
 2024 07:44:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240228113737.43434-1-aford173@gmail.com> <20240228163153.GH9863@pendragon.ideasonboard.com>
In-Reply-To: <20240228163153.GH9863@pendragon.ideasonboard.com>
From: Adam Ford <aford173@gmail.com>
Date: Sun, 3 Mar 2024 09:44:03 -0600
Message-ID: <CAHCN7xLGL5gMhd7Fo907gPScdD15KW==BHSorQMjbd-=k-E9OA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/bridge: adv7511: Allow IRQ to share GPIO pins
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	aford@beaconembedded.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 10:31=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Adam,
>
> Thank you for the patch.
>
> On Wed, Feb 28, 2024 at 05:37:35AM -0600, Adam Ford wrote:
> > The IRQ registration currently assumes that the GPIO is
> > dedicated to it, but that may not necessarily be the case.
> > If the board has another device sharing the IRQ, it won't be
> > registered and the hot-plug detect fails.  This is easily
> > fixed by add the IRQF_SHARED flag.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> >
> > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu=
/drm/bridge/adv7511/adv7511_drv.c
> > index b5518ff97165..21f08b2ae265 100644
> > --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > @@ -1318,7 +1318,8 @@ static int adv7511_probe(struct i2c_client *i2c)
> >
> >               ret =3D devm_request_threaded_irq(dev, i2c->irq, NULL,
> >                                               adv7511_irq_handler,
> > -                                             IRQF_ONESHOT, dev_name(de=
v),
> > +                                             IRQF_ONESHOT | IRQF_SHARE=
D,
> > +                                             dev_name(dev),
>
> This looks fine, but the IRQ handler doesn't.

Thanks for the review.

>
> static int adv7511_irq_process(struct adv7511 *adv7511, bool process_hpd)
> {
>         unsigned int irq0, irq1;
>         int ret;
>
>         ret =3D regmap_read(adv7511->regmap, ADV7511_REG_INT(0), &irq0);
>         if (ret < 0)
>                 return ret;
>
>         ret =3D regmap_read(adv7511->regmap, ADV7511_REG_INT(1), &irq1);
>         if (ret < 0)
>                 return ret;

If I did a check here and returned if there was no IRQ to handle,
would that be sufficient?

--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -477,6 +477,11 @@ static int adv7511_irq_process(struct adv7511
*adv7511, bool process_hpd)
        if (ret < 0)
                return ret;

+       /* If there is no IRQ to handle, exit indicating no IRQ handled */
+       if (!(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
+          !(irq1 & ADV7511_INT1_DDC_ERROR))
+               return -1;
+
        regmap_write(adv7511->regmap, ADV7511_REG_INT(0), irq0);
        regmap_write(adv7511->regmap, ADV7511_REG_INT(1), irq1);

With this, I would expect adv7511_irq_handler to return IRQ_NONE.  If
you're OK with that approach, I can do that.  If you want me to merge
adv7511_irq_handler, and adv7511_irq_process, I can do that too to
make the return codes a little more intuitive.

adam

>
>         regmap_write(adv7511->regmap, ADV7511_REG_INT(0), irq0);
>         regmap_write(adv7511->regmap, ADV7511_REG_INT(1), irq1);
>
>         if (process_hpd && irq0 & ADV7511_INT0_HPD && adv7511->bridge.enc=
oder)
>                 schedule_work(&adv7511->hpd_work);
>
>         if (irq0 & ADV7511_INT0_EDID_READY || irq1 & ADV7511_INT1_DDC_ERR=
OR) {
>                 adv7511->edid_read =3D true;
>
>                 if (adv7511->i2c_main->irq)
>                         wake_up_all(&adv7511->wq);
>         }
>
> #ifdef CONFIG_DRM_I2C_ADV7511_CEC
>         adv7511_cec_irq_process(adv7511, irq1);
> #endif
>
>         return 0;
> }
>
> static irqreturn_t adv7511_irq_handler(int irq, void *devid)
> {
>         struct adv7511 *adv7511 =3D devid;
>         int ret;
>
>         ret =3D adv7511_irq_process(adv7511, true);
>         return ret < 0 ? IRQ_NONE : IRQ_HANDLED;
> }
>
> The function will return IRQ_HANDLED as long as the registers can be
> read, even if they don't report any interrupt.
>
> >                                               adv7511);
> >               if (ret)
> >                       goto err_unregister_audio;
>
> --
> Regards,
>
> Laurent Pinchart
