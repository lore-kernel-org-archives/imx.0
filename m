Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACE21A2381
	for <imx@lists.linux.dev>; Fri,  8 Aug 2025 06:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754635542; cv=none; b=h4HXWkOV9OF9gkxPpbljZ/OOPCt1noO4g4WsiZXO4PzcQ7GULjEPBTGgSRqlI7JWR/DqlzRSUhXXrM/rqnTvgv2XNKZW3bWdFrB9yI/RD40vAKGyIUQ6f/nvpZgj0ejb0xwmdkeCE83k1C/0Rvf/ajnozCgJks/geIJfO0iFq+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754635542; c=relaxed/simple;
	bh=fkDvAtV8BZIVDCieQAMgEDbm9mU+jLGHu3DvNvO2ZKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l7M0qRY0djcuuYI8GwGTBGsTlfzMXd0c/TEAu+bjiDeUWVpEq0tMmQRDBu4NoVRo0xRAdhf/zDA0Ot3pxMbss5lcNEedXytmqsxvRExxIAO6IwpfwQVvxjU4asR9sl89T1ZZkZJlhI6Hrhv72sEWsSc9wBfg/gG9sE5ERpzUE+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fqA2ybLV; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fqA2ybLV"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3e52146df5cso18448045ab.2
        for <imx@lists.linux.dev>; Thu, 07 Aug 2025 23:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754635540; x=1755240340; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VfJ96l0L79uC3QqMW/tKUozVfcbzbbqgdHMrzI/pgq0=;
        b=fqA2ybLVOy6DP98lCaZcBiWf0bS4P41C23Wuib1hBHbtv3cKmFmDiK0AvLTj7iLjz9
         xj1Iy3wCY2H602jAqSMb2nIp1+gUPZ1xeOGb/+oXZMYk18JqgIhpk2Pa4OH1WQVNkUbJ
         xlgjscYTit/s++DZZjRTgE/fhFfDo/l9rGba1NQKPOFPCXLkHVqG2+8nlm5VC5u9PIEF
         TBNwZ8iIFKI68KwLE6uJ/iNSsX2qLdY3p9A+TFMJnW8m3N2fP6oGyaraM5udxkvASCga
         zFxCTpR0MS5UM2kGmC8kegsP5Bh5r83h/Yy472NKT1iTQvs9Db/QrNYudn+hVktr4ypB
         1Cbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754635540; x=1755240340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VfJ96l0L79uC3QqMW/tKUozVfcbzbbqgdHMrzI/pgq0=;
        b=wQ3RBLvPcrujzMp3Z7uDowJLLUnRX+jjCMjWtza2nBYXVtQGG3798Tv2H23XOWHCTv
         PTmIqiORToCsNfgHTUHqch/urRBJFsoTu9RTBUIPaUctucOFlibLQvtG6Rx7EVyusrVW
         VLCukIntO/WGCOaMKPWZRZGhSSwPWSpB13jIjcWbr/VH9UfK9cnGXXBEntDiP9pUPR4f
         T4BgxA9OQWsdm5ZSBlbFPkivlUoqe5dqWYXOFjwqCpN8fVzXOtsiBt1+3fcSMAXKFLmG
         8yLJ1s4qgDTzfvyOgbKxP3bDTBN8xIjvvIg5yOvS17Xx6At56efo0yMHwffWE1UHEOiY
         x76Q==
X-Forwarded-Encrypted: i=1; AJvYcCUyq+munmoRMD187cTRaENCZ2f3EYUJGMfgmkzLX+V9iDdl64cHQfb/gmNUU/14DapwKlE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxVCWG/0on3p1tO3MZaGcEWbgk+FnUmwXN2++vMgHalRz3T4MAB
	tpMvaCtbdbsOp+lpvMfEaJFshgpF5J7jswg6lV4/AA2Up4l8Y/qhRJvVPHovWsSfsj84A6pCisb
	D1sfWmwJFvcz0mui6ICvn8XKXPv7pHW4=
X-Gm-Gg: ASbGncs2kHo/MRracQZBDKLDBIahC7ir9ZpIGt5psJEhY7a5VkbjQUDo8xX3puziuta
	2dD9MFjqIbdvuG55XxrzspiA0nVwN3j/XwV3W1wC9iBRgFnakauyRmXi+bKkQ6JWaiXw+tTimHr
	ngvp6oYbaDKF2KmBo2kYQFD8K54Eabg99ScfkYMwB0KjG5QQAyKgOQYkQxyDTQOzyp6CcbtesF1
	clL3zw=
X-Google-Smtp-Source: AGHT+IGltElZVlwhxw9uDPM97pmJeDSJgwVBwjLX4g172vFNLkOj72zAp9AwhEXJbpTGZUTj/wZcUv/NAwx9DgBOto4=
X-Received: by 2002:a05:6e02:1a07:b0:3e3:a49a:917b with SMTP id
 e9e14a558f8ab-3e53306e84fmr37599135ab.2.1754635540083; Thu, 07 Aug 2025
 23:45:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250804104722.601440-1-shengjiu.wang@nxp.com>
 <20250804104722.601440-6-shengjiu.wang@nxp.com> <fa455148-a071-4433-8c9c-26add3872604@nxp.com>
 <CAA+D8AN4n0H6M_0EqX4z_37ViSCyThKbmtMgqPmipintJ8Wtwg@mail.gmail.com>
 <ba02693b-8ad2-4297-ab89-5b39d5c4315f@nxp.com> <CAA+D8AN3VzFx1g=8wyxJROw96xS2-qoVs3X4vUfFnJtUCqFj_w@mail.gmail.com>
 <481c4a38-e638-49ea-88d4-765e581afca7@nxp.com>
