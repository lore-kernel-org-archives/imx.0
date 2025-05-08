Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FB827A13D
	for <imx@lists.linux.dev>; Thu,  8 May 2025 20:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746736116; cv=none; b=rzUJHJ3xz0nyHAWcVwxYXO6Y3z5BtBX2V3ELTrac4xaVJUJV7TtV5M2QxLIzM7Y1o6If44TMYarN/h0lRaQVg+iKF1WARZph3VTODwOv7p2g+lw9ok2Qu9Ew2InVsHQO1LsrhyJQhNFKDuTyp0gOlCbg/p6+goPXmLhYxq1/jI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746736116; c=relaxed/simple;
	bh=glI2QyA2V4kwUucOfsrEIYTyDYNwfxLg42DzzZgissg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GUU8sQ9JWgU10vEHUrjSKhNjUFLejzrsZQ//Qz5cBLiWqRg2jN9RMTfF78DdgcpaOlJINRiNqAlJQPAq2YJuskyhgFhKBViSuGnDzvloTjoHfvgum2A2N0mUkB+mCmXe7ENwtsagclbAdFUvzMaUGJ8jdIEqhasuZibGCzXSAIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jk9tZMCr; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jk9tZMCr"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5259331b31eso438353e0c.0
        for <imx@lists.linux.dev>; Thu, 08 May 2025 13:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746736113; x=1747340913; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/pc5D2wBbh6n4AHAVGKAJlI6vZAzUWJsMh1/Yq1dDS0=;
        b=jk9tZMCriKtQKVX8UOUjJ7jPrR6mVgpSWHL6unvtG0pvGmiihFjgdh4i5L+jPtW/Gf
         8MOraB89OFCAS9BLBEck3+TpNu/djtokWWsCbyy6FqJLiFtoQh4TFpuORkGIwLqjdJqw
         YsNG4j/MAWNVnvyFB5ahc9eczAR133YsdImPBMlyOBCiSyVMxK7AhskUskI4wgKYxwLf
         Ikk8Bfo2u5ZDo+NQVpcU2xMe21rg43VXgCG/0dgksIdtd8OLvLQc1+wdPgcnFMG3x1CE
         iw7gjd9ycYkXKvN/ayV+cLajE/q2C6NNMMRZMg28IgrL8mt57GdivVtzYFpgT4Y4sYVN
         kGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746736113; x=1747340913;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/pc5D2wBbh6n4AHAVGKAJlI6vZAzUWJsMh1/Yq1dDS0=;
        b=GFSnJwoGOEoUnAq4+sB4EXodAg6clCdCFFjHAQ4RcaFQT8Thvm0fMwc3S1bHfcwPZn
         qEDwwuyN2GNftnZSFAYGP7W5AUtqe4YPHSR8tc9NolI3QtPxuausXBmiSpH1OZiNb6ep
         vB3H+cyemoiXnglaqT7tOPcy/rCTKhAfbyYcSTZ9oxq2E2QOfxh/7VNNpjeZborfA9Fm
         rM2EZwugHyRF8uBiC6iCfzJ6jZr7Rb2GVnWeKGxFZOtpsutD8z+bSoGxE9hDjiM7r0Yx
         v0XOuyLlGXw3Tit0rRAaUQRVegILOuPYxyLD3VsGHAavXsP23PnnA7PkejqJ5V+dmyX/
         AfWQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5sdf189YLDg3xh/gftQXxcS0TGHTDVOACxUCRfyJYCWuz5PoU7yWvSNlW5IZmwMjDBjc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxNTS9OskE6Pl7JFQAfm18Gzc7HYBSP5zPpdnt/drJ7C8LCNmCS
	3vlEqKybowdQrzY3pcMU23hpduMg/tIMsDWV2GHvTpgAqJMTbNf5
X-Gm-Gg: ASbGnct5aFah8BwhobsPvyIkteXrPHmsNOhQsZcklkH8MJcQSzxhzsf2fOOl16mrHYR
	e3AprvOVDA8OMi3cTEyNOJotnvObGrn3sCCTGVTi9NdCpU8RXbQ6uFsxKwCEejFV1C/G3IeFXBJ
	DcDzSJ5XZM6W+lkuuiBcFt+oikyq8k/GV+qJLvAOEKLByNO2kgB+HLoab9RDJ7Gu0hdkrVlCIeM
	X1eaDXu463j7FKdwF9PI2KAYD1ZPw3fkLwGnR91wdZdup1SogE7S1u78g66dJIlaze9LqJcsn4l
	mWDr35HVMhmydf05qJXZxoaPcdlX+gATXzslzDXs
