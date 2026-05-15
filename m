Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA8F2010EE;
	Fri, 15 May 2026 21:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778881961; cv=none; b=Xa8Qd5TtSetfet5MiLmY/TKEMmHLH6NV/vz7EFMZkJ3KDZK+ohPHr21Gr49iRjwOltdtxXyAHF0Bw/ImwyaBeby58pvq6s6NTvB79ksYW2KE2q3p0cVDYSabczY0cDw5ns7MwFcYDGGWE1yIvQZth9JnJcctNoAWe12gvHx105g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778881961; c=relaxed/simple;
	bh=io1mo3XLPCwCYCHxlFo+KOBQf0uvj9xY+ciVNMK0NxI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iUNAYzW/ogijb/axyvSXZoqKymt0QLNXM7eP/VsZeX5zrAuZU/g9zYefu0yHMhGNHnlAi9RZCVWMglnos8fV4ajypflRP0JGqq7LvKlUj7XCglmZCgy4kzlV5ZYqib7lLYI0BEIqu6Xs6xI1UyfT04Z7S8OGMsxqTcTH0kScOHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P213e4aX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P213e4aX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A644C2BCB0;
	Fri, 15 May 2026 21:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778881961;
	bh=io1mo3XLPCwCYCHxlFo+KOBQf0uvj9xY+ciVNMK0NxI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=P213e4aXb9HJvDg8/dZMthaVg/w35t010uFFR4cIyU0eH1vo6+UizfHD2h6SeEiM/
	 XPwvUjjcoksDiLrokomu7n/grMB1lDV8wSTywzV+vB0t+YLSczx/4Srs5R3/NpB71R
	 zP6d6rZ5h7wH9y7WqobfGP44YA+4I9e0yx8PQ0dIxT8t8lMDi6pDnGaoNDMA98E3aD
	 xvYPvrmBCrBOAJN2P1fdFcxn+ADUY5vLxeHXeKJbJFGZhN4cSzl7Oqd2shDHBF3uCp
	 cQb+LsMEI1hstJ6m5SrwnbzrpSuO1SyIOr1bGpvkCe+MOlsAki5CnH7z1iYWdcc/JU
	 zMKHYnHL0d0DQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/6] ARM: dts: imx: add (power|vdd)-supply for related
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Frank Li via B4 Relay" <devnull+Frank.Li.nxp.com@kernel.org>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260515-imx25_dts_simple_warning_2-v1-1-b06bff192a05@nxp.com>
References: <20260515-imx25_dts_simple_warning_2-v1-1-b06bff192a05@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 21:52:39 +0000
Message-Id: <20260515215240.7A644C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The newly added `reg_5v` regulator in `imx53-sk-imx53.dts` incor=
rectly has `regulator-name =3D "usb_vbus"`.
--

commit 1eaf7d9176cad41b8d33d56943e5b16020f26bf0
Author: Frank Li <Frank.Li@nxp.com>

ARM: dts: imx: add (power|vdd)-supply for related node

This commit adds required power-supply and vdd-supply properties to fix
CHECK_DTB warnings for several imx devicetrees.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx53-sk-imx53.dts b/arch/arm/boot=
/dts/nxp/imx/imx53-sk-imx53.dts
> index 1a00d290092ad..c1e065359fd2d 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx53-sk-imx53.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx53-sk-imx53.dts
> @@ -29,6 +29,13 @@ memory@70000000 {
>  		reg =3D <0x70000000 0x20000000>;
>  	};
> =20
> +	reg_5v: regulator-5v {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "usb_vbus";

Is "usb_vbus" the intended name for this regulator?

Since this regulator is used to power the display panel, the name appears
to be a copy-paste error from the reg_usb1_vbus node directly below it.

Defining multiple regulators with the exact same name can cause sysfs
directory collisions and registration warnings in the regulator subsystem.

Would a unique name like "5V" or "panel-5v" be more appropriate here?

> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +	};
> +
>  	reg_usb1_vbus: regulator-usb-vbus {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "usb_vbus";

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-imx25_dts_=
simple_warning_2-v1-0-b06bff192a05@nxp.com?part=3D1
