Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812AE42B728
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 21:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785187546; cv=none; b=WUcB+zUA0pomiaSSq6HARuMMLo9dM7kTOOTxyrc8smALl9WnSjtyi+6jdmiGiv1Ap8r3O1uR+3H7m+JVkM6ZAm0dEGlcaHm4keNbD5ifn9x9IpLaOHpLID0u72Wj/EeHQOrRupCe/Yz71qBqdESdjLZ3/+KWAUv486ZRdU+oyG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785187546; c=relaxed/simple;
	bh=FS/MPkYH02zxFrUdVGx+6syd+CnImQUQ5ol4pSTRu5Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HpP3Jnm+KBI2wo4UbRH+bbAZlVFYROpDiQlWfIurSOHDQYlCeeh8Ro15fJwOvT8JTbeNhz1EbifKmAw+iSMvRTKyqbFzbpm/Z70UvSFGRcceCCJoREKVnKjiWFMQWr9nLg4QdV7+wcDHb8jMQgK4ZeSvCck/7GhCaQoZLy/ONho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eSs5XvrG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eSs5XvrG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA63A1F00A3A;
	Mon, 27 Jul 2026 21:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785187545;
	bh=9mvAbFW2cwQlq+2KeBGamJIMpzMidUN/rF8O9kQfA8g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eSs5XvrGbc8QMlbV5Vi5MHofaI56j5pPSfSzqDO+t5b7fm3itVwC7HC+BKB0vcMAG
	 QmYLkV+rrOn6fofyv5chY2NktxiDrjNJ4T5oYumvQvyBOA8+Ik3BLxHQoQ3M2U5fUJ
	 8VAIYqj1EIwgyNlfVJ9nnto/dDEDTrKrz1knbkUWBvGCRrK5U7qphQkZte+G1z0uiP
	 6uGvk5GyLUiRXWWd86532CKYR6C4QahmBVaUOyPUk/7MB74viwlJdRreOzgSklyF/C
	 ThgC8K+1eKeykAHHaEIG5X1jckERhFK10LeXeBT3BN80B+1gc1lXQGXB0nqMihycbA
	 e6q0V3EoEdxHw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mtd: rawnand: gpmi: add debugfs entry for BCH geometry
Reply-To: sashiko-reviews@lists.linux.dev
To: han.xu@oss.nxp.com
Cc: "Michael Walle" <mwalle@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, Frank.Li@kernel.org, imx@lists.linux.dev, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Richard
 Weinberger" <richard@nod.at>
In-Reply-To: <20260727-nand_debugfs-v1-1-7cba1ceab5ee@nxp.com>
References: <20260727-nand_debugfs-v1-1-7cba1ceab5ee@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:25:44 +0000
Message-Id: <20260727212544.CA63A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing cleanup of debugfs entries leads to a Use-After-Free on de=
vice unbind or module unload.
- [Medium] The use of a static global variable for the debugfs blob wrapper=
 and a hardcoded directory name breaks support for multiple device instance=
s.
- [Medium] The `raw_mode` debugfs file is created with NULL file operations=
, making it completely non-functional.
--

--- Patch [1]: [PATCH] mtd: rawnand: gpmi: add debugfs entry for BCH geomet=
ry ---
commit 687d6ba8c3ad7f3c6c8dbd852caa00f732194bfb
Author: Han Xu <han.xu@nxp.com>

mtd: rawnand: gpmi: add debugfs entry for BCH geometry

Export the BCH geometry parameters via debugfs to aid debugging and
provide the necessary information for legacy kobs-ng tool. The debugfs
directory "gpmi-nand" is created under the root debugfs tree, exposing
the bch_geometry and raw_mode. The implementation is guarded with
#ifdef CONFIG_DEBUG_FS to avoid build failures.

> diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nan=
d/raw/gpmi-nand/gpmi-nand.c
> index c1f766cb225aa..3ceb8df7f8f93 100644
> --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c

[ ... ]

> @@ -732,6 +733,26 @@ static int common_nfc_set_geometry(struct gpmi_nand_=
data *this)
>  	return err;
>  }
> =20
> +#ifdef CONFIG_DEBUG_FS
> +static struct debugfs_blob_wrapper dbg_bch_geo;

[Severity: Medium]
Since this blob wrapper is declared as a static global variable, what happe=
ns
if there are multiple instances of the GPMI NAND controller probed?

It looks like the second instance will overwrite the global .data pointer
with its own geometry pointer, causing all reads from the debugfs file to
return the geometry of the most recently probed device.

> +static void bch_create_debugfs(struct gpmi_nand_data *this)
> +{
> +	struct bch_geometry *bch_geo =3D &this->bch_geometry;
> +	struct dentry *dbg_root;
> +
> +	dbg_root =3D debugfs_create_dir("gpmi-nand", NULL);

[Severity: High]
Does this code leak the debugfs directory and files when the driver is
unbound or the module is unloaded?

It appears that gpmi_nand_remove() lacks a corresponding call to
debugfs_remove() or debugfs_remove_recursive() to tear down this tree.
Since bch_geo points to memory within gpmi_nand_data which is managed
by devres, can this lead to a use-after-free if userspace reads the
debugfs file after the device is unbound?

Additionally, hardcoding the debugfs directory name to "gpmi-nand" might
cause creation conflicts if multiple controller instances are present.

> +	dbg_bch_geo.data =3D (void *)bch_geo;
> +	dbg_bch_geo.size =3D sizeof(struct bch_geometry);
> +	debugfs_create_blob("bch_geometry", 0444, dbg_root, &dbg_bch_geo);
> +	/* create raw mode flag */
> +	debugfs_create_file_full("raw_mode", 0444, dbg_root, NULL, NULL, NULL);

[Severity: Medium]
Are we passing NULL for the file operations here?

If the fops parameter is NULL, the debugfs core assigns
debugfs_noop_file_operations, which simply returns EOF (0 bytes) when
read. Does this make the raw_mode debugfs file completely non-functional
instead of exposing the intended boolean flag?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-nand_debug=
fs-v1-1-7cba1ceab5ee@nxp.com?part=3D1
