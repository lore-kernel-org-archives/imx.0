Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DFE3128AE
	for <imx@lists.linux.dev>; Thu, 29 Jan 2026 19:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769716280; cv=none; b=Qj9GumJnMPutemoEFa6nbAjrRHXYYmmPnFXVXE2J5VaC8Z8AYBPWFu3jODSYBr8YN7j0HQ+XhvTfYO3t9XThEy//USMFKDAsmXLEAGt9ShQAeqgr3QQQt6YfWMSbbycFrge9mlk8rBStYbIhmJwY0nwCJKO9RcIJo5QMA4t+0bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769716280; c=relaxed/simple;
	bh=kz/UmQnF/kQZX0padhdk52aftyV/7o2JgBiZXIT2EDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PAIqSlYeWZzJp5ojDHnHKMpq+CKXZV7LH5pt4q8v+5JoAluunkXYGrATQJ44iE7s8wQ+fvQlX8w1ERvqJXnBlAYxXc4ddhujyeg++YNSVavKtYXDGsztq80YOxZ517w2rcdhcdUq+LBUpW1XAg7LXHLEJq6a1F1ozhUciMLmZAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=lh8bTCGz; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="lh8bTCGz"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-81f4c0e2b42so770323b3a.1
        for <imx@lists.linux.dev>; Thu, 29 Jan 2026 11:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1769716277; x=1770321077; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MnxwsZAxF8STswOuh2vgfeXNVDToeemAzI/Ew3hWeYM=;
        b=lh8bTCGz7RREhkMLNQizREHIfMxZp8tc5ceALlSOGwvHFzShiWgsT5g5S+mC6o+dbt
         Xs2Hndjjx62Y/G4T4UtJ3VTEPF6aZNONtLb4gpZPbeHw7UTKmhVcc4TZaCpDJP0/MX3h
         mAReHY+up35/GbX13jOkmkmkvhwbCXneYRnC+hwx9jI3iolss2eUia/4ufrbNsvrZG/6
         dsBCL+Quf7VQGbm2Ir2a319I5XbHiDzUUaJrMHWjBrg7RKlJozDKijsOvf44oihP2jAi
         h9L5oPDYQ4UNiUNex/vBJ7bguDOL1m3nzSaf3C5pa3Qpkeoof1Oqavj6e+vzITqaX1ej
         EEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769716277; x=1770321077;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MnxwsZAxF8STswOuh2vgfeXNVDToeemAzI/Ew3hWeYM=;
        b=e5VhpwuBPb1dVzcWjVKwAiyi0rBaokSE1OQ3UGEp8Bc4fMg9mpamVfi8s4tsTwsk5s
         TpUA+HnAsczwp9zm906UYCoFj3uth12nwDfnw97Rng0wnQRLACGuWUoud+iwruS9ol+2
         ROmFJDs5rk+avRwTJmQ/5xaqg4D6VFDBrvdDH//edQYJEXZ9D86ugV1Xa2Vt0Ii/uJ3u
         pBdmp4gl9QwdpTVBU6Fm/OxXU1Fl6rVZOVNIlQ9dL29G5W6kmPEgrMcWcdaSgPHA/WwN
         uFrTOZaZggATpGRkqGUnM0hsnLYk0hs+OH58udWLb4dzGqV/Cp9/lUa81y7OE5ibpYHx
         77FA==
X-Forwarded-Encrypted: i=1; AJvYcCUg4jbB2OSYXLh5r1iWH6qI//S4jaHnQu1osB/kvWfjXQJjO3xJ4/iPH1evGjoYzrCf/nE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxNfghikHg+xIvnfcbF2krrBwVgQbg46ToT2ljFdjeZLyammrSA
	NVVxuw+W0oofk5UjnHuZNSbYp10Wj1GkWxV2Mr80G+IY+KD/KQpkE52d4hVPxjy0VTE=
X-Gm-Gg: AZuq6aK/PeG0aWMOo4VWgd7zmDxAWJEC3N9TTMwa395m30rEnqgU2uOkxO3JFTjD0wE
	XjEoE1yYwwKqHSU25t1L+Ftei37mPChIYszLsRkdhN0drYOOLwmCMiO1F6LD3MZwxNow0v8vzOL
	5fZKYfHnhqHT9jK9UK+lOAD0OFhw0Ph7gnZDlcmkatefIj78KmJnhq5F4Oh6nfWfFUCVu+4OE7C
	/OfsuF53GBclI+iqMRzyG4pRJibes5N5Z+xuZd1cV2wEErsiF64qm8lyKHn1Saw4Tpbu24+E1WE
	ndD69fMLkDXDbC7hFnEk182X2NNRBi6EZ1yMGQHJ0WcudNx9Uax4kbo7OAikhv88BR2Dgt1ta9j
	PzMQ6gTcigbEeeF4lunt2Svj0uEXNLb64b69m99Q7+WpGcpEiVm7RIBP4NZTLcJshBgesJ21ptw
	0Nrg==
X-Received: by 2002:a05:6a00:3d42:b0:81e:dcb2:52cb with SMTP id d2e1a72fcca58-823aa3fd50dmr448408b3a.2.1769716276774;
        Thu, 29 Jan 2026 11:51:16 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:3::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c54d4dsm7133424b3a.67.2026.01.29.11.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 11:51:16 -0800 (PST)
Date: Thu, 29 Jan 2026 11:51:15 -0800
From: Joe Damato <joe@dama.to>
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH net-next] net: stmmac: spelling corrections
Message-ID: <aXu6M3BKyDhJIXIx@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-sunxi@lists.linux.dev
References: <20260129-stmmac-spell-v1-1-c7df9a96e482@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129-stmmac-spell-v1-1-c7df9a96e482@kernel.org>

On Thu, Jan 29, 2026 at 05:35:03PM +0000, Simon Horman wrote:
> Correct spelling as flagged by codespell.
> 
> Signed-off-by: Simon Horman <horms@kernel.org>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c        |  4 ++--
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c      |  4 ++--
>  drivers/net/ethernet/stmicro/stmmac/dwmac1000.h        |  2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c    |  2 +-
>  drivers/net/ethernet/stmicro/stmmac/enh_desc.c         |  2 +-
>  drivers/net/ethernet/stmicro/stmmac/mmc_core.c         |  4 ++--
>  drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c  |  2 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c      | 10 +++++-----
>  drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c      |  2 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c |  2 +-
>  10 files changed, 17 insertions(+), 17 deletions(-)

Reviewed-by: Joe Damato <joe@dama.to>
