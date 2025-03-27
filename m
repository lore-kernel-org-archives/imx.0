Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E1515533F
	for <imx@lists.linux.dev>; Thu, 27 Mar 2025 20:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743105763; cv=none; b=Y3jzi4Qs9N9vbRjTE3nryFsE6zuYjfZs/2OoU9Uu7adilCjSLVVtiAdecb9bp1wiuH0miKyIA/uXpyy7TiIioMPaEdUpo1jWCLGS85mwLVHOKD4DJz1zRRYIi3nEfYOZ/PeXzpuW9HfA5mUfxUkqlUYXKDz5iQtsA0xEEqKR0As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743105763; c=relaxed/simple;
	bh=upFVl2TTrdrPVb+18Vptv5pAKRaC8ryTOgpQjZLsV/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q8kmT3kSL6mCumYKlZ4LBsF5mHiIUdX2ySz+i1+Bv5mzKSFf2mUZOKujKHx+pMDb0V873rYMIiAx3r+osTR84sf+Yh7c9b6LIdWvbb04EGlUjI9PAtltZz14cGYZnYmrEjI9CdbmLhNjvEqwGmyQQVCBL2bUV6rlX2QZYsxISeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ixwosobR; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ixwosobR"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-224100e9a5cso29978575ad.2
        for <imx@lists.linux.dev>; Thu, 27 Mar 2025 13:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743105761; x=1743710561; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wuAJatc2JmXf0iY6WMCrv4PggaSVzunJXyftBhSJxQY=;
        b=ixwosobRmfNPGdABdRwRLS26vK6OYmKOWGJ/ObuBasNISUotkL2a/eWvOfNWnr1zeS
         t+9shFtRlRLVg2J6sOvUOQBNotGNIYieMhn1sYE0DCQQ6+VadfiMu2EWRGREyF9x5VM7
         hYHX/WEgvcRMAuKZ0w00ZhPG2PEYbF6D8s1X6BipxtbDEW/FM40Vem0M89qLicecx/P8
         wKvqTTLJyo83jl++/CbO/3HAu+6lDgiPFYWzTo5Kr/dcfXMuDjpvWnvKURpaneqLi6vx
         nMEtynuLzGM5vHW6ty+FTPL9EdSd4XRR+GpzuJQYWyaBC3Itihs1QoIn74daREHnYHoY
         rAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743105761; x=1743710561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wuAJatc2JmXf0iY6WMCrv4PggaSVzunJXyftBhSJxQY=;
        b=oPuiGVmi+Oe12zfaovlrz0Og/pAZ3V6EWdauP1kcJlaBthommjiMNWBqGceSSGRGHh
         gccygtiUIDJRdwJwjou9B70B5dIrPx4/jpdU1HT0N2VdnIrj3ZAZRSb2dpt874QaeZY6
         dqrP5eH3MhR1jVJf5GMtj6iu8Ey3SA7MTONZJUCJHMNLoEDHLJm7crcjRcD4Rd8P/dkZ
         OfyCuF8+/VXFQ+q6UKSEI5RB4C4Xx/cqGAKqvf1YqTzEQ/U9m8w/2VBmr5YHWTIRX0H9
         NXHDNlIcMelGhAz/p0yh4s86WwPoDVeCewsL1Qct/7nTcz6tXpp+/f/l+L+6E8MqHVF5
         ur4w==
X-Forwarded-Encrypted: i=1; AJvYcCVgjZvReTSbkQru3ml9A/BISCyO5IcEfxy0szK1MHopX1xjUrZBNScGaQoymz6oAWaJ2yc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxmZg9zlOR6XXHk1iG3txQDtNb2rVQMhmy5guaau0PCFP6iVvqS
	LH4OcNfg/ZjmFpdDqBnBBgELCACj3MlLWzh1VBB9LqG/brl76nzKsk0dlQgUkz2QnFIRSROeeg1
	cveH3uo3eR5rDOWC5tVrFq4XFa44=
