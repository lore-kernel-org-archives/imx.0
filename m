Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A0C35E1A0;
	Tue, 16 Jun 2026 12:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781611465; cv=none; b=bbeX6b5gNRPLfVhPgHOhUbHkFlmvLuGHUPjUun2OhZYy57eYGuTJZYh7pG2CMpTA5Q1ZxIrzGLeSC7ILG0d7teVr6GYfqZ0O7Sd/OF5X1gp2JCZzg72YkVRFrZ8TgJjUmsDhwJgQgTX+7W/R9nJjQBCIgxKCJnDKriYdY3SbxbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781611465; c=relaxed/simple;
	bh=fL1HkBPXN2YRtEutOccBXAwQhqMRTIldEi+d8B+tSyI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ovc7irBIlhpZAE19AHxNydZ3tJ4Qh3h7IIGfcLOZnKdj81KNnbpy64C3TMomjy91GVWI0atyDO02ICguNVz0KppCnLY7aw+cZUjalydrAyeS2KFgEEs3onrgwP6/w1a3xg9AkUxl55KEOaXBa7s3s7vFSvqTGbEAJSr/6D0NXt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wt6fOy0A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wt6fOy0A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 691031F000E9;
	Tue, 16 Jun 2026 12:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781611464;
	bh=wnpdLt2bf3V5txDxZtRhzm7K9RB8Vfn6YiNZxdYG/bc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wt6fOy0ArsEW9Q5thmIyTUfGBsQV9B2h17VVjYxzorPCwhHMvDQuWzOwgw1XreT2x
	 e+ZRGOmEuCkbgLXJwGWNgvhQI7sutLcl7mUUPNzBvPMoBqUSjQ5aSXYLjgKCnj5Em8
	 mB4d8tRd1CS5MZQ+MR67WkOc1dwlK7+KoP/zS0ewfKOyQyPscxmHYMjrpiW4sOPrL3
	 4mEs09E/xg0UqzKV+fl8xBaUfchzVGflEBXJ90lliKdqfC2gocaUC5gJTcpdqdvyMv
	 87PkuzgBsFrHpax3aIs+FlLiPbq2gs8StLbqwrQ1Gk9ku8ypl2l1PUra6T1O2UwR6U
	 P2lQXVG1y1xDQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/9] nvmem: imx-ocotp-ele: Add keepout table for i.MX93
Reply-To: sashiko-reviews@lists.linux.dev
To: "Frieder Schrempf" <frieder@fris.de>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-4-cb7f3698c3e6@kontron.de>
References: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-4-cb7f3698c3e6@kontron.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 12:04:22 +0000
Message-Id: <20260616120423.691031F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Initialization of a flexible array member is not at the end of the =
initializer list, causing build errors.
--

commit d9179d39f1569f2fd5d16521edccfaa2096500c4
Author: Frieder Schrempf <frieder.schrempf@kontron.de>

nvmem: imx-ocotp-ele: Add keepout table for i.MX93

This commit adds an overall keepout table to describe which fuse
registers are invalid and inaccessible for the i.MX93.

> diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
> index a0d2985c6d030..dadec19ca2527 100644
> --- a/drivers/nvmem/imx-ocotp-ele.c
> +++ b/drivers/nvmem/imx-ocotp-ele.c
[ ... ]
> @@ -185,6 +201,8 @@ static const struct ocotp_devtype_data imx93_ocotp_da=
ta =3D {
>  		{ 188, 1, FUSE_ELE },
>  		{ 312, 200, FUSE_FSB }
>  	},
> +	.keepout =3D imx93_ocotp_keepout,
> +	.nkeepout =3D ARRAY_SIZE(imx93_ocotp_keepout),

[Severity: Low]
Does this cause a build failure? It looks like the designated initializers
for .keepout and .nkeepout are placed after the initialization of the flexi=
ble
array member .entry.

In C, flexible array members must be the last items initialized in a struct,
otherwise compilers like GCC will typically throw an "initialization of a
flexible array member not at end of struct" error.

Could these initializers be moved above the .entry initialization?

>  };
> =20
>  static const struct ocotp_devtype_data imx94_ocotp_data =3D {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616-upstreamin=
g-next-20260609-imx-ocotp-ele-v1-0-cb7f3698c3e6@kontron.de?part=3D4
