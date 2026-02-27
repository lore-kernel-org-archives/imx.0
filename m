Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A8535C18E;
	Fri, 27 Feb 2026 17:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772213174; cv=none; b=gLQWE5+WmBICvUdlTrgP3yuwLY+piZXCOzlfwc4DgioSkCzKSqNepFJBEhh0sIO5n4naYwOEnAMWoCUfCBQyuvnHeScSPywG56kITQFJYBJlBItm2DupzLsQzDvzaeWjK8mvDWWntiCYGqzUzvoiymX0XYV0ugUoPYvUSuC1Glc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772213174; c=relaxed/simple;
	bh=PDhXEkoLlmarqStMk3U8nwB/6tWObB6Ow31KS3GLizA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nraJtMjU/b9syn0bLNGWA9/GCmNYYDukaPE6C0z4hetT4lKiFUbz8mJ5bf0g4TwEVsnl9QKrE8YFKM/wHDHkE1C5d0IERkm6K+kbJCdKV5TfS8BO0LvHkynxQYXSKamuUoxwYgGWWkYDJ8gq0RbTOKC/TvYMQ0eOuAma60egq7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QJbO6M2S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QJbO6M2S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B203DC116C6;
	Fri, 27 Feb 2026 17:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772213174;
	bh=PDhXEkoLlmarqStMk3U8nwB/6tWObB6Ow31KS3GLizA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QJbO6M2SvyfrsjuVRLcCvL9FgVfpbDww9LZBKTQrKkjIwScv94KTyWuosjb5l8Hzg
	 WtQwPEwy1P9g7ykltnvgehq3pgFzIVr8C94tTZsxn+3VtUXlGRoDEPmzGGdmdcKlW/
	 Vu+AFZwlhkJ2dphK2lMAonF11sY6DR2e8J133bOsDFl9YUtRVSVwggD3/xUgCn93yL
	 GlKe+STpiHpJRDeOUiqSrTgefmPAfZnbKURvPnraANtLpQB1HVAyjSv6I4MOyWjlGe
	 Yz6NCln36TbGFgFRgwVfelg4tpPHrd3AlxTYXbCrna26KYK2V1AFT1pdaNIHw8g1eM
	 5o1aOPGnQlPtA==
Date: Fri, 27 Feb 2026 17:26:09 +0000
From: Conor Dooley <conor@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, Robin van der Gracht <robin@protonic.nl>,
	Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: auxdisplay: Use
 unevaluatedProperties to fix common property warning
Message-ID: <20260227-overplay-preacher-d6ed143edc5f@spud>
References: <20260227165836.3445577-1-Frank.Li@nxp.com>
 <CAOMZO5AGwAAU3j0t62CaqNZF7tmyKoWv38ymB1i5i+xnprwJWQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VvEPeRUMmcUKD4sb"
Content-Disposition: inline
In-Reply-To: <CAOMZO5AGwAAU3j0t62CaqNZF7tmyKoWv38ymB1i5i+xnprwJWQ@mail.gmail.com>


--VvEPeRUMmcUKD4sb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 02:05:23PM -0300, Fabio Estevam wrote:
> On Fri, Feb 27, 2026 at 1:59=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
> >
> > Change additionalProperties to unevaluatedProperties because it refs to
> > /schemas/input/matrix-keymap.yaml.
> >
> > Fix below CHECK_DTBS warnings:
> > arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dtb: keypad@70 (holtek,ht16k33)=
: 'keypad,num-columns', 'keypad,num-rows' do not match any of the regexes: =
'^pinctrl-[0-9]+$'
> >         from schema $id: http://devicetree.org/schemas/auxdisplay/holte=
k,ht16k33.yaml#
> >
> > Fixes: f12b457c6b25c ("dt-bindings: auxdisplay: ht16k33: Convert to jso=
n-schema")
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > Change in v2
> >         - Add Acked-by: Rob Herring (Arm) <robh@kernel.org>
> >         - Add fixes tags
> >
> > Resend include Rob's Ack tag:
> >         Acked-by: Rob Herring (Arm) <robh@kernel.org>
> > Rob's Acked at
> > https://lore.kernel.org/imx/175796984570.3379405.7210704746413204244.ro=
bh@kernel.org/
>=20
> Rob's Ack is still missing.

How do you get this wrong multiple times? Just use b4 to get your tags
Frank.

--VvEPeRUMmcUKD4sb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaHTsQAKCRB4tDGHoIJi
0gHVAP4yJ6e3wftqgOrWQIgzdxBM0x+2JW1IYst0bR4tnxh74wD/SButoxXc1plZ
pz4rzaA7jHgZ2epjiofQiB+lJGgb9Q8=
=sWad
-----END PGP SIGNATURE-----

--VvEPeRUMmcUKD4sb--