In-Reply-To: <481c4a38-e638-49ea-88d4-765e581afca7@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 8 Aug 2025 14:45:26 +0800
X-Gm-Features: Ac12FXwPBbMoH09jFjYWwfKVloaD-hbqz3Zq3uo6wZJ3wJC3FWnXebP2M-e4hG8
Message-ID: <CAA+D8AMmQo=TgaJTubLL6xRp0NV3GpeE0JKwhBjmhZjtBnBQjA@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] drm/bridge: imx: add driver for HDMI TX Parallel
 Audio Interface
To: Liu Ying <victor.liu@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, devicetree@vger.kernel.org, l.stach@pengutronix.de, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 8, 2025 at 2:32=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wrote:
>
> On 08/07/2025, Shengjiu Wang wrote:
> > On Wed, Aug 6, 2025 at 2:52=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wr=
ote:
> >>
> >> On 08/06/2025, Shengjiu Wang wrote:
> >>> On Tue, Aug 5, 2025 at 4:55=E2=80=AFPM Liu Ying <victor.liu@nxp.com> =
wrote:
> >>>>
> >>>> On 08/04/2025, Shengjiu Wang wrote:
> >>
> >> [...]
> >>
> >>>>> +static int imx8mp_hdmi_pai_bind(struct device *dev, struct device =
*master, void *data)
> >>>>> +{
> >>>>> +     struct dw_hdmi_plat_data *plat_data =3D (struct dw_hdmi_plat_=
data *)data;
> >>>>> +     struct imx8mp_hdmi_pai *hdmi_pai;
> >>>>> +
> >>>>> +     hdmi_pai =3D dev_get_drvdata(dev);
> >>>>> +
> >>>>> +     plat_data->enable_audio =3D imx8mp_hdmi_pai_enable;
> >>>>> +     plat_data->disable_audio =3D imx8mp_hdmi_pai_disable;
> >>>>> +     plat_data->priv_audio =3D hdmi_pai;
> >>>>> +
> >>>>> +     return 0;
> >>>>> +}
> >>>>> +
> >>>>> +static void imx8mp_hdmi_pai_unbind(struct device *dev, struct devi=
ce *master, void *data)
> >>>>> +{
> >>>>> +     struct dw_hdmi_plat_data *plat_data =3D (struct dw_hdmi_plat_=
data *)data;
> >>>>> +
> >>>>> +     plat_data->enable_audio =3D NULL;
> >>>>> +     plat_data->disable_audio =3D NULL;
> >>>>> +     plat_data->priv_audio =3D NULL;
> >>>>
> >>>> Do you really need to set these ptrs to NULL?
> >>>
> >>> yes.  below code in dw-hdmi.c use the pdata->enable_audio as conditio=
n.
> >>
> >> Note that this is all about tearing down components.
> >> If this is done properly as the below snippet of pseudo-code, then
> >> hdmi->{enable,disable}_audio() and pdata->{enable,disable}_audio() won=
't be
> >> called after audio device is removed by dw_hdmi_remove().  So, it's un=
necessary
> >> to set these pointers to NULL here.
> >>
> >> imx8mp_dw_hdmi_unbind()
> >> {
> >>    dw_hdmi_remove(); // platform_device_unregister(hdmi->audio);
> >>    component_unbind_all(); //imx8mp_hdmi_pai_unbind()
> >> }
> >>
> >> BTW, I suggest the below snippet[1] to bind components.
> >>
> >> imx8mp_dw_hdmi_bind()
> >> {
> >>    component_bind_all(); // imx8mp_hdmi_pai_bind()
> >>                          //   set pdata->{enable,disable}_audio
> >>    dw_hdmi_probe(); // hdmi->audio =3D platform_device_register_full(&=
pdevinfo);
> >> }
> >
> > Looks like we should use dw_hdmi_bind() here to make unbind -> bind wor=
k.
>
> I don't get your idea here.
>
> What are you trying to make work?
> Why dw_hdmi_probe() can't be used?
> How does dw_hdmi_bind() help here?

bind() is ok.  but unbind(),  then bind() there is an issue.

>
> > But can't get the encoder pointer.  the encoder pointer is from lcdif_d=
rv.c,
> > the probe sequence of lcdif, pvi, dw_hdmi should be dw_hdmi first, then=
 pvi,
> > then lcdif, because current implementation in lcdif and pvi driver.
>
> We use deferral probe to make sure the probe sequence is
> DW_HDMI -> PVI -> LCDIF.
>
> LCDIF driver would call devm_drm_of_get_bridge() to get the next bridge P=
VI
> and it defers probe if devm_drm_of_get_bridge() returns ERR_PTR(-EPROBE_D=
EFER).
> Same to PVI driver, it would call of_drm_find_bridge() to get the next br=
idge
> DW_HDMI and defers probe if needed.

right, probe is no problem,  but after probe,  if unbind pai, hdmi_tx,
 then bind
them again,  there is a problem,  because no one call the
drm_bridge_attach() again.

>
> >
> > Should the lcdif and pvi driver be modified to use component helper?
>
> Why should they use component helper?
>
> BTW, I've tried testing the snippets suggested by me on i.MX8MP EVK and
> the components bind successfully:

right, probe is no problem. but if try to unbind() then bind, there is issu=
e.

best regards
shengjiu Wang
>
> cat /sys/kernel/debug/device_component/32fd8000.hdmi
> aggregate_device name                                            status
> -----------------------------------------------------------------------
> 32fd8000.hdmi                                                     bound
>
> device name                                                      status
> -----------------------------------------------------------------------
> 32fc4800.audio-bridge                                             bound
>
> > This seems out of the scope of this patch set.
> >
> > Best regards
> > Shengjiu Wang
>
> [...]
>
> --
> Regards,
> Liu Ying
