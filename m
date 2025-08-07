Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1498C23D281
	for <imx@lists.linux.dev>; Thu,  7 Aug 2025 07:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754552576; cv=none; b=MMgJHhs39+/rO3TIVpb/MWcUyYDyrYOf5OoK+ZGTbmMsy7z1Gu3EPokmKRfYSAZ3mG8T6I2BGCAehWAt4F/n0HzQYLzaUh19Utv0OilTLBpzxd//BRxoL5hXgAq1ts8XT2iFHxtfLFBbRVokgAtiZo+kNoBJ9BVeqB3GOUTflbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754552576; c=relaxed/simple;
	bh=HQgZxozEInQGtZeitnlKUz/X/aogQK/xmKgDuDLRE/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VKkhWL6x+MuTSet9fEN7DUagBq63YF6siHENtcEJ0hgEtz/yqMTTXP+Jr5+NAK9HBmEKPL7GHLRsE2qNpzxj36tm8mST2+j0c+WdoJZbSPEf68KbIVSkUsOPxM/nx6iWfVW3ulV/uvRhHgbwSZuJEYWhnb0MkTROL6DkKOC7XTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B3ozpYZs; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B3ozpYZs"
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-879c734f0e2so12362239f.0
        for <imx@lists.linux.dev>; Thu, 07 Aug 2025 00:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754552573; x=1755157373; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Yib2PCEaqNp1Pj8TAlHvoEegTED9u37QcVhIiDH6gc=;
        b=B3ozpYZsF+XF1LHNlXMpSjSOOZvZDJ7aiJUMGzZcJwgiVunum5HVp7TyT3dTmNWS4e
         nU2g9+VXpMp9zXV2gQniRZwNY1tKAKLE5FvlyWzHTpJPTXWsqFgbDfpez5HV9QITCpfJ
         d/my91Qmgc3cCzNUsP74WaOj8OqBnAV/1NLxjzoWZoOUNdjXlGJHyzrrHuJPAs+Y6QtC
         jwitnju0SMNSHaL9AByWk+p9rSft98d1mKU8tqu8lA5dGhWll815cDPPd9SZCZf1au9V
         93+tPJgmX4rjEzKC1dDow8vBfSmAd0hBEEKPoWbbzKpC95DHc0eacCZNBIGGFs037yDK
         dZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754552573; x=1755157373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Yib2PCEaqNp1Pj8TAlHvoEegTED9u37QcVhIiDH6gc=;
        b=uc4kXBkG35FtBGpt/7mabGmQe2vFNkeHnT0fhg3KC0tqIuphQEXKvXVStBNbtvEKah
         7oCEtl03SFEujwg1QbqscdRPRNqrXgypzFY3/jL4xZFSO45EExG7sjL5yqEUTbzs1X39
         eggMB03lEhNNCPUWMbmrDdQpKOV+7n7t25v+YXpdlXfcbmXHkWyR6v1otd6ryk87Ej0p
         aT+CvVwc9mW6+uai7RReMs29eo84P0gfpA5K1Kzo6+XcP7XUIAipW0TD3PjgHz+uyW2B
         vBsHNcHy25ghK/D/ryD/FjxEfahUo4RAtVI1Uxp4N2zjlVbTMFCdqi4nOBYEVPwQ+u2D
         C4Vg==
X-Forwarded-Encrypted: i=1; AJvYcCXU8gZW726kEHyYh0xrKhnn2LEnyNvAFELB1ZAYLQgtyvExW0oCVUHGEfdz+MYj2mFdusQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywtt/5KE2dj+fhaQJY6QVS/Ytc5bZQzsnBsTEQncjBoj+Lndv53
	Tt2QfhOrJ8zfIlHiE9M55DGdOnX9eXlrlTjcu0cjTNyVIadnsIupBF6TfwGXwx3KCxhTqu0FpCs
	uXJikx2w7Nr4QPJgAg9PfAIOiuY7sMAE=
