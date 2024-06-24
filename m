Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF611369B1
	for <imx@lists.linux.dev>; Mon, 24 Jun 2024 12:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719231181; cv=none; b=VFjeaL3bpk7spTC0H/O/pwvk3OEZTIQXIleP21Ul13wmLLWKHh6LISWMhDmCByN/QFqL/r/pXbVNVE/AV/2jkFmmEga1b4QxDx2Lz+C0kkKWCo0Ok/7Y/cvpZ/+NqLfMvqkxY7AF8mslOIGUF/eITD8qIGQApKoWb5MxDb0GdQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719231181; c=relaxed/simple;
	bh=MaefPGkP/eVC1BUq+bhf0BpCWTj09NkDwsi6DKIEHIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mNlznODy/sbvopcF9SkquOrXvT4udaL1Tx0lZLKHsoVGk+Ql+YBO9nPPSZE6Mxi2aeSnakV6Tq9S7wwUEDjoq1XLaiXpAq9aSsjQK4cdKgDngLRm9xykZuG5L9sz61z/tgumYHEwdQjoJ/+lJqqpuJKyIInRenqvJhhopnjLBYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ClUPhKlr; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ClUPhKlr"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-643f3130ed1so11456067b3.2
        for <imx@lists.linux.dev>; Mon, 24 Jun 2024 05:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719231178; x=1719835978; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6qUn3B941SaKmnTlYImbJrnT+/A2pSZCbuhCNRlU2c=;
        b=ClUPhKlrCRSFkfNtU0v8k6S+rcF2b1q2EgXMP4M5iQHre/q3qbcg00r0tesEtY5ju9
         KYK8S1Ia7BB4aO6MbXsVmoecPXPU2nmHNXYTdK18xORETNuULM5p0uDifSxKzXvVWRJL
         0lwkUi+nq5BhxBSEWeVoG7INxwDcof0wnCNQlPWh/sUv/IZ/vK5Qd2OvfBXZB6tqPzZJ
         tWGyLaF+yU8zzctPkADMva6UzBUqCE+PhZTvdln+z+swaaaQyc1h8wLvUyVOoZFeRoc2
         5y7oO+inrHcO3TzWJLG85vp4pBeVDOHBbhvcuhV5XWll1loSyY4J3DDCQaHaV0Cns6Vd
         BXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719231178; x=1719835978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H6qUn3B941SaKmnTlYImbJrnT+/A2pSZCbuhCNRlU2c=;
        b=QU8IjTAuAtx+X4N9h7O/uPjxNCMtcjkzrJnktHvs2+8DcPtHnNndpFy+TSJcrEAFEc
         6syJkNoVWGBjvia4afDHwD2VudGtE5P8cON/xDerXuF6sgbBdjVYOQiH0AH6YCb9sIpy
         OYKNXuKnaR6AiQp8IDDEJR5637xKjKC00xGySWJpT2s8ZcANiG+msPZBDZzgeIARxE2c
         0D1lDnqW5cSDiLEphDEZ3JI+/GU2jGUJiTAYSMg+sqoXRbyCFbrrZklL+N94+8ErYq5q
         ulP25d9yjskImEtqCftgB3veNdO3Y4FDqa/lh6r+uFzN6dH5ECYAB8TN41MElLcyarAW
         0Oow==
X-Forwarded-Encrypted: i=1; AJvYcCVPAqZUiKkaVOGzsoM6ym3R/eNHGT+SjWDehU7ckVyHBN6oGLb4Eq4V5AJCgYZNocTEOWKuVKHGReFAThuKRJJB+BAu
X-Gm-Message-State: AOJu0YzIww/BN+2z8ztTrI10IgF2ldx72RZZKPuH9CyqYnGrejgZJyx/
	cgiIsaGgIccRwLRn0kvHc0oiLHmxaWJAxGOI1evTmkl+HdzC9QhSblMUD77Y9Md3NP6vWRlew6I
	QPi8EmkvJJumWVKoJIUf0Tc9OMLm/stpJN4lCmg==
X-Google-Smtp-Source: AGHT+IEF1HehGOmrnh5OAL93YehPGGcegJHyWkO5g5YUNrXsZWXxAzZkNA0qGBJHKUiwcOCe0R4VtMvMhRHHrQfF14k=
X-Received: by 2002:a81:690b:0:b0:627:7f2a:3b0a with SMTP id
 00721157ae682-6429aa00545mr43803277b3.31.1719231178522; Mon, 24 Jun 2024
 05:12:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240624-mxc-lcdif-bridge-attach-v1-1-37e8c5d5d934@linaro.org>
 <859620673.0ifERbkFSE@steina-w> <CAA8EJppQtiDxZjLMk6VB0X_4VSuC8cNhPOMd8on2uQ3xo92vSg@mail.gmail.com>
 <1984704.yKVeVyVuyW@steina-w>
