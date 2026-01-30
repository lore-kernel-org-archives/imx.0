Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B00A30217A
	for <imx@lists.linux.dev>; Fri, 30 Jan 2026 07:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769756794; cv=pass; b=Pl3KTElyDH0Xg01hLDrSf0Jro6w6z7Q23LCQHjlq3lgZDOxts18BO3TFfVFBuhXQ3etfyo9UAMcDTgRKM1CU8gtXV7U/BnDFAc2UlcyG6bcZe4P6K7eomCWDBA7VPpTUB9KuGo44WcZumgEiZUtbXaBykFyi8G5VOzxzCSC0isQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769756794; c=relaxed/simple;
	bh=7gLeg3toMIAmog7I0tW7LmQ66j/LH4s4AODoGMKloOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GKL1LyAkeP9UUPXu4qT3yS5aox/BCBQoNT5/ceXpwlyoOUsdzwrF5Ll7So2eIUqQ3UASO2+lMes7jk5odmCa/LTCrtCHIdsjKRBUGagalSQbnqU9p1Ycgc4sz6eOBd4OKe61rL2vhYW51z/9TxJWsc4K8Ut566pTc9Dp2xra42A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SISsoVYK; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SISsoVYK"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a79ded11a2so12750735ad.3
        for <imx@lists.linux.dev>; Thu, 29 Jan 2026 23:06:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769756792; cv=none;
        d=google.com; s=arc-20240605;
        b=avMy4bsAzna5qmNAgKBa2+UVkDjNqdwdp/COhCEfIbgpZ27j/9GKFm+JQ1bUvey6zc
         mXkQ5Wx5lNEwHR9BIxOQmyp+x76c15LlWjmmiMijdjuaVmY95UCnWakhSHpXcvt2R5kJ
         fSnEZwsn4Ronf8c74ykHnqO4rYJu2l0CNRM39sO1JmeSa1hoR/gbOOfL6Grln+4uhPL9
         sLnVVLp45VjiNkdzU7SWmRv9lWS/mK2Q0Axm172PfvQiEFrEYIz10JJTiYpysbwyZDnh
         A/b7ZZQoSLEvNHyBYrIwqb5TXvdfGqk9OfANx9fRAhNfX/hSG1WLqmxd18bv3SJ9uoBX
         0SiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Uo3DwapbYo/p8IpFT3EwNhmFG0/Hf+3HnE+vfgf9grM=;
        fh=zPP64VSEarOLddBIvN4wHVCvhq69VbI9VeuBFD2OcAA=;
        b=bc8lIUxgNwKb4QLsNhPI918EKK7fpgBf9sHL4qQtyOZh5a6Z4X/16tQSbKxS41OJ+d
         s17HK5d7r7Qnq7M8SFodBC3pg5As0g1cIHNvBUh0zXoWvgwWIS+vBuvUX5gMY+AVRlr1
         wSN4B9ryMjFgYXzXS8NvHV6FD3SFbL8YRu7lY826wWJQ5DL5DcYFK6C8yy3o+sGxD1Xm
         oU2ZzzrwjMH9iCTJZUlSOpozxo66UOo+0Lhzg5L2RReaXI7g/SHuuoeS9A0yupOUQMHR
         oFn/O0jHw8p/SC1rKypLCS1PTtwwrEUsVKojwwdhHebi0uudyqRiaLdDoQVpgQultkwW
         5Csw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769756792; x=1770361592; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uo3DwapbYo/p8IpFT3EwNhmFG0/Hf+3HnE+vfgf9grM=;
        b=SISsoVYKdPQo6VV5JvldGJLonyXTHZdpw42q06NfDQMoqhEP+gZvaGWv6LyUS0jVJA
         mCrOazxFTz7JmFxz51igBjI6ErpYIi+wmlOOASGVooUqgEJPnkkNwChb1cmT0/HkSwkG
         CiR9X1P7p34n+Q559hhvaWZJodtDdd7Y/pqkl8viCTg9uOuIO1Cn9P/kzgbFMjrTTnX1
         B7wBbRxsyPHHLBMj2GgB8NI2YVgQlPfT1ZXCdzBNjtvG1CV5iuIjrNF0UAG0n9HZzGvT
         Dp911aiD42Z3dAH6d2q6gHg2t9Mb7+knqUorEuetAxh+ImznuThYhFRSTxotjH0OClV1
         s5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769756792; x=1770361592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Uo3DwapbYo/p8IpFT3EwNhmFG0/Hf+3HnE+vfgf9grM=;
        b=ZwEFH9wAelxTZRz4GbfCtVfisn4AcC3zl3OIfA88MWfjufCpT7Mid5/oRVWJkmHNae
         JB1oqTE/lozELJL0U7SK0AdF/TlR+wLV3IqVFBCCmyaucujXMEN+iSh+KqOjvlZx7CA2
         MoPAZWhzi99irPV3qlwmMGLC5r5WeQVpTDmY7gg7gUzbd+mO6g+yBJgIG06i2ahAzVbi
         ywMsQLFDOCUEOt6FYY71NKMZ4SRrdz5cO6xc1ixcCXqlCpXHwn7Bn4epR/7WYJAcca/u
         pn3ntMrTmgoQ05zyJdXGBl6vPrSvkv8hU7A/N9xWet5ekqf9G/oNgfDvnH+1/NMCfaN1
         rljQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDtB6nXZi2Q0HeQKU5WWJCZlM3mbICLZML2U7o/VreVLMVuqpkqB6FWNH+uDw6CnAovk0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxlcrBccLDcKAyDThuIucfjnIwJtCf6BNQc3UxbWmDRSzHicfNO
	HT60dkSazkubJJo5DZILGwbX0kwlvQ7sC0NKwH4gQ7D0KdkeeYTvLgzSqBJ2yelLuQMbOKW5DaU
	C/uApHpO11bIIop/+voNnvvrpb2GRojw=
