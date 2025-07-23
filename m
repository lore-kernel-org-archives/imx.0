Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC9E271469
	for <imx@lists.linux.dev>; Wed, 23 Jul 2025 07:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753256193; cv=none; b=em2MvMOYNkk52YVFD94um/FJrjYFEmVyLvHCmk8NnBbkIWHHn/XyVnMBjn4NWwJefF3fcFqdHCiJA1yU+J0zgwm9rlIPm5/JVe932x04yUxNbX+81La2aX671w7UMYEZh4jCqAerKP8H9qSwlfo2KlYlY5pYxaeIDnyKfxm+TsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753256193; c=relaxed/simple;
	bh=RL6vumOpJ1aLwcqq18JDpGv67GUN+WLHItc/6rupk8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sw9EVu6hwy5pZ5qjCLIFw6/TDbNp8uIahGwlwHahpPv1b3eJiKYKoze147I5WWFQ8kxFgDtMmSBkXpSzI2ykKwQ5ncfCdQyOt8SXvrQJ8xiKU0bz4DlRnOowMjOEVp1+XVwB7n5yiDn/d6M6ddcVMNoNs1J4cDiDyCZwsYGE9D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H3d+3665; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H3d+3665"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3d948ce7d9dso24465785ab.2
        for <imx@lists.linux.dev>; Wed, 23 Jul 2025 00:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753256191; x=1753860991; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/S3cclAsN9hIgRcEo1wMY4GsJTg8hhVdaN6QhaC45E=;
        b=H3d+36650SYS2WIbRtZfjDxhcfmInr32E1XDSbvzSHEPgCKUDOJDe8o3qK4jFNA8/W
         eMxAc4DP7jCRPCGc8WpUJCGMyLU7Yh0+s14owJPss+Y0YL3FZ1oJQkOYgQckS2sX8Tzj
         kE3ABK2Isi047MJDXTZZxMruNdfYvdzfyfq3yLXSJSO06HLd2AqllzYlC1P89Kop/Ost
         0VnKp7RRRHzyu2uDh9a2rCRzcb+IAlbIKEiL+5e1HW5zrijZYqF8Jqd/7PJ9/268AjNn
         nDwww9aW7r5Tacv7D2CuxD5bst6/FexTLVuLFLJLlKR1TO0N+9a/pgIVT/Mtxud+H8lF
         d2+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753256191; x=1753860991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W/S3cclAsN9hIgRcEo1wMY4GsJTg8hhVdaN6QhaC45E=;
        b=qaaoLxrCkAROHBHofAZF1ZQGcSMHEwnSgg11TAXKrQ4UXdSbcMo33KKFXD1ElgKLdk
         ZA/z73VQ+hzFzV+Sy4T5miWlsO9PLiKGtb1olnlo2xyJCS/3eEIpvAA+wOHneqvJ/Qh3
         /L2bt0ImtTLTcWfa22jcDzKW5tRhAvKf2s9MYm7G6motZEpf+3UlmzWKag+saq116diU
         7k+jLu8Np81LCrup90TnuBSusZOjmTv9c15dnJNoaueA70EcGH2Of70VJRU2pHtjdi6y
         5Mx1CfKe8u5D2rHZ2Vm1NXW1tmgC9/7ZePhsa2K4pdMSL3uBGR0507p+W1KXXo+lTQGA
         1mIg==
X-Forwarded-Encrypted: i=1; AJvYcCVXRCsHeeRhyYykxrWhPYXjujFYpzU8Hg/eYivEBky9UAeqqKKlwqI8xUerU1mPNRXYXHA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9BeT3o7BU9t60JquSthXjlHAra4sFGzrAArGZtxuFHWm5w/sB
	IlgJit7Ek5/UVijXz9o4zcJyt9tqZxnB+3NP7GmQ6xiNk9A1IxMwabI1m5cFNd2HEX7dxeyQUPj
	mSq8w+gvQWjTaZ7Awy9Xz1zjW9DLoKyI=
X-Gm-Gg: ASbGncsanDs0AfF/GiFIS6hf/bCqNE/xg1sUeWBRny9EHKY9vOqHWtp/J2LiyPCSoWh
	AN+B3NwHHzwihbHyP1TxXZ4Qx4MoWZ7bipTctPw0DxDYTnPmTXD3TvcCV4lnzAyy3oUxkgO2Hbc
	nUXSmuDxRG71/EwRtIOC464RCe9YkTInL4mAqMlxHXYP5Gyld6Q9kbE1mgGmEmo0e+WRBRZhCTV
	gmsDo8=
