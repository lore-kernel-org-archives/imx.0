Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA4B28DF3F
	for <imx@lists.linux.dev>; Wed, 16 Jul 2025 07:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752652425; cv=none; b=GB1EfIn1xJEtP7qNw+z/JbByyjaOMnESN/gIn6gUZsHd9I0ASbc5SaJXWJMYhsK2i4qHdQWHRLvtPvyiziiLy+l6hB7AItZdYmekEEE80FSY2pBIVoddOKFWPWJf+PUazWxvJlrdDdpZmARIItPHeZQNAB4bWwKHNLenP4llE1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752652425; c=relaxed/simple;
	bh=yQ8W4tKOBbaufyGXUPlSLQSpRGy76Xnn+ki5/AS1c7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IPcIy8h2odml/m2syBt6gR9O/AHZr2UWtzJqSWQ65r0tGic+ya1tQOih8UqeXk9ztgtmvUulL+CJuyVgc5ZfSV8iUOBWzUEfQWrvp3+O30tx1Yj6CQ6XCt2bTHjaICwQ6qt7p335l0ewf2nVTENS6l2muL0pEIbrtR4a7JLBi7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qz2YxSOX; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qz2YxSOX"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b3aa2a0022cso6404928a12.1
        for <imx@lists.linux.dev>; Wed, 16 Jul 2025 00:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752652424; x=1753257224; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2mQSIMibFZ/TMYlkn3NP86VdyjZyUtByzAEI5AQ5uT8=;
        b=Qz2YxSOXZJzefJFNt7KwfLLZwlXtvzykHbX5P4DnsBxqoPaOR4J3TmklmVKYWSZE+r
         tRmTbdq3+S1p18C6uoGyDGZGCj/p2bc0t5Xncn0fyYPeYjOYjW2BJY52Non248K9xFsG
         bpFuj6TGLNrbIs31GRP2Cpwzmd/dlVeQlkZ129L396RhtgUjdxtP08+eckWdxKwTaAU3
         C4YY6tBc0iJC3fSOWHWde70b9M9Zcs8bPtHRO4QwcjJY1lpZS9qTUdij9zLePcNFuafC
         BtKHYHcrYY4F+CCotMo/nQEdss+HAv1Xr+dxdUVH1x0W8Vqy7RbHp97fB9eqFJXUGBKV
         2CcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752652424; x=1753257224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2mQSIMibFZ/TMYlkn3NP86VdyjZyUtByzAEI5AQ5uT8=;
        b=HwSo8C74FsbPjKISOx7aPFjnEbdssHNvpcHL+j2P8scmhT2BQnJw0bgTt9+jj4wB86
         UDzSeSsdxIv5KD0XV+DfMgiEQmul5W4SQ5OqrYk7ONQ9YygEcwBHA8TgfgH39S++e/qR
         s0yIkGTq3e2g/B2fTZesmxWqO8KJXjP0vB3TTDFv8hP4+6LPkzRh3gSqQ37HoLDXEfd7
         DCqWM/ayaU2PT41y13TcQAc92peW84LW0hoQWI23RoDSBsEAuUg/d2DTR+0JyxZJse9h
         06bfeKSIn8phnaxsu8Fx11jQUNVMjsY9KBTGqg5O7bsVstb3qc5003ZHJnrHFFCvOB74
         9PCg==
X-Forwarded-Encrypted: i=1; AJvYcCXrSiLqqK8b5tmY5ck0T2KgiTEeAhZlJ12yLk6KrBBjb8cjHLIX9oJrp44Hw/bRcVPdC10=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyoh+XpyNiN3t2E4MQQgBRrvmxYDEmBjjHnWlC5e7FO/7y+K15M
	l4MF/oaaJxmpMl5ddLbCzurWd0dYGyY4Yzh2X6e5LQvXKE9br5rdRnrNp6BIc3VyRadD+rVZGb4
	QDS6Mqmvb8C3+xnawzyCyAo4pG/dNGIz9k4WbXLE=
X-Gm-Gg: ASbGnctIqlkjhWQZUNTz6BaC8oBgUbwJ6MJSaBauunj0Li2LW7ztPXgGQLEuIoeHLNT
	Gm1GLGHLLq1yDoYONHPTsJ1uiDKBC1v94xZ8Y6ngw5lDOerFvdPP6OZoYt7PoidVnxm38LZoAF6
	uKV+1yBmUg53ME9g86yA3D53xzP3qhGdV8bgcEi7CUh8HJpxzp8HCAqAMfAf1jDsrSy/DfBDPyI
	5oq
X-Google-Smtp-Source: AGHT+IEXwgMmdV6xEntZIOiDCK4p/KU6t+w3ykBD7q7iq7lKJ8kq6kVxuuaWbxPblQ1N02rsyHmz1iURll1P3lWiuoI=
X-Received: by 2002:a17:90b:1fc3:b0:311:e5b2:356b with SMTP id
 98e67ed59e1d1-31c9f3fbc0emr2790269a91.11.1752652423706; Wed, 16 Jul 2025
 00:53:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250716061114.2405272-1-shengjiu.wang@nxp.com>
In-Reply-To: <20250716061114.2405272-1-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 16 Jul 2025 10:55:49 +0300
X-Gm-Features: Ac12FXz2s0GqTrCwZD5uR0yMTDXd0dpIYCyNX1v8FM1fPc4DXQYF5RSC8ANNnPs
Message-ID: <CAEnQRZC=qApo9C0zBDQoxpV56atLeXpoxZdyBuQ=o2y59YJEqA@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm64: dts: imx8m: support more sample rates
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	shengjiu.wang@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2025 at 9:11=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> The wm8524 codec is connected to the SAI interface. There are two audio
> plls on i.MX8MQ, i.MX8MM, i.MX8MN, one pll can be the clock source of
> 44kHz series rates, another pll can be clock source of 48kHz series rates=
.
>
> Shengjiu Wang (3):
>   arm64: dts: imx8mm-evk: support more sample rates for wm8524 card
>   arm64: dts: imx8mq-evk: support more sample rates for wm8524 card
>   arm64: dts: imx8mn-evk: support more sample rates for wm8524 card

Hi Shengjiu,

I think it would be useful to specify which are the current supported rates
and which will be the ones supported after your patch  (in the commit messa=
ges).

On NXP BSP you can run:

../../unit_tests/Audio/mxc_alsa_hw_params.out hw:X,Y p r

to get the rates.