X-Google-Smtp-Source: AGHT+IHH8Hb44S2pUrzpBoAuMzG/VFUuedek3qnL1aKjilRrz2XuP3PUIZdV2EDPHQ1l0mwZVNw7hQ==
X-Received: by 2002:a05:6122:828d:b0:523:9ee7:7f8e with SMTP id 71dfb90a1353d-52c53c68f4amr1351138e0c.4.1746736113471;
        Thu, 08 May 2025 13:28:33 -0700 (PDT)
Received: from hiago-nb ([2804:1b3:a7c0:6030:ff91:5999:3ab5:5caf])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52c5375bcdcsm217781e0c.25.2025.05.08.13.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 13:28:32 -0700 (PDT)
Date: Thu, 8 May 2025 17:28:26 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com, Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 3/3] remoteproc: imx_rproc: add power mode check for
 remote core attachment
Message-ID: <20250508202826.33bke6atcvqdkfa4@hiago-nb>
References: <20250507160056.11876-1-hiagofranco@gmail.com>
 <20250507160056.11876-4-hiagofranco@gmail.com>
 <CAPDyKFrHD1hVCfOK-JV5FJM+Cd9DoKKZGKcC94fxx6_9Bsri1g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFrHD1hVCfOK-JV5FJM+Cd9DoKKZGKcC94fxx6_9Bsri1g@mail.gmail.com>

Hello,

On Thu, May 08, 2025 at 12:03:33PM +0200, Ulf Hansson wrote:
> On Wed, 7 May 2025 at 18:02, Hiago De Franco <hiagofranco@gmail.com> wrote:
> >
> > From: Hiago De Franco <hiago.franco@toradex.com>
> >
> > When the remote core is started before Linux boots (e.g., by the
> > bootloader), the driver currently is not able to attach because it only
> > checks for cores running in different partitions. If the core was kicked
> > by the bootloader, it is in the same partition as Linux and it is
> > already up and running.
> >
> > This adds power mode verification through the SCU interface, enabling
> > the driver to detect when the remote core is already running and
> > properly attach to it.
> >
> > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > Suggested-by: Peng Fan <peng.fan@nxp.com>
> > ---
> > v2: Dropped unecessary include. Removed the imx_rproc_is_on function, as
> > suggested.
> > ---
> >  drivers/remoteproc/imx_rproc.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > index 627e57a88db2..9b6e9e41b7fc 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -949,6 +949,19 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
> >                         if (of_property_read_u32(dev->of_node, "fsl,entry-address", &priv->entry))
> >                                 return -EINVAL;
> >
> > +                       /*
> > +                        * If remote core is already running (e.g. kicked by
> > +                        * the bootloader), attach to it.
> > +                        */
> > +                       ret = imx_sc_pm_get_resource_power_mode(priv->ipc_handle,
> > +                                                               priv->rsrc_id);
> > +                       if (ret < 0)
> > +                               dev_err(dev, "failed to get power resource %d mode, ret %d\n",
> > +                                       priv->rsrc_id, ret);
> > +
> > +                       if (ret == IMX_SC_PM_PW_MODE_ON)
> > +                               priv->rproc->state = RPROC_DETACHED;
> > +
> >                         return imx_rproc_attach_pd(priv);
> 
> Why is it important to potentially set "priv->rproc->state =
> RPROC_DETACHED" before calling imx_rproc_attach_pd()?
> 
> Would it be possible to do it the other way around? First calling
> imx_rproc_attach_pd() then get the power-mode to know if
> RPROC_DETACHED should be set or not?
> 
> The main reason why I ask, is because of how we handle the single PM
> domain case. In that case, the PM domain has already been attached
> (and powered-on) before we reach this point.

I am not sure if I understood correcly, let me know if I missed
something. From my understanding in this case it does not matter, since
the RPROC_DETACHED will only be a flag to trigger the attach callback
from rproc_validate(), when rproc_add() is called inside
remoteproc_core.c.

With that we can correcly attach to the remote core running, which was
not possible before, where the function returns at "return
imx_rproc_attach_pd(priv);" with the RPROC_OFFLINE state to
rproc_validate().

> 
> >                 }
> >
> > --
> > 2.39.5
> >
> 
> Kind regards
> Uffe

Best Regards,
Hiago.
