Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D9D2D8379
	for <imx@lists.linux.dev>; Wed, 19 Aug 2026 15:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787151740; cv=pass; b=ogc+L/8XLT2PJRsllLF+GtTje6wTLwUV/i2B3qVihDlkX4yGrHvN19IKxTyNjet5+qD+oKDnxya1MGPw1PRmesj+ix5XlU8S8Tl5MXz+bHz1gkmZ628HeFTJ8S2d1HHSyrsTk1KkdmrzSlxt6aeTH7J0j4dsriB0Fb5++6P53aY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787151740; c=relaxed/simple;
	bh=Y2mlUUUB/KRRsTD+WBoNTXGIM5Yr2t9stv66pcM4yS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZkHmpdBSHWt9m6WYDm8rHQzxnG5psKUSp4iSm4iLxW+3LpmEb1sJIHWIl9SKGDOu8/cOJvmJAlRXsfXlGBaJOhEKEpDmV+i1aZH3f+G5axaA23j485YPiy1d6O8Yox2tQGWEwb1HtC/qQ8sulNvwh3XrH0doh1HQkKQH+JanlFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UTCF5RC5; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UTCF5RC5"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39dbe684115so19721061fa.1
        for <imx@lists.linux.dev>; Wed, 19 Aug 2026 08:02:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787151736; cv=none;
        d=google.com; s=arc-20260327;
        b=pV299g6aHx+HgSSRnzpoe/3FQ/gyZtXjWcql1fOTYPRJF+b8AnDDG20inXnf+BldOI
         H5ZOeAmZMoIh/QXGXloSw9I9yla0AWiWElPKaiYJM2rBWlYk4hlA+xWanOgPXrbbzZ2L
         DEHR03jWYsUj+kNHd4tu+kmTgOTaSMROh+s/W4RRganx/ssXXzZUdatO+GvweSXbnfcZ
         L6gghviWYcr7h6SSlxLV3DEbWFNrgB88xXmDMgvCW42cYgioNAcj2SW56KZUU2V3xFcq
         NSRJKwNT4PaNZ9nVmlX2PIMfACbBT2ai8wmTMziyTmNSYI2S/PhdBCOHV7l3jcDGtkj/
         Y9Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ymew9bpImdFjLeF9c8WC+a0QvVk3Jp70dtm/1rKnmb4=;
        fh=jw+8s7GskGZQoJMCpwugpEQoestpitCbhbmzq+R/iIk=;
        b=DcnpU3ft9b5drYKwQmUxMvh5nn3hLTGSUOSC+fDgTowjzr21UornM2AuE3S+Hux3ry
         f4sESL1UoQoN2tdDEzPhmffjYiODIlgseS9EFznfWtdi73eWfA5KOig5yt/pe06gqDVp
         V6k+rxRCDTBdKD41UQew5rendKsMvUQSmul123hJ22SUX0QV4CgWjReMd3U7drI4EBAa
         St7S20k5cifKImqX61Trip0pRgIF6ARNX1ImV02OksHzaKS2MKpEhqJeoruSMQMIaCWd
         0/bAstoIN9HkEZnSDl10gy2e9hR8QG5oqljndpxZSSOOVPuUf+WAEguRB3ZDwqt3npgP
         pfvg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787151736; x=1787756536; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ymew9bpImdFjLeF9c8WC+a0QvVk3Jp70dtm/1rKnmb4=;
        b=UTCF5RC5cj7WUltJjtcTFonrYQwk8OL/TIPb2VIHb4yUPLqMhxC3TVML2arp+X0qY1
         HlClDS+E03sDanr6Jis8nnmy8ii5ZTt8Za2bVv3PClfsiSHIZRtfzfaCOcaZ9vM3WJPL
         9zKmBv018MCZ9lQwq7d6NJUqQwvqJ5lV0xyXT8jbaYSuS5ZWuzC8jo4HYx5kLP3+sSRE
         YFqYD9jHHosVbSYut1SAHFzISR2JioxUTw4v4EP/dY+26eF8VS2k+ebq4y0zoIErwB15
         t1AWzlaE5nibOBU4DzWtqGMh1nOZZQ4yO6yIxWwOY4QFJU4SiXLEGebvA2xQLYAdOAsa
         Oh2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787151736; x=1787756536;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ymew9bpImdFjLeF9c8WC+a0QvVk3Jp70dtm/1rKnmb4=;
        b=Um63KYY/oZc+lKHNBxXpxw8YPfZq6XC1aUkwd1OBmldmAxALknwriNQQqgaBrTLFNo
         Ut3be3UJ3IDnJeKoPtnNVHElV0wZT8ySpkytsdNFtTE1vd64NL2V776Zxd7RfHyZ2vWO
         Mg4AQnLb9ecRHwDNAYFD0WOyriCeYNpnU1fgx0ie3nGYHKQba90A6hyuPrN7k7RVcaWW
         Dk5A4OpBnwuxGgf3cnE5GiWJhQwh8ZtQO9Dpj5STm3e78o3RpvJNIb9DdWmlDHZJxrUY
         AukU42Pu6PUvR4R6tNT+8BzgseP0MVgTz4fm/HlUKSBgl8KfWEn9uqmSmhmtlY5e3vKf
         VGnQ==
