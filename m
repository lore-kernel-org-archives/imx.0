Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C941C148825
	for <imx@lists.linux.dev>; Wed,  3 Jul 2024 12:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720008961; cv=none; b=cT5/mL9YbrpwsfX2qxr3l29e+yhARDj+cD6IbPX2SpQjweBcwbwqW5V4I7uQJ3S22hhzsd5vEqCbdOM5aYu19yEbR0Un49BZKBny/JOA4IHhDKCGmCkaBUmzjp8mzStWOBAmHFHkptcww+ib06YcCLaqHG1i/zHONR4i3eB4FQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720008961; c=relaxed/simple;
	bh=tlj4upF/QrKTZLtAGFgPHf0H8sAOPJzy7oek1uceyGQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NJgQvvqY4/wz1SNi1r8SPArzGr+X/dZErTa95GKdWCSqWxYdq+6BtEcrr2YLUpjYg5tb822q0W8YERjscreA/35CR7ALO8oAtptcvp4Xq8hqIAZeUHT+ILD9y0jHxL7nPDEGNk/SW4M7RSB5pVHT1xL7Syag4u0J2ZPHW2B++EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RzVDl5vr; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RzVDl5vr"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e03a5e54fa6so190403276.3
        for <imx@lists.linux.dev>; Wed, 03 Jul 2024 05:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720008959; x=1720613759; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jiwA5a9QmmCZFO0wmqnRnvmNfpGrkJDWzmZJxVlflz4=;
        b=RzVDl5vrEreHjSAM9F277hn4TowCLIbmVobKATfUofnhYMVpOXiJ0UwDlzgVK1xjjX
         63+hnuLo79FVqKw79fnPf8l3gRhfGUHnJk+DN7fL8yUgNPYmN48gW31Ic6OPDY1RtEYe
         oBWswdjHGAiS2YG85FzOqPOZEZTnc6vHsb87PHoWXuBqKHXqHQz/rvOOMFSUCFDgK2id
         psN5sfTh2l3TuKS4w3HzuvEKRfYsGZBuEEm+sgaN7zB6NrHxK0WdOJ3uZxx3WeAT4bH5
         0/9Wa5Dp7OdfSgo4dDeORvCRfrDVYEYaiK723YR+3Bhbq8eXuTI2sxR4/eYM4lAq0xzJ
         FPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720008959; x=1720613759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jiwA5a9QmmCZFO0wmqnRnvmNfpGrkJDWzmZJxVlflz4=;
        b=JeY+i9uGMpXIoUyFK1KYnxuPtJNtZKKphpNWx+DKCjDxEcLxvgqxrJD4D+Q7+6LeKi
         EakNICq9x6VwRJvj8xcTBbLMA9cSCXO6arMEUS1rOgVAlBVHv5l53pqqjKCZAKjr+DGi
         uxZkb1Y17Bib0sva3OKmTXdX6Xgi7TnRWBNTecXSw6wk+GE24NwxoSHr5fR0Kekio47C
         Suuqbq1KKjM1KCZx1C7p468HMqJ0PjwYg4x4gXs9O9E2AIq/lB+0xcF6ygNaR5fGOo1v
         3KoxmSU6r9fW5bh9UyUUYVLbLNR2fNtEg1z9Ewzxric7GxXyGWt+KOW+/ZnUFvanbi7C
         kMqA==
X-Forwarded-Encrypted: i=1; AJvYcCXyHc9oMWS9GJJ8qFFhXbeGBu5NYuV/hnSvqAvdS1WwkfMlGy/78JebNv6EATwFtYBfPHdveL6Iib4etMWKU/HOknI3
X-Gm-Message-State: AOJu0YyRzCYDbM8Q8D1uHfWzef/X8qc27rjintxZzelLJaP3HHzg/B55
	tADSuVLoxrM0frwT8pHAYHpPw1yBWxF0+1d2a9rFLjvJOUx+Enuj+KP/ELn3Q+oCjtA9tez2ZhV
	znpLkt0ewpZS/HqfhVqpQRC/KVg8=
X-Google-Smtp-Source: AGHT+IFi2ejfqBYv13r/iV0PhWavL4OvLik6ByGeAnQsqZlYkpcvyA+iKnxsbZXHkHnjevbsADz0ZEJfpt/LErKQKlg=
X-Received: by 2002:a5b:e8f:0:b0:e03:af0f:f487 with SMTP id
 3f1490d57ef6-e03af0ff569mr1016935276.0.1720008958773; Wed, 03 Jul 2024
 05:15:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240703120409.1103787-1-s.hauer@pengutronix.de>
In-Reply-To: <20240703120409.1103787-1-s.hauer@pengutronix.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 3 Jul 2024 09:15:45 -0300
Message-ID: <CAOMZO5A9q4+-y9BD7=x5N=UYfGp_nYbhZbwrVPYKH_fppQwGdQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: freescale: tqma9352: Fix watchdog reset
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	linux@ew.tq-group.com, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sascha,

On Wed, Jul 3, 2024 at 9:05=E2=80=AFAM Sascha Hauer <s.hauer@pengutronix.de=
> wrote:

> @@ -151,6 +151,7 @@ &wdog3 {
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&pinctrl_wdog>;
>         status =3D "okay";
> +       fsl,ext-reset-output;

Nitpick: it is preferred to keep status as the last entry.

Other than that:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
