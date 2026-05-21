Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216D32D3A75
	for <imx@lists.linux.dev>; Thu, 21 May 2026 12:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368342; cv=none; b=MdJ+twN8hQnUx2Xcyqw62E0piCjGEXMncJoIjQbNxtjVQSgMQW4MEkD64gwSS8ZZRMomQcEJK6pWIjrI1DJd7mpXJmBo6dmZp2jkVsD1cMI6DJi5eJWROvSZSiJgR5knZo+9RmUAjMtSDisgJMS8h5DYCXVedo/bdFXUmEzHCxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368342; c=relaxed/simple;
	bh=vOBr9Z8ttEhXy8Hc99LC5fwNXMHGh3sTY9rICgZ+JDM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i4wLtyBFgKXGICWhBqqH8nlfoaLG/ZkoRWl/y/d0x27ZF959WGhI5s5Q4EoM3FwVbXCaCX/ghNbap2soVQskkbHm87vy0BDYIc+H29EttYs1XpwevM0l/semc3l9wQJSAgwH8iGLqTkKTyDMrJM+jC5s1aYzjASMAAaEh80Y6SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ejHAMsRF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ejHAMsRF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9164A1F00A3B;
	Thu, 21 May 2026 12:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779368340;
	bh=iswwdABMaxLeTLzIWxnvWfl1MpGR8j1qRo45diwS0Jw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ejHAMsRFTImRGgwBeZ144V84hKOaQw3whpIc3cIbCCdO/YUDvUjszG7+EnD5qi39W
	 74+/0fMYS7lpR5ilN4pZ9n85E7/Ejm8rpwg8pBLsB1rz18yPVtN1Pv/OIWGOqEW8r/
	 vDP4TqXJEXXKnkVqeoQSyzKghCPRfaMBHKYxwWgq/GO0GsvwKZenJwJHJMBpXf2+eE
	 38+V3vPb0es8ASXwvkk3n0QqDBUw9l1sMKRcwrS52ydZmjFfEfrXSbjZiWCOOFMcrL
	 dA3r5VpMwUtDWByIejxdB5PxTJG6q9vzCgENdsO33ofV3zEs4AxtxACZ3E/TyuvydW
	 NDQ2U1nCiQBhA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: v4l2-fwnode: Fix subdev owner overwritten in
 v4l2_async_register_subdev_sensor()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mirela Rabulea" <mirela.rabulea@nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260521122646.600179-1-mirela.rabulea@nxp.com>
References: <20260521122646.600179-1-mirela.rabulea@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 12:58:59 +0000
Message-Id: <20260521125900.9164A1F00A3B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Preexisting Use-After-Free Vulnerability in Subdev Owner Registrat=
ion
--

commit fdcb49ff4268301dc4e675c5a0c14133a98c403e
Author: Mirela Rabulea <mirela.rabulea@nxp.com>

media: v4l2-fwnode: Fix subdev owner overwritten in v4l2_async_register_sub=
dev_sensor()

This commit fixes a reference counting issue during async subdevice
registration by directly calling __v4l2_async_register_subdev() with
the correct module owner. Previously, the macro expansion of
v4l2_async_register_subdev() incorrectly assigned THIS_MODULE to the
subdevice owner.

> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-c=
ore/v4l2-fwnode.c
> index 77f3298821b5c..57284b7adddfa 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -1282,7 +1282,7 @@ int v4l2_async_register_subdev_sensor(struct v4l2_s=
ubdev *sd)
>  	if (ret < 0)
>  		goto out_cleanup;
> =20
> -	ret =3D v4l2_async_register_subdev(sd);
> +	ret =3D __v4l2_async_register_subdev(sd, sd->owner);

[Severity: High]
This is a pre-existing issue, but does this exact same module owner
overwrite bug happen in v4l2-flash-led-class.c as well?

Looking at v4l2_flash_init() and v4l2_flash_indicator_init(), they also
use the v4l2_async_register_subdev() macro to register a subdevice:

drivers/media/v4l2-core/v4l2-flash-led-class.c:v4l2_flash_init() {
    ...
    ret =3D v4l2_async_register_subdev(sd);
    if (ret < 0)
        ...
}

Since this macro expands to __v4l2_async_register_subdev(sd, THIS_MODULE)
inside v4l2-flash-led-class.c, won't THIS_MODULE evaluate to the
v4l2-flash-led-class module rather than the underlying LED hardware driver
module (like leds-mt6360)?

If a userspace process opens the V4L2 subdevice node /dev/v4l-subdevX,
it increments the refcount of v4l2-flash-led-class but leaves the LED
hardware driver's module refcount at 0.

Could this allow the LED hardware driver module to be unloaded while a
userspace process still holds the open file descriptor? If unloaded, the
unbind path would free the v4l2_flash and v4l2_subdev structures, and a
subsequent poll, ioctl, or close could trigger a use-after-free.

Should those functions also be updated to explicitly call
__v4l2_async_register_subdev() with the correct owner, perhaps using
dev->driver ? dev->driver->owner : NULL?

>  	if (ret < 0)
>  		goto out_unregister;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521122646.6001=
79-1-mirela.rabulea@nxp.com?part=3D1
