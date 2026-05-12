Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD343D45DE;
	Tue, 12 May 2026 16:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778604437; cv=none; b=clI14yX03GwMtonJqXFl43w7OuowuQmMyfUohBfEm/4PMGcuONnEDPiaevigCtuCUSrpeK6oM3A9digVBcgn+6vdDL5pmOo7yVmCW1q2o4+BiVA4pArf3J4s6N0HEeXcFpLH1zYjScFzuaWZy/RUl6rPOEzd+fCLygh71UaRRzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778604437; c=relaxed/simple;
	bh=Eq4poRvdFdEybVe7JuMn6Yy3EvJUfYua/oj6n06tRKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r+VYN2Fks200+oW7vftHYffH2G2shNP2uMixssufpNAPkOc6elSfUD/8bAnKTYmf3qsGMo0RLBzoNxyGxl7M0gXrJHS1rTXc3WrDvyvi/3rPrwkaW7Zp7NW+j/blu2SVZyGitRL+UoaX7OD6esYZtlCRDkgW0WsUkXuu2+SpNHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aOQtqwPG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aOQtqwPG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0ED3C2BCB0;
	Tue, 12 May 2026 16:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778604437;
	bh=Eq4poRvdFdEybVe7JuMn6Yy3EvJUfYua/oj6n06tRKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aOQtqwPG6kVWNN0xpIAbJTbjUXalcupb8baWRJ8uvTvuB2o5ej/auln2EVGfN9tTJ
	 7RSHSkHHLkh/yjBkUcBCnq31eCsFDX6jHuSdlFQbNCLOxbmUKSFQ4hyk2+XTELzCsX
	 kPhl8Havr0wCLdJcK4FoSM69jzUf88IcJ0GyoUX1joTX5Rujs7JaEYMGKilV6g6Z7p
	 lAUssIUii7TTJUwl03wcKlAr3MwUl3QTCarqeA6N6Xq4OM5qq1NQr8eCCCRanTrDnF
	 bhyBRTfOsJVskIedhEfxDMuIQxIKQW6HSSD2KiVvJJFFX/+QpfDg/vNu2AiIrIb7iF
	 fi7pc2M7mLQvg==
Date: Tue, 12 May 2026 17:47:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:DRM DRIVERS FOR FREESCALE IMX 5/6" <dri-devel@lists.freedesktop.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: display: imx: add deprecated property
 'port' and 'display-timings'
Message-ID: <20260512-surgery-operative-046a90f84ef8@spud>
References: <20260511220924.1905571-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fxdYyzfmOZWli65x"
Content-Disposition: inline
In-Reply-To: <20260511220924.1905571-1-Frank.Li@nxp.com>


--fxdYyzfmOZWli65x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 06:09:24PM -0400, Frank Li wrote:
> Add deprecated property 'port' and 'display-timings' for i.MX5 SoCs (over
> 15 years) to fix below CHECK_DTBS warnings:
>   arm/boot/dts/nxp/imx/imx51-apf51dev.dtb: disp1 (fsl,imx-parallel-displa=
y): 'display-timings', 'port' do not match any of the regexes: '^pinctrl-[0=
-9]+$'
>         from schema $id: http://devicetree.org/schemas/display/imx/fsl,im=
x-parallel-display.yaml

Instead of documenting the deprecated properties, could this
device/devicetree be converted to non-deprecated properties?

>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../display/imx/fsl,imx-parallel-display.yaml         | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx-parall=
el-display.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx-par=
allel-display.yaml
> index bbcfe7e2958b7..b0c5869771fae 100644
> --- a/Documentation/devicetree/bindings/display/imx/fsl,imx-parallel-disp=
lay.yaml
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx-parallel-disp=
lay.yaml
> @@ -42,6 +42,17 @@ properties:
>      unevaluatedProperties: false
>      description: output port connected to a panel
> =20
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    unevaluatedProperties: false
> +    deprecated: true
> +    description: input port connected to the IPU display interface, see =
port@0
> +
> +  display-timings:
> +    $ref: /schemas/display/panel/display-timings.yaml#
> +    unevaluatedProperties: false
> +    deprecated: true
> +
>  required:
>    - compatible
> =20
> --=20
> 2.43.0
>=20

--fxdYyzfmOZWli65x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagNZjwAKCRB4tDGHoIJi
0mDnAQCqbn9AXEEIvMW3IzfvtBt6idW4LfmgzHiK9gkyNMYDewEA/4JyVHaMHrOF
fwpJW7x4JMMhR7zhSv2Omejm+dkYtAE=
=RA7X
-----END PGP SIGNATURE-----

--fxdYyzfmOZWli65x--
