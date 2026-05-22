Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2033644C2
	for <imx@lists.linux.dev>; Fri, 22 May 2026 14:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779461908; cv=none; b=RLHEtiOo/uYNHtV0TtTBAHzu7VCnxuqowyJQlMEj61KaUpmAbQ8PoipcXcNYOlGCVkQXddR5vyZgWnFLsaoRENJ/HoZFdOsu0oof8moNxefkkNEc+KkYW7ohs9qXlteMLUMG0hdb1aSttmJiOHqOGFf7caXmTXzibIPewr23ExI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779461908; c=relaxed/simple;
	bh=+QesBWakLzdwWA64H593seTw/u9mrpfWj7AjvjtBkYc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GnWeJMvxQ2kDHBW0CK4B07pqoDvZfLNdw8eKDkfjIFl5sP7IZGf88Qsu+CkQB38AjPm5LobFCfkTBUXtKrOCmj0RPsNlx/b+fONfvHcY+ieZm4DonqixA036OPNypHABl97vrac/QNwmw9vvQG1mY7wFdAtXSBdaztuk0WdwVV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hVJfdp3o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hVJfdp3o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CD8C1F000E9;
	Fri, 22 May 2026 14:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779461906;
	bh=2iIVFbt3kEnzypKEhUR8mNAolaDqEcKGKZnb4hIeq24=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hVJfdp3oj4jneiiYS73Gxmui50RcbqjwhHo3krEn+tlecluAK0kEz6gZvxpv6LyVO
	 MXySjtaW03Ml/Xo/zV8G36NZSf7dm7wbV/MGyk3TUAj5PTfaFsC8yipmJFKUb2ABtd
	 5FQJijADD9ZOYK4HAj8pzbLGzMEF06e4cZKVp+quivfPPcQIZ23+lwevUKYlgGUPGq
	 2UbsuGrYoM0ffqIk+eMBVMGu4o/BfOTjk34N1Wrzx7hnOC/lwC+8Vqz1UqUWvXB1gc
	 IQbRNMEm4yZa2tp41Qx/s0nLbrpjxyu3pwvH9b7sYoAu/89lwYv0uwbBiJJnaafl7N
	 guvT+9J/jHdsw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] media: v4l2-fwnode: Fix subdev owner overwritten in
 v4l2_async_register_subdev_sensor()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mirela Rabulea" <mirela.rabulea@nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260522143120.690330-1-mirela.rabulea@nxp.com>
References: <20260522143120.690330-1-mirela.rabulea@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 14:58:25 +0000
Message-Id: <20260522145826.2CD8C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The `v4l2_flash_init()` and `v4l2_flash_indicator_init()` helpers =
incorrectly attribute the flash subdevice owner to the `v4l2-flash-led-clas=
s` module instead of the calling LED driver, leading to a Use-After-Free vu=
lnerability upon premature module unloading.
- [High] Error handling in `__v4l2_async_register_subdev()` fails to unbind=
 previously matched connections within the `while` loop, leaking them and c=
ausing a Use-After-Free when the subdevice is freed.
--

commit 6f9889016345e2094c47d91f08c20902a0dee478
Author: Mirela Rabulea <mirela.rabulea@nxp.com>

media: v4l2-fwnode: Fix subdev owner overwritten in v4l2_async_register_sub=
dev_sensor()

The v4l2 helper v4l2_async_register_subdev_sensor() calls
v4l2_async_register_subdev(), which expands to pass THIS_MODULE. Since
this happens inside v4l2-fwnode.c, it incorrectly assigns the v4l2-fwnode
module as the owner instead of the sensor driver module. This prevents
proper reference counting and allows premature module removal.

Link: https://lore.kernel.org/linux-media/20240315073125.275501-2-sakari.ai=
lus@linux.intel.com/

> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-c=
ore/v4l2-fwnode.c
> index 77f3298821b5c..62a3a452f7884 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c

[ ... ]

> @@ -1282,7 +1282,7 @@ int v4l2_async_register_subdev_sensor(struct v4l2_s=
ubdev *sd)
>  	if (ret < 0)
>  		goto out_cleanup;
> =20
> -	ret =3D v4l2_async_register_subdev(sd);
> +	ret =3D __v4l2_async_register_subdev(sd, module);

[Severity: High]
This is a pre-existing issue, but does __v4l2_async_register_subdev() fail =
to
unbind previously matched connections within its match loop if a later
connection fails?

If a subdevice successfully binds its first connection and moves it to the
notifier's done_list, but encounters an error on a subsequent iteration of =
the
while loop:

drivers/media/v4l2-core/v4l2-async.c:__v4l2_async_register_subdev() {
    ...
		while ((asc =3D v4l2_async_find_match(notifier, sd))) {
			ret =3D v4l2_async_match_notify(notifier, v4l2_dev, sd,
						      asc);
			if (ret)
				goto err_unlock;
    ...
}

The error paths appear to only clean up the current iteration's connection =
or
perform no cleanup at all.

Would this leave the first connection dangling in the bridge notifier's
done_list with asc->sd still pointing to the subdevice? If the registration
returns an error, the sensor driver might free the subdevice, leading to a
use-after-free later when the bridge driver unregisters its notifier.

>  	if (ret < 0)
>  		goto out_unregister;
> =20
> diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> index f26c323e9c963..54a2d9620ed5b 100644
> --- a/include/media/v4l2-async.h
> +++ b/include/media/v4l2-async.h

[ ... ]

> @@ -333,8 +333,10 @@ int __v4l2_async_register_subdev(struct v4l2_subdev =
*sd, struct module *module);
>   * An error is returned if the module is no longer loaded on any attempts
>   * to register it.
>   */
> +#define v4l2_async_register_subdev_sensor(sd) \
> +	__v4l2_async_register_subdev_sensor(sd, THIS_MODULE)

[Severity: High]
This is a pre-existing issue, but does the exact same ownership problem fix=
ed
here also exist for v4l2_flash_init() and v4l2_flash_indicator_init()?

Both functions are compiled into the v4l2-flash-led-class module and intern=
ally
call v4l2_async_register_subdev(sd). Since the macro evaluates to THIS_MODU=
LE,
would they capture the v4l2-flash-led-class module as the owner instead of =
the
calling LED driver (e.g., leds-tps6131x)?

Could this allow a user to unload the LED driver module while the subdevice
file descriptor remains open, leading to a use-after-free when interacting
with or closing the freed subdevice?

>  int __must_check
> -__v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd);
> +__v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd, struct modul=
e *module);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522143120.6903=
30-1-mirela.rabulea@nxp.com?part=3D1
