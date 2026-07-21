Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD8545BD60
	for <imx@lists.linux.dev>; Tue, 21 Jul 2026 10:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628463; cv=none; b=VqYjjXEbZakWzPMwnFRpa91LnRRAU8jtgHShIPMxv8xIjwXepvxfCd81kqQ9ZRFaN1oXbaxCVBJhNu4HZ8+GUM1XQIBqVA11p3oqeUxgrgYLJirjOaTS6lej+2hgUqN5uc9LJI4g01pHJPAi3n3/8dbcAF8D6XwIxZ3fiaZGlT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628463; c=relaxed/simple;
	bh=he+Y03TnDXc0yxsHbydHhh0np5s0P+srFgA4cQ7tjUo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sWFVUxYFk0RHUWIBdC3cFVRMRsFX6Y+emfOeW98JbPJ9fkyN07/Q2VHSidRJiBRGvivo4CAlORefdzseZjufbvgUkXn0X6XpdLIETHdKLb8j/OlmtDm00iJYWSqRLV0HznBIw3TtfOzQFcPrlHOmNt1o9vZprLMJmWyKQ1Ml8HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g7P53Zt9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g7P53Zt9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F220C1F00A3A;
	Tue, 21 Jul 2026 10:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784628462;
	bh=UJaQ9qD3CTopUL/2RNGT2AXld7DaYA3+pcWXs9gfPHE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g7P53Zt9tm6Sm3Pb4LxYGWebCsne4fJX9oC3hxIcchAFdQIYzapT45tJb4Jazbypo
	 h1q9GrMv/5UuoGMXklNsoK0VB8Qbe7dwEJr8pRUWcMZ2STi0wpJBRUBKLs8KabIfor
	 BOdX2vrdWaCH3NESEw1+lpnB8XRZFJQk1Sk8/MNR05mgGWUvf4J/Y7p6KvJvR1l+gA
	 kMOHXI++1Yi9JVXLlSatmr9EW2TlTuSP7KniHqObHjRKwsEkUhClwN2qNyHjwj7Gnr
	 EhysUajChuqEArJ88K66tOUjrYne8saXhjsRHHc25qApjMQewLxSXFg8KbkWCwcD4R
	 s8J4AErjhUdWg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] regulator: fp9931: Fix VPOS/VNEG voltage selector
 table
Reply-To: sashiko-reviews@lists.linux.dev
To: robby.cai@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260721095959.1855436-2-robby.cai@oss.nxp.com>
References: <20260721095959.1855436-1-robby.cai@oss.nxp.com>
 <20260721095959.1855436-2-robby.cai@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 10:07:40 +0000
Message-Id: <20260721100741.F220C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] The VPOSNEG_table lacks padding for selectors 0x29-0x3F, causing v=
alid hardware states to be rejected, and shrinking the array introduces a r=
egression for selector 0x29.

Pre-existing issues:
- [High] The vcom regulator specifies an off-by-one n_voltages limit, incor=
rectly rejecting the highest valid selector (0xFF).
--

--- Patch [1]: [PATCH 1/2] regulator: fp9931: Fix VPOS/VNEG voltage selecto=
r table ---
commit 69720a9d40de43e41550a108ea7fe0d153732240
Author: Robby Cai <robby.cai@nxp.com>

regulator: fp9931: Fix VPOS/VNEG voltage selector table

This commit updates the VPOS/VNEG voltage selector table to match the
datasheet mapping by removing a duplicate 7.04V entry, ensuring the
selector 0x05 correctly aligns with 7.26V.

> diff --git a/drivers/regulator/fp9931.c b/drivers/regulator/fp9931.c
> index 002b41f53eff8..5eee21034f6b7 100644
> --- a/drivers/regulator/fp9931.c
> +++ b/drivers/regulator/fp9931.c
> @@ -42,7 +42,6 @@ static const unsigned int VPOSNEG_table[] =3D {
>  	7040000,
>  	7040000,
>  	7040000,
> -	7040000,

[Severity: High]
Does shrinking VPOSNEG_table[] introduce a regression for selector 0x29?

By removing this entry, the array size decreases from 42 to 41. However,
the datasheet and commit message indicate that selectors 0x28 through 0x3F
are all valid and map to 15.06V.

Because the vposneg regulator configures n_voltages based on the array size:

drivers/regulator/fp9931.c:regulators[] {
	...
	.name =3D "vposneg",
	...
	.n_voltages =3D ARRAY_SIZE(VPOSNEG_table),
	.vsel_reg =3D FP9931_REG_VPOSNEG_SETTING,
	.vsel_mask =3D 0x3F,
	...
}

the core will now reject selector 0x29 which was previously accepted.
Furthermore, since vsel_mask is 0x3F, if the hardware boots with a selector
between 0x29 and 0x3F, it will be rejected because it is >=3D n_voltages,
causing a failure during probe.

Should the array be explicitly padded up to index 63 to match the vsel_mask?

>  	7260000,
>  	7490000,
>  	7710000,

[ ... ]

Looking further down in the file at the vcom regulator configuration:

drivers/regulator/fp9931.c:regulators[] {
	...
	{
		.name =3D "vcom",
		...
		.n_voltages =3D 255,
		.min_uV =3D 0,
		.uV_step =3D 5000000 / 255,
		.vsel_reg =3D FP9931_REG_VCOM_SETTING,
		.vsel_mask =3D 0xFF,
	},
	...
}

[Severity: High]
This is a pre-existing issue, but does the vcom regulator have an off-by-one
error in its n_voltages limit?

Since vsel_mask is 0xFF, the hardware supports 256 states (0 to 255).
However, n_voltages is set to 255. If the core reads a hardware initializat=
ion
state of 0xFF, or a consumer requests the maximum voltage, it will be
incorrectly rejected because the maximum selector is equal to n_voltages
instead of strictly less than it.

Should n_voltages be 256?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721095959.1855=
436-1-robby.cai@oss.nxp.com?part=3D1
