Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55DA3914E1;
	Thu, 30 Jul 2026 16:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785430133; cv=none; b=I00CvFkysxVyLaThaJbYkMQYcS0ItlkQDYgPOc7oDjg6m3uLXuOmphNywcyqr8mifJZ91iH6CTSqasp0rI3CWbbBiRK7bfdVU0+8FhJJfxEJ95cJfQWyOgei0zknuCjrY4dA3GgOf8JYcj+D4U4g+U2pY5Tv/aSGvXuCH64Jpg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785430133; c=relaxed/simple;
	bh=KQNozagIhHu7kI59gRh8OpGrZyu25KZjSprYwtYbMh4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PWwcNQM13EpmhvZdvkZekMUXSXLyfhecA4Ml48t0n2iYJeYkf2TzScU4tEzz87xOpsyQrF0DdVOMHSRL3ij8uMkdZD/zoAq9iQsKFb/v5kypXVf/W1pyDfAIH3RFhQeYH4xvp1IF14uGh0GWKJowhc2piNxVFfFSl7JK18+gi/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SRC0YK9B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SRC0YK9B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C54E1F000E9;
	Thu, 30 Jul 2026 16:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785430132;
	bh=N6z+b9naczan1KNAsSrDOiQQwkNBNg6kp+hBJBk3YUI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SRC0YK9B6hjD3ht37yJTXk3Ku5xKbREcEiegbQ7PJ98ilcJ1HnE/x+x124GKWN7TO
	 i/KhrBlE0wEojgLQ88pEOc3LP7w7xxCPkQnpqK8WB23OTiYL6CQfDuH5xYn8TnNOMi
	 UIU/dLnHd6Z/74mPKlmxB1GROdjVDVyMWGopEm2rgRzojqA6jRx5qOwP0rFug28/bX
	 ktlCrDHU/fvhZ1jJtLO7Tm2t1qJeOGggzyt72NJ03JIW6Fjs1gZBAUznMJ4utDfaEh
	 A0T7hAdZl9LzKtzCTz9oIFnrs4WL7my9HUMaRsD7hdH8AqsFt8qZiAP65rmPwGHMfT
	 GQFZfG1T7+b2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] remoteproc: imx_rpoc: fix carveout name parsing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Laurentiu Mihalcea" <laurentiumihalcea111@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260730163412.1145-3-laurentiumihalcea111@gmail.com>
References: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
 <20260730163412.1145-3-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 16:48:51 +0000
Message-Id: <20260730164851.6C54E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] If `rproc_mem_entry_init()` fails, `imx_rproc_prepare()` returns a=
n error without cleaning up carveouts and coredump segments added in previo=
us loop iterations.
--

--- Patch [2]: [PATCH v3 2/4] remoteproc: imx_rpoc: fix carveout name parsi=
ng ---
commit 919463e3c08e2a14917d823b86fa8559b43af4fc
Author: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

remoteproc: imx_rpoc: fix carveout name parsing

The imx remoteproc driver is updated to use the "memory-region-names"=20
property for reserved memory regions instead of relying on devicetree=20
node names. This allows standardizing node names according to the=20
devicetree specification.

> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rpro=
c.c
> index 7662ebd9d2f49..74719066905d6 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -672,7 +672,7 @@ static int imx_rproc_prepare(struct rproc *rproc)
>  		int err;
>  		struct resource res;
> =20
> -		err =3D of_reserved_mem_region_to_resource(np, i++, &res);
> +		err =3D imx_rproc_rmem_to_resource(np, i++, &res);
>  		if (err)
>  			break;

[Severity: High]
This isn't a bug introduced by this patch, but looking at the loop in
imx_rproc_prepare(), does the early return on rproc_mem_entry_init() failure
leak resources?

If rproc_mem_entry_init() fails, it returns -ENOMEM without cleaning up=20
the carveouts and coredump segments added in previous loop iterations:

drivers/remoteproc/imx_rproc.c:imx_rproc_prepare() {
	while (1) {
		...
		mem =3D rproc_mem_entry_init(...);
		if (!mem)
			return -ENOMEM;
	=09
		rproc_coredump_add_segment(rproc, da, resource_size(&res));
		rproc_add_carveout(rproc, mem);
	}
}

This error propagates back to rproc_fw_boot(), where the error handling path
skips the clean_up_resources: label and jumps straight to disable_iommu:.

If a boot is retried by userspace (e.g., via sysfs), could this continually
append duplicate entries to the lists and eventually exhaust vmalloc space
when rproc_alloc_registered_carveouts() iterates over the duplicates and
maps the same physical memory addresses multiple times?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730163412.1145=
-1-laurentiumihalcea111@gmail.com?part=3D2
