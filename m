Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DED225A34
	for <imx@lists.linux.dev>; Thu, 27 Feb 2025 09:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740650120; cv=none; b=e5wa1nYuXS8FrIIhW/hGmsF17xX88BJW7bEEVNW+HPA+CLyQn6ZtrnGhJFyjrbl9qH74XFit5LuepYQPhWV6qB7f4wB7f1eOgaBdjqsG11UY3s47yFAQfEY7Y7axOpKoKQQyKfkAZN1JaXkbwK7EkCvZdXUY39cxcsg36y19zPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740650120; c=relaxed/simple;
	bh=GMrGy7GjtinHRAXaN38+OyPyk50EHCIL434a80PJ6qI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=tT6EnV9/GLN0FxXLZGRGuoGhvzOOqNBhM1PZ0Np69Ptd5rZkaeuKx1C8tCm+hAuH3Gye988XfoWUbms9t0pQ6D2ySVsXn0DsdKNJtIY8n2+OZCeW4+1kDswwoc2XSovdrsS3dB6NTe+w6p36toNAmJ3GNasv/hXCHsmcJMyRFCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=PaOrCOM5; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="PaOrCOM5"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e05717755bso970332a12.0
        for <imx@lists.linux.dev>; Thu, 27 Feb 2025 01:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1740650116; x=1741254916; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GMrGy7GjtinHRAXaN38+OyPyk50EHCIL434a80PJ6qI=;
        b=PaOrCOM54nlH5LNmIgIxG0FsTLxm1s4s3LvDJrbWwDlbbXQ9zEinFAgaMmS35NiID3
         iUNajJd4pOvz5i5EWOItUumb33msDHdJ/D2CoqHrp2i5gpESK12/Ip+FWnHADk80hclH
         k4e8WabAwjwFzw5lY+pVgVPLc2M+Y9pjlTq+8q73Bd7Qh9qhOAcHNXH843mUnATCHN0y
         Oe5d9CVhQSuYiogrG9hp3ChaSlpvJXFFgoucLN+lTgDU/YCIuuBG+vyjCwor0xEGwFrF
         RL1gQVE3OYQPk6KWJfJjnH//OlFhyMBkARMtSz14T8nTS4FIgpmQ9n/jfjOmyF/XnInV
         e6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740650116; x=1741254916;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GMrGy7GjtinHRAXaN38+OyPyk50EHCIL434a80PJ6qI=;
        b=rBQXLOfcOVcaXs4wUu3562jbyU7ZPEjR0ayVjsIdQ8jpJnfoloWcJ0x4vnzRGNUPFp
         NT5RR0v/ApWgLKnK/hryrGRK/NHP4CbmjoIg7AJ35tl0bZ7IWAOl+ADrcl6k76HKHgGK
         CI9UU/7K7j1BWlDooAx9+hBkkpH0KFdvewMAQORSnbZ9M0CFqOdPLqR6SVZ8yNXD1XvO
         8iAVpTWwv+dFYC6hzN8zTft2Hw/n0q5wvxc+r3rUjknwOAAGLZjp6X+JB1zbk7asegLu
         qjKwUCWZt0+fr5dxym5+2Ipd7D52MjeOjGVrNer5jkpWzVZxtDn3BkfSJymtFzYndOIJ
         cLmg==
X-Forwarded-Encrypted: i=1; AJvYcCVti0UvRtLNATtE8U2oBNqWeQcEiZsaYQPVoHiGfRf8fioM4mA4gB43M34eg3oOV3IO3VQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxrwToxawLNcAq7X3j24T2DwPfEvUWnGAecpRdGazIY4ctWvBGy
	xEM4WJN9XjLMkML8p5tG+Yw7sxuBtBRjtaOdP50DA1X3KSgea+R20onPMGntcdI=
X-Gm-Gg: ASbGncsCj69TrkfQWtN+1bTLoiw8cLT+wVpz51jgrm9E++auy7p8N8jAQrVimGqXSZG
	s0u9HWDI6PKVL184oy+5rCO9hbCkHzyI+ua8wADyalz9KmK1hFBiTcHU/EBjB74V/ej3rmigUOY
	MiNQRJ6Uv8P74srIY7LIBMohWgnX291xEzMT7CZKCmNiibdG9KVIczIeW+lRsgEXL5scyPZqcrw
	gf1V69qw8Pr0xPWfEm7ymGvfPhPvIoWGfmLdLUjwWeZ5iSQL5Tw7f/Wm5ZvZTOdPKAnw37AEQ42
	wywcCt+5IRc6cJ/eDhu2IHi3IrX7W/EOGecO/3p0oRgGsv/eEk3LjxO/Dc/4a+nvsqe1
X-Google-Smtp-Source: AGHT+IHOqWs5W1zWbVsdCamypIUuEl5FiXdceoWzVMCg4QEAxi577mmYKT0uI3sYwCAsXCSxh6AwRg==
X-Received: by 2002:a05:6402:4413:b0:5db:e7eb:1b4a with SMTP id 4fb4d7f45d1cf-5e4457abb1amr13186045a12.10.1740650116291;
        Thu, 27 Feb 2025 01:55:16 -0800 (PST)
Received: from smtpclient.apple (17-14-180.cgnat.fonira.net. [185.17.14.180])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51aasm851700a12.60.2025.02.27.01.55.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Feb 2025 01:55:15 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH 0/1] mxs-dcp: Fix support for UNIQUE_KEY?
From: David Gstir <david@sigma-star.at>
In-Reply-To: <20250224074230.539809-1-sven@svenschwermer.de>
Date: Thu, 27 Feb 2025 10:55:04 +0100
Cc: "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 shawnguo@kernel.org,
 s.hauer@pengutronix.de,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 festevam@gmail.com,
 imx@lists.linux.dev,
 Richard Weinberger <richard@nod.at>,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Content-Transfer-Encoding: quoted-printable
Message-Id: <FDAF33B1-DE06-4A1F-BE9A-4E3E5EDE03D5@sigma-star.at>
References: <20250224074230.539809-1-sven@svenschwermer.de>
To: Sven Schwermer <sven@svenschwermer.de>
X-Mailer: Apple Mail (2.3826.400.131.1.6)

Hi Sven,

> On 24.02.2025, at 08:42, Sven Schwermer <sven@svenschwermer.de> wrote:
>=20
> Hi there,
>=20
> I'm not 100% certain about this patch but trial and error seems to
> confirm that this patch makes it indeed possible to use UNIQUE_KEY =
which
> I was not able to do with the current implementation.
>=20
> I would appreciate if somebody with access to this hardware could test
> this independently, e.g. the folks at sigma star who authored the
> original patch (3d16af0b4cfac).

thanks for the patch! I=E2=80=99ll test this on my end and will report =
back ASAP.

- David


