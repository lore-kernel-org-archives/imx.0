Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFA233A708;
	Thu, 13 Aug 2026 08:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786611371; cv=none; b=PrS+24TcWXWTIxs2qGvLI95WREkBWuQ8SjNetM9CB8LBtNLKQPaD1FUa930fYGwPId6n++8J4GVpYexxM2UJT8U8E2FdPSn+2Cq7OVOXk4Y0vujoLwdzr3em+9wisrh/HLSM0GuRgFjtPuaEq7A0PBHB7VB/e9V2G38VHTXF6B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786611371; c=relaxed/simple;
	bh=tgBSmDvnOxqOIbfBqzVBfqvF1vXachxn+dE510jSfmU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UBxF/uT92EqgMPOXLQqMIznk5xfMPqy7fI/pCLmIxIRE0+lYh3rfkQp8e8oSYs7nCtkwEq+y4Mk87hxyOMSj6Bh4+34AvYSizJccRed0hgI34gwWgSoWQZzaF9HEr51UOGj7DQ/p9zlPPGuwF8I4LD85V1jQG19lN/XvavxCor0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=RkP5++jD; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="RkP5++jD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=NY/kTVoJS7JBCe0ZeDKhM9AwzQeDZAj/AYt9Nsuv+oE=; b=RkP5++jDJ43V7LuFqHVwcMXj/p
	yK9l14sgq87/6fQbgJHH8iwsTpnmjlQjbSnEHZqlNyur8Zm9uLsQ0/TaTiOz71VjeDP1EEutc5pJV
	5AxZzh4WXctSrybsQ+tRUONJTWIcJ+FKXk6YXAAG0OOJlGHrAGYkWw2+rQj8fNudFQJqSC06OLpKv
	LMqmLERhJtwXBHm6sfMMm+s/ppAl+xrUQ7TvzyxqRQX1fyujOhm+PqLRBSirt73H7W50sgXe2sFtP
	z78STzZeu5kC9hCDhTgZ4pFAejX/wG/SsXNRPdPxLoemWJOhpSpT2UlNYCfpwv7H19CYY5aMqOfio
	HKAx6hhw==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wuREK-000Bx1-05;
	Thu, 13 Aug 2026 10:56:04 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wuREJ-000PrA-1O;
	Thu, 13 Aug 2026 10:56:03 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Francesco Dolcini <francesco@dolcini.it>
Cc: Francesco Dolcini <francesco@dolcini.it>, Marek Vasut <marex@denx.de>,
 Stefan Agner <stefan@agner.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject:
 Re: [PATCH v3 1/4] dt-bindings: lcdif: Add endpoint bus-width property
Date: Thu, 13 Aug 2026 10:56:02 +0200
Message-ID: <7661119.LvFx2qVVIh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260813083402.GA19687@francesco-nb>
References:
 <20260812132954.148571-1-francesco@dolcini.it>
 <20260813-classy-boa-of-apotheosis-57207e@quoll>
 <20260813083402.GA19687@francesco-nb>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28091/Thu Aug 13 08:25:54 2026)

Am Donnerstag, 13. August 2026, 10:34:02 CEST schrieb Francesco Dolcini:
> On Thu, Aug 13, 2026 at 10:10:43AM +0200, Krzysztof Kozlowski wrote:
> > On Wed, Aug 12, 2026 at 03:29:49PM +0200, Francesco Dolcini wrote:
> > > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > >=20
> > > The DPI output of the LCD interface can be configured with a bus width
> > > of 16, 18, or 24 bits. Introduce a bus-width property to the output
> > > endpoint, specifying the number of parallel RGB bits connected.
> > >=20
> > > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > ---
> > > v3: use video-interfaces.yaml
> > > v2: use the common bus-width property instead of the legacy interface=
=2Dpix-fmt
> > > ---
> > >  Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 9 +++++++=
++
> > >  1 file changed, 9 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml=
 b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > > index 2dd0411ec651..1f3daf002707 100644
> > > --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > > +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > > @@ -71,6 +71,15 @@ properties:
> > >      $ref: /schemas/graph.yaml#/properties/port
> > >      description: The LCDIF output port
> > > =20
> > > +    properties:
> > > +      endpoint:
> > > +        $ref: /schemas/media/video-interfaces.yaml
> >=20
> > This won't work, you need to test your DTS. The port schema does not
> > allow video-interfaces properties. You need port-base, like in every
> > other case.
>=20
> Thanks for the review Krzysztof
>=20
> Given my testing was not ok, and I am not sure what I did wrong exactly
> on my tests, is this the change I should do?
>=20
> diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/D=
ocumentation/devicetree/bindings/display/fsl,lcdif.yaml
> index 1f3daf002707..89cea0c14cf1 100644
> --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> @@ -68,7 +68,8 @@ properties:
>      maxItems: 1
> =20
>    port:
> -    $ref: /schemas/graph.yaml#/properties/port
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    unevaluatedProperties: false
>      description: The LCDIF output port

With that change:
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>

=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


