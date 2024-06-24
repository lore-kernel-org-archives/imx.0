Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0626B45BE3
	for <imx@lists.linux.dev>; Mon, 24 Jun 2024 11:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719229758; cv=none; b=Lnv3P4Rbh/LBwrNUYNKW8fB+Z+PgOEyc5hLjUKzMKgVMthQIp4RRPP5N5oVe7jar6iilz23I6Hot6/+6CCbjxW0zMQb5mVLmr0pdzUHOmvqpli2PEApZoht1plFM3jf9ysBZKusuzv04L7v5SlHHnlKPRNPv5tjXdSg5Ne/yQpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719229758; c=relaxed/simple;
	bh=3CWoi5Gz3gp6QlUn+BkZlres7TdjUCPgGEgGNcjAg3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mmz3q7D5cVQhOaTe6m+4+AL3STL4gz2gQLxeP9kWRz5z2p+JFgY8/noMUKmzstViIAbFI6SiQFHcsCJRAAX1FFoJd6yvynoWeFT05qbmOgUY8+uIRt7gzoDm7foPcyAuWJPenHMeB7RwOHpay4tYlFCqjvYLgRktTNjtlva7Ykc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JBQXEL3E; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JBQXEL3E"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e0272692096so3547004276.1
        for <imx@lists.linux.dev>; Mon, 24 Jun 2024 04:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719229756; x=1719834556; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mkA/z1l9YpCOLu/cX4kLST/VORs4QaQkWnqqTvlwZPM=;
        b=JBQXEL3E6BO/3X3YksNu2/dILSgf9H1S2x1mxH3q9TjI9tjWEmuQ8yPKmQ5aZQLStW
         TxrkhE8HIlCGe7a1cuPNCg8NsoDZTtNEVpSFUttsSMRt/kSMwjRyh270D/JBwPvbe2BZ
         oAzTDrmg4wETfFInqMiJ4MEbu3ZWrWLC5gn4pMhsdWYILd1ZbQALkhPoLKbFGZYWH4pu
         Neo9SA+eRgD1y430g/WRusNYc2exTBZBKr72pTbApcoh/L2F+sqzVDPDQHy7dAUEpk27
         vkHUGQygSCnEA5izAMZK2e3zuruR5WjNvmBltCjDBmmLmRVcPJ81RC0z3YZU8Mx4ZYFL
         4O7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719229756; x=1719834556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mkA/z1l9YpCOLu/cX4kLST/VORs4QaQkWnqqTvlwZPM=;
        b=J8+rM7FpUzHntvY3NWaPRpG/qfGLIsp2kf2VAOvtR9fdgMncaML6l2vwUWR/iMef/R
         n07mUVTX80rP0BIe8zgZHstd17GOaSMU9ygoTmmCGdxj3ZSRlpu0PRLPkbCn1X05uTiy
         DJ43W1xNe2TDCtU/2iI9Fk6onDm3Ow3iPaP6pMvwozzr/XT5E/mqATt3j8doAgrFJDEu
         92xW622QZDoOucSq6Nwcz/DUi8LEfTwPe1ZL9Ap3UL2VsaD0QxN26b+SH9ctZfMZBR/p
         BGEK6C9qclzsP8v5myPiw8I1ptRMcznOM2rN7ERG+ne+9V2keS0QvCu/2xqe2Lakr1I8
         mzyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmn6MrNL24M/o6XnIWwrt3ZbZAp3+GwR09wYOd0jtr8ikuoibjZs3YN9rk6mXAeKvuuFnOBUnQ+pL69GP8RqiiTPfe
X-Gm-Message-State: AOJu0YywO1FuLs7C/tCk2j074jgwSG+O1xd1KAS27tjzKlbWXoOyJP2d
	70oLiW42yZXC8kaWZT87t2XwyKVSzTOkEyGg9zeL8XB87bUH9eqFTSYPy9jivIUGKs03DG7LIge
	vjg+0snScHyBTCGHvIrUUhVse4JAb4BmBLThbsg==
X-Google-Smtp-Source: AGHT+IFd9TlWtmtn5DwmKwZMZIwIbV3oYXTGDHovHK4lBMEBgjrMyjz7XYp6QERTqmQdXziI3ZktfSK5+Ivy8M+6820=
X-Received: by 2002:a05:6902:311:b0:dfe:4ab9:1cc1 with SMTP id
 3f1490d57ef6-e030109b1cemr3737428276.40.1719229755986; Mon, 24 Jun 2024
 04:49:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240624-mxc-lcdif-bridge-attach-v1-1-37e8c5d5d934@linaro.org> <859620673.0ifERbkFSE@steina-w>