X-Forwarded-Encrypted: i=1; AHgh+RqZqlC6ffK/hFPnMoXVw3/lqFT1XSM/Fr5o3a/TvmE4UEKn1gcCcYnsJjEyir1zDitvTuo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzpengiLEkifPo7RqH+atNOexAdVV6eXRJrnzhckOLXogpDRjCM
	g9lrZU9tSY+riuZ2t83g22gll1AkdRVTJ3oU5SI/Fr2sZUtuPdPf9eIG17QamaA1uaxL/SXSSXg
	IS/KAxf1RYAFmMD6/uQ9SZLCASaJqxjk=
X-Gm-Gg: AR+sD13XBY6m0MzKILtK9xjoSStudnSlSuVrBPeCg/8D6bX1+BmQ3pVuPeofnXOtL2h
	eiVmVI8Sd0fvPBFOwSazBxNEl6ESuEnkd2YVN/R9dSomsR10OcSNcAcRfLg/WzSvQvTmkzbqo0Q
	yusUumJonDQ9WQr7hV3Lv9nxS7YIPRvzVCXqntSoW28UgDuy4cT6+sJmWHC9Sw9GCr4dilPDmmB
	4qBP60+npeKSnXO7YKYxCddsiCB2UcEfTYoSZK2pgS7oKYI8abuA/IWyFUdmVXmNYHPCUI+eH5w
	AGVllRxpgMtxzDCIFRlif9v33nAEE/b7LqbQihRyp/2cYb6y03ioIW/MI1dTfvjrQkpQjJdL7Gp
	s4vu/Ljih7GdlMhtrr9CPPWBoccHcOtNzvg==
X-Received: by 2002:a2e:b8d4:0:b0:396:ade7:4153 with SMTP id
 38308e7fff4ca-3a1880c90f4mr9383981fa.0.1787151734863; Wed, 19 Aug 2026
 08:02:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260819090543.585131-1-Zhipeng.wang_1@oss.nxp.com>
 <20260819090543.585131-5-Zhipeng.wang_1@oss.nxp.com> <20260819092506.832631F000E9@smtp.kernel.org>
 <aoXAXFI3kRWh98R7@SMW015318>
In-Reply-To: <aoXAXFI3kRWh98R7@SMW015318>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 19 Aug 2026 12:02:02 -0300
X-Gm-Features: AcwNN1XMaFpCa6LnLPfbr-oPlJfW99zg1WbFRWcOdgz5JXtHUa-XRE36iSsmIpU
Message-ID: <CAOMZO5DT63sfGdUXiKNK=ihMs=rXbA6kBUUO4TmE1o=e6dkxkg@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] irqchip/imx-irqsteer: Mask all interrupts in probe()
To: Frank Li <Frank.li@oss.nxp.com>
Cc: sashiko-reviews@lists.linux.dev, Zhipeng.wang_1@oss.nxp.com, 
	Frank.Li@kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 11:43=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wr=
ote:

> Make sense, this check should just after
>
>         data->irq_count =3D DIV_ROUND_UP(irqs_num, 64);
>         data->reg_num =3D irqs_num / 32;

This is what I did at:

https://lore.kernel.org/lkml/20260817190621.335492-2-festevam@gmail.com/

Zhipeng, feel free to include my two patches in your series.

You also forgot to CC the drivers/irqchip maintainer.
