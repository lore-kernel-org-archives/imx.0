Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A9642F708;
	Thu, 17 Sep 2026 10:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789640920; cv=none; b=bMVwDMH3LgZwhMGvibYBUqwV8abLzLJWWmyMTkgkHajpHKqTNSZBniBqvx3DYENgkNYp9jmLu8OeXWlMXYaIbTfcDaU8seBmfWPxxhgqKXGItDtBfT2S0fRwMM+5tV3uYJxz68Ax9qAGJtwCZBxuXs0hZiMDYVLchOltsRpepPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789640920; c=relaxed/simple;
	bh=nRODbc1XuGRfCUe+fW0D3wy9JQLkZdrwqvQ6qaVy3gg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PQf8Hj0TJMoCrnnG1QSb0b0z2YKY55ICptbXGbvaG9wlwNKp73mfDm5lq5GO7agffY4JGpYJvw1LFBhiMXhDgexl0UVsR/XVWMGXXJ2WRvqz8F0Ns8rv5FJNRn4L8zWHcEaM/xi/X5mP7xuX8t0l7WJpa+8C02H2REpZgEAHclw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ieAC0Ehg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ieAC0Ehg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2BB31F00893;
	Thu, 17 Sep 2026 10:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789640917;
	bh=3jvluj/3dO5JFIQNw/MCcKqw4GxJmrRroEHKYZq9ulw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ieAC0Ehg/t+N+oCZtYawNUJ12WjL9Ee3ksevs39LQoTC6xkpvQMcCmrrfJTMmasCe
	 AXbu0fc88Dxce+oqLoNgi28oC9htqH8/5g1w40XfLdrOjYcj/st4jSh3S41dYcec+9
	 YEyh9SCaaDMN0sxDtqy/IP3ZfMS5T+ex78vK7M8gL033H4zjeA1785j7AHvHB45SOM
	 3CMCCm7L5/NorMHlczbYWJ+PhDAuGUPROtBfZBeM5ouN2tP7WqcwfzhOCJd7SkW4V8
	 xLij1DNW15BM4WIumDbiMw2hrt0VcDTOeOXlqATxsBUI42j4dlr/iovl5piD0RLlfN
	 KatxmP14J89zA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: Add Toradex OSM iMX95
Reply-To: sashiko-reviews@lists.linux.dev
To: "Francesco Dolcini" <francesco@dolcini.it>
Cc: robh@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260917102011.69071-3-francesco@dolcini.it>
References: <20260917102011.69071-1-francesco@dolcini.it>
 <20260917102011.69071-3-francesco@dolcini.it>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 10:28:36 +0000
Message-Id: <20260917102836.C2BB31F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: incorrect ALSA sound card name due to copy-paste error
--

commit 6c3bfda4bf1b15d78278dba5a3e6235b17a43b87
Author: Antoine Gouby <antoine.gouby@toradex.com>

arm64: dts: freescale: Add Toradex OSM iMX95

Add support for the Toradex OSM iMX95 SoM, based on an NXP i.MX95 SoC,
and its OSM development carrier board.

Link: https://www.toradex.com/computer-on-modules/osm-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/osm-development-board

> diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts b/ar=
ch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts
> new file mode 100644
> index 0000000000000..b3d54be07c434
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts

[ ... ]

> +	sound {
> +		compatible =3D "simple-audio-card";
> +		simple-audio-card,bitclock-master =3D <&codec_dai>;
> +		simple-audio-card,format =3D "i2s";
> +		simple-audio-card,frame-master =3D <&codec_dai>;
> +		simple-audio-card,mclk-fs =3D <256>;
> +		simple-audio-card,name =3D "verdin-wm8904";

[Severity: Medium]
Is this the correct ALSA sound card name for the OSM module?

The string defined here is exposed to userspace on the OSM standard board
and forms the ABI for the ALSA UCM (Use Case Manager) to load audio routing
profiles. If userspace matches against "verdin", it could load Verdin-speci=
fic
routing topologies that may be incorrect for the OSM carrier board, leading=
 to
broken audio.

> +		simple-audio-card,routing =3D
> +			"Headphone Jack", "HPOUTL",
> +			"Headphone Jack", "HPOUTR",

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917102011.6907=
1-1-francesco@dolcini.it?part=3D2
