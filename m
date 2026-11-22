Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795348413;
	b=Pm7w2q/ryne4tfqvSs+Ub+2HJ4uiDISPJG90OwjOH1tGwm2FexmzvXB12fAx4HB14kVn
	 r+dsVsNLneLqnuT2W9Uo6CdBzlBrr5uwIh791BY7JzhJs1dbc20fEmCHeaMCdpfK5YkJK
	 lJhHK7wgKUbJkn6AIyV/I1/Q3f9simE3R9O6v6srIIVvd+Qf2vks2e8wPblB1CAo94Gx/
	 nRrn3RkRRVah3yU9cQuPR6SSxv+iGyP1eAV0bo27ymrkM+pQ/JvNQ7//v05D8v4kgvA7V
	 uRaBkvdOwThY1BTkQ3MAmAX7qWaxldPC0SI6y6LOQGSYJwhL95HegHIgPBi4DtDl/Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795348413;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Km95FdJ3grboSVXJfnJERlZVzUyfSZ1Xz0g6pqN01GA=;
	b=OVlgm4LGViKvCujSn9XdZrbSJMcxrKlHkCZk99MY4Hn0nxktngCji66llqMFT7vNtvRL
	 OEHckEgPMEwijLyFGqPYMcm+MXVqBxenOk5UTq80aJlnWzANFKBSd860KFbqbt/K/h/Uq
	 5xNWCrUbePLBr5HpD1Me1k/1995HgE+/Bb0Z98OFjK03dOW+Hgh/unW/leg7kBQ4m+Pc6
	 19S2p5wsMODpM8s3rWblo9SL7MZnBp0CDOfT1lbsF4SRhuBc41HvKMz+ORjM69WxvxRcM
	 Zo4IYVAylROy1xrX4XBgjIg/omZA2qpc9XBwHwgLOYMPhI6Ws8JsOlWA18tC1afaagQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gEkAZas7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D26606A320
	for <imx@lists.linux.dev>; Sun, 22 Nov 2026 11:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gEkAZas7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E46021F000C6;
	Sun, 22 Nov 2026 11:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795348413;
	bh=Km95FdJ3grboSVXJfnJERlZVzUyfSZ1Xz0g6pqN01GA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gEkAZas7JQ1+JnMhAw1oFnfYrF1cWaAnZcFg+JUyKpYo2/+NjyR5iHdEWbW7bjJy7
	 gTGFrLhIteiyIf+mYDdeoHg+oPTYrSqb73FnMjTs2BztIgRhoiFLtwSejblPk4a97k
	 VtUNueSaZa4HVL8BwZ1lWJARtlt3rCtS59PwM2nhDfZLmOOROtfs3f1YqocdjQjqT5
	 e7HV/kTqf7laoZaWvnhPiEXb+RaPzLHwDCtfXXY1nlP7DpJarQzj3BEoQ98oFbrXJR
	 rAFZLPMNbmSU/P+lowCZiYqYyodm6VEaDdp/BcirMamVOnZQcVNbfKrhDRFAP3folC
	 t8pE1LHiUMlgQ==
Message-ID: <sashiko-outbox-227913@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/2] media: imx: remove legacy video node control and
 format handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaqi Shi" <shijiaqi_develop@163.com>, imx@lists.linux.dev
Cc: Frank.Li@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261122114205.494704-2-shijiaqi_develop@163.com>
References: <20261122114205.494704-1-shijiaqi_develop@163.com>
 <20261122114205.494704-2-shijiaqi_develop@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 11:53:32 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] media: imx: callers of imx_media_capture_device_init() pass
  legacy_api
--

commit f477c79fad0e434429f9fa5c4d3df4807bcb087f
Author: Jiaqi Shi <shijiaqi_develop@163.com>

media: imx: remove legacy video node control and format handling

This commit removes subdevice control inheritance to capture video nodes
and switches capture nodes to source-independent format negotiation with
stream-time format validation.

> diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/stagin=
g/media/imx/imx-ic-prpencvf.c
> index 3430ddeac3569..bd4c2e7a0b8d0 100644
> --- a/drivers/staging/media/imx/imx-ic-prpencvf.c
> +++ b/drivers/staging/media/imx/imx-ic-prpencvf.c

[ ... ]

> @@ -1280,13 +1281,13 @@ static int prp_registered(struct v4l2_subdev *sd)
> =20
>  	priv->vdev =3D imx_media_capture_device_init(ic_priv->ipu_dev,
>  						   &ic_priv->sd,
> -						   PRPENCVF_SRC_PAD, true);
> +						   PRPENCVF_SRC_PAD, true, true);

[Severity: Medium]
Should prp_registered() and csi_registered() pass legacy_api =3D false (or
should the legacy_api parameter and capture_legacy_ioctl_ops be removed)?

Because both callers of imx_media_capture_device_init() still pass
legacy_api =3D true:

drivers/staging/media/imx/imx-media-capture.c:imx_media_capture_device_init=
() {
	...
	vfd->ioctl_ops =3D legacy_api ? &capture_legacy_ioctl_ops
		       : &capture_ioctl_ops;
	...
	vfd->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING
			 | (!legacy_api ? V4L2_CAP_IO_MC : 0);
}

V4L2_CAP_IO_MC is never set on any capture device, so v4l_enum_fmt() in
v4l2-core zeroes f->mbus_code before calling capture_enum_fmt_vid_cap(),
making its f->mbus_code filtering unreachable from userspace.  In
addition, capture_ioctl_ops is left unused while
capture_legacy_enum_frameintervals() remains active and coupled to the
source subdevice's V4L2_SUBDEV_FORMAT_ACTIVE configuration.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122114205.4947=
04-1-shijiaqi_develop@163.com?part=3D1
