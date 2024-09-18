Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2449A3A1A8;
	Wed, 18 Sep 2024 08:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726647454; cv=none; b=bb+vqhVmiJMvhCyJUHntpAeTJdjcybBQUstMG0QGPUAN/dPwlwL+AvxYX5KOYN0trRmt6gWwc/TOaFBCrZsxJPJlxHtmkq+XmNq3gEp3opJlMPK2kVfzJprmpR/RbICtFnbnFpDMOgc61QBuCmxc/lLRIFnysgbRO6ZNCi2izVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726647454; c=relaxed/simple;
	bh=FTJoZ8AQeQAw65u2/w9rBqCYK5Ht6T2q1Qca/3oUkA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m5cqtibSb0AC2a6wcOzUp4YJvV+kXlm9KqqpSSAftn41MBVWd09we2em6URSAhu2t8hTtosneqlQtKL2NSgT+qsb44t+bbkc65oEOLv55uEWtwdssyjzKKeTOg5xeDGY2iFl/OFBcwdRUV2Xxmq7bAAm1BYEfXBEGihwzKBK7P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H6A/qU+V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H6A/qU+V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C3C4C4CEC3;
	Wed, 18 Sep 2024 08:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726647453;
	bh=FTJoZ8AQeQAw65u2/w9rBqCYK5Ht6T2q1Qca/3oUkA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H6A/qU+VdR0Y9jSSTcHLWbmJwfGOU0AKo++1CxM4/BQaGOZrMD1gENYrHFK0XBE8f
	 f3Le05cLyNQ+TL/ODz4erntA1KRUd91HJrd8B1n2akUgPWKGG2suUPQJyAbvWOKBhe
	 Xoi52+s0ntAVHeSXdor9XcoZ96/4cvEco2n741xJWfhjLCDVllGPojfwCqTHsr4S6K
	 wjDZ3AhefQ9eN9ScOCR4SxEHulmdLcmTR3ybU9tgT0QrH2OiFThnxpOWVIaOD3BYpA
	 dT8063COUFujg6JLfjpDbh888J88G9xTXdwMkDg7KV0OSwD7YzeTmsVyJsyyx4CUX6
	 hGuc1pkoePLCg==
Date: Wed, 18 Sep 2024 09:17:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>, conor+dt@kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev, krzk+dt@kernel.org,
	robh@kernel.org, shawnguo@kernel.org, festevam@gmail.com
Subject: Re: Device tree node order sort tool
Message-ID: <20240918-igloo-unspoken-45443a52e338@squawk>
References: <ZumjueKy+tvkODnB@lizhi-Precision-Tower-5810>
 <2fdfmn7wjt5tr6lsxee2qubjgiphys5n2fivlracaksilvvgmi@od6t76mpd3co>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/Tt7n4fJunpch9ts"
Content-Disposition: inline
In-Reply-To: <2fdfmn7wjt5tr6lsxee2qubjgiphys5n2fivlracaksilvvgmi@od6t76mpd3co>


--/Tt7n4fJunpch9ts
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 18, 2024 at 10:03:32AM +0200, Krzysztof Kozlowski wrote:
> On Tue, Sep 17, 2024 at 11:43:53AM -0400, Frank Li wrote:
> > All:
> > 	I write a simple tools to sort device tree to make sure nodes and
> > properties sort as correct order.
> > 	https://github.com/lznuaa/dt-format
> >=20
> > 	There are many dt files, which have node order trivial issue, when
> > try to upstream. To reduce reviewer's time, dt-format can help correct =
the
> > order.
> >=20
>=20
> Hey Frank,
>=20
> Cool idea!

I concur, it is a useful idea.

> > 	I just want to make sure my understand about node order is correct.
> >=20
> > 	Rule 1: node@hexvalue,  	order by hexvalue
> > 	Rule 2: label: node,  		order by node name
> > 	Rule 3: node, 			order by node name
> > 	Rule 3: &label			order by label
>=20
> Some subsystems have different ordering, like expressed in DTS coding
> style:
> 1. DTS: keep order of DTSI file
> 2. DTSI: group similar nodes together (e.g. serial engines).

I think it's fine to pick whatever is used by =D1=96mx/nxp and start with
that style, get something working and then decide based on whether or
not there are many users (or interest) if it is worth allowing the
"style" to be configured.

>=20
> > 	Rule 4: children node already after property
> > 	Rule 5: "status" always is last one.
> > 	Rule 6: property order as below list[unfinished], otherwise, order
> > 	        by name.
> >=20
> > compatible
> > reg
> > reg-names
> > ranges
>=20
> Up to here everything above seems about right, except above caveats.
>=20
> > #interrupt-cells
> > interrupt-controller
> > interrupts
> > interrupt-names
> > #gpio-cells
> > gpio-controller
> > gpio-ranges
> > #address-cells
> > #size-cells
> > clocks
> > clock-names
> > assigned-clocks
> > assigned-clock-parents
> > assigned-clock-rates
> > dmas
> > dma-names
>=20
> I don't think we have defined order for these.

We may not, but I don't think there's anything wrong with the order that
Frank has chosen here being a =E2=80=B6default".
That said, I'd not enjoy getting a bunch of patches for the platforms
that I maintain redoing things in this order, so it is worth asking the
platform maintainer for their take on whether it should be used for
anything other than new code, before sending a rake of patches.

Cheers,
Conor.

--/Tt7n4fJunpch9ts
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuqMnAAKCRB4tDGHoIJi
0hX+AP9NH+nyGcjmpcexMw8KQXlvhP2p1To0bdRAyl97RNJfugD/XPWubbog6R8A
J2pm9iWtrIIFQz/3V+x1z+z7ZeCIiQw=
=qKd2
-----END PGP SIGNATURE-----

--/Tt7n4fJunpch9ts--
