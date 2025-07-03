Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C923F2E6D0C
	for <imx@lists.linux.dev>; Thu,  3 Jul 2025 12:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751546716; cv=none; b=LWHrtW09g6UBgFHdPZaezYuYdCFyoLk1+X+hURvTm1HIcOcQ46LMEZo0TWmDpZ8/aXo7KIFr+ndClj2oB67Pv5yxagWMOWv8vFH+Xxb4LOesLj2aeBVjwkOQApNNiw11RlUuTfpb87DZBjFfPfwlYbktU1GF+8Pm0F5gRjHTPwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751546716; c=relaxed/simple;
	bh=rO0njdpGJRmQLICI1iSZlhb7/WOcHhA769ZS+UhR/0Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mIj1CpzLmpN0ZfEl3kvGDT4qZo3n/NTfPfg/qoTyjBInA/mTBgDsKRH9OWcGhpv+UOzvgCCtxQChu8Z4QzyQKLP26C7M+dbE4CT/2gmLVF6PiVuB1WoaMdmgKSJWcgb+HEt6QxCpNEgk6+GpgkMUJd50rGNLjgMY5pVOcMIuXd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KIFctL3p; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KIFctL3p"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5535652f42cso9365576e87.2
        for <imx@lists.linux.dev>; Thu, 03 Jul 2025 05:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751546713; x=1752151513; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8z5MFiFDbTCnPC8v5WpW94S0pfqFUuXgHt9s4lpS3Bw=;
        b=KIFctL3pDfiTCr8XSCWGR6Z3DwVrcYbd7PTwjKR6Vb3tL/GmS2Qfw3YK4eM1eZBxsA
         p3V7x1ACNT1dw8vOMN3DMCT2h6mX9ma5GiN7Gs89EI4oqbLsYuGC/MuseVpGdtvv6QNW
         WYLxeMHUCSqBjwU7lmgAaVoDtS+q4x308zZVjzewk9sGdOVboiNcKdniQwuY9YPdzYr7
         CtRyI8fPRP72WWVBDyOe4BctonFExWIOcRvLz0AS/xP6K5LniQbQ14ngp2W8QCxPRywv
         GGyeA3N08TeKKoqWT7O91yIq0FC20NFoPEuNesDCP6n5z+nIcbSS5iJE3Qy226fD4OO2
         wc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751546713; x=1752151513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8z5MFiFDbTCnPC8v5WpW94S0pfqFUuXgHt9s4lpS3Bw=;
        b=MDn2FbvMD/VMNb5kcHSdg7Xkx8pTEcNGW9mB64zMkkzN/TW3BTNt21qFWmeDjHlvIk
         mDHukV1ZwSRxajBuFTg3VNmHfif3Pi6NdbVVxg1aNweuoq2hv8lVxKbOs+vVOHZEeUCU
         yT9IXjNMFaIvcqwakp5uasZ8Rq2VrPXqULnmUXXxyZa3dceUKTxlVOh8noMggDmHMBfy
         BRpFrV0GFXyxOYsBzKLXMDJumeraWrcQM9yU1o5SNWEfVUNRHg/O33XNeXgtfiywD5EF
         dbPlLnxJiTDWThmKFDtSs4rxeH0vEYtUcj9w8cmCw3471FSya+aBmeeVW7h32mjc9z3S
         NnHw==
X-Forwarded-Encrypted: i=1; AJvYcCUJFBpTd2tG2GU71GuNGwuSlpDQVUkaoYBG5miyIpOkrGw7fVRFUSO51C0sM9Bvo3ZSlMM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxsfsj1myJEopKnk0mAe9tCYXFY0Azqh1gT9KqPb5wo/vFZoHE6
	+bLOL1+u7+VJ6snCaxV+3RcN8l5zUcXmL/6aTH1cF0WLIw4ICLwQb4lYAiLe2t1AtlWzuMRT1jD
	zH7V66Holecyz5++dJFsvRKOXkPQUi/0=
X-Gm-Gg: ASbGncuxwTPDe7Y3nMjQtX/8eBl+5kEbZ0/JSPNcnCyHNJLoZSSD8kBKa6UuOs8aS+N
	c7XG+0ZYzTTda42SHkrlLTRCCaQIAVRB84G/UKDBH4kDIfO5d6b/P428vc4LcAmGsP7SxWQSwJ7
	cEd/SQawJoQ27EaU/chIwIFv3/SutBy954ORHSktHvMsMEXD/sH4APNNCh/fmWXQvpxm/YVujoC
	Xs=
X-Google-Smtp-Source: AGHT+IGBw3CxY2v8MLX/NDdGlfF8dyBndDt1tavZLG0gZzxse3LqUUJJxO/JX2QX8e47qkWrZL/3+lhdGSA9IhX3VqY=
X-Received: by 2002:a05:6512:1307:b0:553:354f:1fe2 with SMTP id
 2adb3069b0e04-5562836564cmr2772958e87.51.1751546712637; Thu, 03 Jul 2025
 05:45:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250620213447.56392-1-aford173@gmail.com> <20250620213447.56392-2-aford173@gmail.com>
In-Reply-To: <20250620213447.56392-2-aford173@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 3 Jul 2025 09:45:00 -0300
X-Gm-Features: Ac12FXwocCCVqSmjiOxSD4g8dn9narHxqeilAf-O-E6b2FW2Q8eELtrk0gCMDmA
Message-ID: <CAOMZO5BpbVg+sV0DXNSeJmsKjrZzjVy2Dr6W2Axd5tGT-U9tEw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: imx8mn-beacon: Fix HS400 USDHC clock speed
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 6:34=E2=80=AFPM Adam Ford <aford173@gmail.com> wrot=
e:
>
> The reference manual for the i.MX8MN states the clock rate in
> MMC mode is 1/2 of the input clock, therefore to properly run
> at HS400 rates, the input clock must be 400MHz to operate at
> 200MHz.  Currently the clock is set to 200MHz which is half the
> rate it should be, so the throughput is half of what it should be
> for HS400 operation.
>
> Fixes: 36ca3c8ccb53 ("arm64: dts: imx: Add Beacon i.MX8M Nano development=
 kit")
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
