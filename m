Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.27.42.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793724061;
	b=zrqikMTyLfCDmPAWBH1YOuawPK56PjXD8DdtyDjusplU9rEFzBgecohxrRqLM363z2hz
	 Z+zMKEm0Gxipl64Lw6Yj5p/wwa+DPGRCqfsKbcpr+ls6xZqZBBl2e76Hp968FRTC1yleg
	 2X3sTs2aCntoZ/9fWihizz9ZFqW7wgIbu1bMio2PfG1akqMBHR3206LSPIgv6RbScBw6K
	 VW6c9BCwfDMWwVOJHyM7ObAVO1EU/cbLjhWBjhDL7HgiJjBwCBSGynBP/621WPFOLhzlZ
	 uusFzLxO/us02hjqKM0jk+M9VEEsXvQAJcQ091v30EXvPL52nI0PeQAChq/M4D2yuUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793724061;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=Shr2teq63V8P7ushHBYXKFTTJfhpOja4aluMgZ/Uw+A=;
	b=rpV8H4ib8mZwAId3OazwYBjSPGC+mc85CVeUIoM5AlQweLGZzHSjxRNnGlHYJr1hzzJs
	 nu+AAwqo6irROI/jMhV5wDp71uNjRg5xx1hDzBeheo2NaSnRPfGu9u4cQHQTKN11K46+T
	 xaHz9GJX80Q8TouOE5jtqsYUGVkLhi5l3kDt1Yn47I7uNQkaM2HxfOFYRz4KMkY4OOi1t
	 wTlsMiwrjIrogLMUS+z/MJ0F6suAxDkKe2tlTaBzeZZngAOShqw8SIG3dVOwEGFXHOj/F
	 2f6Tr+j5ysIilf2ebd00iNQuX6c9Px/V4TOc9UVt041b3UW1uMtXgoBNvBuLw6OL8/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=free.fr;
	spf=pass smtp.mailfrom=free.fr;
	dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=MqjfaUek;
	arc=none smtp.remote-ip=212.27.42.6
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6AD6082BDC
	for <imx@lists.linux.dev>; Tue,  3 Nov 2026 16:40:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A6AD6082BDC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=MqjfaUek
Received: from L30177.local (unknown [213.36.7.12])
	(Authenticated sender: vjardin@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 4F8F4780395;
	Tue,  3 Nov 2026 17:40:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1793724051;
	bh=hIo5wKJPZnjho62FTKebqDa+KdYP3W8K2TKY9Ek4sYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MqjfaUekQFvuCKTt/CUf1BBopp/kcg5M3iZ87uBtd/nRtKnBJfAp02aoxBl7fM2h3
	 S9tspLtn+2miYvL3O33DMvrKkdk3IixH/NZrAhZFJkJa9lEUDrc3klMlJ2Tu8fPrqP
	 hyG0EmOouYs6CWYUmATZ1eGbbTdIieM0rWBoegQDVorc8DPHVETgHgH1D832uj7jLv
	 4+JPhBMpxsfYp2j/i51/WozlNaSJVSJ3drk3wC3RGqqle3g35vXJCr+ux9j8XjEqzJ
	 eYK24F0ZHgsKICSoFTbPEbbj0DYsIkfrxmMu5K8DKbZ5z3NUcNUkluqP83Epb/BPzS
	 kEIgfY7oOzMvw==
Date: Tue, 3 Nov 2026 17:40:27 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH 1/5] dt-bindings: pinctrl: add the NXP LX2160A RCW pad mux
Message-ID: <auoOe2-9wZhAad87@L30177.local>
References: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v1-0-0a61a9837744@free.fr>
 <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v1-1-0a61a9837744@free.fr>
 <aun5TzN6kWdkr5x-@SMW015318>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aun5TzN6kWdkr5x-@SMW015318>

Hi Frank,

> > +      groups:
> > +        items:
> > +          enum: [ iic1, iic2, iic3, iic4, iic5, iic6, xspi1-data74,
> > +                  xspi1-data30, xspi1-base, sdhc1-base, sdhc1-dir,
> > +                  sdhc2-data74, sdhc2-base, uart1-soutsin, uart1-rtscts,
> > +                  uart2-soutsin, uart2-rtscts, irq11-8, irq7-4, irq3-0,
> > +                  evt4-3, evt2-0, clk-out, asleep, reset-req ]
> 
> how to know which function belong to which group?

ok, I get the point, I'll spread those into their respective groups
per the CPU documentation.

For this v2, I'll try to be inspired by the
mediatek,mt7622-pinctrl.yaml and the airoha/ralink bindings:

    allOf:
      - if:
          properties:
            function:
              const: can
        then:
          properties:
            groups:
              items:
                enum: [ iic3, iic4 ]
      ...

best regards,
  Vincent
