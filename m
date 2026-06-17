Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B99338D40A;
	Wed, 17 Jun 2026 21:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781730379; cv=none; b=t/aDYsr+qarl4IBLlrXWoelZrf/A/pgky6dEN3Xqf7/G7qfw3fLBECysZL6xtXGNObHFIEKq+uWO0UKOydCXxVzARv4dw+DdlQEUdyPK5r7T2kdkFdSeSazUBY6v57dy2YgA0xzwHDM6nmE9mIZnUGY9k3Ha3Y5u6UWUPwInsDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781730379; c=relaxed/simple;
	bh=t4QC2ihSDEVFk+Lb1Srzy62X3QttL6pmentr90YtsuI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PFH0fN3STvvx2lCF7vdUyhW2ypNgaGBCxs6ptdtxVVlRo9LBlcL40jH3+o7rvctKJOvC9qFNIY2vHUwNRNxhruph+giQAY69K45UiFxS6miEMq3xL2tijYDLZy097XIK/Xh5826oI/yPg7i86bMX2eyfxiFJrtnc7z3kEtJxse4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ilx57rp+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ilx57rp+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F232B1F000E9;
	Wed, 17 Jun 2026 21:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781730378;
	bh=qH11nDHRe1xfZzYyEXpXl+pnPve9QlY8A4Ri3/gD4cc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ilx57rp+SVQUqvr93GrgpQJSMeXpjrXeyGUwuyC+iTSB6RlqSAJ1dvBvhJEeiy19b
	 70PBIAHwFvjU68uO3rRI3ul/Krk8QK0jAX0WxqSn9snmRnuG+E8WavkIoIZbUpzZ8O
	 obLAsuvfrmjY9du0RLK0Vkj55X5nc9STBUHK/Icb3lep3+SLNhOQ2dyEVmEEtRimN3
	 YE0wUhMXrbhNyV/uYXdQx2LZVPev2Spber9LmEqkS5n/3RY7BEGsO37V6opg57Z7H6
	 H/t3wQ+08sa0yitGyRAT4fc0xM95jK4gIgj36iwNsq4E4oQICdUjejSZK7nlLoXTvE
	 JaDkXcFotQADg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/8] media: v4l2-fwnode: Add common helper library
 for 1-to-1 subdev registration
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: conor+dt@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260617-imx8qxp_pcam-v5-2-7fa6c8e7fba7@nxp.com>
References: <20260617-imx8qxp_pcam-v5-0-7fa6c8e7fba7@nxp.com>
 <20260617-imx8qxp_pcam-v5-2-7fa6c8e7fba7@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 21:06:17 +0000
Message-Id: <20260617210617.F232B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Redundant cleanup and misguided teardown of `sd->subdev_notifier`.
--

commit ebb79cbbc440da4b8d1a35f25ce9168deff7467d
Author: Frank Li <Frank.Li@nxp.com>

media: v4l2-fwnode: Add common helper library for 1-to-1 subdev registration

This commit introduces a common helper library to encapsulate registration,
media entity initialization, and cleanup for 1-to-1 V4L2 subdevices,
reducing boilerplate in simple bridge and converter drivers.

> diff --git a/drivers/media/v4l2-core/v4l2-1to1.c b/drivers/media/v4l2-cor=
e/v4l2-1to1.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/media/v4l2-core/v4l2-1to1.c

[ ... ]

> +void media_async_subdev_1to1_cleanup(struct v4l2_subdev_1to1 *sd_1to1)
> +{
> +	struct v4l2_subdev *sd =3D &sd_1to1->sd;
> +
> +	v4l2_async_unregister_subdev(sd);
> +	v4l2_subdev_cleanup(sd);
> +	media_entity_cleanup(&sd->entity);
> +	v4l2_async_nf_unregister(sd->subdev_notifier);
> +	v4l2_async_nf_cleanup(sd->subdev_notifier);
> +
> +	kfree(sd->subdev_notifier);

[Severity: Low]
Does this code perform redundant cleanups?

Looking at v4l2_async_unregister_subdev(), it already handles unregistering,
cleaning up, freeing, and setting sd->subdev_notifier to NULL:

v4l2_async_unregister_subdev(struct v4l2_subdev *sd) {
    ...
    __v4l2_async_nf_unregister(sd->subdev_notifier);
    __v4l2_async_nf_cleanup(sd->subdev_notifier);
    kfree(sd->subdev_notifier);
    sd->subdev_notifier =3D NULL;
    ...
}

Since sd->subdev_notifier is NULL after v4l2_async_unregister_subdev()
returns, are the subsequent calls to v4l2_async_nf_unregister(),
v4l2_async_nf_cleanup(), and kfree() necessary here in
media_async_subdev_1to1_cleanup()?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617-imx8qxp_pc=
am-v5-0-7fa6c8e7fba7@nxp.com?part=3D2
