Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C4F37AA9F;
	Tue,  7 Jul 2026 09:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783415128; cv=none; b=Qzc4zdN11PZEJ7GO7LMINCEjlfPQFFS1koDRhhXllKFtg719UtJ/4PWCGF53Sa9eMSMWpH7Y5Eb/lWYchXDuPhUj1nSV8ukCT/Qeeo3ufyxJcImkB5OFLFThfMeogGOg/xwxwirXzWSNP2BHyevT0Z2JKX5XYwvNf1Z97y54SEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783415128; c=relaxed/simple;
	bh=426Zwk/YqhM7ttsOUpI9CIja+pyZ3MuqZaVbyCjE8Fo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XsVdKJ559z4O8d1CUI7nH2oC8sTdTOOSCNU2MNnzEj72W/GsKDTHaxEAPhx+tD8Ip26xsXf8RSB4KlpIxTFSfxw6Pg5d/8QYsz1i1+68PYWV5boDQ/QckhxZn10ofD7Dp+A1doYu4MgjNUxTvbph75RonJ37JWOvj8nVwIgR95w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CgIojPLD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CgIojPLD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 978C01F000E9;
	Tue,  7 Jul 2026 09:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783415127;
	bh=QZbdlwYEOqt8/DNrm3fDQ5tOSNFY5hC7nF9gDH4EmtU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CgIojPLDEAZwRV/MbsCB9vQrmkEvmmwKpK7QQzm/mmOY4LWJZxqEW518RDl0JBo5j
	 jt0ZHeCNzcG8i/kwiQjG+HaVfqiER8uaGDkfHRDAdOiJSxsfs2cB7TpObOytdK48kB
	 rv9Vb+EnQtjL+D0dqnGb9VtzmSsykYZ3psaQwUqYL6lWEIrSCQtFpfflnB3gQIZUyW
	 q9urMPislZx14H2d95d9DKDw3FUBwZHZRYBoAafd/qtBzV9xP1VodlHTuPyLiO4XIF
	 Unhrb1JkABARo0P1ySitz6GajZx4eXpKdYN0GQzKL5XGSCcc7AuuaLt2EIuuEkODSj
	 Zlc2jETOy/7Sg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: imx91-tqma9131: move ele-reserved
 memory into 512MB range
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260707085551.1683462-3-alexander.stein@ew.tq-group.com>
References: <20260707085551.1683462-1-alexander.stein@ew.tq-group.com>
 <20260707085551.1683462-3-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 09:05:24 +0000
Message-Id: <20260707090526.978C01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Moving the EdgeLock reserved memory region in a shared .dtsi break=
s backward compatibility for 1024MB boards with older firmware.
--

--- Patch [2]: [PATCH 2/2] arm64: dts: imx91-tqma9131: move ele-reserved me=
mory into 512MB range ---
commit 48154931b16a7f9734d0f8037cf111d05d7b8120
Author: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>

arm64: dts: imx91-tqma9131: move ele-reserved memory into 512MB range

TQMa91 has a 512MiB RAM variant for which the edgelock memory location
exceeds the valid memory area.

> diff --git a/arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi b/arch/arm=
64/boot/dts/freescale/imx91-tqma9131.dtsi
> index c99d7bc168483..a8c79731eace5 100644
> --- a/arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi
> @@ -33,9 +33,9 @@ linux,cma {
>  		};
> =20
>  		/* EdgeLock secure enclave  */
> -		ele_reserved: ele-reserved@a4120000 {
> +		ele_reserved: ele-reserved@94120000 {
>  			compatible =3D "shared-dma-pool";
> -			reg =3D <0 0xa4120000 0 0x100000>;
> +			reg =3D <0 0x94120000 0 0x100000>;

[Severity: High]
Does this break backward compatibility for 1024MB boards with older firmwar=
e?

By unconditionally moving the ele-reserved node from 0xa4120000 to 0x941200=
00
in the shared .dtsi, Linux will no longer reserve 0xa4120000.

If an older 1024MB board runs existing firmware that still places the ELE at
0xa4120000, would Linux treat that region as normal RAM and overwrite the l=
ive
secure enclave?

Could the new address be specified in a board-specific .dts for the 512MB
variant, or could the bootloader dynamically patch the node to reflect the
actual allocation instead?

>  			no-map;
>  		};
>  	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707085551.1683=
462-1-alexander.stein@ew.tq-group.com?part=3D2
