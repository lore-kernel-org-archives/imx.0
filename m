Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C826D3B7760;
	Tue, 14 Apr 2026 13:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776175085; cv=none; b=kYT7ubJb097UpBaY30jOPWlnx9xxavR52bMWZYTg62QsqPsNNlwttgngRXcF2dEeTbtN+PU3O4VtkI2CDeTcqpc1fTfkYMne0Rq97qmtJVCpZhOB1/y8B2KQQkkNMx5HM7ENFAG/05m5NWmUn9yMUiNIh1aLZqkNxS34s8o7tgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776175085; c=relaxed/simple;
	bh=okPte3OmReR0ds5AUumPGwJ33E9OLhaVRMbH9x5iZjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iyboLB+6iUD2fDOUTayUmFQMb70bO9fOIDKUP9edUU/PU0sDLUGy63PiYg9S72Fxu194/KqtFq0dCpKiWy6UzmcW2W+NTUHlrCdFbtiIDA6630ven0mpZkR9Ev3fr4LhkAzHtgw+qeDWjXn/4/ArAFKnfM20kL3OuMVs+LR7Ydc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uxIxqYAY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uxIxqYAY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B6CBC19425;
	Tue, 14 Apr 2026 13:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776175085;
	bh=okPte3OmReR0ds5AUumPGwJ33E9OLhaVRMbH9x5iZjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uxIxqYAYKQvQNPoCK7sXRoGrOo6h+uN1xlSzejcujBtYu2Gx0vNXy5v1YEiziwpUD
	 DHj7jlLLm4teaoZJ4GkkytD1WhCaM3u1mXTo5MP5n2uE5efHnMfMKLK9gEYPPYYV26
	 s66OGUEbLF2AByzj2drlWv9a8pHK2pjgBnNDwwJAZSVy+Z358iRljp//0Du6w/2EdX
	 RUmtvYqFl/6Pmeg2QeHiwhfHeV04Yd2JxbKo/anpmvdjtlrewYzmJBX3k2sE2BGaAf
	 CLhYTYsshuh8y/32BBE0LHSFBGgZtym7r4lmItj2BZkEtizzR8PvQQ9zdIhL3UpzHV
	 bjgR66Mxu1N1Q==
Date: Tue, 14 Apr 2026 14:57:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: "shengjiu.wang@gmail.com" <shengjiu.wang@gmail.com>,
	"Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>, Frank Li <frank.li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: Re: [PATCH] ASoC: imx-rpmsg: Fix ignore-suspend-widgets only
 applied to codec DAPM
Message-ID: <654b8689-86f0-4a4c-b140-cf7aeefa662b@sirena.org.uk>
References: <20260411072439.1125664-1-chancel.liu@nxp.com>
 <adolKj26DFqZ-XTi@sirena.co.uk>
 <AM9PR04MB83539BD1328151697DA85859E3242@AM9PR04MB8353.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YL6/Af0O1BjOkI4M"
Content-Disposition: inline
In-Reply-To: <AM9PR04MB83539BD1328151697DA85859E3242@AM9PR04MB8353.eurprd04.prod.outlook.com>
X-Cookie: Academicians care, that's who.


--YL6/Af0O1BjOkI4M
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 03:13:51AM +0000, Chancel Liu wrote:

> Thanks for pointing this out. I really appreciate your suggestion to
> move this functionality into core-level. Several machine drivers could
> benefit if there's an unified ignore=E2=80=91suspend mechanism.

> I have an idea to make it support a generic and reusable mechanism in
> the core rather than something each machine driver has to re=E2=80=91impl=
ement.
> The design follows a simple structure:

> 1. Parse and store the name of widgets to ignore suspend in=20
> struct snd_soc_card

> The name list of widgets to ignore suspend can come either from DT or
> from the machine driver. Different boards/machines have different
> routing and power requirements. So allowing DT to specify
> "ignore-suspend-widgets" is important. It enables each device to define
> its own policy rather than forcing hard=E2=80=91coded rules. To support t=
his, a
> helper such as snd_soc_of_parse_ignore_suspend_widgets() can be defined
> in core and provided.

> 2. Apply ignore_suspend flags during snd_soc_bind_card()

> After all components have been probed and all DAPM widgets are
> registered in snd_soc_bind_card(), perform a unified search through
> the card=E2=80=99s widget list and mark matching widgets with
> ignore_suspend =3D 1. Any runtime prefixing applied during widget
> creation should be handled well by the lookup.

That sounds like a reasonable plan.

--YL6/Af0O1BjOkI4M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmneR+UACgkQJNaLcl1U
h9DiBwgAhLGOxr+5AHGt6b89oRux1fhI0Eqk8XbCic3WLPmKONZuJvCG/eqVXCfK
dUsh24vZxmdRDegpmbdU9oCD6jAYI3B5Fz1kIJsTadzbw4DD8PgNyg88Bg/POePj
8E/TpMiHss0fTVQfao7pNCKr1MBnHj/60xWzg44DqpMr1avm1ZCZ0HoXFK8mODxv
GHeLBPAUgqQOduRysk3BcfEyiD1AchtKwfiFtZ3Ub4tXo+QmlzSTHOF+BoIPn5dD
OYQ6zXUlvgSmvA89SCDjtwYL4BKTJtjqzHNUl9sOEG57xq5KbrF8UOZmnb+JbdrG
8wlS57wFJCXNqLmtWvsNfXyJhcoklg==
=SHzw
-----END PGP SIGNATURE-----

--YL6/Af0O1BjOkI4M--
