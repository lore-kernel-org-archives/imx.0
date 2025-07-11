Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F22227E07B
	for <imx@lists.linux.dev>; Fri, 11 Jul 2025 12:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752235531; cv=none; b=tmiY+kGhxUpHpqVwjh64ScOeIIotsbtNpTyS6h/Dh715U/JPdVa3x8GScCzsfIfaUnjchG3JKhy5iLEDPXdFbhPYKiJ4r0IEyfK4/l0vLxYrAELewy+aLIdeRRB7hdXtmFD9OZxmRl5mYEn4yBc5L/t447ONtFBnBup0CgRwoBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752235531; c=relaxed/simple;
	bh=2AEASaq5CDzhb6ktnTbfQ22tIfOZRPSGaJHgFyQUuec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tYmtD9oprLp4UhdH3BqtDemrJ0cBMd3EPoQxWnfqrKErl/J8w3rNlwhOWYNKhoYExJ6E9AuQ09z21MwYQ7QtTE7v4kwKk6F3Kug5hwbxjHpGDc6Ze8qyXZ6afTjoqtTc3E7VsvopmesntAnt+Ic/erXkxwJnlKeYmFNiEUE5XsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PDTX0B9H; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PDTX0B9H"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-555024588a8so1795354e87.0
        for <imx@lists.linux.dev>; Fri, 11 Jul 2025 05:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752235528; x=1752840328; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2AEASaq5CDzhb6ktnTbfQ22tIfOZRPSGaJHgFyQUuec=;
        b=PDTX0B9H3mhN4fTjJhXw8f6tLakSP4gdG6zJBe8bEnwAaxMzBoA21Fh5XBx1xNuaGh
         filNsdq8dNI8Yuc4522G4giz1odCiAJsNJUmoCFvbVJHJsZ9R9eiDBTil//iaRKhXvrz
         1LOiCO1cJg83zg8A1rhmpM/0IgHYJYiHcN5px+IzaagmT4l9IbqBWIUp+D//sl6d2Mfc
         FjQiotPne7RZZAF+Ocl8azdBbEOgABIrQloN/lX0+pRsoi80JVpDALxKvxpdr28GtpOb
         BRQvLEpR5fLN16T1z5G/Jji2bp/TkTvQLZsCCgkcthQwRdIpBrzJRR7Qx7sSR8WNhdgS
         zyiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752235528; x=1752840328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2AEASaq5CDzhb6ktnTbfQ22tIfOZRPSGaJHgFyQUuec=;
        b=UF1Rfjn8xT+J7HmQX4/TG5tebJ9juz+c0xOgnUAINeLYDA2IRctvwlgxNlvfCYJEvP
         OcTgGMMqNJb76+SfQoTzJ6w0YOEN6AwzxXo9qvOfuwYBzBlDQc0tSmUr9HFSG4EJvHpX
         +NWNlGOiwDAIL6G76uRiQBSGIjbbExzS1VgTcfdhIG5MSvbFxnSq5lduhkML0XOQfQ8d
         BfAR0YhfZzn+INIOr7QjGIaY51KqUwNaQE27bxHIGYqI16EVqy9DIeHnaFlaJWnFKYR+
         YXsa2oz4qRXnGE72C7JlDMGYrPH2ZKqn2687GFCDp83yjreSDJfux21Cg4E+fXpHMrfL
         npvQ==
X-Forwarded-Encrypted: i=1; AJvYcCV04zOgS53IQ0JRkg+394kyc7bCkMCJwGHOXe1FoDeBq6yUZDxKpN0ERdM5lzvKfkmyweo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyDrxI1WAEtiDTYbeJF/lBtny4SAbEgZCC6lp/qyHaGRr1SeJeF
	q+nfm6otlpYqoo9lMlEpWRL9p+DzJSWZcEZUE8WMBFt/16jx6Y2UbG95H4g3uzCraGse9ZmC4xB
	chwlXJDzWckM5r/2ToO5H9R/wadyymSM=
X-Gm-Gg: ASbGncsLSDyCrZw9ZkoUDJ7o2jHBO2VZHFnA9gNgsxjyiMcwtjLdUyyYtQmo/vG37Y1
	0rW7ry7vst+tOQSrbBywaPZmXc+CPS8Oep7UN411PC+0m6sdf88YTS8w/pJIEbM0WLXHwQaYLEj
	pmRxxSVBsZROJDZjo+klHU1LNWpqm7iH31D92jrQx4b5wJrHBKqGAfAAiLcE7efj2ZYz6443V/8
	dtdCzHFKpdOLnQD8FATYPmIljTyaOS2waORxaw=
X-Google-Smtp-Source: AGHT+IFl+IoLWuIaEOcASJ3YDYcH5iOQ7KM94YNp90zKqQwivksqlWt3cmzdDFclUAJWq5ZCcUCbfLJPflKvNsW1j6Q=
X-Received: by 2002:a05:6512:234f:b0:553:2645:4e90 with SMTP id
 2adb3069b0e04-55a046448c7mr1047920e87.52.1752235527861; Fri, 11 Jul 2025
 05:05:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250711120110.12885-1-ceggers@arri.de> <20250711120110.12885-3-ceggers@arri.de>
In-Reply-To: <20250711120110.12885-3-ceggers@arri.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 11 Jul 2025 09:05:16 -0300
X-Gm-Features: Ac12FXxXhUl0pWyBQ1-EtucR0saC40xWMP_mrTY-Vw0EB65wy0G0ZSkmB17HgQ4
Message-ID: <CAOMZO5BNgGao-+B_K8+7juBXTHVKr72NCRRk5NMpr2ew=t0+aQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] nvmem: imx: Swap only the first 6 bytes of the MAC address
To: Christian Eggers <ceggers@arri.de>, =?UTF-8?Q?Steffen_B=C3=A4tz?= <steffen@innosonix.de>
Cc: Srinivas Kandagatla <srini@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Dmitry Baryshkov <lumag@kernel.org>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sasha Levin <sashal@kernel.org>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christian,

On Fri, Jul 11, 2025 at 9:01=E2=80=AFAM Christian Eggers <ceggers@arri.de> =
wrote:
>
> Since commit 55d4980ce55b ("nvmem: core: support specifying both: cell
> raw data & post read lengths"), the aligned length (e.g. '8' instead of
> '6') is passed to the read_post_process callback. This causes that the 2
> bytes following the MAC address in the ocotp are swapped to the
> beginning of the address. As a result, an invalid MAC address is
> returned and to make it even worse, this address can be equal on boards
> with the same OUI vendor prefix.
>
> Fixes: 55d4980ce55b ("nvmem: core: support specifying both: cell raw data=
 & post read lengths")
> Signed-off-by: Christian Eggers <ceggers@arri.de>
> Cc: stable@vger.kernel.org
> ---
> Tested on i.MX6ULL, but I assume that this is also required for.
> imx-ocotp-ele.c (i.MX93).

Steffen has recently sent a similar fix:

https://lore.kernel.org/linux-arm-kernel/20250708101206.70793-1-steffen@inn=
osonix.de/

Does this work for you?
