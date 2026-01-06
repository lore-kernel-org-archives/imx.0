Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2F0311959
	for <imx@lists.linux.dev>; Tue,  6 Jan 2026 11:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767697912; cv=none; b=hPXwnvekENm2rTJ1fGCgLxjKWXMy4fAlVJ5IUmysrR79noYChSpfiL+PZXTTsBFV5cXy641sBVDwG6chivF0x0TrbGl2vjWfz+eaqto0pj6RptZ8+SBh7kWI0ug58g0uwtTd+VXgPEYigcVIXAhxpFIP6BEv8KvQbwTbLDtBId8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767697912; c=relaxed/simple;
	bh=a2F7YL8leUAOvlvMu4zckGihftKbZ2gJp5pJWtEpoiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bdhMac4TvFY6kyO7jiTHeiqn+7aKHTlAyQ3HDuNKTcYsXDgzN+vXnL4BPIx1L2mjvgCPvDIUJ9Y8o9RB1XK+5oh0OfhjvBiy0MRF9oB6RYrk76MTV6+NBoXPclvmphAjTXemwQ7xOwsAA+spwN2d+XnWPmuql+IkgHUEIIoz/W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R5TNH3DZ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R5TNH3DZ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so8892785e9.2
        for <imx@lists.linux.dev>; Tue, 06 Jan 2026 03:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767697909; x=1768302709; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V9SJsn0IaBRHmsN3YyFL5FZJYk6K2cgBjWAKNd98Wh8=;
        b=R5TNH3DZ9oJzKANxXysuqpmJa0S/xLgSfKq11VBr5oT6S+3Hl/xayVTTDeeKPvZW3i
         SUeVSc+0dbfpqk5Rkmfc1oMNzAJubf5IxreDTpQLEQpaK2UlxvSB4qg1lRvkFtwki0OD
         KMTIjm+3IE57pns1JqfH3Es8BTzCSTb2pjjld2duC9cVPR3qNZPnCwsOzcs9oy2P4HIg
         XlPwKK1XAO0Ojtq9teklQ1Vk8ugdy2ynYhArmAncckcjnI6IJmJrmm5El0peYU81vK25
         W4RBeY67Liw45HWaz2QWuokqkMaY+zV5uX8MsMVZCiyIkRgTr4+1t9ge0Wc1k3kbDIcE
         arqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767697909; x=1768302709;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9SJsn0IaBRHmsN3YyFL5FZJYk6K2cgBjWAKNd98Wh8=;
        b=PZo9ZzQJow8xYorQMZqv94hiqldOyNhycyLV47XHBiu5JR78Rvts1fMaqmkJgykMsT
         B3URNAl2cEqrOOTy8rz861r1x00TDTadOOQ4ANb5n541q2ph0KqN+s6Y5j18xBLk1g2X
         VokXkeWz09+jACQzeIb8dhH/XXtIgVJQjISH2ZEiKWBN8Gp9JjPC/yJCNPAdtQjhc4Du
         n9xbNCwZWU2HbQseUACkgLGU3gHEpiQgi76QL+fNs65D4blYARTNBgo+ekVN2i69Z2Vs
         3WsK3HKgD5zrdaXVEAIm4m8zLgiNK4vRg5oTWjCagtYNrXXAw0eyAU4ORo91N4oFimU9
         zTUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCMP7ZeCV47niTzYsXA526P4y+b8gxmpHogbVUJwnnB7gco01dGiyoqIygqrYWVC1m5jY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwfFpnSj5DZxhcQIf1z/nNiXsTw35CpH73Ux+tyyQlKOOTGB6KE
	Gt1NmFhdzr0Hvmv9H9AGQK1DdaewITePctPBA4mEDjyLsxx3wuaOo6n4
X-Gm-Gg: AY/fxX5gZcKEINUen3jOLU8z++1ptc2Uby275W5xkFnBhi92lgxU3lJOJ+82tFDsY//
	gKK06CWe2tiCQFcH8lCFHA697Spgul684LANOQ8cgH5gckkYKkyv84KY8x4fr7r4WwouM1QMHur
	VSgyIFpVrx0op6PaTCH0ZyZs8HudUD1MKRjhcbGIbQ++Qt5ESFMwm1ttO6uWIik1J5AKaQfdRPY
	PgWbZ84srLe32712WLYA/Vd16U7aijBKIj2TwNWeGLPNoQxdo6iMhnT1hqvK9Tp9Gu7avuDhW1S
	CLu8IET7ZdEUFoyhwPVK6owClqEZLDb3LWWMqWsOcyun6vfAqy5VAM/HhLoDHL6izI91ABbmlYh
	TgwEr0VDaLRgtTLOnc8gtzG1WwrcVxOWsNeo6DGhURVaoqFEeRre9UAGPdTTp0mZ3P+8X+5sAu9
	tbZZsKiGsyNDDPxYzy/l0BvVav/p7+X17TUuakBj5GqZ/movnZxHr0pOBeVZLtHW1rXNIoJ6BGA
	st9qTGj0bovqNUfHnNEWmn8lVGWdpmV
X-Google-Smtp-Source: AGHT+IHUuYlVORpetXhgVAXfGMDXsPDVfwvE/C/OPeXgrPCsTr8liGY2193dNTUJMH/upS3YC04ZsQ==
X-Received: by 2002:a05:6000:3105:b0:431:864:d492 with SMTP id ffacd0b85a97d-432bc9efe6bmr3137882f8f.36.1767697908526;
        Tue, 06 Jan 2026 03:11:48 -0800 (PST)
Received: from Lord-Beerus.station (net-93-151-204-73.cust.vodafonedsl.it. [93.151.204.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee5e3sm3797112f8f.35.2026.01.06.03.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 03:11:48 -0800 (PST)
Date: Tue, 6 Jan 2026 12:11:45 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Yannic Moog <y.moog@phytec.de>, Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/3] arm64: dts: freescale: Add support for Variscite
 DART-MX95
Message-ID: <aVzt8XemmIPz18aQ@Lord-Beerus.station>
References: <20260105102412.6674-1-stefano.r@variscite.com>
 <20260105102412.6674-3-stefano.r@variscite.com>
 <aVzjQEhpv4fenAWF@shlinux89>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVzjQEhpv4fenAWF@shlinux89>

Hi Fabio and Peng,

> 
> CM7 support still not landed, and VPU support also not ready in upstream.
> You may need to drop these reserved nodes.
> 

Thank you for the review and feedback. I'll address all the points
you raised in v4.

I appreciate the work you and the community are doing on i.MX mainline support.
We at Variscite are starting to be committed to actively contributing upstream,
and we're happy to help with upstreaming efforts for the i.MX family,
including driver development and IP block support that may still be missing
or lagging behind vendor BSP.
If there are specific areas where we can assist or collaborate,
please let us know.

Best regards,
Stefano
