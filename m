Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763A92853F3;
	Thu, 26 Feb 2026 17:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772128428; cv=none; b=TQvZAdncKCxx75pvf7f3ZUhoylIYj8v33wlwo84zwJyv210D/o+y4TNO1pbyWOpZ3I4PQEt0zQ9bK7/ZWYw5Qn+90Eeh2Wjmsj888jkNlDQy2+sLss8xe2H+ibF52vqJLxc67CUnwYQANiMgkH7QOWDhsw1yUvmHLVsP7XAyaXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772128428; c=relaxed/simple;
	bh=jYpswFOHGcuRpULlKaY8PpzjjCH2HHXs1KNK4pL1NGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dRd50GXQ2S8TUrBaBxjyzAZb2BhYSE0vf0IBiTGrK07qtVIFQ7GoG2I7u6grp2fDPX7j+PnRomNKq03XRYIndppXR9njbxjZmEb5gXDJr/4Qund744A3LNzXot0hnAqUyoidt8q/qym+NaI6iXMEzBROgffWmIC/Ct4RRlPqaF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=roEoliAG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="roEoliAG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3895BC19423;
	Thu, 26 Feb 2026 17:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772128428;
	bh=jYpswFOHGcuRpULlKaY8PpzjjCH2HHXs1KNK4pL1NGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=roEoliAGTuUSVOrGHkNbNO2ZzsCWhJTeMktYVraykcB/bA0qIvgD7SPLsLwtoXv+Q
	 WKNnHbHJuXKQLt5tpOCXVmjYfmrf6VzKJ1jNNGNmRI9kwtauK3rum27pEq+A0DoGIK
	 IJOFQldJ3Pq1AY/ZnPHuY5YwfhjgwB9JyKAF1WH1c9+MaW7t6UXCptDns2W/GIYJ30
	 1egJO/+vLG5/5DX7/6OVjVct91HgIWgV/uvW3DRDtl/4TqKeoHTk8n0RFiklHVtKWh
	 uY4XVAVawmiasx2tXCxKmVMc3TtknBM4M3Bze83uC7ZaHnbx3o1h8oFdQgjts+GbRc
	 1t1wWMs8H6xLA==
Date: Thu, 26 Feb 2026 17:53:43 +0000
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
Message-ID: <20260226-nanometer-reproach-8c87569cc837@spud>
References: <20260226172258.257089-1-Frank.Li@nxp.com>
 <aaCIEs-65JQUkSyA@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VFQzgRqoq3o+6aGD"
Content-Disposition: inline
In-Reply-To: <aaCIEs-65JQUkSyA@smile.fi.intel.com>


--VFQzgRqoq3o+6aGD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2026 at 07:51:14PM +0200, Andy Shevchenko wrote:
> On Thu, Feb 26, 2026 at 12:22:57PM -0500, Frank Li wrote:
> > Change additionalProperties to unevaluatedProperties because it refs to
> > /schemas/input/matrix-keymap.yaml.
> >=20
> > Fix below CHECK_DTBS warnings:
> > arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dtb: keypad@70 (holtek,ht16k33)=
: 'keypad,num-columns', 'keypad,num-rows' do not match any of the regexes: =
'^pinctrl-[0-9]+$'
> >         from schema $id: http://devicetree.org/schemas/auxdisplay/holte=
k,ht16k33.yaml#
> >=20
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > Resend include Rob's Ack tag:
> > 	Acked-by: Rob Herring (Arm) <robh@kernel.org>
>=20
> I didn't get this. If it's official, make it official.

Funnily enough, b4 picks up Rob's ack, although I think it gets it from
the original posting.

> Also, shouldn't it have a Fixes tag.

Sounds like it should, yes.


--VFQzgRqoq3o+6aGD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaCIpwAKCRB4tDGHoIJi
0hTOAP47I0OxPkunqdcK96ctAP4FXUL2TiqJzE0gxm4ovRao+wEA0lMvKWz1uOAZ
tUvzrdfEKbZsG5Cv+LFWg5SGvhXhJw0=
=z4gr
-----END PGP SIGNATURE-----

--VFQzgRqoq3o+6aGD--
