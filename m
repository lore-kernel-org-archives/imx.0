Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9EF3769E3
	for <imx@lists.linux.dev>; Tue, 23 Jun 2026 10:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782210101; cv=none; b=JIZwhblEbO4cMSQ2zVgyvHkM6WQLsC7tBzg2FZPAWThdc6P/NSU1cV8q0JkCY1kBLnVoGfpo6/t96a2a/n8T90fAqICjFR3gbYjbVyZ5gCRT9oI0nIzgN7RqFYlVBrdQssdDmdUC4I+qJmNfoHHoZOgRaGzaKm4DqnX5jlx5WhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782210101; c=relaxed/simple;
	bh=IjpFFomcgYWsNbwOvLu4OPgPpQ31Oogqw6gkqTdzph4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C4L/uZIDdgbtGPm4cIfWoU0XnstJG3vdwt/CmkWEAQCOfy3TSE4DIKoNhdhlJNgg3DtgqaEZQpU+/x/hb7nW8FkRqgXcMUZXFcvf+hQD0V0hFsh20tXHnlCzGCxFoYuXw/tQEFIEY6tzW7TKFF5myZ8i/2nqE664a2cp5psLLnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TouiWOJG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TouiWOJG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BE021F000E9;
	Tue, 23 Jun 2026 10:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782210099;
	bh=rPav65QB4r1EMbkHNwQ8dCQCBnsnbjx0/yoppyK5veg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TouiWOJGM2Nxe6GaL+qh+ec0CzW5ScTIrPAp+Kpt7GsZqIrTXIpSlzAXnhFvQl5oq
	 SPOHTjn/8t4oy4ng3+fCC9rV9GNRmQJYDKWgGq/mntTu5fY6TRE0RlWXLIxxLMxvsm
	 iWWCeS/z7Eu5McHwePZPSaqz7G2pRLqwDb28VB0OhP/k/9kCvLLC24u482qW4g0IuG
	 SBk4dn0XwqN8G+UGSTWtInuqynxJ5Nt9vWaYLv3gJXtA4wEA6J1BRoD8WMEN6UsflT
	 Wq0Yx98m2kpq+b7YcLZCmnKfYbnpGPwEuqYDwLITOPphQReG8pEl1VdwGZNtpuoY8Z
	 8rguwRlTadXGw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: dwc3: imx8mp: make dwc3_imx_glue_ops static and
 rename to imx8mp
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ben Dooks" <ben.dooks@codethink.co.uk>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260623101043.748359-1-ben.dooks@codethink.co.uk>
References: <20260623101043.748359-1-ben.dooks@codethink.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 10:21:39 +0000
Message-Id: <20260623102139.8BE021F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The `dwc3->glue_ops` pointer is assigned after `of_platform_popula=
te()` returns, creating a race condition where role switches can occur befo=
re the `pre_set_role` callback is registered.
--

commit b965a813ee62bb063a7c9f8c07f1ddfe408ebc85
Author: Ben Dooks <ben.dooks@codethink.co.uk>

usb: dwc3: imx8mp: make dwc3_imx_glue_ops static and rename to imx8mp

This commit renames dwc3_imx_glue_ops to dwc3_imx8mp_glue_ops and makes
it static to fix a sparse warning about an undeclared symbol.

> diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8m=
p.c
> index 1cf96540b66e4..de8c17bc940d2 100644
> --- a/drivers/usb/dwc3/dwc3-imx8mp.c
> +++ b/drivers/usb/dwc3/dwc3-imx8mp.c
[ ... ]
> @@ -266,7 +266,7 @@ static int dwc3_imx8mp_probe(struct platform_device *=
pdev)
>  		goto put_dwc3;
>  	}
> =20
> -	dwc3->glue_ops =3D &dwc3_imx_glue_ops;
> +	dwc3->glue_ops =3D &dwc3_imx8mp_glue_ops;

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for a role
switch to occur before glue_ops is registered?

In dwc3_imx8mp_probe(), of_platform_populate() runs earlier and probes the
dwc3 core, which registers its USB role switch. If a concurrent Type-C or
extcon event triggers a role switch before dwc3->glue_ops is assigned here,
dwc3_imx8mp_pre_set_role() won't be called.

Does this leave pm_runtime autosuspend enabled for the host role, potential=
ly
causing the XHCI controller to clear RUN_STOP and disable wakeups so it
becomes unresponsive to device insertions?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623101043.7483=
59-1-ben.dooks@codethink.co.uk?part=3D1
