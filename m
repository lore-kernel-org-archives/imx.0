Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D3237A494
	for <imx@lists.linux.dev>; Thu, 30 Jul 2026 03:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785381668; cv=none; b=S+NgBOlREd/2DSVihx9M1EVIzuJjxovJzfUyCEJxDTfhZuGP3hPxheRPRiCJXQWHLJ9/Xh/UiUMS4NoG6rMsRh7xjFpBX8js/y0YL7/AGqBUSwj5mAd9pe9rn00DkkM8FgNi6woZba4LWxykKvAd+1Jsj+jvaoPkSjHkLPD3YIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785381668; c=relaxed/simple;
	bh=pv2inRjuhakksloV4pBKgCs5pQLuW63oDQ2/tl4hmGA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JRRsLSIFR/xWM/OxV/WfeqCmGFfNmFFlez7YzIKC+dhLrleqXmvliMEMZfXMMGoWhbnss4kj1kRHbGpXuijQKPijOunRG3H/Gx0OjzF9ntGNvMWdaEG/x2EVVr2fl7mb9Hp7DObuhsEaOAyN023k02Tc08JwFHPBCj/Ff6mYdWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XMW9YWr0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XMW9YWr0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D7F91F000E9;
	Thu, 30 Jul 2026 03:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785381667;
	bh=8L49y/6iTSm2ffTGQ3dqZA8K+sEa16WE4qAtvSTGDXw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XMW9YWr06M1M+hlFahbVxzbGoATiYYmS8jDAUrqgxqtLtRDtV/ToCMzfUJlNNKyqS
	 LRRDA+cb1GvEqfw1jgga6QCKxBAdE6vSSY/ldufmnfJKeBoqzatVpY7rf941C7Ut9T
	 jXMHXyZjdehVqnTMGexJ/M/1JNvA42oWtzQLyHhk8cf6AxfpwIgi+pbCbuG1MBsxkN
	 6hBag1ASE/EHFkLP2YiDm293FC7SHiSWwd5PZgVkCBcqVrJdK9lTxBqbKTqAcmwuj1
	 xXdW2oK1zvskRovFR9ui1tcne/Lz0zgvyksTm/rLee+2ZLUUkReT2jXDmSx8KjnJkJ
	 s+xh7Tz8rwKMw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] remoteproc: imx_rproc: Fix off-by-one in address
 translation
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260730-imx-rproc-range-v1-1-97c9ca7a5658@nxp.com>
References: <20260730-imx-rproc-range-v1-1-97c9ca7a5658@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 03:21:06 +0000
Message-Id: <20260730032107.0D7F91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The patch fixes an off-by-one boundary check in `imx_rproc_da_to_s=
ys()` using `<=3D` but misses the identical boundary check in its caller `i=
mx_rproc_da_to_va()`, leaving the bug unresolved.
- [High] An integer overflow in the memory segment bounds checks allows unt=
rusted firmware to perform arbitrary out-of-bounds kernel writes on 64-bit =
platforms.
--

--- Patch [1]: [PATCH] remoteproc: imx_rproc: Fix off-by-one in address tra=
nslation ---
commit 26c9a9508d8034f3f59181045a1d03a59fa5b603
Author: Peng Fan <peng.fan@nxp.com>

remoteproc: imx_rproc: Fix off-by-one in address translation

This commit fixes an off-by-one error in imx_rproc_da_to_sys() by changing a
strict less-than comparison to a less-than-or-equal comparison for firmware
segments that exactly fill a memory region.

Link: https://lore.kernel.org/all/20260729013506.584321F000E9@smtp.kernel.o=
rg/

> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rpro=
c.c
> index 745ce52cd8226..9af0aa26ce9b7 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -552,7 +552,7 @@ static int imx_rproc_da_to_sys(struct imx_rproc *priv=
, u64 da,
>  				continue;
>  		}
> =20
> -		if (da >=3D att->da && da + len < att->da + att->size) {
> +		if (da >=3D att->da && da + len <=3D att->da + att->size) {

[Severity: High]
This is a pre-existing issue, but does this fix actually solve the problem
since the caller still uses a strict less-than check?

When imx_rproc_da_to_sys() successfully translates a valid boundary case
where da + len =3D=3D att->da + att->size, its caller imx_rproc_da_to_va() =
performs
a secondary boundary check:

drivers/remoteproc/imx_rproc.c:imx_rproc_da_to_va() {
    ...
    if (imx_rproc_da_to_sys(priv, da, len, &sys, is_iomem))
        return NULL;

    for (i =3D 0; i < IMX_RPROC_MEM_MAX; i++) {
        if (sys >=3D priv->mem[i].sys_addr && sys + len <
            priv->mem[i].sys_addr +  priv->mem[i].size) {
            ...
        }
    }
    ...
}

Because imx_rproc_da_to_va() still uses a strict less-than comparison (<)
instead of (<=3D), won't it still reject the exactly matching segment and
return NULL, preventing the system from booting valid firmware?


[Severity: High]
This is also a pre-existing issue, but can the da + len calculation overflow
64-bit integers on 64-bit platforms?

In rproc_elf_load_segments() from drivers/remoteproc/remoteproc_elf_loader.=
c,
da and memsz (len) are extracted from the ELF headers. By providing a
maliciously crafted da (e.g., 0x10000000) and a massive memsz
(e.g., 0xFFFFFFFFF0000000), da + len can overflow and wrap around to a small
value (e.g., 0).

Could this bypass the primary bounds check here:

    if (da >=3D att->da && da + len <=3D att->da + att->size) {

and the secondary check in imx_rproc_da_to_va():

    if (sys >=3D priv->mem[i].sys_addr && sys + len < ...

allowing untrusted firmware to perform arbitrary out-of-bounds kernel memory
writes during memcpy() in rproc_elf_load_segments()?

>  			unsigned int offset =3D da - att->da;
> =20
>  			*sys =3D att->sa + offset;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-imx-rproc-=
range-v1-1-97c9ca7a5658@nxp.com?part=3D1