X-Gm-Gg: AZuq6aKDgx5p0d30HL/cK5ZXm8+cNjahyqDdVJjIbvdpGUuh5ecYmVun2pfFmwuqQgW
	Cjb6t/QxUVHzDGT3jIuB3cMTG0acNxVt0vdJTEtuyVObrQsRQyw+h5LF9qg12JADi1DpzSJM0l0
	VpZnco5D3tXeHDKCXof5ASnPqFcgoDi01d2P+yXju9u6Cv3UKCfT6PdrUfuMACJfMtzwbN+AWub
	aNSjzPMavo9x1DO0rGKdvDVFzukNbpERb9/3aUP4b5JOoYdBMUpKFg0ovN1KS3DdygLvCXzMFLu
	YA8tkg==
X-Received: by 2002:a17:903:a8f:b0:29e:bf76:2d91 with SMTP id
 d9443c01a7336-2a8d99285c3mr18452045ad.42.1769756792206; Thu, 29 Jan 2026
 23:06:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260130055508.3462700-1-shengjiu.wang@nxp.com> <cec25a41-cc6a-4b03-833e-5c7da5727e85@nxp.com>
In-Reply-To: <cec25a41-cc6a-4b03-833e-5c7da5727e85@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 30 Jan 2026 15:06:19 +0800
X-Gm-Features: AZwV_QiBIWwWZgjtPtAyNGJf1ZiVmzr03NeE_IXZ_qgHqkYVQtx8cbrwQilhH88
Message-ID: <CAA+D8AMkipi_iX=vagZMHXTNtqUqyFeVkU1Vr_wb4R82F1OHDA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: imx: imx8mp-hdmi-pai: enable pm runtime
To: Liu Ying <victor.liu@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 2:49=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wrote=
:
>
> Hi Shengjiu,
>
> On Fri, Jan 30, 2026 at 01:55:08PM +0800, Shengjiu Wang wrote:
> > There is an audio channel shift issue with multi channel case, first ru=
n
> > the channel order is correct, but second run the channel order is shift=
ed.
>
> Nit: I'd rephrase "There is an audio channel shift issue with multi chann=
el
> case - the channel order is correct for the first run, but the channel or=
der
> is shifted for the second run.".

Ok. will update.
>
> > The recovery method is to reset the pai interface.
>
> s/pai/PAI/

Ok.

