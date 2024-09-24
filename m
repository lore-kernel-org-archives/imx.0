Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0078C1AC444
	for <imx@lists.linux.dev>; Tue, 24 Sep 2024 16:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727196631; cv=none; b=GQxa0wNJkt7LKOJYqXyd0c4qF6SSICV31jpfWRboUA//b4vRt5u+rcin+uUES/dmUEKwdlpcPPnmnAmMlMX5BBXcTCqvdFmC9GsgcipaMuzsHNRoAWvSGQCPu808FBVJbZy7+N2PpDntzblwVU7YqrfsWykYLokPpsY2SJ2Tcp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727196631; c=relaxed/simple;
	bh=k4z37PBBqp5fmyzET3BqDMVMHN1TqYd2jjf2Z4433yI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GFnv2+SCPj++NGjN/FtL8EZDJhTiUldGNIv2/y7Gzwpt8ZgEcJvRslm9C/4O5TNY1ev6sZzw5pfvVLNkjwFNfAB6ZcjKqKP1M92mjhE71TKkzuw7hRiVwJGnSh18SDGL9mP5XbpNCsElRFx9d8hRU3CnZHhKFE/jsrG16w3pL3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B52v+BHZ; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B52v+BHZ"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-206b9455460so520765ad.0
        for <imx@lists.linux.dev>; Tue, 24 Sep 2024 09:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727196629; x=1727801429; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XrLxPgkgKOiPm2BGxnQytFvFW36owhoRBcwb0NgVun8=;
        b=B52v+BHZzgQnnFy+pnMAHoHE1y4a090eeqdsJFtkyT8/lqoAarOEzWJ0QDD1WTj+G9
         Sm07ImbWv46lHMaOgdhNVQ4qd6LCmCBW7ruopvGq0X356q2g/sZRdDNazvLn9xUtH9VD
         Mq7xjC2gsO/ye3hWZ0yvL9fiXxP6wB9ZsQ4urE6mUhE9qz7iPDEiey15EbkavqVs652A
         rgImx3SuHpdItItlv1Cu7+FGCc1ZfLIW25V3OJhBYASm+Vmlpkyc3idKywgzPmd48jZn
         uLTiyQkAN9nV1hC3p5qXW4oObO2V42siZrtz3n72R0kHcj5jijveCWdghMtuSGm7lXZX
         5yoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727196629; x=1727801429;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XrLxPgkgKOiPm2BGxnQytFvFW36owhoRBcwb0NgVun8=;
        b=VIC1oRSen9Ro2hy5NyfmIKa5nBXVxTVSy56cuBWGc+19UkoL9XaP/n9JFA5/xbWv3H
         1QLlpGF0O2N+RWCIBobV2nMtFkrJDV0Uswlh/MVclaUf2g4Pg1nllOJekhokY7aaggu9
         NQk5cduy6NJVb1oonpQzwMwk+Irr0RAEL/WLS19h4wJPKPS6V/zfzr45kEzQfXtOTnly
         s2Nr5akHfwFSWI+3vIsPLOS2npU0eaPlWlTSbjjIH3+eFqcfjpMnesGuNbp5M+pk0Nb3
         T0H+GWl6MyDgXdVHlQQwwNl5S06w8TzhMrctXskNdQRq/h5hpy526bdcNCG79ZwMoqan
         mLMg==
X-Forwarded-Encrypted: i=1; AJvYcCXO0kqSqCAMaQqv996pr9OJYFStqVZVA7/VS8TdO0WpIpnViQo8vO4DHrJaUFWkwcJxm3k=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6x4xg8AEY02DsXqli40bdW/grdyT+P8uOdXOhoYyBdp/zPI8F
	du1RqnDijbv2W30ChPCKV0btzoedKX/PpzWC/q8smSz//Ij/Baap
X-Google-Smtp-Source: AGHT+IFqfUUaDOPnE1y9rGSkTZU20gXomlidJ6gg6vYqzx/bbHaIxhoy3MT4T10BvyOIE84H7hgXng==
X-Received: by 2002:a17:902:f60a:b0:205:5d71:561e with SMTP id d9443c01a7336-20aed13c417mr58688885ad.26.1727196629208;
        Tue, 24 Sep 2024 09:50:29 -0700 (PDT)
Received: from joaog-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af17dfeedsm12290045ad.147.2024.09.24.09.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 09:50:28 -0700 (PDT)
Date: Tue, 24 Sep 2024 13:50:21 -0300
From: =?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1 3/3] arm64: dts: freescale: imx8mp-verdin: Add Ivy
 carrier board
Message-ID: <20240924165021.n6lln424llsfzhtu@joaog-nb>
References: <20240924114053.127737-1-francesco@dolcini.it>
 <20240924114053.127737-4-francesco@dolcini.it>
 <ZvLWP62Gw0nygxaF@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZvLWP62Gw0nygxaF@lizhi-Precision-Tower-5810>

Hi Frank,

On Tue, Sep 24, 2024 at 11:09:51AM -0400, Frank Li wrote:
> On Tue, Sep 24, 2024 at 01:40:53PM +0200, Francesco Dolcini wrote:
> > From: João Paulo Gonçalves <joao.goncalves@toradex.com>
> >
> > Add Toradex Verdin Ivy carrier board support. One notable feature of Ivy
> > is the analog inputs. These inputs are multiplexed, allowing the same
> > input to measure either voltage or current. For current measurements,
> > a GPIO switch enables or disables the shunt resistor. This process is
> > automatically managed by the Linux kernel using the IIO and MUX
> > subsystems. Voltage measurement is always enabled, but the voltage
> > measured by the ADC is scaled by a cascade voltage divider. In the
> > device tree, the equivalent gain of the voltage divider is used, which
> > can be calculated as follows:
> >
> >                ------------
> >                +          |
> >                          .-.
> >                   R1=30K | |
> >                          | |
> >                          '-'
> >                           |-------------------
> >     Analog Input (AIN)    |                  |
> >                          .-.                .-.
> >                   R2=10K | |         R3=30K | |
> >                          | |                | |
> >                          '-'                '-'
> >                           |                  |
> >                           |                  |--------
> >                           |                 .-.      +
> >                           |          R4=10K | |
> >                           |                 | |      ADC Input (Channels 0 and 1)
> >                           |                 '-'
> >                -          |                  |       -
> >                -----------|                  |--------
> >                          ===                ===
> >                          GND                GND
> >
> > Vin  = Analog Input (AIN)
> > Vout = ADC Input
> > Rth  = Thevenin Equiv. Resistance
> > Vth  = Thevenin Equiv. Voltage
> > RL   = Load Resistor
> >
> > R1 = 30K, R2 = 10K, R3 = 30K, R4 = 10K
> > RL = R4 = 10K
> >
> > Rth  = (R1 // R2) + R3 = 37500 Ohms
> > Vth  = (Vin * R2) / (R1 + R2) = Vin/4;
> > Vout = (Vth * RL)/ (Rth + RL) = Vth/4.75 = Vin/19
> > Gain = Vout/Vin = 1/19
> 
> which properties related these value?

The gain value is used on the "ain1_voltage_unmanaged" node for the full-ohms
and output-ohms properties.

Best Regards,
João Paulo Gonçalves