X-Google-Smtp-Source: AGHT+IHYow0XlvdEpZbbLeYgBBO2y4gBFRlSOQ97MzENf9ZWPixLLuVk3gzT14yo44EQSarqRYKCLdWkxl7mB1g6H/s=
X-Received: by 2002:a05:6e02:1a22:b0:3e2:c5de:5ff with SMTP id
 e9e14a558f8ab-3e33eabdbadmr33868505ab.3.1753256191292; Wed, 23 Jul 2025
 00:36:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250718101150.3681002-1-shengjiu.wang@nxp.com>
 <20250718101150.3681002-2-shengjiu.wang@nxp.com> <4731eb9b-9a29-4065-8dac-06f558e78e02@nxp.com>
In-Reply-To: <4731eb9b-9a29-4065-8dac-06f558e78e02@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 23 Jul 2025 15:36:17 +0800
X-Gm-Features: Ac12FXwK3jsd_JjUkeN-4HVNavY2uEVLQxHw3AgCqwKwIWwQEHZUSbjiR65_C0c
Message-ID: <CAA+D8AOkOV0850yH+96deZ-haFSsNCw=hE+G7m+svSJBsz3c6Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/bridge: dw-hdmi: Add function to get plat_data
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
	p.zabel@pengutronix.de, devicetree@vger.kernel.org, l.stach@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2025 at 3:38=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wrote=
:
>
> Hi Shengjiu,
>
> On 07/18/2025, Shengjiu Wang wrote:
> > The enable_audio() and disable_audio() callback pointers are in
> > plat_data structure, and the audio device driver needs to get plat_data
> > for assign these pointers. So add a function to export plat_data
>
> {enable,disable}_audio pointers are directly assigned to plat_data in pat=
ch 2,
> instead of using dw_hdmi_to_plat_data().  dw_hdmi_to_plat_data() is only
> used in patch 2 to get hdmi_pai pointer through pdata->priv_audio.
>
> const struct dw_hdmi_plat_data *pdata =3D dw_hdmi_to_plat_data(dw_hdmi);
> struct imx8mp_hdmi_pai *hdmi_pai =3D (struct imx8mp_hdmi_pai *)pdata->pri=
v_audio;
>

will update this commit message.

> > structure.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 6 ++++++
> >  include/drm/bridge/dw_hdmi.h              | 1 +
> >  2 files changed, 7 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/dr=
m/bridge/synopsys/dw-hdmi.c
> > index 76c6570e2a85..3dfa42178f6c 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > @@ -198,6 +198,12 @@ struct dw_hdmi {
> >       enum drm_connector_status last_connector_result;
> >  };
> >
> > +const struct dw_hdmi_plat_data *dw_hdmi_to_plat_data(struct dw_hdmi *h=
dmi)
> > +{
> > +     return hdmi->plat_data;
> > +}
> > +EXPORT_SYMBOL_GPL(dw_hdmi_to_plat_data);
> > +
> >  #define HDMI_IH_PHY_STAT0_RX_SENSE \
> >       (HDMI_IH_PHY_STAT0_RX_SENSE0 | HDMI_IH_PHY_STAT0_RX_SENSE1 | \
> >        HDMI_IH_PHY_STAT0_RX_SENSE2 | HDMI_IH_PHY_STAT0_RX_SENSE3)
> > diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.=
h
> > index 6a46baa0737c..a56a3519a22a 100644
> > --- a/include/drm/bridge/dw_hdmi.h
> > +++ b/include/drm/bridge/dw_hdmi.h
> > @@ -208,4 +208,5 @@ void dw_hdmi_phy_setup_hpd(struct dw_hdmi *hdmi, vo=
id *data);
> >
> >  bool dw_hdmi_bus_fmt_is_420(struct dw_hdmi *hdmi);
> >
> > +const struct dw_hdmi_plat_data *dw_hdmi_to_plat_data(struct dw_hdmi *h=
dmi);
>
> Nit: Add a blank line as it was here.

will add blank line

best regards
Shengjiu Wang
>
> >  #endif /* __IMX_HDMI_H__ */
>
> --
> Regards,
> Liu Ying
