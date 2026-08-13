Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4885438487;
	Thu, 13 Aug 2026 11:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786622167; cv=none; b=OyVJBOh6RZRbhpjOxVaVBqMWItjJybOFB4VLJIkneT4tKskr+HNcpo3sDoL3CQx3KUTL3P77WItfgyOmNxu+ypp8L7C6kAYZtLda4iNUtQqiObVzQE885jO6uRj47oH4AR0w01PiyTnXU8S4wSW2RifO0EEjreiCTQm+XuccRrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786622167; c=relaxed/simple;
	bh=Uk7Il3FE65wXGCnqql8rYhFHiqw9lCRFg5eIkwXXd2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nJyJr42ZrNm5xDLTfs8xFwc06XEWcJHxB3j1j8Birxc5tV/GfhGwgSVdPaEzHswGVI8QWhLqCAN39fYm9QR3STxm8JTYeYJIf6LOuEfPXBH/dsghQH6mdN00I8Av54ZLcNGDkdL0refnCzG4Twv658NMdX+FspgXUIT72cZPhZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=WIdOMCWu; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="WIdOMCWu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=jV+fr1YQSYU+Nk0tUAwhRpsmVLUxLPPUsySQv1/P7jU=; b=WIdOMCWuTO4eLAyYs6Kf6uR2Zv
	Va89VhI+u9Dmu+cns7ATJDSn8UUqS+X3ZyihRtem3zTW74T96FVdWpmHSRVoME+79JG7AHVdiJYFu
	a2zXUhIY4lTDLxpiAjlhfDQql1yI2Zo+/KewKwFDmJ4MbuqKk2CgXAvpW2YLvVAIgcWnx6aAS55mM
	5OQr03rFN28yNM+2SkzuflKkewUehcJ4kSzhE6It/HC3EBRS4OdsQR70b8+H0aQzUYnyCyba1GnVK
	Te/Gv4yskbCkmumZOWGkuliITOOdONnuyra4rqfhpGoVfmsObkermgEpIWG8t0vS2vuIZuDDtj5U4
	DX9uyiBQ==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wuTgX-0002Fs-1v;
	Thu, 13 Aug 2026 13:33:22 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wuTgW-000HCm-1a;
	Thu, 13 Aug 2026 13:33:21 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Francesco Dolcini <francesco@dolcini.it>
Subject:
 Re: [PATCH v4 1/4] dt-bindings: lcdif: Add endpoint bus-width property
Date: Thu, 13 Aug 2026 13:33:20 +0200
Message-ID: <16977374.uLZWGnKmhe@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260813092836.38367-2-francesco@dolcini.it>
References:
 <20260813092836.38367-1-francesco@dolcini.it>
 <20260813092836.38367-2-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28091/Thu Aug 13 08:25:54 2026)

Am Donnerstag, 13. August 2026, 11:28:31 CEST schrieb Francesco Dolcini:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>=20
> The DPI output of the LCD interface can be configured with a bus width
> of 16, 18, or 24 bits. Introduce a bus-width property to the output
> endpoint, specifying the number of parallel RGB bits connected.
>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
> v4: use /schemas/graph.yaml#/$defs/port-base
> v3: use video-interfaces.yaml
> v2: use the common bus-width property instead of the legacy interface-pix=
=2Dfmt
> ---
>  .../devicetree/bindings/display/fsl,lcdif.yaml       | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/D=
ocumentation/devicetree/bindings/display/fsl,lcdif.yaml
> index 2dd0411ec651..89cea0c14cf1 100644
> --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> @@ -68,9 +68,19 @@ properties:
>      maxItems: 1
> =20
>    port:
> -    $ref: /schemas/graph.yaml#/properties/port
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    unevaluatedProperties: false
>      description: The LCDIF output port
> =20
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml
> +        unevaluatedProperties: false
> +
> +        properties:
> +          bus-width:
> +            enum: [ 16, 18, 24 ]
> +
>    display:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description: phandle to display panel
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


