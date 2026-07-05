Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EE5233721;
	Sun,  5 Jul 2026 20:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783283080; cv=none; b=kaIHRC5+7yAxf26U20kfFcZomkN5U84kUWiiZknaaVY601qzhhIFObq5KK9yzrfdL4O1Z3fuuB/Lkpt8/76/865+NnOQAb14hWC0lJLrm5ckNZhXCoVzjCrPG8ayKiJOHmyHm1z4/tv3v7lMptr6+10EkW5DWyLSuxOJNbl7TF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783283080; c=relaxed/simple;
	bh=GuPpKtrhP3c1xZA/Qlo7ta6FzkmLcUsye5lm8ZoSweI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lR1c/XFTqZtVfunCuBtqvU65t4RuWqM6nj/JlfgJZXe+PVDILMtPVrIT08gPl+rWIBYIvo2fYI9zGe6cLO/97/mTDqvGSl4XqsbOabYrlaJFDwYerqk667zyuNpzhTgRWM+mUgfel1oOarMr4P6rbLvN+c9x8WIFfxdm14gBq+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nGL9KXzm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nGL9KXzm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F5771F000E9;
	Sun,  5 Jul 2026 20:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783283079;
	bh=tpeECkUNRsF6XjObolx1xq/lzAcJcqA5oGlQhEokzU4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nGL9KXzme48IRsw8tnnD8wRK1Mn2vCaJGngRvmupMM0n/UtgpzGwQZ4dhNxtyHh50
	 Xin8NchpxgQJ14+47YVfz1K6QovFKTm2840ysuDrwvWNcqGG0Hnyou6dAzuk4T08Qr
	 QlSBmIodqoPUY9W+8pENqJwnvPn1OJxTxrq6aUmow8mtY+uXAUzmtER0JZDhAFyeS0
	 2JedYq+2DzriT9Dw/U4FYp+E4Dh0x5Pe6Rsfaxmu/618WTDOjDx7u8lyuYyOW+Apam
	 p3FIysPkZ6sfkCEfJRrN9H7E4VLzhDvdv13rcK+ZezJZGt2uHYz5qxs+o0IS8/xJ16
	 J5nty9G2HjBdg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/6] arm64: dts: imx8mm: imx8mp: Add CM DTOs for Data
 Modul i.MX8M Mini and Plus eDM SBC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260705200534.151803-4-marex@nabladev.com>
References: <20260705200534.151803-1-marex@nabladev.com>
 <20260705200534.151803-4-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 05 Jul 2026 20:24:38 +0000
Message-Id: <20260705202439.3F5771F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The virtio device buffer node is named `vdevbuffer` instead of `=
vdev0buffer`, bypassing the driver's carveout exclusion logic.
--

commit b1e78cbda66a659316ae8170db75a75bd2d9d9d2
Author: Marek Vasut <marex@nabladev.com>

arm64: dts: imx8mm: imx8mp: Add CM DTOs for Data Modul i.MX8M Mini and Plus=
 eDM SBC

This commit adds device tree overlays for the CM4/CM7 cores on the Data
Modul i.MX8M Mini and Plus eDM SBCs. The overlays allow CM4/CM7 firmware
to be used with remoteproc and rpmsg without imposing the overhead on
every user of the platform.

[ ... ]

> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-over=
lay-cm4.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-over=
lay-cm4.dtso
> new file mode 100644
> index 0000000000000..8d681c0eff0d4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-cm4=
.dtso
> @@ -0,0 +1,56 @@
[ ... ]
> +		rsc_table: rsc-table@b80ff000 {
> +			reg =3D <0 0xb80ff000 0 0x1000>;
> +			no-map;
> +		};
> +
> +		vdevbuffer: vdevbuffer@b8400000 {
> +			compatible =3D "shared-dma-pool";
> +			reg =3D <0 0xb8400000 0 0x100000>;

[Severity: Medium]
Will this node name bypass the driver's carveout exclusion logic?

Looking at imx_rproc_prepare(), it iterates over memory-regions and checks
specifically for the name "vdev0buffer" to skip processing the vdev buffer:

	if (!strcmp(it.node->name, "rsc-table") ||
	    !strcmp(it.node->name, "vdev0vring0") ||
	    !strcmp(it.node->name, "vdev0vring1") ||
	    strstarts(res.name, "vdev0buffer"))
		continue;

Because this node is named "vdevbuffer" instead of "vdev0buffer", it appears
it will be mapped as a generic carveout via ioremap_wc() and unintentionally
included in the remoteproc coredump.=20

Could this node be renamed to "vdev0buffer" to avoid wasting vmalloc space
and bloating the coredump?

> +			no-map;
> +		};
> +	};
> +
> +	imx8mm-cm4 {
[ ... ]
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-over=
lay-cm7.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-over=
lay-cm7.dtso
> new file mode 100644
> index 0000000000000..21e2a8c0bab0a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-cm7=
.dtso
> @@ -0,0 +1,57 @@
[ ... ]
> +		rsc_table: rsc-table@550ff000 {
> +			reg =3D <0 0x550ff000 0 0x1000>;
> +			no-map;
> +		};
> +
> +		vdevbuffer: vdevbuffer@55400000 {
> +			compatible =3D "shared-dma-pool";
> +			reg =3D <0 0x55400000 0 0x100000>;

[Severity: Medium]
As with the CM4 overlay, will naming this node "vdevbuffer" instead of
"vdev0buffer" cause the 1MB buffer to be unintentionally mapped as a generic
carveout and dumped on a crash?

> +			no-map;
> +		};
> +	};
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260705200534.1518=
03-1-marex@nabladev.com?part=3D4