>
> Can the channel order shift issue be fully fixed instead of implementing
> a "recovery method"?  I presume that this patch implements a recovery
> mechanism.  If it can't, any chip ERRATA?

Yes, it can be fully fixed by this patch. I will remove the "recovery" for
confusion.

>
> >
> > The reset can be handled by pm runtime, so add the pm runtime function.
>
> Nit: s/pm/PM/
>
> s/add the pm runtime function/enable PM runtime/

Ok.
>
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
>
> Subject prefix should be "drm/bridge: imx8mp-hdmi-pai:".
> Refer to what previous commits for i.MX bridge drivers use.

Ok.
>
> >
> > diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c b/drivers/gpu=
/drm/bridge/imx/imx8mp-hdmi-pai.c
> > index 8d13a35b206a..1afc729da9b9 100644
> > --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
> > +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
> > @@ -8,6 +8,7 @@
> >  #include <linux/module.h>
> >  #include <linux/of_platform.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> >  #include <linux/regmap.h>
> >  #include <drm/bridge/dw_hdmi.h>
> >  #include <sound/asoundef.h>
> > @@ -33,6 +34,7 @@
> >
> >  struct imx8mp_hdmi_pai {
> >       struct regmap   *regmap;
> > +     struct device   *dev;
> >  };
> >
> >  static void imx8mp_hdmi_pai_enable(struct dw_hdmi *dw_hdmi, int channe=
l,
> > @@ -43,6 +45,9 @@ static void imx8mp_hdmi_pai_enable(struct dw_hdmi *dw=
_hdmi, int channel,
> >       struct imx8mp_hdmi_pai *hdmi_pai =3D pdata->priv_audio;
> >       int val;
> >
> > +     if (pm_runtime_get_sync(hdmi_pai->dev) < 0)
>
> Use pm_runtime_resume_and_get instead.

Ok.
>
> -8<-
>   `int pm_runtime_get_sync(struct device *dev);`
>     - increment the device's usage counter, run pm_runtime_resume(dev) an=
d
>       return its result;
>       note that it does not drop the device's usage counter on errors, so
>       consider using pm_runtime_resume_and_get() instead of it, especiall=
y
>       if its return value is checked by the caller, as this is likely to
>       result in cleaner code.
> -8<-
>
> > +             return;
> > +
> >       /* PAI set control extended */
> >       val =3D  WTMK_HIGH(3) | WTMK_LOW(3);
> >       val |=3D NUM_CH(channel);
> > @@ -85,6 +90,8 @@ static void imx8mp_hdmi_pai_disable(struct dw_hdmi *d=
w_hdmi)
> >
> >       /* Stop PAI */
> >       regmap_write(hdmi_pai->regmap, HTX_PAI_CTRL, 0);
> > +
> > +     pm_runtime_put_sync(hdmi_pai->dev);
> >  }
> >
> >  static const struct regmap_config imx8mp_hdmi_pai_regmap_config =3D {
> > @@ -101,6 +108,7 @@ static int imx8mp_hdmi_pai_bind(struct device *dev,=
 struct device *master, void
> >       struct imx8mp_hdmi_pai *hdmi_pai;
> >       struct resource *res;
> >       void __iomem *base;
> > +     int ret;
> >
> >       hdmi_pai =3D devm_kzalloc(dev, sizeof(*hdmi_pai), GFP_KERNEL);
> >       if (!hdmi_pai)
> > @@ -121,6 +129,13 @@ static int imx8mp_hdmi_pai_bind(struct device *dev=
, struct device *master, void
> >       plat_data->disable_audio =3D imx8mp_hdmi_pai_disable;
> >       plat_data->priv_audio =3D hdmi_pai;
> >
> > +     hdmi_pai->dev =3D dev;
> > +     ret =3D devm_pm_runtime_enable(dev);
> > +     if (ret < 0) {
> > +             dev_err(dev, "failed to enable pm runtime: %d\n", ret);
>
> s/pm/PM/

Ok. will update them.

best regards
Shengjiu Wang

>
> > +             return ret;
> > +     }
> > +
> >       return 0;
> >  }
> >
>
> --
> Regards,
> Liu Ying
>
