Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E952732ABCD;
	Thu, 16 Jul 2026 06:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784182128; cv=none; b=OP2ncbXpLmVfiF/dshCSjjJ5n9DxFUcdcNtedK5JQD3o5eE0CALNr4SK5NfeOspqqu8tgaEK6Z56ZQ4vctizbgkJi4qXL6xiVB3OFSEdFQcSlnLQ+AvwuH48x3T2znZ0dBabc5bluIs0o1pENKa/o0Lez/0G5iaTtYDlNGfDMAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784182128; c=relaxed/simple;
	bh=W6KB8hjCFrW8lNF/IhnETpoM/XHjGkg8TMBkrzSRcBo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=erJ1jLNgG2J/NRRku8TE5TEw98SQmcCbhIZWKlh2kHxinFX0jczXE02YmUQvHhvaLMbKGmGOt5I6kjvGxUTiYIGl2WoVajRTd4gWehaVjHzrmpqjyMsrHY8ioQqvyWEkhDwC6AOkEYPQqDJ5wc9v6hBpxxT6FhnhcLChgdAEock=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aLVE06Pg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aLVE06Pg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34AC71F000E9;
	Thu, 16 Jul 2026 06:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784182126;
	bh=EDyV5Oh4971HFHj/K95mrqUvUskeT8xStKGitEcp//0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aLVE06PgELaIWZxLML1Jv7Cnkul7hpESTn6L9ZZyM2Qg/2pn1q60yZOJRbG3o5qTK
	 Ys0OCPFxNVcM8g86heQ9Sfr9pFlSuSSlwJFwyHOwBp1yg+nbDViIgi8i02QXfs3/4p
	 wKRnc47XTSO71iHLqI4z+VrRBb85WYAmSZ/9MYvHDss/scifmNeQ2KlObHmnMVNsBn
	 Cq6t4d93F26LpsoesasaEEcv3JabA5LPZNB4D5ILyByjagpwX53EaGJvzgUT5EuIsI
	 tv2BM39+Eu+Sf9WuP9LknDNCkihFJqKmmPjFg2vk0TAHzJusOnt4bAyzAWMus8tDmj
	 fkcrzoLjw7gmw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/6] arm64: dts: imx8mm: imx8mp: Add CM DTOs for Data
 Modul i.MX8M Mini and Plus eDM SBC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: Frank.Li@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260716055751.279033-4-marex@nabladev.com>
References: <20260716055751.279033-1-marex@nabladev.com>
 <20260716055751.279033-4-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 06:08:45 +0000
Message-Id: <20260716060846.34AC71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The CM4 devicetree overlay for the i.MX8MM board hardcodes reserve=
d memory regions at physical addresses that lie outside the RAM boundaries =
of the 1 GiB variant of the board.
--

--- Patch [4]: [PATCH v5 4/6] arm64: dts: imx8mm: imx8mp: Add CM DTOs for D=
ata Modul i.MX8M Mini and Plus eDM SBC ---
commit 570590d387e46a557b9ab429099f8826e9336ea2
Author: Marek Vasut <marex@nabladev.com>

arm64: dts: imx8mm: imx8mp: Add CM DTOs for Data Modul i.MX8M Mini and Plus=
 eDM SBC

This commit adds device tree overlays which provide CM4/CM7 extras for
the Data Modul i.MX8M Mini and Plus eDM SBCs. It allows CM4/CM7 firmware
to be used with remoteproc and rpmsg without imposing overhead on all users.

[ ... ]
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-over=
lay-cm4.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-over=
lay-cm4.dtso
> new file mode 100644
> index 0000000000000..0bd770af2a68c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-cm4=
.dtso
[ ... ]
> +	reserved-memory {	/* CM4 reserved memory */
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		m_core_reserved: m_core@b7000000 {
> +			reg =3D <0 0xb7000000 0 0x1000000>;
> +			no-map;
> +		};
> +
> +		vdev0vring0: vdev0vring0@b8000000 {
> +			reg =3D <0 0xb8000000 0 0x8000>;
> +			no-map;
> +		};

[Severity: High]
Will applying this overlay on the 1 GiB variant of the board cause a crash?

The base board imx8mm-data-modul-edm-sbc.dts supports 1, 2, or 4 GiB varian=
ts=20
with physical memory starting at 0x40000000. On a 1 GiB variant, physical=20
memory ends at 0x7FFFFFFF.

Since these memory regions are hardcoded at physical addresses starting at
0xb7000000 and 0xb8000000, they fall outside the available DRAM for 1 GiB
boards.=20

When the remoteproc driver probes and attempts to map and initialize these=
=20
reserved memory regions, will it access unbacked physical memory and trigge=
r=20
a synchronous external abort?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716055751.2790=
33-1-marex@nabladev.com?part=3D4
