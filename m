Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52273E9C37;
	Tue, 21 Jul 2026 21:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784667680; cv=none; b=TFrx0OCgwTioDX0VzZXXEFuHnUyEIXRpWBb2aXRKzX9BIgA6hiceAPOySfYAPRAY21CTk4SJBATb6ooac8xJ0aKqLgdhBg8zV5NUWtrn02utrufdO9BEghdq6htKUwPIjmulpqEL0GkSHczHDf50Ob9L689lcjS0T0DA/gwqzLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784667680; c=relaxed/simple;
	bh=U1ieC93nBOcXHR1iuJ5hP8t3aU/OaYqGXRwOsil+3KM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lO3+QXYsClQTdchMGP19VtiMZG/OqVBOsn+eQoqWfKqlu9cquyf0xc3+r+QA++9YRiHmv34Eapk/nWwKhwnYu0z/zOchQNwO0MVMivQtaVEpmesAbOTSdeZXpgjslSaWFaDZAwemw3Sl+f+qS66+XZWzvs09BJtzP2sEiwzLC/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P3ihfrqK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P3ihfrqK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BBDA1F00A3A;
	Tue, 21 Jul 2026 21:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784667679;
	bh=7GR+EfR8+JJgts0vn1Oz/HSdNljpS3w5R29f5gbBILU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P3ihfrqKCDr3fLV9qKWqXjJMV79V0NzDinEAgrqSZUt57J0XNdLgjL47VuiJjXm2r
	 cHhrpoQYB4hILWhJG4/B7HYiSTWNqqikmypw9BPpN+MSzC652Msj39s3GT9oELQr+U
	 xHm1ZeHVxThBMEHvHXM7VX8LIYSYZYVFnWx7i4EORAte4l7/sRFm1hxScE3k1gmITV
	 MFRsO5vYLvrfwk97nz74iTTEqiZDgqfX8vkc+/7saa8HNb2ja0KV2BWQx2SNb/JcZB
	 UY+U+n3MXTzlFnovT6zsbJlRs19sZwW44bG142QxJYUn9IADqQhTWLuJ1uB2FGL8//
	 5ldN/VaMU3FTA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 3/5] rpmsg: core: match rpmsg device IDs by prefix
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shenwei Wang" <shenwei.wang@oss.nxp.com>
Cc: Frank.Li@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260721204704.400781-4-shenwei.wang@oss.nxp.com>
References: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
 <20260721204704.400781-4-shenwei.wang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 21:01:18 +0000
Message-Id: <20260721210119.2BBDA1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Global change to prefix matching breaks exact match semantics, cau=
sing namespace collisions and incorrect driver binding.
- [High] Prefix matching breaks module auto-loading via udev because export=
ed module aliases remain exact matches.
--

--- Patch [3]: [PATCH v15 3/5] rpmsg: core: match rpmsg device IDs by prefi=
x ---
commit e561ac26959a610ff64bc4d231b963dec9f0caf9
Author: Shenwei Wang <shenwei.wang@nxp.com>

rpmsg: core: match rpmsg device IDs by prefix

This patch updates rpmsg_id_match to compare only the length of the driver's
ID string instead of the full RPMSG_NAME_SIZE. This allows id_table entries
to act as prefixes, enabling drivers to bind to dynamically suffixed device
names.

> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index 04bfcc75f05b4..97a4db52b0401 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -386,7 +386,9 @@ ATTRIBUTE_GROUPS(rpmsg_dev);
>  static inline int rpmsg_id_match(const struct rpmsg_device *rpdev,
>  				  const struct rpmsg_device_id *id)
>  {
> -	return strncmp(id->name, rpdev->id.name, RPMSG_NAME_SIZE) =3D=3D 0;
> +	size_t len =3D strnlen(id->name, RPMSG_NAME_SIZE);
> +
> +	return strncmp(id->name, rpdev->id.name, len) =3D=3D 0;

[Severity: High]
Does changing this to a strict prefix match prevent rpmsg drivers from
enforcing an exact name match?

If there is a driver for "sensor" and another for "sensor-temp", wouldn't
the "sensor" driver incorrectly bind to the "sensor-temp" device if it
happens to be evaluated first?

It appears the correct architectural way to multiplex multiple identical
services in the rpmsg framework is to use the exact same service name
(channel name) and distinguish instances using unique source and destination
endpoint addresses, rather than dynamically suffixed names.

[Severity: High]
Will this prefix matching logic break module auto-loading via udev?

When the firmware creates a device with a dynamically suffixed name,
rpmsg_uevent() emits a uevent containing the full suffixed name:

drivers/rpmsg/rpmsg_core.c:rpmsg_uevent() {
    ...
    return add_uevent_var(env, "MODALIAS=3D" RPMSG_DEVICE_MODALIAS_FMT,
                          rpdev->id.name);
}

However, scripts/mod/file2alias.c generates module aliases based on the
exact string in the rpmsg_device_id table, without a trailing wildcard:

scripts/mod/file2alias.c:do_rpmsg_entry() {
    ...
    module_alias_printf(mod, false, RPMSG_DEVICE_MODALIAS_FMT, *name);
    ...
}

Since the module alias lacks a wildcard, userspace tools like modprobe
will attempt an exact string match and fail to load the driver for the
suffixed device name.

>  }
> =20
>  /* match rpmsg channel and rpmsg driver */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721204704.4007=
81-1-shenwei.wang@oss.nxp.com?part=3D3
