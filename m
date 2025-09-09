Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83137239E70
	for <imx@lists.linux.dev>; Tue,  9 Sep 2025 07:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757402120; cv=none; b=ThrDKgRXn/Kw6s72HdQPvwiGATsrzyIQ6MZmRIi9qgoIvSlFW8cB+bWu4QHDDioaYF4yZk3m2E3tqG+Uz0g7jR+9OcmGqU++Xrjd9ndAWAOhiOEHbeIdyotr4/Ij59OwdoTXAE3MiFJWxsdrAQjV7fqvh0Ni3+CJTAafDdpU8hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757402120; c=relaxed/simple;
	bh=RLT21W40QQic9U+kLXEBvc/R94byG6Ag6xJ9Xg4gz4c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ahRqx8SP5if1QCVNEUd5WN/b6CXgwjSJ63fd/Ia2xc1y1NpJpEaG4aD4mWuHZf57dq0xDIiyXN6TIlDPVSPGqGVrfftVEb9gS+OYPEg1IEdtT0IBQxhMCnJBAQE5d059/eo5o46EcvrbxL0UPeayW4VddO8+hClmShoJhg5ca1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=TEW/akYE; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="TEW/akYE"
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1uvsZO-000000021Wx-1EYH
	for imx@lists.linux.dev;
	Tue, 09 Sep 2025 09:15:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=xYnn6eq9zDJfEhefiTAt9k41NDwuDU+EuoU6E1ypT30=; b=TEW/akYEAvobwhIwNwLHv1OxsP
	TRvqluGtzgOR/IiAz81Ld1z7p+3NwOuRxtoTDzhgrNzF8lPVlbe5GmVwmDd9YupEcWQtoUuatEIzM
	998FaTxhLFWOIlVKDaSG+TCicA4A68/EfPtXUMNML4HI+j+7Dq0JPy6zJr+mu2BKYQwXytm+/pTy0
	gPRk2F4bj6M3Vv8ykYlxo1PgAFWix22zQoH7JUnCGDRI6agb2naeYKPzkOsMStQbcSvFM/8n86tCb
	2Xi+0hTV4n5mIBa9X8aAMu9W8pXWAFeD4UlWPwcgEOcOBN57mThT67qAVlrHginNntb8fMq6XQ+aN
	K1eI9LHg==;
Date: Tue, 9 Sep 2025 09:13:50 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Rob Herring <robh@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Andreas Kemnade <akemnade@kernel.org>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alistair Francis <alistair@alistair23.me>, Liam
 Girdwood <lgirdwood@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: mfd: sy7636a: Add missing gpio pins
 and supply
Message-ID: <20250909091350.7732243e@akair>
In-Reply-To: <20250909004458.GA2311693-robh@kernel.org>
References: <20250906-sy7636-rsrc-v1-0-e2886a9763a7@kernel.org>
	<20250906-sy7636-rsrc-v1-1-e2886a9763a7@kernel.org>
	<288f0cf1-1ee4-4eba-b059-641120bb93f3@kernel.org>
	<c879f3e1-f64c-4cbd-97ec-646d06488d8e@sirena.org.uk>
	<20250909004458.GA2311693-robh@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Mon, 8 Sep 2025 19:44:58 -0500
schrieb Rob Herring <robh@kernel.org>:

> On Mon, Sep 08, 2025 at 03:34:00PM +0100, Mark Brown wrote:
> > On Sat, Sep 06, 2025 at 02:01:25PM +0200, Krzysztof Kozlowski wrote:  
> > > On 06/09/2025 11:09, Andreas Kemnade wrote:  
> >   
> > > > +  en-gpios:  
> >   
> > > enable-gpios, unless it is something else, but then please explain in
> > > the description.  
> >   
> > > > +    description:
> > > > +      If EN pin is not hardwired, specify it here to have it set up.
> > > > +    maxItems: 1  
> > 
> > It seems reasonable to name the property after the pin on the device?  
> 
> Yes, but in general we've standardized on reset, enable, powerdown, etc. 
> rather than all the possible variations of those names. At least with 
> 'reset', standardizing it has bought us the ability to handle it with 
> the reset framework rather than every driver implementing its own GPIO 
> twiddling.
> 
ok, then I will do
EN -> enable-gpios
VCOM_EN -> vcom-en-gpios (as is)

Regards,
Andreas


