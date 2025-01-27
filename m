Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D55418BC26;
	Mon, 27 Jan 2025 17:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738000300; cv=none; b=rennMRf5kjTRp47cyyr0FD4gPf8NyTpakK5MlzF7xB3Wpu4buhyH2ZFraUPppkMNkZg1Zc0n8nv3W4136YJbkUIDbax66l/dDu4RhB7tt1+fFMLJM9y7LuYQpTpfnK6N09mB71peozsDoxEBRS/dugp7h4GPAw8AxtCdIeSXvPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738000300; c=relaxed/simple;
	bh=IWnhynaYs9UhLgD4QSl3asorXOnxX63sXit4/2adtOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A0FpWLqyiJHIYjeTpOOjJ5qBSQcSMcHcu+4cxout0KCV6fMBvSl4Md/ltVQpMT4dxMTBfz++Yn7k+0C0Pw3DUoMt2XDwZZKRp+CnbVXD5WmS4K1Bw3CsloeOJiztREPUYebiys7/rGbSNj9xgsD8wIHMzgxJgNNkK9prLz8kpXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZihJJ26E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZihJJ26E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C73EC4CEE3;
	Mon, 27 Jan 2025 17:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738000299;
	bh=IWnhynaYs9UhLgD4QSl3asorXOnxX63sXit4/2adtOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZihJJ26EhTE4kO3fmKWFGPAmlRrEkkMbw02V7USCY6o1gzHgUjbp0yAbIdKntb69M
	 BtLHFqyb5dV9E7jcbIMuell5x/Vem5WXvk8yeQRVDJebxVPYSGEsY3fe9hM7BKQA8Y
	 uYKUCgAl69IK1kJBnuE6mcon5LKH1lm+qsSIYx2S7+GuPYhygxRWt5LUOVnzXxPxcd
	 2AOMKTN17x6j11f1HS7EcbQWF2/9EjZv8FIIpAUM6mvOhrZUSLjARQrL6zhGoPiEX4
	 FnfKywpDpWQ5mP6YBQzvNZgblESRHr3fdCTHCgsqqDMroSzl/Lw/sE48YEH0XIZmt6
	 DhPP5xVOFoNVw==
Date: Mon, 27 Jan 2025 17:51:35 +0000
From: Conor Dooley <conor@kernel.org>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: fsl: Add VAR-SOM-MX6UL SoM and
 Concerto board
Message-ID: <20250127-antiquity-spelling-fd54076afe66@spud>
References: <20250127-varsom6ul-concerto-dts-v2-0-4dac29256989@bootlin.com>
 <20250127-varsom6ul-concerto-dts-v2-1-4dac29256989@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cReqDgVidX28TjYo"
Content-Disposition: inline
In-Reply-To: <20250127-varsom6ul-concerto-dts-v2-1-4dac29256989@bootlin.com>


--cReqDgVidX28TjYo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2025 at 04:31:00PM +0100, Antonin Godard wrote:
> Add support for the Variscite i.MX6UL VAR-SOM-MX6UL and the Variscite
> Concerto carrier board.
>=20
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--cReqDgVidX28TjYo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ5fHpgAKCRB4tDGHoIJi
0saFAQDHIIOY1ZLLliCFzyxW+U5lKPDJYiKB5mzQ8E2yHA7J2gD+OYMYk3bw/t4w
NWrIqwr7PCXzAQUakE//RoKJNUvNSg4=
=Xs+l
-----END PGP SIGNATURE-----

--cReqDgVidX28TjYo--
