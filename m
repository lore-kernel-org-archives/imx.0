Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA24225DD
	for <imx@lists.linux.dev>; Tue, 23 Apr 2024 06:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713853628; cv=none; b=PDiA678xDiTmjQ+jSZzcoo4de6sya251/n9f5lc7Lnrh+7L9a5P2e4i4SXjyW0BG2kRMRWjvdAMrx3ec1tGWykfJG9MVUHgdFX7vzFlDU7RbQpcY8d9TMZbzlm0MSnTavqBlz37P+xTAsgrXM3+Atbwn8ExI/IlnaFXOatenmVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713853628; c=relaxed/simple;
	bh=BOTVxgdLvwkUKUp/KbDf4z2lDM2qZC92BYAnfam74oY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AKLxNielQlxUGeY0ETlAmsURIOS3M9qaXuWW6ruQCxV8RfrspmcwruV3iPcR2Ada4PsCIj8P8vANcZtKNJEU9c111PIbI6hZoF3ars1cAU3unTBKiH0sKNSXnqpKSp0fbQRz0mbqj1VzbTdPNWFGGuImHKoGG7qhO0lsSttAcE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=GjzkDgyC; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=UAkiHRNj reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="GjzkDgyC";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="UAkiHRNj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1713853625; x=1745389625;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s7RKTtO04TwlxnfzFc9siRRe1sN43bdKokqcoMESYdY=;
  b=GjzkDgyCKC7XgSWiVsM6htOIL5wzdzfXwer46C3kENqkqUJNxTojKVGM
   5VmUuUyZvEji6E3/iTYulTJirJYS7XieHZSRJDLG2Oi+x95gpTe+bYybK
   rPeXhFy6/15NhMrSMDpxtud8yLqpVz/pr9vpDlm7gqrnxOPXXrqyGhN65
   /d+0P+TcJaMkM6qEFChUHbSDW3Xy4BQMEivPXSx9ht3sVwvz0bOtye1o2
   28SXySlcUHQH6wcmJjMeZqwhHkiVfme6gAJez44ZIPfh6u+y7+7CoFj8L
   XDIht7dydfyCMrnJf2yLCQmMl7M+Ha7JGXx6feSJrlWnJPTwSW/cvxbQ4
   A==;
X-IronPort-AV: E=Sophos;i="6.07,222,1708383600"; 
   d="scan'208";a="36554964"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 23 Apr 2024 08:26:58 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C86B3173F3F;
	Tue, 23 Apr 2024 08:26:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1713853614;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=s7RKTtO04TwlxnfzFc9siRRe1sN43bdKokqcoMESYdY=;
	b=UAkiHRNjMPPyc0aoxi7sCbNJkWN4dzPCT/TtD2d4Ca+L9Cf2CMqH/q2MCpIyGF9RFQntm7
	3EfpEN1GTF0ig6txR+/ictIsHJHX7yZETNMph2MzyROkh82Jw27lDG5Kiham8mfDw3Fmzs
	7h1bveDOteAgmtqP/o2JBAgNcPth6yqNxCc4Dk3iHpDT8AdjuWasnadJn9OmUd/x5Y/XAJ
	OTRC1/Xi04FXakyTnKeXE4Tt0eQhiaXaAI2TVsYVXFGVyoFKm8LMPTH1ZJg8RWgqcjqpi1
	9SLI7W1Ms2kKYyEwBPb/+Ph6Z/48ydp+ZGB0tnFqr0C1jGHZEnBpfvix5mIVOw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Conor Dooley <conor@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lucas Stach <l.stach@pengutronix.de>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v3 1/1] dt-bindings: interrupt-controller: fsl, irqsteer: Add imx8qxp support
Date: Tue, 23 Apr 2024 08:26:55 +0200
Message-ID: <6041240.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240422-channel-emission-d485dee6ae48@spud>
References: <20240422064949.70778-1-alexander.stein@ew.tq-group.com> <20240422-channel-emission-d485dee6ae48@spud>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi Conor,

cc'ed imx@lists.linux.dev

Am Montag, 22. April 2024, 17:48:20 CEST schrieb Conor Dooley:
> On Mon, Apr 22, 2024 at 08:49:49AM +0200, Alexander Stein wrote:
> > Some SoC like i.MX8QXP use a power-domain for this IP. Add a SoC-specif=
ic
> > compatible, which also requires a power-domain.
> >=20
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > Thanks for the feedback.
> >=20
> > Changes in v3:
> > * Move 'allOf' before 'additionalProperties'
> > * Remove superfluous 'minItems: 1'
> >=20
> >  .../interrupt-controller/fsl,irqsteer.yaml      | 17 ++++++++++++++++-
> >  1 file changed, 16 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl=
,irqsteer.yaml b/Documentation/devicetree/bindings/interrupt-controller/fsl=
,irqsteer.yaml
> > index 20ad4ad82ad64..3d33b75d6ecfa 100644
> > --- a/Documentation/devicetree/bindings/interrupt-controller/fsl,irqste=
er.yaml
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,irqste=
er.yaml
> > @@ -14,7 +14,9 @@ properties:
> >      oneOf:
> >        - const: fsl,imx-irqsteer
> >        - items:
> > -          - const: fsl,imx8m-irqsteer
> > +          - enum:
> > +              - fsl,imx8m-irqsteer
> > +              - fsl,imx8qxp-irqsteer
> >            - const: fsl,imx-irqsteer
> > =20
> >    reg:
> > @@ -42,6 +44,9 @@ properties:
> >    clock-names:
> >      const: ipg
> > =20
> > +  power-domains:
> > +    maxItems: 1
> > +
> >    interrupt-controller: true
> > =20
> >    "#interrupt-cells":
> > @@ -70,6 +75,16 @@ required:
> >    - fsl,channel
> >    - fsl,num-irqs
> > =20
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: fsl,imx8qxp-irqsteer
> > +    then:
> > +      required:
> > +        - power-domains
>=20
> Provided the power domains are optional on the existing platforms,
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> otherwise,
> else:
>   properties:
>     power-domains: false

A power-domain is used on imx8mp, but imx8mq does not.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