X-Gm-Gg: ASbGncvU8AGE/r484BgAbOCgPd/mqBKshkyvEyedDd9lQ3sDxj+s0WWit2qu/Bl41Qd
	CgCCvE7QxsEKPKLrmM+sAq1gZirZZRwvpPHEHjuFaV71Jk6Ga5Lvm7rXoZocyzqo9BaystEL3HN
	tagPIBGBsCF12Uponhsso9qZySRrvdAjbnjOLNYNQciyJy52Mmo0BzjtxNLj9KfZ31aMLrv4XfP
	+V31nM=
X-Google-Smtp-Source: AGHT+IHdqQFtfjRtDehIGRFADkvBaA4NvCzKMcHYFjCPCJ2UEYMmg8NkMVh8psgCR7M3BrtP7IfXADIqspKMXA8NOUE=
X-Received: by 2002:a05:6e02:3f08:b0:3e3:f1e9:635f with SMTP id
 e9e14a558f8ab-3e51b8985cdmr117142635ab.8.1754552572965; Thu, 07 Aug 2025
 00:42:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250804104722.601440-1-shengjiu.wang@nxp.com>
 <2380862.ElGaqSPkdT@steina-w> <CAA+D8AMqBqfRuR7oGLwH4CUrAdY4q1XGmnPXGQYUGndY0eS=yw@mail.gmail.com>
 <3006103.e9J7NaK4W3@steina-w>
In-Reply-To: <3006103.e9J7NaK4W3@steina-w>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 7 Aug 2025 15:42:40 +0800
X-Gm-Features: Ac12FXyRnD4EHNKIjcnFtD3LudiK7-g39dWsOJVNfZbpF_BspGvpp8foyFbcxgc
Message-ID: <CAA+D8ANb_9GQTGCV0c5y517aSbQNnAu4wYvDhc4QPd+RqOhjbQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] drm/bridge: imx: add driver for HDMI TX Parallel
 Audio Interface
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org, 
	l.stach@pengutronix.de, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 7, 2025 at 2:48=E2=80=AFPM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi,
