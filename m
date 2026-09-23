Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC89423E9F;
	Wed, 23 Sep 2026 18:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790189973; cv=none; b=g6O+KhPO6XfcNSRjV9m7DlDn2Up69RtrDRecmwUvr9qUn0V/MI/cVjqc2SaU/1GgPb0MzGrnIpT0t/y1Q+5LJLiOqsC31sKLLXpsp4HIGN3Pa0MBOLj+6xiKqUSc/fSmTaPvtcn0K529npE6IXWCx1oX93xFjGhptSZ34VJ/l0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790189973; c=relaxed/simple;
	bh=Hj/kSaEbmfqUMsoxcGhkmDa0Ct8OEDeD/sGHxQawzCc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EShw4Y3LqweifJgLu+aJQl5KOsiKe4iCemOGWuBkxUNcOsPAE/FjlYyWvS/EeyoGskJXbLAMLo39GCGc7BGwvF+3nwTwAEJfo10xg/SJL/41v4dUpxAFdwh5se3ZWYLGCAS+B2nsfri/kziaXSjqUBR7MThsXmXNNH0DnqssRus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lCD0KAeU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lCD0KAeU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C52C01F000FF;
	Wed, 23 Sep 2026 18:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790189972;
	bh=7ltHVUkdMKBR02/Pe35j6GAQk1MTYNMANOs5s3Bxr4E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lCD0KAeUNuY6XF4lxqeH+UO1J19WfzAeNC4YX/qe0KLy0P+PHmtwyJQfCAdK41XFL
	 MBkc9sAkUra50eutePfOwCb0PEkHGeaQbznlFAKl5wfILAGVlLghZrNCQCCMKZCxnH
	 DusDlecqIzr1KyWFdiPPfq7L/ro7L6sbUQPPgU61ds5kjh0cfhvHvqmGOMRABbZMbU
	 F0h+rpZgkFc9pWoft4cIWH/nqM/8NMaYw4qcOYVwOOWMCS+EtFuofa3Y3xRtUDUmtS
	 9f/2B+KI0SFrplC7EVmz4MFKG/nm4RPA1OgfAzMj+ctfNiwOxoRV5Oi79DaCQtQIyO
	 G3LLTTZp5j9mg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 3/5] rpmsg: core: match rpmsg device IDs by prefix
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shenwei Wang" <shenwei.wang@oss.nxp.com>
Cc: imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260923184255.299034-4-shenwei.wang@oss.nxp.com>
References: <20260923184255.299034-1-shenwei.wang@oss.nxp.com>
 <20260923184255.299034-4-shenwei.wang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 18:59:31 +0000
Message-Id: <20260923185931.C52C01F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] rpmsg: core: global prefix matching causes driver binding collisio=
ns
- [High] rpmsg: core: broken module autoloading for dynamically suffixed de=
vices
--

commit b3b593160f090b0f9bdaa3003ed014a224f40238
Author: Shenwei Wang <shenwei.wang@nxp.com>

rpmsg: core: match rpmsg device IDs by prefix

The current rpmsg_id_match() implementation requires an exact string match
between the driver id_table entry and the rpmsg device name. This commit
updates the matching logic to compare only the length of the id->name strin=
g,
allowing id_table entries to act as prefixes for matching devices.

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
>  }
> =20
>  /* match rpmsg channel and rpmsg driver */

[Severity: High]
Since this unconditionally changes bus matching to prefix matching for all
drivers, will this cause a regression for existing drivers that rely on
exact match semantics?

For example, if a driver like rpmsg_wwan_ctrl expects an exact match:

drivers/net/wwan/rpmsg_wwan_ctrl.c:
static const struct rpmsg_device_id rpmsg_wwan_ctrl_id_table[] =3D {
    { .name =3D "DATA1", .driver_data =3D WWAN_PORT_AT },
    ...
};

Could this now erroneously bind to overlapping device names like "DATA10",
leading to unpredictable behavior? This breakage in exact match semantics
does not appear to be addressed in subsequent patches in the series.

[Severity: High]
With driver matching now operating by prefix, does this introduce a
regression for module autoloading with dynamically suffixed devices?

When the device is discovered, rpmsg_uevent() emits the full device name:

drivers/rpmsg/rpmsg_core.c:rpmsg_uevent() {
    ...
    return add_uevent_var(env, "MODALIAS=3D" RPMSG_DEVICE_MODALIAS_FMT,
                          rpdev->id.name);
}

However, scripts/mod/file2alias.c:do_rpmsg_entry() does not append a
wildcard when generating the alias:

scripts/mod/file2alias.c:do_rpmsg_entry() {
    ...
    module_alias_printf(mod, false, RPMSG_DEVICE_MODALIAS_FMT, *name);
}

Because the exported module alias is strictly exact (e.g., alias
rpmsg:rpmsg-io-), will udev fail to load the module for a device named
"rpmsg-io-0" since the required wildcard '*' is missing? This omission
doesn't seem to be fixed later in the patch series.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923184255.2990=
34-1-shenwei.wang@oss.nxp.com?part=3D3
