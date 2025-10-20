Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25369261B8A
	for <imx@lists.linux.dev>; Mon, 20 Oct 2025 15:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760973508; cv=none; b=hIE159n8OFyrZQuhJTKTPlJ5VdfUJ//qoko+FpTyEWb5qnX7xCfUInQpQNp/jVhHft6UkBJX/Phjr97yGUO7E02Te/DYO/djHojvT1xQ/mPW8rm1v+Fx56gJxc2KVLp6J3lfX3f5VVYXoARa9UCcTvSbYDTHHTE81VJ3FTFmE1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760973508; c=relaxed/simple;
	bh=Jyxeti9uUZ9Fw4cj51QB7FVlE2BcnZaTFx9SeNp0Vgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RyMULciJJHvNN4Yg8zzh8mBhdi6poMqOS+GZyHLC5zXe8h+yR0B+LrZv6x1Os6AeyLDmS8komURV79Km2AwS48RnqWvQGYlP68y5DpM5Kd3NSSCw/E/nw5pMv66Jp5o+QRKhrndLfVAh37eVebx1BrqEGlvz0xQjHcxqL927C0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hqgbKL97; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hqgbKL97"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4711f3c386eso19903905e9.0
        for <imx@lists.linux.dev>; Mon, 20 Oct 2025 08:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760973505; x=1761578305; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EIri8gPwCvgxzuVNcP5Ad0/5z9CcdBUeY3ByihuZDbc=;
        b=hqgbKL97H7QzEizoEnvMdnKe8n/HD7CXu/gFp2Y1U3ACZ4bZd8g30+p9G681BlkHyM
         gDb1JsltorNl+SwLrvGKeaKJ7bim78puKAzI3SDwTMopf/90bwtHEpe2ZvUCqQ63H5Rl
         aN8SZldAahP3mkYaEr9M78ZCMg+G0g4qCuiZrHmIGYmj/B7ZcXACB7XroST27HGm9/ak
         s+Bk+tKP7zA+y67S5V+AcN9a3u4UG7ZPrTIsJv17+K8cwYI2G1cIdyPZO+kNaHRti5ge
         DxdqS1OqXKSF05VFHdd04+86y8TDj3DpHthfMus+ItnEa12LyZ9XBbNwYzpsNCiQ0EmH
         EMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760973505; x=1761578305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EIri8gPwCvgxzuVNcP5Ad0/5z9CcdBUeY3ByihuZDbc=;
        b=hk5lNdKbpWBRUxFPM5H0twIycQoibm3oX4fV38dPQhnFurQER0tHpfijHKEnn70t9w
         irG5JQ36m+j44S/BmF+exviZUsp0JQejpNkOsC6oEHz2qrDZEDWYXWnBROWT01VribzJ
         KUI9QToJpklzurcEc6myyCGNsC22+tcsh3n+7J7BHktmA4rEFtyaWljhdDRb3vw5j4qr
         dU/5zjQMSZnSdpJiddL6awCDJdQBiCfj2JeS62in8HEhb4qS+gfyS7R+3lgMU6rsnYDT
         Mvfv2I68f+nvvNPK6gbgLYZ2R848l659fyDwOlnLL9ytPZfyIdf8uZ6c5aPifj17iVQ9
         c9Pg==
X-Forwarded-Encrypted: i=1; AJvYcCWABG3SRjtmb9fu6nAujERV3qmdkOkwIrYFKmItwYOz/8NKoavRPgce6RE0QuPn/O/hkfM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzBEtNKyV4NvawjaYw/kehF6u49FOeZF9b9+cjeR1Yh+ALlimjm
	+Lhizph4Jx1BdiXJl6x5d92aurVi+zyi1Y98M9F5lbjTuzMZYRfKgxqn
X-Gm-Gg: ASbGncv8CD41+Ay/vu+NnaAur4Nw+vwcnPOJonBSiJ0Sf73hAh4AU0GhiNt8v4w8ttz
	dH0QQWbbHWYW0vDJA6GafsvmNVXdV3CW1BARVrY412zlv2B+04E5OEVlJoQBb4TM2qIgxMvcG8g
	Douh+/jTL+sI8U5Ga6eme37BfsCfrf3RD7ocHILnXn+fpVZcGP5AWcbbP12/OltINxXr1/UpaGP
	mAgL5+MzCPvuokfB8B9wCpzVyIcYmV4ZVA2vtK94LLhvOQOSW5kvcOj5oNQF3tTrq2i0M1yP47u
	yOkwIweYfV96fFSCEZbHA1kczOcLlpwHHnMKabvb6LHm8GwnkWwBkgysFYMOkw4eIpV70Nm4+Cv
	SVEiR456aoEZnJZxTg1aiVpJv7xVKP5g5lJ4EK+z+EsFiybTlsCbxYUQ0Xx2zYmudOpirO/wntX
	OtSnbEuLPusP3SJukoYC9d29m6h8XtE3v78usWqs4UO/8lViPBkqMUGDC9QI8q3G2/EqkZ
X-Google-Smtp-Source: AGHT+IHQEYoBMcfx1b6Nsx/IivzRuTLpzyAZ455r3ZJisHcjzwPbpeFkoct3AeG4wC3jqAyj6VhBUA==
X-Received: by 2002:a05:600c:45c9:b0:471:115e:87bd with SMTP id 5b1f17b1804b1-4711791c601mr98951155e9.26.1760973505153;
        Mon, 20 Oct 2025 08:18:25 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00ce178sm15617638f8f.46.2025.10.20.08.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 08:18:24 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: devicetree@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>, Liu Ying <victor.liu@nxp.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 1/4] dt-bindings: bus: don't check node names
Date: Mon, 20 Oct 2025 17:18:23 +0200
Message-ID: <5930653.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20251020060951.30776-7-wsa+renesas@sang-engineering.com>
References:
 <20251020060951.30776-6-wsa+renesas@sang-engineering.com>
 <20251020060951.30776-7-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 20. oktober 2025 ob 08:09:50 Srednjeevropski poletni =C4=8D=
as je Wolfram Sang napisal(a):
> Node names are already and properly checked by the core schema. No need
> to do it again.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> I'd suggest to give subsystems some time to pick this patch before
> Rob applies it?
>=20
>  .../devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml        | 2 +-

=46or allwinner:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  .../devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml | 2 +-
>  Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml       | 2 +-
>  Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml   | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)



