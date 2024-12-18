Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD8715B13D
	for <imx@lists.linux.dev>; Wed, 18 Dec 2024 09:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734514559; cv=none; b=glsBtLQZxQcXtubrj0PIvGAiAAU1Sn+A8LwHX2oHbx0cRc+KdCw8ot4uOLmwHzG4ULyFz7H/jPJ38L50cebUVYsGbxIgGs7kjVRgHphv+1l3Zhx4/4KjsJYHiTKG41fkFigtYkmLrdYmz1uSd0SJLa44qUenN8SY5Uk75EwCYWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734514559; c=relaxed/simple;
	bh=FJq1pYapoccia/BgWigddIl2gQuB1ofXOmvP/EMzZEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UmwtSbFWG7zyA90mtkz1J45U2u1RsbKA+GgVNtTkJXhq1+i5tH4QL1ZDPV1Eg3Y1WJIjQlneWH6OBX2Pjbu7G/JXln9Rk7I2keJ058/68T+l4BRaaxtO/CqGAxFvAEXw8ino/CGMor3Ljqh36sK+pZteyj1H+TgQTLGLsCBtrTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ThoEDiEJ; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ThoEDiEJ"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a9a0ec0a94fso980841766b.1
        for <imx@lists.linux.dev>; Wed, 18 Dec 2024 01:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734514555; x=1735119355; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3N9Pq3W0yA6vyS5UgH7SSPLqSJKsQrk0GFj7xmOShmA=;
        b=ThoEDiEJbSD5KbIKmXS8QL+kK/ik4xSKrnevo8Q1C8o/tP7Rv9wv0S3f/8IA7/igHL
         U+LNXW5GnXFZrECPK/1f9+c+q7AooHdLfDQclRH53DsWXIkTTMMfjFSPjiuq2HgTMrea
         6C2wHqDIESuLcgdiJmuDjnsTo23yrSer2H0KOD0KaOV8jLzDwPVZy8V3Qux2pL7pOtka
         ib2xAqP29vCWx7wzmC502NubbuaZBa24OesGMb5R3YM4v2pHKufiJhd0maSSuD03IKH5
         QDj1Ca9S5jHHx7iymgL4e0zUtmIzN/pd0fc0eRiR139O0e92qgcVHGKSkFPGXpFHz+n7
         fDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734514555; x=1735119355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3N9Pq3W0yA6vyS5UgH7SSPLqSJKsQrk0GFj7xmOShmA=;
        b=BdJnhE1YUelAK/YG/K8EcpOpthrh3R/N1v9jwLsSvwxrboOycOdCPWlDM53aaMq5EH
         S+TuJAErw0Uwdq2Sa2XzkEmgPfdBT1JgtiFo3pXKvoN8v49stbchqrJuEbkd2bcxgQe2
         5MmJHVnbnMeSFTrDnmwwuijNC5XonR0x4uMLLfMhHZyc+uPN/uZP/7xll6GqQgmxRo2c
         CkVamx1Mt1Jl9J78xvnW2qRwObDG6q0pVNnKzpg30rFB7tjlJalDNB2hWgl8PcZDCyeC
         Cn6aFSNLB2v60KBQxtT9buw0AMhP2sEaBBwWKk0XAibM+nVQ+clh0XL2ZJ9KPxSAscUK
         BMBA==
X-Forwarded-Encrypted: i=1; AJvYcCXZgHEDIdmOMe5VhkNygHPUdbswcQYL5gN4P/h/d5mEhTkdwQDXplEUNqNXuETKvSdBLzE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwkoJ34/Uk6a+0yLqyRmDqnbIUo9UPMkVNGUpxXyU5qfaaXungi
	Y3o3ZsOe4nj7y08xspSpoyhn5vahKHaMhdoifPRN2mbFPPMCHqluKjRV25/1w7g=
X-Gm-Gg: ASbGncsINAcu58w1pX4AKPigoc9SCvMQseYPtcpYDoyzQBH7fPIiwbjpPhYYpiyiRjX
	wZFT4B7Hc/X9BIivGw0/yISOSlpDjiMPFogeYD5UQ7drZojn0cLYBf5qD826LW1WiZb6ItF6Pv0
	4a9BXyCfxQaPyZyBDLZ2MlAeHCeD29iea+TTaB80sPrqEdIyRbV5kP6pTmgkW7zkfft7x3oOtvl
	b7VLYN6PBdrYUmfKDxOINM2n8QqwvVACfybl5XbYRK2sNm2hzCkM2cZQ0JQzA==
X-Google-Smtp-Source: AGHT+IFaGu0nRcRN0hBkf3tpYx1H1DRFGLVAT0p94ikyhVxYr1CI3Q0jpFhyrnZ85QBDos4sy3/DvA==
X-Received: by 2002:a17:906:3b10:b0:aab:daf9:972 with SMTP id a640c23a62f3a-aabf4787284mr163782066b.28.1734514555568;
        Wed, 18 Dec 2024 01:35:55 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab96068928sm538861966b.70.2024.12.18.01.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 01:35:54 -0800 (PST)
Date: Wed, 18 Dec 2024 12:35:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
	andre.draszik@linaro.org, rdbabiera@google.com,
	m.felsch@pengutronix.de, emanuele.ghidoli@toradex.com,
	parth.pancholi@toradex.com, francesco.dolcini@toradex.com,
	u.kleine-koenig@baylibre.com, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v3 1/2] usb: typec: tcpci: fix NULL pointer issue on
 shared irq case
Message-ID: <3f6167b6-f3b1-46d9-b436-ac4e7b42a7d0@stanley.mountain>
References: <20241217091208.2416971-1-xu.yang_2@nxp.com>
 <5260fafb-0b1f-43d5-83af-a61b3b179a1c@stanley.mountain>
 <20241218054547.bbbpvqledrul343f@hippo>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218054547.bbbpvqledrul343f@hippo>

On Wed, Dec 18, 2024 at 01:45:47PM +0800, Xu Yang wrote:
> > > Fixes: 77e85107a771 ("usb: typec: tcpci: support edge irq")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > 
> > 
> > This commit message was not super clear to me.  It didn't mention that
> > it's tcpci->regmap which is the NULL pointer.  (Obviously there are a
> > lot of other NULL pointers, but that's the one which will crash).
> 
> Ahh, actually tcpci itself is the NULL pointer and kernel will crash when
> get regmap. Because if tcpci is a valid pointer, all of its members will
> be valid too. Anyway, I will add such info to commit message.

Thanks!

regards,
dan carpenter

