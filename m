Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE259412C1A;
	Fri, 14 Aug 2026 07:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786693270; cv=none; b=WBxHw5RiO/MTRfZDepTe6Fy2jMO85Y5B4kdU93isJuIOt5/rxJG0ZcdYAeizd5moqGYFz4gf1q6hkUwTZiG1SufjlqNVVs8X91FvB7pWDs9Zozjv1VLIz+7pnrvr+BbysfYjvPU1X+0ccw31ZgwkaVZ/mzuQZRFINtql2+Y1Uks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786693270; c=relaxed/simple;
	bh=86JXjCR1mW7Np0YdX48qO7+Z3/KOy2dB/kaPR+AdVrA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u3JlZQAapWAXWLHxo9guXJKBvQ9i7l8yYhzige/f4jnIbTgAmnXPlGlRsepqQO5wqWRzhih0jD/6TT6D1gdwNboWsPx8XsKunln4hWx/Gx4LFqJNNDNnfKVKbm8NIK0F+Wax/JgL0eQEsa0vRMqomd2bEZGt3c1LWkvhyzEx0Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c0apSp46; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c0apSp46"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31EE51F000E9;
	Fri, 14 Aug 2026 07:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786693262;
	bh=tA73GwbwFL+vXCN8LXzG8fEIvkN1mhhSz2ulAFlWh60=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c0apSp46Va+nNQEjJXLrdI2xdYmdypTfuNYApohDnuxjMwT9kvUlGgk9km+FL0Mur
	 qVjfbCVgP/RjeLjh/rlw3tt2ihgTgKqhk1jnRq8yQcLXUMkJODRvP0aZupK/IdF+6f
	 9LqQ5aL5JlvI3BX6ex06goyUd+mU+/mLNi4TmDFYOoxonmYN75TQrSLQgzJLEZUFDg
	 BD7WUySzAJIrkJk3W3qOM1ld/xYJU7LdQFQbTlV5shJTAChdFieRxM2vWVkNOBIwCZ
	 GEsslJczDxaajHUirX5qWT7PW51wxqtJEuaH09231CGODsYBzZPXHObUEHDOf5uczJ
	 Iuf0GsVVI7Yag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 17/17] arm64: dts: fsl: Add DT overlay to build MQS1
 sound cards on i.MX9 platforms
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chancel Liu" <chancel.liu@oss.nxp.com>
Cc: Frank.Li@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260814072022.4064009-18-chancel.liu@oss.nxp.com>
References: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
 <20260814072022.4064009-18-chancel.liu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 07:40:58 +0000
Message-Id: <20260814074102.31EE51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The MQS overlay orphans the `sound-micfil` ASoC card, leading to=
 an indefinite deferred probe.
--

--- Patch [17]: [PATCH 17/17] arm64: dts: fsl: Add DT overlay to build MQS1=
 sound cards on i.MX9 platforms ---
commit 3fb4d43fd09e2139234f5b149b073a22039d004c
Author: Chancel Liu <chancel.liu@nxp.com>

arm64: dts: fsl: Add DT overlay to build MQS1 sound cards on i.MX9 platforms

This commit adds a common DT overlay to support MQS sound cards on i.MX9
platforms. It routes SAI1 to MQS1 and disables conflicting devices and sound
cards.

> diff --git a/arch/arm64/boot/dts/freescale/imx9-mqs.dtso b/arch/arm64/boo=
t/dts/freescale/imx9-mqs.dtso
> new file mode 100644
> index 0000000000000..9ac6d58eacbb9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx9-mqs.dtso
[ ... ]
> +&mqs1_conflict_card {
> +	status =3D "disabled";
> +};
> +
> +&mqs1_conflict_dev {
> +	status =3D "disabled";
> +};

[Severity: Medium]
When the MQS overlay is applied on boards like imx93-11x11-evk.dts, this
disables the conflicting device (which aliases to &micfil), but does it lea=
ve
its consumer sound-micfil active?

Looking at arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts:

	sound-micfil {
		compatible =3D "fsl,imx-audio-card";
		model =3D "micfil-audio";

		pri-dai-link {
			link-name =3D "micfil hifi";
			format =3D "i2s";

			cpu {
				sound-dai =3D <&micfil>;
			};
		};
	};

If sound-micfil is not explicitly disabled by an alias here (such as
mqs1_conflict_card2), will the audio subsystem repeatedly attempt to probe =
it
since its CPU component (&micfil) is missing, resulting in an endless defer=
red
probe loop?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814072022.4064=
009-1-chancel.liu@oss.nxp.com?part=3D17
