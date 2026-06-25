Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B313E832B;
	Thu, 25 Jun 2026 16:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782403591; cv=none; b=JMNtGCeUtSAcZe+iLp2OqmTq/TFK2ZXRxWCXh2dmFZmPFPPskzgnySDJ6gXiL6rn3VC7LkMpZdD9i08Vs+OQGYpoBI327C1vEGRAekbM9rqEcjPK2vh+Ef7GAeo3G9lIai3Tlm845u1fSMwDZu2Jg14pCndIvHOQh6sHRQuz1A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782403591; c=relaxed/simple;
	bh=iMSmx0WUJLs3pRzTfhWKQadJwGQA7jr3+9lyQKvp5v0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MvKl5LWfeQ23XLRCG06TXPDzhJ8HaS6RQpI4davW97T6XdiGiwO6n++alPbbYtN8DvRrHed3LpXgIl6UU3xJT/Pf+hlOriFNhg5PAb2QxtocgeBJ/26fMUupXHrWSuchJT2R2cwlBdAEwKT7HOMYLIOvQeIgLdIs2BqUDNvgh18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a0QoB+BH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a0QoB+BH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25F911F000E9;
	Thu, 25 Jun 2026 16:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782403587;
	bh=r7eJ4ZN15hryT71sF55Lx6shJ6Qymm8GYvhbh4i5h5Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a0QoB+BHX8hagcftbuiCcknl05vt68PFNgToE72lFmmBM/DlbkhaVAx/ikzb6KUtx
	 7MXzxxP37rgfVJ2nXItVMcaI9zgz86HKyrUWI3d5pKA5uq1KCRFL35frlLBAOXdXDs
	 Fxur2L2yQdpi0QkTTHCu5dNX+0MgQ/in+9+5gBJhAE0IZR81EiXjk05K3N6Mfq0svy
	 epxubgjqVfS1WqKL4Gi6N7PRScN23+lOj7/3fr2MU43ph6OdCuZFdICoj3tWQcksVV
	 Y5cvQE+s7PGnRg8JL/yg7+icYOB5s4IIG/y77KR8YCh98DK4DPj5U+gf7Huw4BFfZc
	 14Kh35ftiNUxA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 3/5] rpmsg: core: match rpmsg device IDs by prefix
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shenwei Wang" <shenwei.wang@oss.nxp.com>
Cc: imx@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260625155432.815185-4-shenwei.wang@oss.nxp.com>
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
 <20260625155432.815185-4-shenwei.wang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 16:06:26 +0000
Message-Id: <20260625160627.25F911F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Forcing global prefix matching on all rpmsg drivers without a 'lon=
gest-prefix match' rule can cause unintended device binding and collisions.
- [Medium] Module auto-loading via udev is broken for dynamically suffixed =
devices because module alias generation remains exact and lacks a trailing =
wildcard.
--

commit 7cf465d01393f57a212484ddaf8a931c40ec4179
Author: Shenwei Wang <shenwei.wang@nxp.com>

rpmsg: core: match rpmsg device IDs by prefix

This commit updates the rpmsg device matching logic to compare only the
length of the id->name string. This allows id_table entries to act as
prefixes, enabling drivers to bind to dynamically suffixed devices.

> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index e7f7831d37f89..f95bfc9965d4c 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -414,7 +414,9 @@ ATTRIBUTE_GROUPS(rpmsg_dev);
>  static inline int rpmsg_id_match(const struct rpmsg_device *rpdev,
>  				  const struct rpmsg_device_id *id)
>  {
> -	return strncmp(id->name, rpdev->id.name, RPMSG_NAME_SIZE) =3D=3D 0;
> +	size_t len =3D strnlen(id->name, RPMSG_NAME_SIZE);
> +
> +	return strncmp(id->name, rpdev->id.name, len) =3D=3D 0;
>  }

[Severity: High]
Will this change cause unintended driver binding for existing drivers that
expect an exact match?

Because this modifies the global match behavior for all rpmsg drivers witho=
ut
an opt-in flag or longest-prefix match logic, a shorter existing prefix cou=
ld
hijack a new device.

For example, if a remote processor creates a channel named rpmsg-tty-contro=
l,
would it be incorrectly matched by an existing driver registered as rpmsg-t=
ty?

Looking at rpmsg_dev_match(), the iteration returns on the first successful
match:

drivers/rpmsg/rpmsg_core.c:rpmsg_dev_match() {
        ...
        for (i =3D 0; ids[i].name[0]; i++)
                if (rpmsg_id_match(rpdev, &ids[i])) {
                        rpdev->id.driver_data =3D ids[i].driver_data;
                        return 1;
                }
        ...
}

Could this result in a collision if multiple IDs share the same prefix?


[Severity: Medium]
Does this change break module auto-loading via udev for dynamically suffixed
devices?

When a dynamically suffixed device is registered, rpmsg_uevent() emits the
exact name:

drivers/rpmsg/rpmsg_core.c:rpmsg_uevent() {
        ...
        return add_uevent_var(env, "MODALIAS=3D" RPMSG_DEVICE_MODALIAS_FMT,
                                        rpdev->id.name);
}

However, the module alias generated by file2alias.c does not append a
wildcard for prefix matching:

scripts/mod/file2alias.c:do_rpmsg_entry() {
        ...
        module_alias_printf(mod, false, RPMSG_DEVICE_MODALIAS_FMT, *name);
}

Since module_alias_printf() is called with append_wildcard set to false, the
generated alias will be an exact match (e.g., rpmsg:rpmsg-io-) which won't
match the uevent string (e.g., MODALIAS=3Drpmsg:rpmsg-io-1).=20

Will this prevent the module from loading automatically?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625155432.8151=
85-1-shenwei.wang@oss.nxp.com?part=3D3
