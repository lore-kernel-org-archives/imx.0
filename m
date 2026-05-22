Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609E7372B23;
	Fri, 22 May 2026 12:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779451460; cv=none; b=uFsWCtsAkFHgYSFRgM9OCAmw0GLwrGuCg1WXOWdh4b6mBBlUINZ/QEA4DSW9o+8FEh8CVkXdFh+VZ3EKX6AMtFFsCw+QZq4ynjs5myKN216NTvexnSuOa08v/N4Kpg/Me8c4ltIKaWyYF7rlKoAxpe7fGbMhmMZ4fgb9eup66sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779451460; c=relaxed/simple;
	bh=sI0pcR+voaVf7cd9rpPUUuL1ngrj9Qplp5jHZ6qrCgc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WsP9jGfzyzA6c4VyoW0xNV/q0mEcKaSv4NI8OOus0OMCpJbzvgIGn1pmg7pgXFkIm/T6cDnXB+j6zRDIdrZGPENR0QHxwzt4/zOGgmcrEDfGUKKfuBTlU5jMeH3mJq8rVK+OwAPirstx3pfnosnLDSEnmWf3YK0vwvURmXLNsl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YAJEskCe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YAJEskCe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC5B51F000E9;
	Fri, 22 May 2026 12:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779451457;
	bh=aZjBtr4bcdeP/8MzweF6WQC3b3kciehtL893LPMB4h4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YAJEskCeVj98yvfwSXEItiCbcracKo5lzyoUpw7wllb0Of/DRdKpSyThScE6RGnjP
	 J0VVJbKJ8Buuttcd+nb2KLa02oZcnwpGMe4pyf0bg6hoLnLPxhik9Jb+w9AmZ8Mqm8
	 Gbe3WHcO6A7Uz2LePDxzyzHvwAio5E1OLLduCqLmeohnj+/vV+riBo6zwdoseiGAlB
	 lgGBi2WSVsl73RiNnqiofbJTjUn//PhoJb7J+P+DkSn7ZEjnZhUn3aJPN6zbT7oQ8i
	 RFMaNkdOaEzxpFmrx9RiJEPGeEyAD35L+lsbhMISP3BzsScHQB4xvYy/P0SPVY1lzZ
	 vvPNMHmoFS3+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] remoteproc: imx_rpoc: fix carveout name parsing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Laurentiu Mihalcea" <laurentiumihalcea111@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260522111849.783-3-laurentiumihalcea111@gmail.com>
References: <20260522111849.783-3-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 12:04:16 +0000
Message-Id: <20260522120416.CC5B51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Incomplete error handling of `of_property_read_string_index()` cau=
ses driver probe failure and silent truncation of memory regions if `memory=
-region-names` is malformed.
- [Low] The header `imx_rproc.h` is missing necessary `#include` directives=
 for the APIs and types used in the newly added `imx_rproc_rmem_to_resource=
` inline function.
--

commit 892c9b40a1305beaf42a4c79b061576551f828eb
Author: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

remoteproc: imx_rpoc: fix carveout name parsing
   =20
This commit modifies carveout name parsing to use the names provided by the
"memory-region-names" device tree property if available. It introduces a
common helper function imx_rproc_rmem_to_resource() to fall back to the old
behavior if the property is not present.

> diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rpro=
c.h
> --- a/drivers/remoteproc/imx_rproc.h
> +++ b/drivers/remoteproc/imx_rproc.h

[ ... ]

> @@ -45,4 +45,23 @@ struct imx_rproc_dcfg {
>  	u32				reset_vector_mask;
>  };
> =20
> +static inline int imx_rproc_rmem_to_resource(struct device_node *np,
> +					     int index,
> +					     struct resource *res)
> +{

[Severity: Low]
This isn't a bug, but this header file appears to be missing includes for
<linux/of.h>, <linux/of_reserved_mem.h>, and <linux/ioport.h> which define
the structures and APIs used in this new inline function.

Could this cause build failures in the future if another file includes this
header without first including the prerequisite headers?

> +	int ret;
> +
> +	ret =3D of_reserved_mem_region_to_resource(np, index, res);
> +	if (ret)
> +		return ret;
> +
> +	/* "memory-region-names" is optional */
> +	ret =3D of_property_read_string_index(np, "memory-region-names",
> +					    index, &res->name);
> +	if (ret =3D=3D -EINVAL)
> +		return 0;

[Severity: High]
If the "memory-region-names" property exists but has fewer entries than the
"memory-region" array, of_property_read_string_index() can return -ENODATA.

Will returning -ENODATA here instead of 0 cause imx_rproc_prepare() to break
prematurely out of its while loop, silently ignoring the remaining valid
memory regions?

Also, could this cause imx_rproc_addr_init() to completely fail the driver
probe if it encounters an incomplete property? Should this treat any negati=
ve
return value from of_property_read_string_index() as non-fatal to properly
maintain the old fallback behavior?

> +
> +	return ret;
> +}
> +
>  #endif /* _IMX_RPROC_H */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522111849.783-=
1-laurentiumihalcea111@gmail.com?part=3D2
