Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F3C33438F;
	Fri,  9 Oct 2026 19:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791575376; cv=none; b=K/cKNyX1bb9dCjaSOqTVNzxl+uBsmK2gRikI0HzJNj4kcZXZYFwX+gEyJyeHSXx9ppYl/NSjFlzlGz+56jDXWsRhFr6fXRC1hWQYCPBR9+j5lWHwvRDzMnOnf/awUnS4rlVNhpS40kAbBFlRNGHtYhmp0aYPUW1/gXr2WtIAxi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791575376; c=relaxed/simple;
	bh=zKjRbBBghZhhm9MgKbix9lA+Z+RbUgkvQF2BfvaXddA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=V1Yvb0EnQpJ5Z5HFxCkrl1LXXL7CheR7gRHSUgA5GE8hMClPaDh+wfjxuGZtehgFEvdr/WX1jdMSr5ZQFvKbV56Eainb2t2ET6jHdJSnNM9acNbg7qwhNhgn4FmLixc4aWr4DZtD6mUWZNBOk9vx7DSIWSWhKSV0K8aGP3Mhypw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SYRAfrgp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SYRAfrgp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F07D81F00893;
	Fri,  9 Oct 2026 19:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791575366;
	bh=GnN+uCQ1dn99HSmrnfByAoCGFhNnJOVkc264ZjjBaEE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SYRAfrgpG40UzmzPoY+nBCbGd4Oi9+7mJEk/N5iH9ECp5ejGNDc2UNZX9xKlJjWYg
	 ychJhkHA+/FNT4Y7R2hEulHUcAjPbf92Mo7Vfdum2Ci3Cu2pF0qBMmE4Iyg0un5ib+
	 bE76nrnwwy/ruMWQs0Pc6QTCthUApYIav02AT7VKj9+j/p+MIf+6KAFpumNWo45MAB
	 uhNtyohpJa+1XYRphC0iZ67KazNzQ5Peh+FxDtiY6IdDMsljl9dpaj7nO4ItrrBACT
	 CkPN/kEfnswq7qnHwQmh6jzNLdpPV7575+M6ZYbMuvG9+T1Q4rOrZCgpvy+VDXevPn
	 JvU4eUsuUQUPw==
Message-ID: <sashiko-outbox-166013@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 07/13] ARM: dts: imx6ul: Add Variscite WM8904 and
 WM8731 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: robh@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <50f74f31925dd5d43d5b6578888c33875d8f2a20.1791487179.git.stefano.r@variscite.com>
References: <cover.1791487179.git.stefano.r@variscite.com>
 <50f74f31925dd5d43d5b6578888c33875d8f2a20.1791487179.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 19:49:25 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] sound: simple-audio-card: inverted DAPM routing for WM8731 microph=
one
--

commit fed6a844cfc964e2cba2d176b3deac928acc5e54
Author: Stefano Radaelli <stefano.r@variscite.com>

ARM: dts: imx6ul: Add Variscite WM8904 and WM8731 support

Add shared WM8904 and WM8731 codec and sound-card descriptions for
VAR-SOM-6UL and DART-6UL. Reuse imx6ul-var-som-audio.dtsi for SAI2
and select the clock setup and audio routes in each codec file.

[ ... ]

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8731.dtsi b/a=
rch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8731.dtsi
> new file mode 100644
> index 0000000000000..ed9af0a39714c
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8731.dtsi
> @@ -0,0 +1,50 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
> + */
> +
> +#include "imx6ul-var-som-audio.dtsi"
> +
> +/ {
> +	sound {
> +		compatible =3D "simple-audio-card";
> +		simple-audio-card,bitclock-master =3D <&sound_master>;
> +		simple-audio-card,format =3D "i2s";
> +		simple-audio-card,frame-master =3D <&sound_master>;
> +		simple-audio-card,name =3D "wm8731audio";
> +		simple-audio-card,routing =3D
> +			"Headphone Jack", "RHPOUT",
> +			"Headphone Jack", "LHPOUT",
> +			"LLINEIN", "Line Jack",
> +			"RLINEIN", "Line Jack",
> +			"MICIN", "Mic Bias",
> +			"Mic Bias", "Mic Jack";

[Severity: High]
Does this routing reverse the logical signal flow for the microphone?

The simple-audio-card,routing property expects pairs in the format of
{"sink", "source"}.

In the DART WM8904 wrapper also added in this patch, the microphone routing=
 is
correctly set up with audio flowing from the jack to the codec input, and b=
ias
flowing from the codec to the jack:

    "IN2L", "Microphone Jack",
    "Microphone Jack", "MICBIAS"

However, the WM8731 configuration here uses "MICIN" as the sink for "Mic Bi=
as",
and "Mic Bias" as the sink for "Mic Jack". This appears to treat the bias as
an audio source for the input pin, and the jack as a source for the bias.

Could this reversed routing violate DAPM semantics and prevent microphone a=
udio
from being properly captured?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791487179.gi=
t.stefano.r@variscite.com?part=3D7
