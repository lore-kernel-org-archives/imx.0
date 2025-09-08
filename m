Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6777022256F
	for <imx@lists.linux.dev>; Mon,  8 Sep 2025 10:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757328919; cv=none; b=OStQSfPwXL4EzGhgxn33EG70YRO46LDNgW0czgCv+tj2t1Qf3bTudwdzKEwsPjh1timIg9+Y0YZv7LWXA5JHYqh3L7MOWtrxPbQ4rsCaoPS0Yy/KapvsgXIwwrYyXITXtQLb2IDgn13Q7WK5lrBdfxqfOQblYoFHe/CMpD7JZaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757328919; c=relaxed/simple;
	bh=EqlZsQks+WW7jmnsAvVdsxSQzUjOCLYnk3kijMEKaYU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WTkfrBuZp2y+zgEiF/CFdc/zfN/w92pCzweDe/gtYFm3jZyVRXdj1M2uSGz6zu/Zy/BvoY+V/HS51LoP8Si2dAP/n/PNfr6cliTT7BdnFnAADB5P9GwJ8LqEdTnfGp3FTowxjq5FDGCneQhkybDEhyjCDJcPAIndWxFjSKNBlEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=7X7U2Xu2; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="7X7U2Xu2"
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1uvZWd-00000001zVZ-28zt
	for imx@lists.linux.dev;
	Mon, 08 Sep 2025 12:55:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=0LgwfZ9wkEAtJ94bNBrquAEb0mXoUgSOBRfwjUSoLhY=; b=7X7U2Xu2eOqFWTYsVy6vs1y2oY
	0qG6OglqIbcf2y9/F6qWOOyWDeRwMGACXkuOBkf0KyklP4boGFnIgTIZ0mXik2Wcg4H8Hc2jVRPCb
	vcr+fihtypb3Byy6CV8pu7S0bsd2tdMXI5UHzHfnP7XsC9y80TqZZWqgIsJYRB5wlj3Sgy3SlBA/W
	J0LYtlK+vNe/iS3RKltZRnMAlhsR6qA50w/ZNqiwgOTe0a7MFEfHOSjA68xamZxSrICNHnJSQU5Hl
	BkqPRnD2CHRWGcQB51w5qo3D/jWYnlckF46g+bG2mEEUwhMR6gdfse9oiZJ+ysc3yvpY5NxePkYay
	KVA4IT3g==;
Date: Mon, 8 Sep 2025 12:54:49 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andreas Kemnade <akemnade@kernel.org>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Alistair Francis <alistair@alistair23.me>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: mfd: sy7636a: Add missing gpio pins
 and supply
Message-ID: <20250908125449.0b1443cf@akair>
In-Reply-To: <288f0cf1-1ee4-4eba-b059-641120bb93f3@kernel.org>
References: <20250906-sy7636-rsrc-v1-0-e2886a9763a7@kernel.org>
	<20250906-sy7636-rsrc-v1-1-e2886a9763a7@kernel.org>
	<288f0cf1-1ee4-4eba-b059-641120bb93f3@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Sat, 6 Sep 2025 14:01:25 +0200
schrieb Krzysztof Kozlowski <krzk@kernel.org>:

> On 06/09/2025 11:09, Andreas Kemnade wrote:
> > To be able to fully describe how the SY7636A is connected to the system,
> > add properties for the EN and VCOM_EN pins. To squeeze out every bit
> > of unused current, in many devices it is possible to power off the
> > complete chip. Add an input regulator to allow that.
> > 
> > Signed-off-by: Andreas Kemnade <akemnade@kernel.org>
> > ---
> >  .../devicetree/bindings/mfd/silergy,sy7636a.yaml         | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/silergy,sy7636a.yaml b/Documentation/devicetree/bindings/mfd/silergy,sy7636a.yaml
> > index ee0be32ac0204..08ad593e237f1 100644
> > --- a/Documentation/devicetree/bindings/mfd/silergy,sy7636a.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/silergy,sy7636a.yaml
> > @@ -32,6 +32,22 @@ properties:
> >        Specifying the power good GPIOs.
> >      maxItems: 1
> >  
> > +  en-gpios:  
> 
> enable-gpios, unless it is something else, but then please explain in
> the description.
>
My idea here was to have it crystal clear which hw pin is meant since
there are two pins which enable-like functions. But since you agree
with the name for the other pin, I can live with enable-gpios here,
as long as EN pin is mentioned in the description.

Regards,
Andreas