>
> Am Mittwoch, 6. August 2025, 05:49:13 CEST schrieb Shengjiu Wang:
> > On Tue, Aug 5, 2025 at 3:09=E2=80=AFPM Alexander Stein
> > <alexander.stein@ew.tq-group.com> wrote:
> > [snip]
> > > > +static int imx8mp_dw_hdmi_bind(struct device *dev)
> > > > +{
> > > > +     struct dw_hdmi_plat_data *plat_data;
> > > > +     struct imx8mp_hdmi *hdmi;
> > > > +     int ret;
> > > > +
> > > > +     hdmi =3D dev_get_drvdata(dev);
> > > > +     plat_data =3D &hdmi->plat_data;
> > > > +
> > > > +     ret =3D component_bind_all(dev, plat_data);
> > >
> > > Do you really need plat_data variable?
> >
> > yes,  it is used in imx8mp_hdmi_pai_bind()
>
> Sorry for not being clear. I'm not talking about struct dw_hdmi_plat_data=
, but
> the local variable plat_data. You can use
>
> ret =3D component_bind_all(dev, &hdmi->plat_data);
>
> directly.

Ok,  will update the code.

>
> >
> > >
> > > > +     if (ret)
> > > > +             return dev_err_probe(dev, ret, "component_bind_all fa=
iled!\n");
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static void imx8mp_dw_hdmi_unbind(struct device *dev)
> > > > +{
> > > > +     struct dw_hdmi_plat_data *plat_data;
> > > > +     struct imx8mp_hdmi *hdmi;
> > > > +
> > > > +     hdmi =3D dev_get_drvdata(dev);
> > > > +     plat_data =3D &hdmi->plat_data;
> > > > +
> > > > +     component_unbind_all(dev, plat_data);
> > >
> > > Do you really need plat_data variable?
> >
> > yes,  it is used by imx8mp_hdmi_pai_unbind()
>
> Same as above. Call
>
> component_unbind_all(dev, &hdmi->plat_data)
>
> directly. Also consider assigning struct imx8mp_hdmi *hdmi =3D dev_get_dr=
vdata(dev);
> directly.

Ok,  will update the code. Thanks.

Best regards
Shengjiu Wang
>
> Best regards,
> Alexander
>
> >
> > >
> > > > +}
> > > > +
> > > > +static const struct component_master_ops imx8mp_dw_hdmi_ops =3D {
> > > > +     .bind   =3D imx8mp_dw_hdmi_bind,
> > > > +     .unbind =3D imx8mp_dw_hdmi_unbind,
> > > > +};
> > > > +
> > > >  static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
> > > >  {
> > > >       struct device *dev =3D &pdev->dev;
> > > >       struct dw_hdmi_plat_data *plat_data;
> > > > +     struct component_match *match;
> > >
> > > Set match =3D NULL for drm_of_component_match_add (and subcalls) to a=
llocate memory.
> >
> > Ok.
> >
> > best regards
> > Shengjiu wang.
> > >
> > > Best regards
> > > Alexander
> > >
> > > > +     struct device_node *remote;
> > > >       struct imx8mp_hdmi *hdmi;
> > > > +     int ret;
> > > >
> > > >       hdmi =3D devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
> > > >       if (!hdmi)
> > > > @@ -108,6 +145,22 @@ static int imx8mp_dw_hdmi_probe(struct platfor=
m_device *pdev)
> > > >
> > > >       platform_set_drvdata(pdev, hdmi);
> > > >
> > > > +     /* port@2 is for hdmi_pai device */
> > > > +     remote =3D of_graph_get_remote_node(pdev->dev.of_node, 2, 0);
> > > > +     if (remote && of_device_is_available(remote)) {
> > > > +             drm_of_component_match_add(dev, &match, component_com=
pare_of, remote);
> > > > +
> > > > +             of_node_put(remote);
> > > > +
> > > > +             ret =3D component_master_add_with_match(dev, &imx8mp_=
dw_hdmi_ops, match);
> > > > +             if (ret)
> > > > +                     dev_warn(dev, "Unable to register aggregate d=
river\n");
> > > > +             /*
> > > > +              * This audio function is optional for avoid blocking=
 display.
> > > > +              * So just print warning message and no error is retu=
rned.
> > > > +              */
> > > > +     }
> > > > +
> > > >       return 0;
> > > >  }
> > > >
> > > > @@ -115,6 +168,8 @@ static void imx8mp_dw_hdmi_remove(struct platfo=
rm_device *pdev)
> > > >  {
> > > >       struct imx8mp_hdmi *hdmi =3D platform_get_drvdata(pdev);
> > > >
> > > > +     component_master_del(&pdev->dev, &imx8mp_dw_hdmi_ops);
> > > > +
> > > >       dw_hdmi_remove(hdmi->dw_hdmi);
> > > >  }
> > > >
> > > > diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_h=
dmi.h
> > > > index 095cdd9b7424..336f062e1f9d 100644
> > > > --- a/include/drm/bridge/dw_hdmi.h
> > > > +++ b/include/drm/bridge/dw_hdmi.h
> > > > @@ -143,6 +143,12 @@ struct dw_hdmi_plat_data {
> > > >                                          const struct drm_display_i=
nfo *info,
> > > >                                          const struct drm_display_m=
ode *mode);
> > > >
> > > > +     /*
> > > > +      * priv_audio is specially used for additional audio device t=
o get
> > > > +      * driver data through this dw_hdmi_plat_data.
> > > > +      */
> > > > +     void *priv_audio;
> > > > +
> > > >       /* Platform-specific audio enable/disable (optional) */
> > > >       void (*enable_audio)(struct dw_hdmi *hdmi, int channel,
> > > >                            int width, int rate, int non_pcm, int ie=
c958);
> > > >
> > >
> > >
> > > --
> > > TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld=
, Germany
> > > Amtsgericht M=C3=BCnchen, HRB 105018
> > > Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stef=
an Schneider
> > > http://www.tq-group.com/
> > >
> > >
> >
>
>
> --
> TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Ge=
rmany
> Amtsgericht M=C3=BCnchen, HRB 105018
> Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan S=
chneider
> http://www.tq-group.com/
>
>