X-Gm-Gg: ASbGncsvkTfsmZap3m2GJTFUImOM4DJttzXVj2fNBud1qoVu/sJ/NybroqgrpbYHD4A
	O5R7BRHfvbIrmbl5yQ9+BPHmGpXrMsRDm1lLr7ZpLlEMcYiywf70Z93jnSBsK0s2G9wY3tCm6gG
	4oMgvy5Fpda6Lwz7uzzyXXSmznpQ==
X-Google-Smtp-Source: AGHT+IFauHqFGz+l5KSmNKiQ87uiI0RmmUS7PE3RtYqUxj+Ju364KNFhZ3pFAY9xmj01bZt3AIVOI+wHC5S3cDOhqvE=
X-Received: by 2002:a17:90b:5686:b0:2fa:15ab:4dff with SMTP id
 98e67ed59e1d1-303a906ebc2mr6863917a91.31.1743105760980; Thu, 27 Mar 2025
 13:02:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com> <20250210-8qxp_camera-v3-4-324f5105accc@nxp.com>
In-Reply-To: <20250210-8qxp_camera-v3-4-324f5105accc@nxp.com>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 27 Mar 2025 15:02:29 -0500
X-Gm-Features: AQ5f1JpXPfB7WcMK1DcTCK1yjsON2ZzVKgj_sI1ozYwDfWnEj3NMxxnXx4v7m90
Message-ID: <CAHCN7x+6_xxkx-Fft6WnfsVyqy_v3c732uKuEanrP64jv3Kj1g@mail.gmail.com>
Subject: Re: [PATCH v3 04/12] media: nxp: imx8-isi: Allow num_sources to be
 greater than num_sink
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>, 
	Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	Robert Chiras <robert.chiras@nxp.com>, "Guoniu.zhou" <guoniu.zhou@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 3:01=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
>
> Allow num_sources (drvdata: num_channels) to be greater than num_sink
> (drvdata: num_ports + 1).
>
> ISI support stream multiplexing, such as differentiates multiple cameras
> from a single 2-lane MIPI input, or duplicates input stream into multiple
> outputs. So num_channels may be greater than num_ports at some platform.

Can you tell me which platforms support this?   Is this through
virtual channels, or do you physically connect lanes 1 and 2 to one
camera and lanes 3 and 4 to another?

adam
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v1 to v3
> - none
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/dr=
ivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> index 93a55c97cd173..ba5b2d3617a23 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -188,11 +188,11 @@ static int mxc_isi_crossbar_init_state(struct v4l2_=
subdev *sd,
>          * Create a 1:1 mapping between pixel link inputs and outputs to
>          * pipelines by default.
>          */
> -       routes =3D kcalloc(xbar->num_sources, sizeof(*routes), GFP_KERNEL=
);
> +       routes =3D kcalloc(xbar->num_sinks - 1, sizeof(*routes), GFP_KERN=
EL);
>         if (!routes)
>                 return -ENOMEM;
>
> -       for (i =3D 0; i < xbar->num_sources; ++i) {
> +       for (i =3D 0; i < xbar->num_sinks - 1; ++i) {
>                 struct v4l2_subdev_route *route =3D &routes[i];
>
>                 route->sink_pad =3D i;
> @@ -200,7 +200,7 @@ static int mxc_isi_crossbar_init_state(struct v4l2_su=
bdev *sd,
>                 route->flags =3D V4L2_SUBDEV_ROUTE_FL_ACTIVE;
>         }
>
> -       routing.num_routes =3D xbar->num_sources;
> +       routing.num_routes =3D xbar->num_sinks - 1;
>         routing.routes =3D routes;
>
>         ret =3D __mxc_isi_crossbar_set_routing(sd, state, &routing);
> @@ -453,7 +453,7 @@ int mxc_isi_crossbar_init(struct mxc_isi_dev *isi)
>          * the memory input.
>          */
>         xbar->num_sinks =3D isi->pdata->num_ports + 1;
> -       xbar->num_sources =3D isi->pdata->num_ports;
> +       xbar->num_sources =3D isi->pdata->num_channels;
>         num_pads =3D xbar->num_sinks + xbar->num_sources;
>
>         xbar->pads =3D kcalloc(num_pads, sizeof(*xbar->pads), GFP_KERNEL)=
;
>
> --
> 2.34.1
>
>
