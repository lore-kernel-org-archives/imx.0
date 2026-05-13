Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CC534B1AD
	for <imx@lists.linux.dev>; Wed, 13 May 2026 02:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778640518; cv=none; b=KLLaxz7ilI9Rj8vAhpUWFHCKjEVzXGqbNX5oUfepf/ACkfVnOOxYzjDhvj74y7d8PkKIT42Gdr54/ewdfaZ9cS9jVvDOjbfSm184REujRmpO/E044sS/Bkx4HrUUHgqwdPM/tqH8lu3mvW4ba5a87o6ZOaSqxEO63tgiUAjdUIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778640518; c=relaxed/simple;
	bh=Ii2zX/LHNXcWIBmOIDP4f03bOm0TjjhRvSCdJUOHV1A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nLp+UJsiMJoSrZR+kIlCkG8TMA6AcDpLoHsAPTEQlyayhb59b80zQijgJb57kajvfU5gADhVSyCztqY/LDO83LNzuOczvuH4dfaD8WzBgcoqgQeY+CRbVDPG4bvZ7I930h7wsONuE4Z2k2afEj/7/LN2VKV6Mq4pUIcvewBN9tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NL8Xp5xu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NL8Xp5xu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6825EC2BCB0;
	Wed, 13 May 2026 02:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778640517;
	bh=Ii2zX/LHNXcWIBmOIDP4f03bOm0TjjhRvSCdJUOHV1A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=NL8Xp5xuqtT23n/hCzLcmdzDVJR5ZfRqnJkqSxCQ28z+pd+IpMp2Ulzxxvem97Bq8
	 ZRaGN5K8nlLZDWBLmzUWKYJSR6zciVdVW1dIUZ7t1tkd/o+weEebCzCv1/1AUWRAAW
	 U7k2wkNA5bUAMWFwgei5TawiGb+Ack3J/aW9GYHoC4f94yjvTHkAnbPns0zFkvc4g9
	 /CPS/fring04CWE1RPBi4YO0IHGGRsIHNAGyfmxiqGs1qxlztZHVQ+mhvRztt/AskL
	 ESJ2FD1gQQtkBXqXlbCtndCmk7xZD6zohN8RsGC/RIalNEEPVvRKgn+2juKa1Jp1R1
	 oZtZ6tVOohvbA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] remoteproc: switch drivers to optional
 resource-table helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ben Levinsky" <ben.levinsky@amd.com>
Cc: wsa+renesas@sang-engineering.com, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260511211841.284809-5-ben.levinsky@amd.com>
References: <20260511211841.284809-5-ben.levinsky@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 02:48:36 +0000
Message-Id: <20260513024837.6825EC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Propagating errors from the `parse_fw` callback exposes a memory l=
eak and list corruption in the remoteproc core's error handling.
- [Low] A `static inline` function is assigned directly to a function point=
er across multiple compilation units.
- [Low] Implicit downgrade of the diagnostic log level for missing resource=
 tables.
--

commit 4ae41a0f00b09b541655967f84eb5307e9228a6a
Author: Ben Levinsky <ben.levinsky@amd.com>

remoteproc: switch drivers to optional resource-table helper

This patch switches several remoteproc drivers to use the shared
rproc_elf_load_rsc_table_optional helper for parsing firmware.
This keeps missing resource tables non-fatal while allowing other
parsing errors to propagate to the caller.

> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rpro=
c.c
> index 6249815b54d88..5509048f7e192 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
[ ... ]
> @@ -777,7 +766,7 @@ static const struct rproc_ops imx_rproc_ops =3D {
>  	.kick		=3D imx_rproc_kick,
>  	.da_to_va       =3D imx_rproc_da_to_va,
>  	.load		=3D rproc_elf_load_segments,
> -	.parse_fw	=3D imx_rproc_parse_fw,
> +	.parse_fw	=3D rproc_elf_load_rsc_table_optional,

Drivers like imx_rproc, stm32_rproc, and rcar_rproc allocate memory for
carveouts and coredump segments in their .prepare callbacks, appending
them to rproc->carveouts and rproc->dump_segments.

In rproc_fw_boot(), rproc_prepare_device() is called before
rproc_parse_fw(). Before this patch, the .parse_fw callbacks of these
drivers swallowed all errors, including -ENOMEM from
rproc_elf_load_rsc_table(), and unconditionally returned 0.

By switching to rproc_elf_load_rsc_table_optional(), failures like
-ENOMEM are now correctly propagated.

If rproc_parse_fw() returns an error, rproc_fw_boot() branches to the
unprepare_rproc label, which entirely skips the clean_up_resources block
and its call to rproc_resource_cleanup().

Because these drivers lack an .unprepare callback to manually free the
carveouts, the allocated memory is permanently leaked and the entries
remain on the rproc->carveouts list. Subsequent boot attempts will run
.prepare again, adding duplicate entries and leading to list corruption.

Does propagating errors from this callback expose a memory leak and list
corruption in the remoteproc core's error handling?

Also, rproc_elf_load_rsc_table_optional is defined as static inline in
a header file.

Taking the address of a static inline function to use as a callback
forces the compiler to generate a standalone, out-of-line copy of the
function in every referencing compilation unit.

Does assigning it directly to a function pointer across multiple drivers
cause unnecessary binary code duplication?

>  	.find_loaded_rsc_table =3D imx_rproc_elf_find_loaded_rsc_table,
>  	.get_loaded_rsc_table =3D imx_rproc_get_loaded_rsc_table,
>  	.sanity_check	=3D rproc_elf_sanity_check,
[ ... ]
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_=
rproc.c
> index 7ac8265b60ac7..007175dcd7afa 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -232,14 +232,6 @@ static int stm32_rproc_prepare(struct rproc *rproc)
>  	}
>  }
> =20
> -static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmwa=
re *fw)
> -{
> -	if (rproc_elf_load_rsc_table(rproc, fw))
> -		dev_warn(&rproc->dev, "no resource table found for this firmware\n");

This isn't a bug, but prior to this change, drivers such as stm32_rproc
emitted a dev_warn, and others emitted dev_info when no resource table
was found.

The shared helper implicitly replaces these with a dev_dbg log level.

While this suppresses warnings for an optional component, it is an
undocumented side-effect that silently degrades observability for users
relying on kernel logs to verify firmware IPC configuration.

Could this change implicitly downgrade the diagnostic log level for
missing resource tables?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511211841.2848=
09-1-ben.levinsky@amd.com?part=3D4
