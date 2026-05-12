Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6E7383304;
	Tue, 12 May 2026 02:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778553317; cv=none; b=shoryC6r7mGi6JK5aFShx6PDHuh1Mcj8pKb+3gV0vQKkLnnsmveguUnr3d6OHCukxHxlY1IgxVWiiw6JFx3OKDhCg1uBrFms3Gb6H03wTvbQ11Gvr00aPCvZBJBFcqIw6o65jXwNBjAtwg3G4mD66b8IhG1IMMGcjY320nvIgeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778553317; c=relaxed/simple;
	bh=uleChJpoqAW87f0x7HJETNu7siu9u3abfSkbzLTZPD0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VTEQJO5Cv3BbLIiAG/t25NwZWwoeqfifHp9CDmSOWSK25VO2uuMHSqVa9bhTEbcv53roVAlycLrJX0trvLb+fw/Aj053ErLBiEW6yMRp8FEBVGt8G0ujMCIkhyQE0tOhXEwNZuLeveHudqkwIQaRPLh67lhkl7oaG7laL127R8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pFtjLpr8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pFtjLpr8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45C7DC2BCB0;
	Tue, 12 May 2026 02:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778553317;
	bh=uleChJpoqAW87f0x7HJETNu7siu9u3abfSkbzLTZPD0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=pFtjLpr8KfmRJMsU5tf/NePTpuFc0k9hFhxUsA9DGjXEpjfNT0KXoZv1BajN1b7am
	 QzRLmRYBqyIzwjoIo9nCWlPJ/eaX59gO0mg8lMGzn2vAPwVhFb+/l0BSklUZdm1W5f
	 wbXVtPy3d+s/9MJhUm1gRTAxU+wmDvqQXgGzgboXCDns+7PRT79fnAyeREBd6HHJhP
	 Puzqxcij6DL7/y8wRdNT8LHq2fDWkA4joc12VPQFuc/0AKMqdt+y7Xb5uRIvb9/ahz
	 PYmVJuU63CJUKrnzh+WH5b4t2l095TA/diItDPmux4ivL9PTKhw5hmdyHjyDMbBu++
	 Eiswal/WpDDrA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/5] media: hi846: fix modes handling for different
 lane cases
Reply-To: sashiko@lists.linux.dev
To: "Pengyu Luo" <mitltlatltl@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, Frank.Li@kernel.org, robh@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260511090924.269106-4-mitltlatltl@gmail.com>
References: <20260511090924.269106-4-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 02:35:16 +0000
Message-Id: <20260512023517.45C7DC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The mode filtering logic for 4-lane setups relies on brittle array =
pointer arithmetic and implicitly assumes a specific global array ordering.
- [Low] A local variable shadows a global variable in `hi846_enum_frame_siz=
e`.
--

commit 809f6817858f4d273d756eeec1b017198bbcfa3a
Author: Pengyu Luo <mitltlatltl@gmail.com>

media: hi846: fix modes handling for different lane cases

When using 4-lane, a 640x480 mode may be incorrectly set. This patch fixes
the issue by specifying the supported modes and mode count dynamically based
on the number of lanes.

Closes: https://lore.kernel.org/linux-media/OmTXoHZJTSGePymL9I-1Cw@puri.sm/
Fixes: e8c0882685f9 ("media: i2c: add driver for the SK Hynix Hi-846 8M pix=
el camera")

> diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
> index befd54553df2e..9decfda747876 100644
> --- a/drivers/media/i2c/hi846.c
> +++ b/drivers/media/i2c/hi846.c

[ ... ]

> @@ -1821,8 +1825,11 @@ static int hi846_enum_frame_size(struct v4l2_subde=
v *sd,
>  				 struct v4l2_subdev_frame_size_enum *fse)
>  {
>  	struct i2c_client *client =3D v4l2_get_subdevdata(sd);
> +	struct hi846 *hi846 =3D to_hi846(sd);
> +	const struct hi846_mode *supported_modes =3D hi846->supported_modes;

This isn't a bug, but does declaring supported_modes here shadow the global
static array supported_modes[] defined earlier in the file?

[ ... ]

> @@ -1999,6 +2006,13 @@ static int hi846_parse_dt(struct hi846 *hi846, str=
uct device *dev)
> =20
>  	hi846->nr_lanes =3D bus_cfg.bus.mipi_csi2.num_data_lanes;
> =20
> +	hi846->supported_modes =3D supported_modes;
> +	hi846->num_modes =3D NUM_MODES_2LANE;
> +	if (hi846->nr_lanes =3D=3D 4) {
> +		hi846->supported_modes =3D supported_modes + 1;
> +		hi846->num_modes =3D NUM_MODES_4LANE;
> +	}

Does this mode filtering logic rely on the exact ordering of the global
supported_modes array?

By advancing the array pointer by 1 and using a hardcoded mode count for the
4-lane setup, this implicitly assumes the only mode incompatible with 4-lane
operation is located exactly at the first index.

If another 2-lane-only mode is added or the modes are reordered in the futu=
re,
could this silently corrupt the subdevice's mode list by misaligning the ar=
ray
bounds?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511090924.2691=
06-1-mitltlatltl@gmail.com?part=3D3
