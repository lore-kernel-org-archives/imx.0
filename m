Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894F84B049F
	for <imx@lists.linux.dev>; Thu,  1 Oct 2026 09:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790845847; cv=none; b=nGTorlvKfBRvs1F/nByjEIW5Vd6mmeL4yWs+IZ0HxMBoC2yoNMYnW7nWnhmLdraNO2PhkFkrRR/tMP9y5bcoXgjjb2gcpMAK6gLdLXC3TJsumpDgkj+ZUPnHPUet/RO8LkwkCfZqoevbLzZYr5IxYvKuztsCx7drWJ+X+h6L8eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790845847; c=relaxed/simple;
	bh=nP4uwT5vKhhI/awkQd5oqbO5S4qnAT6kxAGyn1bp2X0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lAgD3dwAy8uGGIgI68wextlSmww+y8QRmBwtIEjMBGoSLcwVO+yYGHBV1bZ8p3ptTl/f+zkA/Q0vkZeJYFVofZjAFj/8DHi/VpIG88eswJOUpevgcBj9/VcKeto4XyTUPLEiNOV0YubNPkr+jMGWHz6GAgNAadgkNdYdeUpJX64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N7KaDFQp; arc=none smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N7KaDFQp"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e3f641442so43126066b.0
        for <imx@lists.linux.dev>; Thu, 01 Oct 2026 02:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790845844; x=1791450644; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UudBeT5MtTtLRJzGKTgVM/EBUgESY13lKxlTXfP+GNo=;
        b=N7KaDFQpOhRg5YO5DZzQvgPF89S7MQ7Jb5Uq1gPdvuujE3QhmfsSo7+UNtuvW+vkYI
         d/u4LwIByv5Xkhe5kWwc17A3pT7hBCVSZCmQ/NiXEaAEOQTbihssvPDMCm1TmetddKYA
         EG/afKvT/znviXgiSDFJgUKkY753j3koRcSajEQahmWU4dyVO7DzJmx+xK8ORwHxjGDs
         o8xpoBCg9aNp5AITfmGcnglXrWaA/CKVScoSnu4dREUF7BQeYF5PECXjyusMkC3GzE30
         JQa0NQ6yBvMkGpTGbqP8CLrVOnpMJylqtFRFPhkw0PUWjBxbN+SIYyLpceuEUo3+j5Za
         xK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790845844; x=1791450644;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UudBeT5MtTtLRJzGKTgVM/EBUgESY13lKxlTXfP+GNo=;
        b=B2IfuMCTOuqWVv/AwGEtKREnU+XQeqHQtWazrbfXWabfbqayJklHu8ap/irqsRBubv
         3A4WMWSk8J+40mDubH1c1iLuTE/YWb3ATKUCUA5INmPcxyw6/O7swk3R6ZV7o0kvZehS
         D2KsxQ2uc5PfpDTt1ArD0Ls0tKrFp+yr/rK6ZUYXswwkpz/YtT3QTvN8firSYG8NW+AG
         k3aLnXBVXS2hO16TAqcjiVMyrzx6JBW9icV1qRdMLXdA55bEmH24x+y10ZYTnO50s8dc
         wE9bwH7JWvKdMqfAeQWPLr/4wsTzwXm5UkKp3vF0u/nhpFilXbquRm6CCcWoiwxwl/+I
         fXsw==
X-Forwarded-Encrypted: i=1; AKwUvBwngVT9/H36nz5yZvIA8AOY73Tl9HVn0xue2QBnL7Bu8GNv/xBx/dFyh7J+5Xy6ZV/Iwpg=@lists.linux.dev
X-Gm-Message-State: AFuF++mHnLnFCx7ZR1lDaY0jK1hrthFP2J6lPix+3RbPIJdsX3IyIjeo
	gk4zMEUXM0586CEO+7VCxrvAbjYRrmeE/jgcHt34xyK/PA0Y3WZz6uKU
X-Gm-Gg: AYBFou3idltNx3jVLHVIR/m+5pJlOyCHwLfqBQi2mPauI3eRkdYv3pquxN/edDMe+ag
	iLIYVvTpTwRLp70FU2r/W92XOumdXMlWzrIICK0MYRZ3XWNhLI2kZ22IrynZhZC0ETQEjjhjOKR
	6m6t3HXeFJ+zs6+2yx575aqurk0su8BMA1haDTPFexiPj6BlviyZii9LrkbAYmu/tyMUPpNOcMK
	2qTj4lksPJVEY205xgsOtWAn3Xlxi/xAH+TDCoDBtPXPDu5gBcxnpZRUVqK+EThLyCa4dzQP+Dh
	zleQ/zCZn/0U/AKDnqmUFnULzstWFc+UbpU9pz6fSix1jgQFFosbX7cbLMXPIXb1ioqlje0xCHV
	npLXFkqjJAommuArGCxVxf5xeKFd1TmiqUbtVGP+XSbbX1FCF3vudEn2B8baMRzjA4/1anJ6DHc
	zKZKwt6tjxvQz/FAb4N4CHB3zoz6obJy1Aa6+n/CoC/bVtTyuG3LrY1KwhxjMbG0hWaLuxz8A7d
	hscl7RkbnTpABDaaacfBt8OrFegfovrKpCJj+uKI0czWNcIegD8htwlZbC6Llo+5dUDMOTLpFls
	/efBgNO1pASnGcgeS355VtQTp9qX
X-Received: by 2002:a17:907:3cca:b0:c29:4cdf:dd70 with SMTP id a640c23a62f3a-c2e23e5d1fcmr349826766b.44.1790845843677;
        Thu, 01 Oct 2026 02:10:43 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31d80d5csm116136266b.51.2026.10.01.02.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:10:43 -0700 (PDT)
Date: Thu, 1 Oct 2026 11:10:40 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>, Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>, netdev@vger.kernel.org
Subject: Re: [PATCH v4 03/13] dt-bindings: arm: fsl: Add Variscite i.MX6ULZ
 board variants
Message-ID: <ar4jkNZc0eoF-EhL@Lord-Beerus.station>
References: <cover.1790693249.git.stefano.r@variscite.com>
 <1e6f9e01bd9e0e0801b18ddc9eb44bde200ea984.1790693249.git.stefano.r@variscite.com>
 <20261001-immortal-wild-wallaby-23de50@quoll>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-immortal-wild-wallaby-23de50@quoll>

On Thu, Oct 01, 2026 at 10:09:22AM +0200, Krzysztof Kozlowski wrote:
> On Tue, Sep 29, 2026 at 05:17:30PM +0200, Stefano Radaelli wrote:
> > +          - const: variscite,dart-6ul-imx6ulz
> > +          - const: fsl,imx6ull
> > +          - const: fsl,imx6ulz
> 
> Is this the right order? Which one is superset of which?
> 

I followed the compatible order used by the existing i.MX6ULZ EVK
and had also noticed the comment questioning whether `fsl,imx6ull`
should come last.
On review, I agree: i.MX6ULZ is the reduced-feature variant, while
i.MX6ULL is the more general compatible.
We can use `fsl,imx6ulz` followed by `fsl,imx6ull` for the new
Variscite entries. I can also propose a separate patch to update
the existing EVK compatible order to match, what do you think?

Thank you,
Best Regards,
Stefano
