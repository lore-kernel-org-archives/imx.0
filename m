Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E630A332611;
	Thu, 26 Feb 2026 17:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772128499; cv=none; b=khRNyrie4tOdl7WyQ50yGcAj192OBcQ22aj02gbf9Iq5ZVugUOjLEHukOxFoO5HaTCvJUiv1eejpk0cgu2hlfotRjuQA/bWMKP8oeYbMJPdLhu5yTMHPySR7eT74Usk+AbrLTAfU866szGVsT3KEet4i28mqODjypvpS61zumDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772128499; c=relaxed/simple;
	bh=Fr7y1bxPTvZC5sck2+WccNkD28UbxIbiP5hACJEXz9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CiyZ2cOlPrPVq3htP+SBrg79BJel1T+ahWmCi2w1O3iSnORvzFirAYJrBeBlIV9j40cgEqPzhzorQGwJwTxcBZ12jSi1jwo5gvHOdVIdWDTE4Dp/sgsHEcgWYn7jz/HSsovehxKfzk+CKp5WZ6+Qno/emvoKbfuHlKDTgPjHSWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HVPCh7Sv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HVPCh7Sv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 701FDC116C6;
	Thu, 26 Feb 2026 17:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772128498;
	bh=Fr7y1bxPTvZC5sck2+WccNkD28UbxIbiP5hACJEXz9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HVPCh7SvNOsqmByhGoEy4WqurPrsi7B7gtHHv6KMNKV5seMCpgVMeE8rh30tnmnzf
	 NeMtmKoI9uJgD4ZEKBcK856FmTCxBkFE2SFQ3IuyVNzzf+brK5IcNFxdu5xDJR8FFo
	 nNxktJw/1YKJzGSjdpm0defzpGfd0QmeRk+ywv27LGoJjrym0ZIFMs4iuzJyZbDSJ1
	 w2DdDUf/oxXFrzPbdZ8isL/ALsf6/iSUFznYRcW0NoQFakB0g6gv7n0z2+Yh+1oWna
	 qQJ3wUnHXHqKnflvOs9cq4O+mx9EujaADIVOlHOllfXCaom2YgXE15lI1QsL6PtbMe
	 3TvvVn4+ZopHQ==
Date: Thu, 26 Feb 2026 17:54:54 +0000
From: Conor Dooley <conor@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Frank Li <Frank.Li@nxp.com>, Robin van der Gracht <robin@protonic.nl>,
	Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [RESEND V1 1/1] dt-bindings: auxdisplay: change to
 unevaluatedProperties
Message-ID: <20260226-observant-finishing-c07452049544@spud>
References: <20260226172258.257089-1-Frank.Li@nxp.com>
 <aaCIEs-65JQUkSyA@smile.fi.intel.com>
 <20260226-nanometer-reproach-8c87569cc837@spud>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5P5SMxueZIj41jeC"
Content-Disposition: inline
In-Reply-To: <20260226-nanometer-reproach-8c87569cc837@spud>


--5P5SMxueZIj41jeC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2026 at 05:53:43PM +0000, Conor Dooley wrote:
> On Thu, Feb 26, 2026 at 07:51:14PM +0200, Andy Shevchenko wrote:
> > On Thu, Feb 26, 2026 at 12:22:57PM -0500, Frank Li wrote:
> > > Change additionalProperties to unevaluatedProperties because it refs =
to
> > > /schemas/input/matrix-keymap.yaml.
> > >=20
> > > Fix below CHECK_DTBS warnings:
> > > arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dtb: keypad@70 (holtek,ht16k3=
3): 'keypad,num-columns', 'keypad,num-rows' do not match any of the regexes=
: '^pinctrl-[0-9]+$'
> > >         from schema $id: http://devicetree.org/schemas/auxdisplay/hol=
tek,ht16k33.yaml#
> > >=20
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > > Resend include Rob's Ack tag:
> > > 	Acked-by: Rob Herring (Arm) <robh@kernel.org>
> >=20
> > I didn't get this. If it's official, make it official.
>=20
> Funnily enough, b4 picks up Rob's ack, although I think it gets it from
> the original posting.
>=20
> > Also, shouldn't it have a Fixes tag.
>=20
> Sounds like it should, yes.

And if that requires a resend, the specific binding should likely be
cited in the subject line.

--5P5SMxueZIj41jeC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaCI7QAKCRB4tDGHoIJi
0h1OAQC5S3k9LEqPkMm8IMRhJfGsxnxWzL16OIrBF7xw/LreewD/Vu5z+5uaaRH8
GzponTKUm28gsGYRYdxSvLRfG5eKGgI=
=mESh
-----END PGP SIGNATURE-----

--5P5SMxueZIj41jeC--
