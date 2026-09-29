Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189193CEB8B
	for <imx@lists.linux.dev>; Tue, 29 Sep 2026 09:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672818; cv=none; b=HTs/qnVIl4AX7mySA4mIyKKvX77IoFmEemlMZLjdE8IfTyJWpPp7X9vBpViB7XdhQW+hLvh2XdTMRQEKGoBFf5x6bvMFDwIqULy6Ll8qwqm9IWnLF/jmUpYmGA3UIW6u5Rielx1mv83iD1IxBh/7CRwEfEWzChAVoXLkF/QX1zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672818; c=relaxed/simple;
	bh=tXJ+qY81QYX6ntiL17hDKcWY+jDR6CzEofjkGotGB90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ql7O1V9dtphdOL+P4ouNKDaCFKtpYUjPYpQ9BdXzMjWLAnVRH7KijaA0ecZVDqRyk3qXg9ar/EHCQkt8Vn5Yb0CJTngsOGAqAHBehQxxZfkVC7CocwqkK/r1EGVDtf7e+VU0IJAu8A2LpUyGu1uTbXkyveRnuaNzQTj8tjNqHUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s22qRIAH; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s22qRIAH"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffb83bf7aso23567735e9.2
        for <imx@lists.linux.dev>; Tue, 29 Sep 2026 02:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790672769; x=1791277569; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yVeHQ0WAriz76dL1hysd44dqzM4X8EtO0BJ7xNzSj4A=;
        b=s22qRIAHRxHXnXhoNVSxt36W9ywM+xWT7La/wvx5vpTcr6jMCe3O8JIAktGYRHfpO8
         RhjwjQjczIdwsR//iDDqDTgjWtKS7csKDsPZmthaaSRQzuoVISYg/kLWOlxSde57kHJH
         fG5lHiGDe4bT2+yu7sOtbUmk1T+e9ZV4SJKype/OghOMyvAzty52vaJSswgZzdpiZaSW
         QmGg6bY5cxmU70kVYiXzOlbhxZoL7Yon+ZmL8eqUI9JtMTuGNtH8ySSiGTbQATSl7I3l
         EHE8k2abx1f8UH6Nazkhhjk9xu/pSXai1o+tKRFWX/cWEdpOLu345eGK/4zimKg4F2pR
         z6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672769; x=1791277569;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yVeHQ0WAriz76dL1hysd44dqzM4X8EtO0BJ7xNzSj4A=;
        b=r6i0eG2BIGSiddENIkKgZvB4Q29F3sgz613WJr7q4w61Jnj1kVIdFf82p1LuPUYi7y
         NvhHiwK4/arAOf6sBReF+rEfOIUZKjAGDzbDTwz3swNAgbbVtQjHq7McU3eVk5ZM+2D/
         ijmE2Tln6KZqwMEvwvEqDnZS85ToeiJt1TyRi3Q1V3O+TudvdCsFyTWALfVlbzad29ar
         BKgT1twb1eggZoMVUdaZf+0OXqEhNy+TkPzSBN9uQIl6Gqy4QL8mALvFG2uPZv+lvrLz
         EnRdX0Iv5Tf5DE+/T+VaT6kdXYPcnDP5y0EqUW8LisgrvnqbPuPMPQ50LrEaBy5oReJH
         C0aQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNKdSXBDtkLdaADRICvWjckgn27dU/n+ad7MtOr8QkM6lsPbDqm1NbwZhSZfvtRrPtwlQ=@lists.linux.dev
X-Gm-Message-State: AFuF++lZi1hcL4eSHyDmklUe1ZCl6iOGKmuibq8b1jqnWE5ndDukEw62
	58oVfQ9y3IO0MrjO7FrdrWG8znUX8AR506O8fVerMKn1FkmNLzX9uGTo
