Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F89347DD;
	Sat,  9 May 2026 03:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778296460; cv=none; b=d6DdrnlA2pa6DqfnX2VcIxqImk50sNadRlW2za0s/IhnmLQtMUo7+fd1i0yLBq3iysC3JVHglFYzO4/gMIKIwIR2Q+/NBlxL7eDLju7MgLFniiOtjgeZ18UcEUk43fgzdeEgHArTq44dYVrjFyvnO2ivtbnSAxsONv5SZAizdTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778296460; c=relaxed/simple;
	bh=YrUhtbwDkewIg9EkHJHsN3kyBFs/JEqndJPf/RXlgYs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hSu2nk0BnAljurGJBkAkqjGkS/sI3mYyfVAbtkQu2AQ6LbgJJvF/oxB4Beb27OPb1SVlCkg6C3lXMOih9h1yXut/2NfMNBRjmTC4WWzjKE1VdMV1/DJfr9LPcQ1uoo7jh3odylkGMCKu8spRT9oKlBzBIl+6Tm4EliUEtF/Bi5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uxe4+BDL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uxe4+BDL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3828CC2BCB0;
	Sat,  9 May 2026 03:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778296459;
	bh=YrUhtbwDkewIg9EkHJHsN3kyBFs/JEqndJPf/RXlgYs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=uxe4+BDL986BvLVj0wNssgPTW8QE9mq4d+J5x8zaxdVyfIumSLzbI2QgvnU+ABNh6
	 YHK+do5v0L8J2KNUnNHtk7qOYI6vj5OuI2jrM7HYaZoXlikD7sV12v3R5nvGY9bJtN
	 JL1mITxfcIiL4V4reHD6OTiqUwUDXpepKgiZILk/PYbEm3ZBlEahhcqAqpgLVj08DV
	 AOjfLpcU4N8zZyeoabWd/rAbQAH7dHrvtZqM5ZCt7lWIE58mD7Qw4aeZs+TisGazt9
	 zeCl29OGiTfOLxenpUUTnwl7/PRRX1VqcAtRMYeiklJEoZGYywT1BjUKBruxYm18Cg
	 OZKISMypWpm8g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] clk: Add support for clock nexus dt bindings
Reply-To: sashiko@lists.linux.dev
To: "Chancel Liu" <chancel.liu@nxp.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, krzk+dt@kernel.org
In-Reply-To: <20260509024846.2094049-2-chancel.liu@nxp.com>
References: <20260509024846.2094049-2-chancel.liu@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 03:14:18 +0000
Message-Id: <20260509031419.3828CC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Incomplete clock nexus node implementation breaks assigned clocks =
and parent resolution.
- [Low] Stale comment referencing replaced function in `of_parse_clkspec()`.
--

commit bfd03486778cd0e1335a28b465c6294bbcca9284
Author: Chancel Liu <chancel.liu@nxp.com>

clk: Add support for clock nexus dt bindings

This commit introduces support for clock nexus nodes by updating
of_parse_clkspec() to use of_parse_phandle_with_args_map(). This allows
remapping phandles and their arguments through nexus nodes to find the
actual clock provider.

> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 048adfa86a5d0..4240f059bec2b 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -5199,15 +5199,15 @@ static int of_parse_clkspec(const struct device_n=
ode *np, int index,
>  	/* Walk up the tree of devices looking for a clock property that matche=
s */
>  	while (np) {
>  		/*
>  		 * For named clocks, first look up the name in the
>  		 * "clock-names" property.  If it cannot be found, then index
>  		 * will be an error code and of_parse_phandle_with_args() will
>  		 * return -EINVAL.
>  		 */

This isn't a bug, but should the comment here be updated to refer to the new
of_parse_phandle_with_args_map() function variant?

>  		if (name)
>  			index =3D of_property_match_string(np, "clock-names", name);
> -		ret =3D of_parse_phandle_with_args(np, "clocks", "#clock-cells",
> -						 index, out_args);
> +		ret =3D of_parse_phandle_with_args_map(np, "clocks", "clock",
> +						     index, out_args);

If a device tree utilizes nexus nodes for assigned-clocks or
assigned-clock-parents, how do the core clock paths handle parent
resolution?

Looking at __set_clk_parents() and __set_clk_rates() in
drivers/clk/clk-conf.c, and of_clk_get_parent_name() in drivers/clk/clk.c,
these sites still appear to use the unmapped of_parse_phandle_with_args()
function.

When using nexus nodes for these properties, won't the specifier resolve to
the nexus node itself rather than the mapped clock provider?

Since the nexus node is not registered as a clock provider, it looks like
of_clk_get_from_provider() will return -EPROBE_DEFER, which could cause the
consumer device to silently defer probing forever.

Are there plans to update these core paths to use
of_parse_phandle_with_args_map() to fully support clock nexus nodes
system-wide without causing regressions for valid configurations?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509024846.2094=
049-1-chancel.liu@nxp.com?part=3D1
