Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5ED7402B99
	for <imx@lists.linux.dev>; Sun, 20 Sep 2026 11:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789903204; cv=none; b=r81s9vnyvHbR5YIo1256lUwXTJbD2QTfNlby4lcg0jY7NQ/uRxcT+BTOSBL9u9Knrcdft2JTrzBq21IAARMeI/yyskRMPuZzAImozhYDVrnlwVuejJFYxfPIB+n5pBzmuVXk59HneEEqxoAws6f1l5LadyIPxzdfPNpS6rhSA/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789903204; c=relaxed/simple;
	bh=Aj3GJXPp5u3IS4krE9w69UFet4NubEFzHkC6TE5bA4c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mIlAJ1ixlbpC05F0jEGIU+0QXSqz6kFxQYtqvp5kRYF8IyoFhBWHUldp8GYJwCw6EccUcJRreIjI88KzZNbjKL/mYDlDU0m1ITIDMSMbWKrCtDVllVSGpqYA04d1LjDEJ6ma9d82I9PHTHXyW1TMQFRO7C46Jstxks/w4O4e7q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fLLCmqME; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fLLCmqME"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 957A51F00893;
	Sun, 20 Sep 2026 11:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789903200;
	bh=343/Db1Z8S17ssk821pz0Ch5sbEg1jnS5AmNrMg2Re0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fLLCmqME9mXuW6pALNbtZP1fybu4xfooXafACBbeTqWFPHvxM3Rw4zUR7EmM88WF+
	 kmReu3VZkYMvYuG2nW5NE9AlEVlSbbybeE9MksDTig9OrZhgbaemiPhNba6ns3oDNM
	 sTEwfjdYrcS6NivXxSgBefGrv7qPMdmI6a23FJ7VyURwGATioxwL1/7KoSDrtaHnyh
	 nf+Eu2TXGh/I1Pny8Dg95shsRPLuXTGua6S+bRhccDfFjwH4eCcI4gK9VOri1jWK2M
	 +YGZddoDnY25JfVZNlO8xcXYgpL5Z5UxEjcB6Dc9iLeNbBh67zFb2+6Sw0VVz3xyze
	 uEycDd0O6sLLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/4] nvmem: core: deprecate reg_write callback with
 reg_write_const
Reply-To: sashiko-reviews@lists.linux.dev
To: "Link Mauve" <linkmauve@linkmauve.fr>
Cc: neil.armstrong@linaro.org, ojeda@kernel.org, linux-amlogic@lists.infradead.org, Frank.Li@kernel.org, imx@lists.linux.dev, gary@garyguo.net
In-Reply-To: <20260920111000.2404131-3-linkmauve@linkmauve.fr>
References: <20260920111000.2404131-1-linkmauve@linkmauve.fr>
 <20260920111000.2404131-3-linkmauve@linkmauve.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 11:19:59 +0000
Message-Id: <20260920111959.957A51F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] nvmem: dev_warn uses uninitialized device name in nvmem_register()
--

commit 77653927bdf19b36c155e416a676051598da0213
Author: Link Mauve <linkmauve@linkmauve.fr>

nvmem: core: deprecate reg_write callback with reg_write_const

This commit deprecates the reg_write callback in favor of reg_write_const,
which takes a const pointer for the value buffer. It also adds a deprecation
warning in nvmem_register() for drivers still using the old callback.

> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 0556d140170a4..a484d424119f9 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c

[ ... ]

> @@ -937,6 +940,11 @@ struct nvmem_device *nvmem_register(const struct nvm=
em_config *config)
> =20
>  	ops->reg_read =3D config->reg_read;
>  	ops->reg_write =3D config->reg_write;
> +	ops->reg_write_const =3D config->reg_write_const;
> +
> +	if (ops->reg_write)
> +		dev_warn(&nvmem->dev, "Usage of reg_write in nvmem is deprecated, plea=
se "
> +		                      "migrate to reg_write_const.\n");

[Severity: Low]
Will this dev_warn() print an uninitialized device name, since dev_set_name=
()
hasn't been called on &nvmem->dev yet?

Looking further down in nvmem_register(), the device name is assigned later
in the switch block:

	switch (config->id) {
	case NVMEM_DEVID_NONE:
		rval =3D dev_set_name(&nvmem->dev, "%s", config->name);
		break;
	...

Could this result in the log message printing an uninitialized name like
(null) or (unnamed), making it difficult to identify which driver triggered
the deprecation warning?

Would it make sense to use config->dev (the parent device) for the warning,
or move this check below the dev_set_name() block?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920111000.2404=
131-1-linkmauve@linkmauve.fr?part=3D2
