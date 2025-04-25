Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3B12701D7
	for <imx@lists.linux.dev>; Fri, 25 Apr 2025 13:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745588305; cv=none; b=DFqRbLxDPQRMHM8Y+d5hrgP+xd+J/m9q7OFVlvma3bHwaTmkxOFaVaSi3DtfEtCdrtnmZHcst1YDYLcEcRaTMaftiI8KQ60R36+BnYx8OsOcQyOcZDkgpTaxVLTI8sUW3VuZN/klE4yczjezESdBbrQNBvdcVxzu7I4BMMt1VtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745588305; c=relaxed/simple;
	bh=eql/A+0VoqpLXSVZu0IePHu6j73BQUU/xmbRTnd/rgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bBBIsW5EfoGBsMOyuyWRHLrWYUZBfv/+ZEY3PcDFc4UTZz9kqznpafpRFPq8ZMNDqBZqvWEjtVK1yoR27v3gXZrmY7c+gsSaNTfR6LmZ4UEYQraHQPc82rv7CS5sxJvQg6HFQB9qgbMpYORGmBm75DU3Vcl6K/3kuntfNMuPbao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZeQzi5IM; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZeQzi5IM"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e8be1bdb7bso3657815a12.0
        for <imx@lists.linux.dev>; Fri, 25 Apr 2025 06:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745588302; x=1746193102; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6IMOiea3GhWLNir4wotniHxT7Pbt88zv8Te73Hc/hlo=;
        b=ZeQzi5IM7AtVinS/0PxXj4WeN4Oi87BpA5GkSXdWmykIO1qRN2wF4ivF+TYpNhdmSO
         j9Pjx6l8w7JkaH4TApLc9KI/Sllahca544Ym8FQ+WHR283jbCYXz98rkQKzs0tQc32FO
         HLLZXqiDuDzbGy1zBwTjuTPuyQ3z59Urd6QY2XVHqpbGsy6E7CcL4EsTvWuUODqeQkm7
         wEha5kb+KXkCGqcD0EcyTsehRRWVZH4Ji59J/stz6CGFW+JsTXJ++O5rFHXIb4Nf0C11
         Cbrp+4J9/sgbXaNQpR7wiA75SFkxedxYlUnd3t9DnGAplGjKQb6k4ho9OWzdSbza8gja
         3/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745588302; x=1746193102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6IMOiea3GhWLNir4wotniHxT7Pbt88zv8Te73Hc/hlo=;
        b=CJIQeIDZrpIPbC1raN7Xf3b1qHNDbbGjgc85sRSlIf5Hz8cQS9chNUpBtFMdkj45Yh
         3w6AyHTcEbWmPdaMnnRedggutdvex20CqFnkC32edx82x4ejcUAuG3RwoQteN/p8Sdlw
         Dbyrpjt+ivSyUREtL5NFSf2ZrOQ2hp/AFxA6+gvclC9sPNoDAyTEA6ULbp9nDGK1kvNA
         ufLD+Vo6YIEi9U7ssU41dT0WtLxNz0jz3RaU5jdbMDmli0lKag/v0/srDQt6u9szFNZ5
         t3eadsWU8Ye/Z0hjr0SmbaIXpYKxomV9IgdTHje+/0RvPeL20785h7nH9PppvMPN/3pB
         n/Xw==
X-Forwarded-Encrypted: i=1; AJvYcCXAeq7BsphwbMjBr9/JT+fUoQ1XxnuF3adJYtfAo9Og05dPL8gUw2tV659IG+S7c0C1XFU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwZIe7+QRYtOsbsMJawZwJncbRk9E0pUzIqqX1kr/bme5K3Vo3+
	redUbu2Bs+bji27phn63pmVo37ddKuk1qXr9rx1z7vhsWKD22nQsurqkN+Yk
X-Gm-Gg: ASbGncuK6TqLUuLRR/NjlkjXp85bOmu1A1iS7PQtKdjuD2cek9H/y+uu8MVd4mUKh9z
	F7cBgQ0rGswqj5WhvBIay+P0zNTMc5WUsr4oPOhl7zLdz+rdueBgoSeW1pQtfLIMBfqVl9SPWTo
	+sXaPvl7Baf36D4MAKA3Ejfz7gWneEL8xtTPZVSBMHx+G/+RkTxYpoPEuN9kgXLiMDQ3jes/4sg
	4KoIyWwp9Ii0mm4SqrwSRNqU0ZXrir9zstbNC8l9pGF9yRE3vsSO0QO/wHMxskh3MCcrIkq1X6l
	KOA0dI+HY/Mejm/Nt78A7u/S5qEqkzZdz3tNxICu9y5I47S2gyPvrRM=
X-Google-Smtp-Source: AGHT+IG1oJi+fCaW3nLcNOn339NORpBu1OpVP+r3+z/N3hqTIFh+IGeR/Kz+ryWWUdgqSktDSZIf3w==
X-Received: by 2002:a17:906:730f:b0:acb:88ac:e30f with SMTP id a640c23a62f3a-ace710c6585mr259076066b.20.1745588301955;
        Fri, 25 Apr 2025 06:38:21 -0700 (PDT)
Received: from localhost ([217.151.144.138])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ace6e4e7a4fsm142045666b.61.2025.04.25.06.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:38:21 -0700 (PDT)
Date: Fri, 25 Apr 2025 15:11:55 +0200
From: Oliver Graute <oliver.graute@gmail.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] arm64: dts: imx8qm: add system controller
 watchdog support
Message-ID: <aAuKG-_vk36dK0is@graute-macos>
References: <20250414-imx8qm-watchdog-v2-0-449265a9da4e@bootlin.com>
 <20250414-imx8qm-watchdog-v2-2-449265a9da4e@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414-imx8qm-watchdog-v2-2-449265a9da4e@bootlin.com>

On 14/04/25, Thomas Richard wrote:
> Add system controller watchdog support for i.MX8QM.
> 
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
Acked-by: Oliver Graute <oliver.graute@kococonnector.com>
