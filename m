Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B56213D2B2
	for <imx@lists.linux.dev>; Fri, 12 Jul 2024 06:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720764493; cv=none; b=XKPDjpJiQt1pKzV1pqo0rr/zhy9xH+G8f11Tx30wK2NM6W9GqT+8XZJA9xCfEe+cQhQG5L7hURyJJHihP/1zodrPZDapsKOAefuzdGzeORYRB40wkhHobsl/wYWsftA8n9k1pdQZxwheLcJP3k76l8qZdMBj197qTz0slyLBotw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720764493; c=relaxed/simple;
	bh=oOmEa1P3IKAGNFZfngYwKWSd+Br874qTAS3G64tjdgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fpm5HMT6Rb5mbjpg+rbBFpJnyleVNEIwiiFxvNZWxQ9C6sZFQ5PJf8TAACLUczNkCy3tMs2grqu6ti7Et7Azh0nEEJEGWVGcRHrBgFUTTgow2N7eH4cT6XPXtimIdTl+emBwJqXkty2cBTpD3NeENGrWccLkVDfaju3W1/d5xjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=L6qlpCO1; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Iw3rgzXw reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="L6qlpCO1";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Iw3rgzXw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1720764489; x=1752300489;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9kkQv+TWA9nQxOn83JfnaiK6tbtRd6yY1Ho2RrmzOk8=;
  b=L6qlpCO1uAGpUcn63m19zhcYG4DLxlUqWmsocfrzvIpaii4mXtU7g09g
   6V/sRPiRXlT2bpB6/OXM2nzyTHPtd+C9R2sK+mOlNDn9FRF9iapgvEeAi
   nMiiVt7x4rNTP1+g2oTGpHESyMrwSn4yXXGKoJqASKUVlgpZ6BMok36uW
   ssLw5e4QWUw9keMyawLux+ulh7ritTkBMUx4IKi4gsrUdyWn9Vf38o8g1
   Np9TOMmrTo3s9Kotl0WlEOFqEZsGTsjb6P3vsTx5eL0pYrXWrGsOUQm5k
   LAZANjGEeu5MLTD94a0tU5ndAaCL+l7hz3AVIWwPzkEAUhGr0HQfjEZ4z
   g==;
X-CSE-ConnectionGUID: ijGMlMZrQLCwQSsfFBkBGA==
X-CSE-MsgGUID: WHEqB7i0TnWd7EzlQqfYBw==
X-IronPort-AV: E=Sophos;i="6.09,202,1716242400"; 
   d="scan'208";a="37873063"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 12 Jul 2024 08:08:07 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 52BBA164423;
	Fri, 12 Jul 2024 08:08:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1720764482;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9kkQv+TWA9nQxOn83JfnaiK6tbtRd6yY1Ho2RrmzOk8=;
	b=Iw3rgzXwVxbizrITOLFdZrD4PgrE4WYEVXH2U1xJU22JJlPxDPwZT0Ln3X2D39D3/OVq0H
	NMSJtR7dk2P5Q8q9IAUxKISScCl0yyqorESNhHIpls3ZEnzL4X8V4b841BSMvT9FZPkBL0
	9OUkMah6RNN7JSX17Tr1Ab+uo/A6OFKOT3twFgTrppGv0UwHDFas0rC+HqKC+FGVWHLjh3
	NgyIsu/WAQ1nC0jfM68bXOEhwTP9IioSK6S4L5rZqWwVpaN5btSdlmhhjg2oEPUmanRtwx
	gaUKJ+srN3w/VIrpEQfA+9agpZmP1OY9BBh2xbh/NNSeyul+Io72Byez+gQF+g==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-arm-kernel@lists.infradead.org
Cc: York Sun <york.sun@nxp.com>, Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, James Morse <james.morse@arm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Robert Richter <rric@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Borislav Petkov <bp@suse.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, Frank Li <Frank.li@nxp.com>
Subject: Re: [PATCH 4/6] dt-bindings: memory: fsl: Add compatible string nxp, imx9-memory-controller
Date: Fri, 12 Jul 2024 08:08:05 +0200
Message-ID: <3238685.5fSG56mABF@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <ZpCiujvOKJpz6/JU@lizhi-Precision-Tower-5810>
References: <20240709-imx95_edac-v1-0-3e9c146c1b01@nxp.com> <6068670.lOV4Wx5bFT@steina-w> <ZpCiujvOKJpz6/JU@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi Frank,

Am Freitag, 12. Juli 2024, 05:27:54 CEST schrieb Frank Li:
> On Wed, Jul 10, 2024 at 09:18:16AM +0200, Alexander Stein wrote:
> > Hi Frank,
> >=20
> > Am Dienstag, 9. Juli 2024, 22:23:05 CEST schrieb Frank Li:
> > > iMX9 memory controller is similar with other layerscape chips. But so=
me
> > > register layout has a little bit difference, so add new compatible st=
ring
> > > 'nxp,imx9-memory-controller' for it.
> >=20
> > Is this controller the same for all i.MX9 SoC? E.g. i.MX91, i.MX93,
> > i.MX95 and any future variants?
>=20
> So far it is the same. I can't prodicting future. Not plan to change it
> yet.

Okay, thanks for clarification. If DT maintainers are okay this way, I do n=
ot object.

Best regards,
Alexander

> Frank=20
>=20
> >=20
> > Best regards,
> > Alexander
> >=20
> > > imx9 need two 'reg', one for DDR controller and the other is ECC inje=
ct
> > > engine register space. Keep the same restriction for other compatible
> > > string.
> > >=20
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  .../bindings/memory-controllers/fsl/fsl,ddr.yaml   | 31 ++++++++++++=
+++++++++-
> > >  1 file changed, 30 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/memory-controllers/fsl=
/fsl,ddr.yaml b/Documentation/devicetree/bindings/memory-controllers/fsl/fs=
l,ddr.yaml
> > > index 84f778a99546b..e0786153eec73 100644
> > > --- a/Documentation/devicetree/bindings/memory-controllers/fsl/fsl,dd=
r.yaml
> > > +++ b/Documentation/devicetree/bindings/memory-controllers/fsl/fsl,dd=
r.yaml
> > > @@ -40,6 +40,7 @@ properties:
> > >            - fsl,p1021-memory-controller
> > >            - fsl,p2020-memory-controller
> > >            - fsl,qoriq-memory-controller
> > > +          - nxp,imx9-memory-controller
> > > =20
> > >    interrupts:
> > >      maxItems: 1
> > > @@ -51,13 +52,41 @@ properties:
> > >      type: boolean
> > > =20
> > >    reg:
> > > -    maxItems: 1
> > > +    items:
> > > +      - description: Controller register space
> > > +      - description: Inject register space
> > > +    minItems: 1
> > > +
> > > +  reg-names:
> > > +    items:
> > > +      - const: ctrl
> > > +      - const: inject
> > > +    minItems: 1
> > > =20
> > >  required:
> > >    - compatible
> > >    - interrupts
> > >    - reg
> > > =20
> > > +allOf:
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - nxp,imx9-memory-controller
> > > +    then:
> > > +      properties:
> > > +        reg:
> > > +          minItems: 2
> > > +        reg-names:
> > > +          minItems: 2
> > > +    else:
> > > +      properties:
> > > +        reg:
> > > +          maxItems: 1
> > > +        reg-names: false
> > > +
> > >  additionalProperties: false
> > > =20
> > >  examples:
> > >=20
> > >=20
> >=20
> >=20
>=20
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


