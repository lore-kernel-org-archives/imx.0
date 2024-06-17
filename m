Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B6B15F335
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 14:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718635394; cv=none; b=K5jQVd0lXrjVL/ccG+M1v7/tjoyxqXEGYYQeVY4R8bA6uemEP+prnyp1q1Lq7XpNimw0+yrypwz3AD+XNIGIGuX/hzToDeYiOP+r72hjR3+xwaHJLzoqGMQUDb2Dtp1nVhOWPxFDsQNJggGE5ES64/NKaDNOwPx3bh8WwmcBslE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718635394; c=relaxed/simple;
	bh=ZBRYz0XGpXpv2eraO3GUW2itTwP+yglswHfa4pbL/RI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PF6zHVMKo2PJ75To+BsXFhVBQ/rWup9CahFyO8nMQmCAHW+efLbKPPKKXNrmgrKCoHjvAeOIw7eC2h7YNGfgHWO76+1qAU9QNYHdUwwgxqLK5EKk+z7wyOSK15FswZtH5KII/2DFAnFfQDBc7xu6k+mZHvgwTU+IXfACAvfpb+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CH/z9LBr; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CH/z9LBr"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-57c83100bd6so5395812a12.3
        for <imx@lists.linux.dev>; Mon, 17 Jun 2024 07:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718635391; x=1719240191; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZBRYz0XGpXpv2eraO3GUW2itTwP+yglswHfa4pbL/RI=;
        b=CH/z9LBrJtJFuSBae7jDKFDcobwkU4WUPCRoR+zUNiuOl+8pyfx3rWPSTLVecQ4Lom
         /tiQ8fUOV1sCgyjmJVFDo9qbJRlVcLYaznQWDRKcHpZ1u6thxMi8dXOGroddh90ul9PW
         zOEGfntXahNJwOrptfNZr8DjpioaDJIfR9m45LoeWEXJHmxsMiRtmvJaA5/jqZKKty2v
         b9SoOife0K/I1NldKc+7HeTNqMn75IaI9OyB+16173gGXs47L9qmdCJg1XHqRF0fjMTS
         zhggJFHDIOZ66xGTxjAmf+PA1UWzaCuN84Jc5lGSEgR1MwfRNNfrlisP+dq0/+nDNULn
         GpyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718635391; x=1719240191;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZBRYz0XGpXpv2eraO3GUW2itTwP+yglswHfa4pbL/RI=;
        b=TqD+zAQJlysTtCRrQy4UrMF5TtszeK2Wjih/cagLOQqBAz+ZGisNhjZG7tkUO0/52B
         tAX1f0b1qwzDLf2hs4jPVBjBIh9Mlr5klPKoP/B4nySVOp6HsaLshFm2iUP3tFCCDHKM
         3ajFwMkCkByfZjxDNgOOQIBzhRiZW7/ksgDXK913mepC4//ryA5TGuuvvtGOIcNTzocF
         c7ZtfVeY/rwGmjEQwV2kZSDAbSiXCOjgdrPZ4eS+ZIdRMGhne68EwreAgGivRiYHlW/8
         3+fvQOVBWO4Mth6/vCvd0n7s1ystM5LMXR3e5ULi3aVxeGs3cI4ypL6y3PJSmGytJjqJ
         IPPg==
X-Forwarded-Encrypted: i=1; AJvYcCU9OFXjsUHwMn9TwZgtYHCenURf6OUBW6zM7+X7JpJDnYr4fvCRCgA46BHt6PO/ebLCjVooH0Stne9u8AXS2Pr/lG7U
X-Gm-Message-State: AOJu0YzU3k5zTifYnBCMPuShNz1dFuT2tHnXomFuKWpyB67WiEHHYJGZ
	ykUDaeabIXLG1I4AZ5f//XdV/rG/L9pV8+M7YBLCiVPuNdarGnn1
X-Google-Smtp-Source: AGHT+IFZCLJUyzlf8fNXs1wSr7SW5vQG+3gjx8K9mMt6pzU9bVkMHLl1SBxe9dWS51TWvl5kQfUcKQ==
X-Received: by 2002:a17:907:970b:b0:a59:b590:5d71 with SMTP id a640c23a62f3a-a6f60bc9ac8mr839107966b.0.1718635391235;
        Mon, 17 Jun 2024 07:43:11 -0700 (PDT)
Received: from ?IPv6:2001:a61:35f9:9001:40df:88bb:5090:7ab6? ([2001:a61:35f9:9001:40df:88bb:5090:7ab6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f427a5sm514062766b.180.2024.06.17.07.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 07:43:11 -0700 (PDT)
Message-ID: <63cd8d0e250a77c1201945ebe13e19ab0fb59ce9.camel@gmail.com>
Subject: Re: [PATCH v3 19/41] iio: dac: ltc2688: make use of
 regmap_set_bits()
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Trevor Gamblin <tgamblin@baylibre.com>, Jonathan Cameron
 <jic23@kernel.org>,  Lars-Peter Clausen <lars@metafoo.de>, Dmitry Rokosov
 <ddrokosov@sberdevices.ru>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Cosmin Tanislav
 <cosmin.tanislav@analog.com>,  Chen-Yu Tsai <wens@csie.org>, Hans de Goede
 <hdegoede@redhat.com>, Ray Jui <rjui@broadcom.com>,  Scott Branden
 <sbranden@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Saravanan Sekar
 <sravanhome@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>,  Linus Walleij <linus.walleij@linaro.org>,
 Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, Crt Mori
 <cmo@melexis.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Date: Mon, 17 Jun 2024 16:43:09 +0200
In-Reply-To: <20240617-review-v3-19-88d1338c4cca@baylibre.com>
References: <20240617-review-v3-0-88d1338c4cca@baylibre.com>
	 <20240617-review-v3-19-88d1338c4cca@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2024-06-17 at 09:49 -0400, Trevor Gamblin wrote:
> Instead of using regmap_update_bits() and passing the mask twice, use
> regmap_set_bits().
>=20
> Suggested-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---

Reviewed-by: Nuno Sa <nuno.sa@analog.com>

