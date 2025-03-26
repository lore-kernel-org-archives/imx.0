Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE271C7015
	for <imx@lists.linux.dev>; Wed, 26 Mar 2025 11:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742987349; cv=none; b=p+19IFawAp4Sniw40XXrGP/SFZJtuGt9wkh1MB55xETvh4LFTz9P3t2DxbsPaC6ZdNxGq+bQYAtFRCppR8IHVESdt2jSjZTxzTr0a9uQp7MOYivCXS5IF+JlpjoRv5+M0br30vR4ZTmQZOfE4tgYRJOzWsdMO+ZQOO3m4xNfHrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742987349; c=relaxed/simple;
	bh=ZrGXGtpLu9V6i8WaDAYslIOE9Xmgz7g6O3/KWU/N4BQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BbH1c1Cy+Z8gTAx0UkazDv9E20UUHQPPy97x3ltOrqs0tcNxsxela3CS3MebG//+FP269BVxJ+T2L3ym4Tvvb5GwpTEz1sPkate4T4fy/3N7moMFz1/jK4kzbWgWdHXvgm/HKwh6/FIcmGGSYeKamF2Eq2tk5fUfUuk+8GXGpY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eVmPBDiE; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVmPBDiE"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2243803b776so17957565ad.0
        for <imx@lists.linux.dev>; Wed, 26 Mar 2025 04:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742987347; x=1743592147; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZrGXGtpLu9V6i8WaDAYslIOE9Xmgz7g6O3/KWU/N4BQ=;
        b=eVmPBDiEJ3HYnXGevgo4Wl7v4S5TEnT45pqYysAdj38stz3ObBU4rEhqTQ07S6nIxl
         aji7ysCEj/TcOuSGGea1p4apr2PzglHX8tDVx3ERN9Tj0go1pCI8BZWYlQiEqh+wi4gK
         RcGlr16GCt+KAhpBmDj9LCWjqu91b7Zb7ZYGNaWsOW18GNYHEp1icDGBZZgB9hSMdZN8
         hkfPpiZIW1o2pSclaKpRIB2fQleOHNXPs+LRq7kVbKkaCT9ax8t5109Rbj9UF1C/2BqZ
         7+1dGLtazoiLFt6HX3CmdJmeVY3gUgJOL1FXnKihAXw0EuuV/oGrfOh8SZH/YxtxINXp
         lEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742987347; x=1743592147;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZrGXGtpLu9V6i8WaDAYslIOE9Xmgz7g6O3/KWU/N4BQ=;
        b=EK+HIKLupkbS7mOVzqsHHZ4+5sL9LET0q/PUHCIzxiUC8gLDeHkbrFdbCeqzZkF0xN
         KUZivAu94AzG0QLT7KtawWoN2Gf/tXRXXA3w34ExV1ee2EO5plMVBMPL78aiDcJGnHT6
         XRwPd7QTDlgI5Cmu5g+rKhova+MNRnnceyAv94eVqa2tpg0IUbHGCVfVJmQZwSUvcuik
         bT5Uu5cvnMtztUUv94mvXFu+BV3a7Rhdf7KXMAT0Z7WI1iKN0RHl29fW/IUMKGbUmB3o
         myuOJ4IanlaAX9eJFGaxl7R/3K5XsyegtrOhxw6xMLIl9HYJSRH3YX+CJb4bPdkWOV4g
         hQNA==
X-Forwarded-Encrypted: i=1; AJvYcCX8xjY7FWULc+WYa9xB+ECJhLJ58zcMVu7Enn6vpsVBuFoFdlWHtf9tpGDV/pVQ9vSr9Ys=@lists.linux.dev
X-Gm-Message-State: AOJu0YzkMfM6PV7yyRTOqdHiM7lfcSmGaQwIWpLh1ur2rew7wM0QGLZA
	u+6eta3N0n/xCam/MQ1k4wU7sthBk++IW560D1mvMmLfJR6oJCBQ
X-Gm-Gg: ASbGncs81Vf08X10R/+T6ROFTMA899LmbATdA/Jmzt+E6bABn4Nqg3x1pcJw8PZlP2z
	kNpBtTBWQgUzNNw+/c3C4uao8w57RE+D7mHBTjBbi994docMCYMMBl/L3UK7roQmeGTqfwMMcTi
	d4SGraZnxzJajdpb9LPfDB3IYHyMgRoQtafNi1tm5OJIdyvGRiUKQTssREX0ZADPFOF+9+seWkC
	ibj4ncu9WKY1YBTENCTJOk9VLM7vFyDiJuWfmEdh6CY7yXYs4tK9xrWuy8lG40CLXHSuX7ijLKY
	9CTFkUWTnCsD3PJwUvrEm7FiErSX6nBiWwi5oYGyZ2WB1grD/rTBa4SqHY3D4MnE82J88eikGvT
	wVFg=
X-Google-Smtp-Source: AGHT+IEdpeiZOhB9p6BzPG2n+dG5uj/m8aGyipMLZavA4DA41FA6uOxitkCJlsSQo6NctVfLWb7LBw==
X-Received: by 2002:a17:902:d491:b0:224:1074:63a0 with SMTP id d9443c01a7336-22780e0305dmr375094395ad.34.1742987347254;
        Wed, 26 Mar 2025 04:09:07 -0700 (PDT)
Received: from joaog-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f396fasm106711465ad.27.2025.03.26.04.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 04:09:06 -0700 (PDT)
Date: Wed, 26 Mar 2025 08:09:00 -0300
From: 
	=?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	Frieder Schrempf <frieder.schrempf@kontron.de>, Hiago De Franco <hiago.franco@toradex.com>, 
	Joao Goncalves <joao.goncalves@toradex.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Max Merchel <Max.Merchel@ew.tq-group.com>, Michael Walle <mwalle@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Tim Harvey <tharvey@gateworks.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: freescale: add initial support for i.MX
 95 Verdin Evaluation Kit (EVK)
Message-ID: <7ts6jkfg2kfpfhteomlhn5ewxetcaav5bi6x5kgtklqhaa5iph@olxjy6l3icy4>
References: <20250324234013.140440-1-marex@denx.de>
 <20250324234013.140440-2-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250324234013.140440-2-marex@denx.de>

On Tue, Mar 25, 2025 at 12:40:02AM +0100, Marek Vasut wrote:
> Add initial support for i.MX 95 Verdin Evaluation Kit (EVK), which
> used to be the Titan EVK. Currently supported is lpuart1 as console,
> SDHC1/2/3 as storage, WM8904 Audio, USB3.0 and ENETC ethernet RGMII
> Gigabit port.
>
> Note that the SoM used in this EVK is a derivative SoM from Verdin
> line of SoMs, an actual i.MX95 Verdin SoM is under development.
>
> [1] https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95-evaluation-kit
>
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
Tested-by: João Paulo Gonçalves <joao.goncalves@toradex.com> # i.MX95 Verdin EVK

Best Regards,
João Paulo Gonçalves