X-Gm-Gg: AYBFou0XKibMNkbFTeL5xA0LBhl6NiPe8Mw+spn9KYoGF4Oca7eHlYipg6CStHtUD1t
	cUKN8ySZytISLEaTmdRPwddwRUoSLWsmMf3mqoo43T/ea7hShXSaDme62W+XPVc8Vlezhxidve+
	uhDce3vzUhOS5rcaubo5/X62a+emrBHYVz/yFpYEPYf8PveRqVrBnTJBlT4D2fydqXnaFiLsBsA
	1u2gmUO6/DeIAq4CcUWI/Agd2hCye6CezrsB5ukO9Afr8636NVUOpGZS24T3hb++pBd5bdrzgtS
	EI2ehjpAEoApeiyz8S0RhoHVvYXcpoNHh7AgvMIlR//3mtYAenm+ECMckRrLiAoqMyJeQ/+VsAL
	W9pqUaBGOAMG6kmUUDQ6CkXBQ0DpTd45uw4D2NDWPJvhG/kkssmGhW5GPsIFLlQJ2WnUR6o5Eeo
	ryx5+sX+ejXIRXA3K8Bn62bPh6kaRl+aQCOsUe5aADuB4g8dBUexMrc8ActD+RLzxo2gSIxao0U
	cMb043qOKiDBfw17Otnp/R51sOxmkuFTVffDJdJM7qp/VbPlrrBVB3LkMFssIqPgNdIJXWfyfJL
	F+JwpRuHV1T9tWxW09U9JzSeBI9H
X-Received: by 2002:a05:600c:314f:b0:49f:e4ca:e09 with SMTP id 5b1f17b1804b1-49fe66ca9e5mr261828235e9.3.1790672768454;
        Tue, 29 Sep 2026 02:06:08 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d0ea7c0sm65937205e9.11.2026.09.29.02.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:06:07 -0700 (PDT)
Date: Tue, 29 Sep 2026 11:06:05 +0200
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
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>, Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>, netdev@vger.kernel.org
Subject: Re: [PATCH v3 01/12] dt-bindings: arm: fsl: Document Variscite
 i.MX6UL boards
Message-ID: <art_faJ7Zx5CaWfW@Lord-Beerus.station>
References: <cover.1790512621.git.stefano.r@variscite.com>
 <a4e262cfb08153c23c80cd3098a684816993f1e9.1790512621.git.stefano.r@variscite.com>
 <20260929-logical-fanatic-quail-2ff20b@quoll>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260929-logical-fanatic-quail-2ff20b@quoll>

On Tue, Sep 29, 2026 at 10:49:08AM +0200, Krzysztof Kozlowski wrote:
> On Sun, Sep 27, 2026 at 02:46:16PM +0200, Stefano Radaelli wrote:
> >  
> > -      - description: i.MX6UL Variscite VAR-SOM-6UL Boards
> > -        items:
> > -          - const: variscite,mx6ulconcerto
> > -          - const: variscite,var-som-imx6ul
> > -          - const: fsl,imx6ul
> > +      - description: i.MX6UL Variscite VAR-SOM-6UL and DART-6UL Boards
> > +        oneOf:
> 
> Please do not introduce own style.
> 
> > +          - items:
> > +              - enum:
> > +                  - variscite,mx6ulconcerto
> > +                  - variscite,var-som-imx6ul-emmc-sd-card-wm8731-concerto-board
> 
> "board" is redundant
> 

Thank you for the review.
I will keep the existing Concerto binding entries separate, use the
surrounding items/enum style, and drop the redundant -board suffix.

> Also, look at other examples here, like Toradex. The actual variant
> should be the last.
> 

Could you clarify what you mean by “the actual variant should be the last”?
For a board with eMMC, SD card and WM8731 mounted on SOM, would you prefer
variscite,var-som-imx6ul-emmc-sd-card-wm8731-concerto or
variscite,var-som-imx6ul-concerto-emmc-sd-card-wm8731?
I had used the former ordering following examples such as
toradex,colibri-imx6ull-emmc-aster. (som - som variants - carrier)

Thank you!
Best Regards,
Stefano
