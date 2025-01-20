Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB02140E3C
	for <imx@lists.linux.dev>; Mon, 20 Jan 2025 07:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737359860; cv=none; b=nPaXCoew8I5c3llow1Qwl/iW9hkSt9Iylntad/kyJeEZvyH6S4P2+A4cC8azFaFMdUly3oLyU+A+XnrZ1SWOa/HOu3BBA0yJY2NnYE3azMqJeGydoFkZ9BtZAH1K+hS3P+CIfq2vlqN1hf9LZYuHb7wbWsFVhXp7uLUmMxl82DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737359860; c=relaxed/simple;
	bh=J7UvSKXQMl3xObnrQ1b4h99nWk2kPVRXb3e86+L/MKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n2ihxuxTrIozRjsE08oEC9Tnm+T8R2Lx7dWzMdrf4GwUDJs1k9zxFmrc/6snTpCLv3/dX7I68Cuy+F613DHpxdSISWH3mOsDhCTZ86CdGxjeLSOJs+gdWtk5q0RDak+QX+MeQKq2z49PIUadSWyaV2pzBj+fhNK0fCxlXeDqaZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=OZoSdQMk; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="OZoSdQMk"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A72D31040DBF6;
	Mon, 20 Jan 2025 08:57:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1737359849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8NaISGLJR03FYklXMebGcqoa5Dp1o8Ttfq525ZbxkqY=;
	b=OZoSdQMkRQTNc7qfmGcxxT31s0/qJ6e9W8kxfx7WZ5Brj372WMEN9lvKS07sJ+i/ePX6bs
	i/TtJerWU0ZvITtW3iP8equwf2uKDCKgSTS7kjbG2eUc3sshbgqaamk6aQ49bH8zBSvDzj
	faWJmgJAUfqoWNiFkDmr90eiJn/9ydKjsr1wGBEdDLx3ErvxnW3NluYnVyRZKu1g+Sg8V7
	rZwcR1/xZGERYTwJs7fk/7roNdAyvs3sync4t+kNP85jbMX+mQSb3jyzidrgTKRG1nhx1r
	UToMciDqcyYvT19aaQ2+ATN3NDtHPba6DNkWL6PISkisRlaCgZinFAmeq9/+pA==
Date: Mon, 20 Jan 2025 08:57:24 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan
 Wahren <wahrenst@gmx.net>
Subject: Re: [RESEND PATCH v11 1/3] dt-bindings: display: Add
 powertip,{st7272|hx8238a} as DT Schema description
Message-ID: <20250120085724.5caf80af@wsk>
In-Reply-To: <20250109154149.1212631-1-lukma@denx.de>
References: <20250109154149.1212631-1-lukma@denx.de>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/U/yll50iKgE5KldfaI.Ejar";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3

--Sig_/U/yll50iKgE5KldfaI.Ejar
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Dear Community,

> This patch provides the DT Schema description of:
> - powertip,st7272  320 x 240 LCD display
> - powertip,hx8238a 320 x 240 LCD display
>=20
> Used with the different HW revisions of btt3 devices.
>=20

Gentle ping on this patch...

> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>=20
> Changes for v9:
> - New patch
>=20
> Changes for v10:
> - None
>=20
> Changes for v11:
> - Combine both separate dt-bindings patches for powertip,st7272 and
>   powertip,hx8238a into one
> - Drop the quotes for in "title" entry of powertip*.yaml files
> ---
>  .../display/panel/powertip,hx8238a.yaml       | 29
> +++++++++++++++++++ .../display/panel/powertip,st7272.yaml        |
> 29 +++++++++++++++++++ 2 files changed, 58 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/display/panel/powertip,hx8238a.yaml
> create mode 100644
> Documentation/devicetree/bindings/display/panel/powertip,st7272.yaml
>=20
> diff --git
> a/Documentation/devicetree/bindings/display/panel/powertip,hx8238a.yaml
> b/Documentation/devicetree/bindings/display/panel/powertip,hx8238a.yaml
> new file mode 100644 index 000000000000..b7d74faeb5d5 --- /dev/null
> +++
> b/Documentation/devicetree/bindings/display/panel/powertip,hx8238a.yaml
> @@ -0,0 +1,29 @@ +# SPDX-License-Identifier: GPL-2.0-only OR
> BSD-2-Clause +%YAML 1.2
> +---
> +$id:
> http://devicetree.org/schemas/display/panel/powertip,hx8238a.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml# +
> +title: Powertip Electronic Technology Co. 320 x 240 LCD panel
> +
> +maintainers:
> +  - Lukasz Majewski <lukma@denx.de>
> +
> +allOf:
> +  - $ref: panel-dpi.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: powertip,hx8238a
> +      - {} # panel-dpi, but not listed here to avoid false select
> +
> +  height-mm: true
> +  panel-timing: true
> +  port: true
> +  power-supply: true
> +  width-mm: true
> +
> +additionalProperties: false
> +
> +...
> diff --git
> a/Documentation/devicetree/bindings/display/panel/powertip,st7272.yaml
> b/Documentation/devicetree/bindings/display/panel/powertip,st7272.yaml
> new file mode 100644 index 000000000000..f3622800f13f --- /dev/null
> +++
> b/Documentation/devicetree/bindings/display/panel/powertip,st7272.yaml
> @@ -0,0 +1,29 @@ +# SPDX-License-Identifier: GPL-2.0-only OR
> BSD-2-Clause +%YAML 1.2
> +---
> +$id:
> http://devicetree.org/schemas/display/panel/powertip,st7272.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml# +
> +title: Powertip Electronic Technology Co. 320 x 240 LCD panel
> +
> +maintainers:
> +  - Lukasz Majewski <lukma@denx.de>
> +
> +allOf:
> +  - $ref: panel-dpi.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: powertip,st7272
> +      - {} # panel-dpi, but not listed here to avoid false select
> +
> +  height-mm: true
> +  panel-timing: true
> +  port: true
> +  power-supply: true
> +  width-mm: true
> +
> +additionalProperties: false
> +
> +...




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/U/yll50iKgE5KldfaI.Ejar
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmeOAeQACgkQAR8vZIA0
zr0jbAf9GiMn13F0dhmGWZLn3VDJ643cS78yCNzck9CuQgS5unj84y7aiawwzcWB
O/zrorxzpuNnpxQpXYZN2+Ayu7q9B99J8/WwNvi1nM2m4ffoF7HsqE1mSd8TWxkC
6yKehoD74CdSYcKGZEh0anPDFV331lN8L6opnm70kvMM0ar+7QhQwy62eLiX7qOW
jyHytccvg9c+ATLThSeET87I2Ke4oAJpE/QJGHEdCIk6ZBvINEK5L8vgNJUU4Wkh
QD+dMaQAfU+G2ncwk1T2dlyJmtl01dWriR/mHQEQSaR90gTleuRsxycQvUL9ljix
F8YQnQzI1VSwxIHqUW8q5zPtV8YDZw==
=oVKs
-----END PGP SIGNATURE-----

--Sig_/U/yll50iKgE5KldfaI.Ejar--
