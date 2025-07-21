Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42C32B9A9
	for <imx@lists.linux.dev>; Mon, 21 Jul 2025 03:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753068281; cv=none; b=mnpH3cjp8agPeKb+B4+eZLvOIf339o8cE4jbSeHff3bg6byCJOu5UNcFd9oDx54UM0pNE0BDTMpoM2nIq7mfIjEpTYG+Z07AcbI9pfZMtX26px84KauJQpgEHZWkImLbNak3CgN4hly5XJYh+lPwm2QBQJQvlO+MjGwO2UFPkrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753068281; c=relaxed/simple;
	bh=gjPYILYDcX1biCFjP256A//l513CzG7FlCFqg8jOtCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZuQjxsGc+kS0xv67E120SIcfc9z5QjJo0fjDnjfB3UjL8wIhWvU6r2a/Uhy/4P1Z5w6PIQqU6V2w/aerA0fBOliRHyCcsX42TdZMZ1vIGl2VNS/nQXLcxArOrgE9b5mAfh3WNYmb0iPfMJil2VYyid9wsMyXJTOu0YCJfXPx4XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VtXSmJfX; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VtXSmJfX"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-87c04c907eeso180867739f.0
        for <imx@lists.linux.dev>; Sun, 20 Jul 2025 20:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753068279; x=1753673079; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OwI2hpcy3lcVV+QnTniw+hVEeGQWL5HMOKObyfZtgEM=;
        b=VtXSmJfX6tWgiCDXjOGzfmkbBwqySys/D0yzBdtGxwTbs3xorHR2naEFSRQ3EBUZ13
         U4WKKD8aBQ6Xqj2XmOy8vLNkbwFHkLJBzg6BsUixG3UwBuLw9qUJssGPZxcIXDqubMhR
         wwVDCh6KgocC3Kaw9bxUzGw/FAMKYRlhcLRylvK8fuWM8piTvmU80iLI8QEUzbl6CzQf
         faJBBEHoN2z4wAVZU9bfZ/WKd7QQMBF7f2QHKvB4mkk8/y0dXALQ5gdEdWNgMfUNgFjw
         0eQGEoKno4rYlb6UQ8bI9iL+YVHMzp6x0kqjWNtPDOi05VPb52Mc+fv4Tc0FX8NKEIL2
         NkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753068279; x=1753673079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OwI2hpcy3lcVV+QnTniw+hVEeGQWL5HMOKObyfZtgEM=;
        b=pclRS2arf5cU3ogq28grd4vIZDJiGQSlQwrYBVmTIihxpnure6/4p3pGEnGIwCDVZz
         wu/gv50jDg8MIBB4CrGZqo1NyTohvbhTSO0rltwbLF/TYjnDAXxD4Ec++pGeQpEnXiGJ
         WI+Fi9cANROlBC3Jnd4YTbgaeFQ++TvyCQxN09HJMqBsw1mYWOR8TaBlpoUvZvZSH8x9
         Tym2tNs9FtyHvwnN4gfGRxg9RlegNzW9Z5VO1XhZ0BYPcEz5JaQwX5Ln0cnKgzCpDUaD
         ihG18gYF40jWCeoCVl1t/hnS4yyzgaBNxpAASmjXC2QzCApWDxQ4QC2b7+ZMtwWjXeGI
         4T5w==
X-Forwarded-Encrypted: i=1; AJvYcCVrRthuKq75IuUl1iOccv6jgGQTGyFpWr76rSi5IJNIJ4NAh0wSgxnoiypp8jsql/qD794=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0qIcY3+2nrFkHL7hhpSm3MFn86WfcLbig9UFSkZyHOY/3GHY6
	eShzfpisN5RZVIHC1lyUqhiF7j57d5TcDEcq05DBbYA5bYJ8lUDvD9E0S4Vv3qDLXq8zbtpQwYw
	axIxqHj16KYVPhLO4ichWBu+2PP/8ZaY=
X-Gm-Gg: ASbGncuedcp/XsqtkKPSk70euEaaHpFHA362bxozPjeTKjcWUI7e8R0htfzP2dnnlFQ
	aQ0s4lCve6P5TSX+ju9mWq8TNUu2ShGORXi4q4vuliogChS+P1gaiJZaidMfPk+jzFd2gcFV5qW
	0KY9YI3aclyfoTAZwYro6D4NPB6xpqgrkajpJoTrIOcnvGsxGd+ujYk3L1pxv/Ped83J02VuDfE
	JNRPcM=
X-Google-Smtp-Source: AGHT+IEc4eCE70WDmGsnRlEEKfMnJZ+xtO+dDhCQVQfDpz+1aJdPRzDCoXXMD8/WnfPbQf13oi/XE9aCmcR1NPGUpLY=
X-Received: by 2002:a05:6e02:2582:b0:3df:2f47:dc21 with SMTP id
 e9e14a558f8ab-3e282f5547amr213949295ab.22.1753068278812; Sun, 20 Jul 2025
 20:24:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250718101150.3681002-1-shengjiu.wang@nxp.com>
 <20250718101150.3681002-2-shengjiu.wang@nxp.com> <aHpzElP09pEOi4id@lizhi-Precision-Tower-5810>
In-Reply-To: <aHpzElP09pEOi4id@lizhi-Precision-Tower-5810>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 21 Jul 2025 11:24:23 +0800
X-Gm-Features: Ac12FXy5bUMTlHGaq7PpDN0ZSeNbIlr9FhbAx0Aren2E8HjpPRhVBNLuNDI2CRQ
Message-ID: <CAA+D8AOQ9v_qCHecfL1brXUJgpA3UjdDq-O3J9udQzp2xm3J9w@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/bridge: dw-hdmi: Add function to get plat_data
To: Frank Li <Frank.li@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org, 
	l.stach@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 19, 2025 at 12:15=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Fri, Jul 18, 2025 at 06:11:47PM +0800, Shengjiu Wang wrote:
> > The enable_audio() and disable_audio() callback pointers are in
> > plat_data structure, and the audio device driver needs to get plat_data
> > for assign these pointers. So add a function to export plat_data
> > structure.
>
> drm/bridge: dw-hdmi: Add API dw_hdmi_to_plat_data() to get plat_data
>
> Add API dw_hdmi_to_plat_data() to fetch plat_data because audo device
> driver needs it to enabe(disable)_audio().

Thanks for comments.  will update it to the next version.

best regards
Shengjiu Wang
>
> Frank
>
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
> >  #endif /* __IMX_HDMI_H__ */
> > --
> > 2.34.1
> >