In-Reply-To: <859620673.0ifERbkFSE@steina-w>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 14:49:03 +0300
Message-ID: <CAA8EJppQtiDxZjLMk6VB0X_4VSuC8cNhPOMd8on2uQ3xo92vSg@mail.gmail.com>
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

On Mon, 24 Jun 2024 at 14:32, Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi,
>
> Am Montag, 24. Juni 2024, 12:31:46 CEST schrieb Dmitry Baryshkov:
> > Existing in-kernel device trees use LCDIF with the dsim + adv7533, dsim
> > + tc358762 or with ldb + panel_bridge. All these combinations support
> > using DRM_BRIDGE_ATTACH_NO_CONNECTOR for bridge attachment.
> >
> > Change lcdif driver to use this flag when attaching the bridge and
> > create drm_bridge_connector afterwards.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Note: compile-tested only.
>
> I gave it a try, but it doesn't work. Despite DSI output it also breaks
> HDMI output, where I at least some error messages:
> [drm:drm_bridge_attach] *ERROR* failed to attach bridge /soc@0/bus@32c000=
00/hdmi@32fd8000 to encoder None-37: -22
> [drm:drm_bridge_attach] *ERROR* failed to attach bridge /soc@0/bus@32c000=
00/display-bridge@32fc4000 to encoder None-37: -22
> imx-lcdif 32fc6000.display-controller: error -EINVAL: Failed to attach br=
idge for endpoint0
> imx-lcdif 32fc6000.display-controller: error -EINVAL: Cannot connect brid=
ge
> imx-lcdif 32fc6000.display-controller: probe with driver imx-lcdif failed=
 with error -22

Could you please try it with the following change:

diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
index 13bc570c5473..c87d3e55c00d 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
@@ -94,6 +94,7 @@ static int imx8mp_dw_hdmi_probe(struct platform_device *p=
dev)
        plat_data->phy_name =3D "SAMSUNG HDMI TX PHY";
        plat_data->priv_data =3D hdmi;
        plat_data->phy_force_vendor =3D true;
+       plat_data->output_port =3D 1;

        hdmi->dw_hdmi =3D dw_hdmi_probe(pdev, plat_data);
        if (IS_ERR(hdmi->dw_hdmi))


>
> Best regards,
> Alexander
>
> > ---
> >  drivers/gpu/drm/mxsfb/lcdif_drv.c | 14 +++++++++++++-
> >  1 file changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/=
lcdif_drv.c
> > index 0f895b8a99d6..1d5508449995 100644
> > --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> > +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> > @@ -16,6 +16,7 @@
> >
> >  #include <drm/drm_atomic_helper.h>
> >  #include <drm/drm_bridge.h>
> > +#include <drm/drm_bridge_connector.h>
> >  #include <drm/drm_drv.h>
> >  #include <drm/drm_encoder.h>
> >  #include <drm/drm_fbdev_dma.h>
> > @@ -48,6 +49,7 @@ static int lcdif_attach_bridge(struct lcdif_drm_priva=
te *lcdif)
> >  {
> >       struct device *dev =3D lcdif->drm->dev;
> >       struct device_node *ep;
> > +     struct drm_connector *connector;
> >       struct drm_bridge *bridge;
> >       int ret;
> >
> > @@ -96,13 +98,23 @@ static int lcdif_attach_bridge(struct lcdif_drm_pri=
vate *lcdif)
> >                       return ret;
> >               }
> >
> > -             ret =3D drm_bridge_attach(encoder, bridge, NULL, 0);
> > +             ret =3D drm_bridge_attach(encoder, bridge, NULL, DRM_BRID=
GE_ATTACH_NO_CONNECTOR);
> >               if (ret) {
> >                       of_node_put(ep);
> >                       return dev_err_probe(dev, ret,
> >                                            "Failed to attach bridge for=
 endpoint%u\n",
> >                                            of_ep.id);
> >               }
> > +
> > +             connector =3D drm_bridge_connector_init(lcdif->drm, encod=
er);
> > +             if (IS_ERR(connector)) {
> > +                     ret =3D PTR_ERR(connector);
> > +                     of_node_put(ep);
> > +
> > +                     return dev_err_probe(dev, ret,
> > +                                          "Failed to create bridge con=
nector for endpoint%u\n",
> > +                                          of_ep.id);
> > +             }
> >       }
> >
> >       return 0;
> >
> > ---
> > base-commit: f76698bd9a8ca01d3581236082d786e9a6b72bb7
> > change-id: 20240624-mxc-lcdif-bridge-attach-60368807b2f9
> >
> > Best regards,
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