In-Reply-To: <1984704.yKVeVyVuyW@steina-w>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 15:12:45 +0300
Message-ID: <CAA8EJpoKudfSF_BM9O3xXv0GV3wUkTz2x6nH3J4JzrXtk7ECzg@mail.gmail.com>
Subject: Re: [PATCH] drm/lcdif: switch to DRM_BRIDGE_ATTACH_NO_CONNECTOR
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 24 Jun 2024 at 15:03, Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi Dmitry,
>
> Am Montag, 24. Juni 2024, 13:49:03 CEST schrieb Dmitry Baryshkov:
> > On Mon, 24 Jun 2024 at 14:32, Alexander Stein
> > <alexander.stein@ew.tq-group.com> wrote:
> > >
> > > Hi,
> > >
> > > Am Montag, 24. Juni 2024, 12:31:46 CEST schrieb Dmitry Baryshkov:
> > > > Existing in-kernel device trees use LCDIF with the dsim + adv7533, =
dsim
> > > > + tc358762 or with ldb + panel_bridge. All these combinations suppo=
rt
> > > > using DRM_BRIDGE_ATTACH_NO_CONNECTOR for bridge attachment.
> > > >
> > > > Change lcdif driver to use this flag when attaching the bridge and
> > > > create drm_bridge_connector afterwards.
> > > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > > Note: compile-tested only.
> > >
> > > I gave it a try, but it doesn't work. Despite DSI output it also brea=
ks
> > > HDMI output, where I at least some error messages:
> > > [drm:drm_bridge_attach] *ERROR* failed to attach bridge /soc@0/bus@32=
c00000/hdmi@32fd8000 to encoder None-37: -22
> > > [drm:drm_bridge_attach] *ERROR* failed to attach bridge /soc@0/bus@32=
c00000/display-bridge@32fc4000 to encoder None-37: -22
> > > imx-lcdif 32fc6000.display-controller: error -EINVAL: Failed to attac=
h bridge for endpoint0
> > > imx-lcdif 32fc6000.display-controller: error -EINVAL: Cannot connect =
bridge
> > > imx-lcdif 32fc6000.display-controller: probe with driver imx-lcdif fa=
iled with error -22
> >
> > Could you please try it with the following change:
> >
> > diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> > b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> > index 13bc570c5473..c87d3e55c00d 100644
> > --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> > +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> > @@ -94,6 +94,7 @@ static int imx8mp_dw_hdmi_probe(struct platform_devic=
e *pdev)
> >         plat_data->phy_name =3D "SAMSUNG HDMI TX PHY";
> >         plat_data->priv_data =3D hdmi;
> >         plat_data->phy_force_vendor =3D true;
> > +       plat_data->output_port =3D 1;
> >
> >         hdmi->dw_hdmi =3D dw_hdmi_probe(pdev, plat_data);
> >         if (IS_ERR(hdmi->dw_hdmi))
>
> Okay, this does fix the HDMI probe errors. Nevertheless I get the errors:
> [   13.429313] [drm] Initialized imx-lcdif 1.0.0 for 32e80000.display-con=
troller on minor 1
> [   13.439116] imx-lcdif 32e80000.display-controller: [drm] Cannot find a=
ny crtc or sizes
> [   13.448168] imx-lcdif 32e80000.display-controller: [drm] Cannot find a=
ny crtc or sizes
> [   15.519737] [drm] Initialized imx-lcdif 1.0.0 for 32fc6000.display-con=
troller on minor 2
> [   15.675672] imx-lcdif 32fc6000.display-controller: [drm] Cannot find a=
ny crtc or sizes
>
> just from the lcdif patch for both HDMI and DP.

It seems, because I'm stupid and I missed drm_connector_attach_encoder().

Anyway, it looks like even if that fixes the issue, dw-hdmi needs more
work to work with drm_bridge_connector without losing access to such
features like YCbCr 420 and CEC. So thank you for the tests, but let's
probably drop the patch / idea for now.


>
> Best regards,
> Alexander
>
> >
> > >
> > > Best regards,
> > > Alexander
> > >
> > > > ---
> > > >  drivers/gpu/drm/mxsfb/lcdif_drv.c | 14 +++++++++++++-
> > > >  1 file changed, 13 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mx=
sfb/lcdif_drv.c
> > > > index 0f895b8a99d6..1d5508449995 100644
> > > > --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> > > > +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> > > > @@ -16,6 +16,7 @@
> > > >
> > > >  #include <drm/drm_atomic_helper.h>
> > > >  #include <drm/drm_bridge.h>
> > > > +#include <drm/drm_bridge_connector.h>
> > > >  #include <drm/drm_drv.h>
> > > >  #include <drm/drm_encoder.h>
> > > >  #include <drm/drm_fbdev_dma.h>
> > > > @@ -48,6 +49,7 @@ static int lcdif_attach_bridge(struct lcdif_drm_p=
rivate *lcdif)
> > > >  {
> > > >       struct device *dev =3D lcdif->drm->dev;
> > > >       struct device_node *ep;
> > > > +     struct drm_connector *connector;
> > > >       struct drm_bridge *bridge;
> > > >       int ret;
> > > >
> > > > @@ -96,13 +98,23 @@ static int lcdif_attach_bridge(struct lcdif_drm=
_private *lcdif)
> > > >                       return ret;
> > > >               }
> > > >
> > > > -             ret =3D drm_bridge_attach(encoder, bridge, NULL, 0);
> > > > +             ret =3D drm_bridge_attach(encoder, bridge, NULL, DRM_=
BRIDGE_ATTACH_NO_CONNECTOR);
> > > >               if (ret) {
> > > >                       of_node_put(ep);
> > > >                       return dev_err_probe(dev, ret,
> > > >                                            "Failed to attach bridge=
 for endpoint%u\n",
> > > >                                            of_ep.id);
> > > >               }
> > > > +
> > > > +             connector =3D drm_bridge_connector_init(lcdif->drm, e=
ncoder);
> > > > +             if (IS_ERR(connector)) {
> > > > +                     ret =3D PTR_ERR(connector);
> > > > +                     of_node_put(ep);
> > > > +
> > > > +                     return dev_err_probe(dev, ret,
> > > > +                                          "Failed to create bridge=
 connector for endpoint%u\n",
> > > > +                                          of_ep.id);
> > > > +             }
> > > >       }
> > > >
> > > >       return 0;
> > > >
> > > > ---
> > > > base-commit: f76698bd9a8ca01d3581236082d786e9a6b72bb7
> > > > change-id: 20240624-mxc-lcdif-bridge-attach-60368807b2f9
> > > >
> > > > Best regards,
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
> >
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


--=20
With best wishes
Dmitry
