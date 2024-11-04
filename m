Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA9A1AF0A6
	for <imx@lists.linux.dev>; Mon,  4 Nov 2024 11:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730718970; cv=none; b=o0WxErsXIcoGSwwPsfl9ckkWf02trxsAkOVmiu3DH34e5wKGpMCmJt4u5Zw0NMSzGznggHUEzvWi7jZdG/R72LiqIGCrDOpm8sf2NxDNHVx4a4QuouQ0WtesKVh4LsCf7lJFuuBd+QfXLF2L0BpMm/drUss+Mf1S1wFHfJW5IBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730718970; c=relaxed/simple;
	bh=6lPauIiTscqKMOQTLUHijuI2aQyYBb6lw3dYwjsi6bM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HVueEZXo/PIM1aIGkTNCssJ27r2SJ2mbYThNAAzRIvCMYtMcNUWrEk7CBFHDuIPksQt6bzqH4rXS5+1qLhL+HJ8q9C44wwbodokeigSuHxLQKK2n7HZ516mfKsAnp9e1hCs5tz5MpAeo2cOF/o29FbFfTf7GJ7BvEOQCPR1EFow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WD4CW/d8; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WD4CW/d8"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb56cb61baso29771801fa.1
        for <imx@lists.linux.dev>; Mon, 04 Nov 2024 03:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730718967; x=1731323767; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6SMwMlud9VpFJug/GEuyhyAfU63OEE3p7Bt9+6mizC0=;
        b=WD4CW/d8Qlb3SRrvyC2YVy2ZQCVK7vyaRcAog6MN8w1jnWIMOtGAmVFv7UV9Cc7RU8
         h3fUhudUHFDlAb/Sc8BkKP8d/JguwKs2CTMeHi4ToxWgPTs6vG2I2o1XcuQyKJ6fieLD
         EVD1eK/IEW/GNLQ3awGJPJWViX/bYU2IjHX8TqEZiXz9t4oHW0udnbF0VMhWiqJkmx4H
         rQNDKcid9S7TkVcoW//hgZYqVLTCJvSwxOaqtUITn2XGerkGn7JHpcm9ywkHM0Nufsod
         LAsCy8kx62dFF83zIJ1dH+CvSOqKIVtRo7aTpAkmnIJ77ITpthioNJAf8Nnyvn8l7CnV
         sJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730718967; x=1731323767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6SMwMlud9VpFJug/GEuyhyAfU63OEE3p7Bt9+6mizC0=;
        b=iAwIb2gQzuenq1PX50rH1iKYFfaXJlbNiyq3d39wblE87ugWRXGSrdpSotg1iq7zPs
         +0uICqdxKNCzRebsqKUI+MVqQ9mG3TwvbIZbFd8tUtRRZMu4qGPiXJHLaXWey/mkzt0q
         HiV2DkJ54LdsrrWe+9Y7nVb5yxx5YEdzkhZ4fCc9M4Iy5kccMxBrt0YKG6JNN/Vbyo8S
         YorQvz0y9pumKJQN/DZohjd/pTvB43W7SWLuZ9tSoJ16n/uQgQS3/AsFfiReQU/V1m7S
         TShIHtb2rZbEEf9FDH92ZQTcWqYkb4Kxfiq5tnckxu1eIdPAPm/FvdTTJzFG+5zt+FXY
         gdvw==
X-Forwarded-Encrypted: i=1; AJvYcCVKLdTH6wMnEIj73SQnYy2k/i3KogRhoq+PYrFLU5GyV2EkPEc/R50PX9AYQoYrqwxTDpg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzXeN8sGPb9Zr3sI2vf6JV3niBWu6I9UW55JilgtowOgsKFqEPo
	X9enrXayUdoUE0Wchr+hLqESFc6mj6AJesE/HNyYocZr+83jorvk0GmaPSLd0HzGCZ/MqSVujsZ
	3i+0d36CsOU38WMmRuy/NdklX5Xs=
X-Google-Smtp-Source: AGHT+IEzN70NkrF6BWT0VQctKNPsc9mfubq6riSTtLOV3QRjwhMFt9r3TqokctCja3a9zuoI92aSnDqOznprk9dMpPU=
X-Received: by 2002:a2e:bc18:0:b0:2ef:2490:46fb with SMTP id
 38308e7fff4ca-2fdecc2f714mr74133011fa.37.1730718967005; Mon, 04 Nov 2024
 03:16:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241031151238.67753-1-hs@denx.de> <20241031151238.67753-4-hs@denx.de>
In-Reply-To: <20241031151238.67753-4-hs@denx.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 4 Nov 2024 08:15:55 -0300
Message-ID: <CAOMZO5ACMGbhySUbR8r1UUimc53YDaRbfEObyUrf0GLYZcQfjg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: imx8mp: add aristainetos3 board support
To: Heiko Schocher <hs@denx.de>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Heiko,

On Thu, Oct 31, 2024 at 12:12=E2=80=AFPM Heiko Schocher <hs@denx.de> wrote:

> +               brightness-levels =3D < 0  1  2  3  4  5  6  7  8  9
> +                                    10 11 12 13 14 15 16 17 18 19
> +                                    20 21 22 23 24 25 26 27 28 29
> +                                    30 31 32 33 34 35 36 37 38 39
> +                                    40 41 42 43 44 45 46 47 48 49
> +                                    50 51 52 53 54 55 56 57 58 59
> +                                    60 61 62 63 64 65 66 67 68 69
> +                                    70 71 72 73 74 75 76 77 78 79
> +                                    80 81 82 83 84 85 86 87 88 89
> +                                    90 91 92 93 94 95 96 97 98 99
> +                                   100>;
> +               default-brightness-level =3D <80>;

One suggestion: a more succinct way to represent this would be:

brightness-levels =3D <0 100>;
num-interpolated-steps =3D <100>;
