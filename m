Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3F515886D
	for <imx@lists.linux.dev>; Wed, 15 Jan 2025 16:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736959950; cv=none; b=Lnd0eL9agWeQsOkRZ7lpHu4fTAON6AGrJBhE0ORtiTx2Jd2QoZ55Cna1jDDSxg1ZN3NBVIem5CErQvYA2e4lzdGFiiSOXlVHDxCoLlEKkx8FPAd4UhTjY77AmZG8B3UXmkVFqLB58yoZ0HqCv+VQ0WW8HbOz2XXPQ4QFhFEJhww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736959950; c=relaxed/simple;
	bh=ScUqTDWnzQduLboZQZn5qJxxt7JOhe69U+tproLSWEk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kM7T90b1Q1xWNUgs3PzBZKOa/+w/9ebW7mr5TZt/UCPvhoEB4JftCldnzUeVmcsXDa0UjxwmKAhtbHb5T0vAa1VgS5IHP2qsrRw8rctmD5Iyc1lRuF1ckS0OJGuupcQn9awY8LoKiPQfJAiKFiTMA5YjqoIF9brGDQiT50O/HjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dOgDFWnI; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dOgDFWnI"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30167f4c1e3so61628591fa.3
        for <imx@lists.linux.dev>; Wed, 15 Jan 2025 08:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1736959945; x=1737564745; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ScUqTDWnzQduLboZQZn5qJxxt7JOhe69U+tproLSWEk=;
        b=dOgDFWnI35xdU+tM4fM9pu9hEcdzU7qWgo3/NOBmVI/U+7a7EajSKH6OCqrNy3/Ndy
         h66jrYa53FhbBhr3wiR6MfTIrWMZh0zsIHQFu/Xmm1GBXOj30BpSu8k5gT6ZIBMAmeXp
         w5GswOm3qbzY2LiB70mi2hATSA05JZN6BwIbTC0KZJVaVBv/kyMnwDPV2GEmdRI1/Q0R
         ye3BE0dg4POWit0aFlW4Ctna+mZvBNF8RRX5h5PhQ94eQIgFZMxaFHqs+5vmQxEC8NVB
         zQMWpfDTGBSUcGZziNRTvDayuZlWvkuno4ISMww10FrrHIOCSdH+vG6Z9jem2I1+CH9s
         q6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736959945; x=1737564745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ScUqTDWnzQduLboZQZn5qJxxt7JOhe69U+tproLSWEk=;
        b=d7ZZodE80hLn0uWgNphtKz2cpIXgW2NYiTJvzlz62zzAAKWWZv3HFdC92ZV+prHeyf
         rMkFtBYomW4lbwRnpckEZcMrbe8FzQnZdA6b/+sCiRkbILr2ge4H3bGgwccGQ+6qzYmq
         XRyktFeNnt0gC7JMoYiMZuDiCVUJpUAZ52gbq2W/sqUxXNOr0M2DEJ2oG9H2i5hTCl5u
         otsqyAdSZEtH7a8ELDEbNIBTjt5rsw90uW1I22ZQIGoC7a/o7AI4hTU+DZ8/DT0YtYf4
         adfbhCtrdPWYeFbBg+FfYlAJtMcq/YOBcu7UMNWkCwSKkD7xPtOEdq0I/sUMfUrHOaql
         FhNA==
X-Forwarded-Encrypted: i=1; AJvYcCU2M8pQiGXSYFqgDvP7WHbqBlFtIU0MVBsouT3T8v3sVUw1oJcVyd7lpe04+nmzaaDCZK0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxEf4Bi2rt48LkFLUmkknhfT/2YO67czCPHJUaECidMKK/bkzYc
	lVgcef0Yb6k8bJtFVYJrKQ7oyQWoVo494NL5m3dCt8OCahCnLr2K4KeHEoqg8y7a+OTZ5cxmNOs
	tNneC9Mlk3l/C808CVQF+7ThhD/aB55wxkUB1bA==
X-Gm-Gg: ASbGnctXdxf4zNoi7q+vkGXNQaCSrQaZkt7OHulJiKT3gcR6EaF/N2y2IdIIFga+k6c
	s6vrLqpTBYWYrMRM3XBP9g/nD65GKAjTA68D3bzbQYPUEHeG0LQ5ErzwbFFI+E5PkZia/qw==
X-Google-Smtp-Source: AGHT+IFbudLF97M9SY4kT51eRu7G8hIOTmWNuILKuPS/5RISLBhUaMA8RaVyreeevht06KYG4u13lDLUp7DnHNKW1lE=
X-Received: by 2002:a05:651c:501:b0:305:d86a:4f01 with SMTP id
 38308e7fff4ca-305f45db5d9mr86648231fa.31.1736959945548; Wed, 15 Jan 2025
 08:52:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
 <CAHp75Ve8d96Uw1obJVwRPyRE5E0eC8qU7uXe-UKuZeB-3XLPcA@mail.gmail.com> <528b6695-387e-436d-98fc-6f576636d16f@pengutronix.de>
In-Reply-To: <528b6695-387e-436d-98fc-6f576636d16f@pengutronix.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 15 Jan 2025 17:52:14 +0100
X-Gm-Features: AbW1kvab1-KFmYpbsyzdNL2AKyeg7H-EBh1b21mZES0GH7vaSk2m90tKHAwUVsA
Message-ID: <CAMRc=MdYB_XHCaurs1mO+KGX7rB5zFT3zCi=UbNY0rSbMEJdWw@mail.gmail.com>
Subject: Re: [PATCH 0/4] gpio: mxc: silence warning about GPIO base being
 statically allocated
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Catalin Popescu <catalin.popescu@leica-geosystems.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 10:55=E2=80=AFAM Ahmad Fatoum <a.fatoum@pengutronix=
.de> wrote:
>
> Hi Andy,
>
> On 14.01.25 10:46, Andy Shevchenko wrote:
> > On Tue, Jan 14, 2025 at 12:19=E2=80=AFAM Ahmad Fatoum <a.fatoum@pengutr=
onix.de> wrote:
> >>
> >> The i.MX GPIO driver has had deterministic numbering for the GPIOs
> >> for more than 12 years.
> >>
> >> Reverting this to dynamically numbered will break existing setups in t=
he
> >> worst manner possible: The build will succeed, the kernel will not pri=
nt
> >> warnings, but users will find their devices essentially toggling GPIOs
> >> at random with the potential of permanent damage. We thus want to keep
> >> the numbering as-is until the SysFS API is removed and script fail
> >> instead of toggling GPIOs dependent on probe order.
> >
> > While I understand the issue this tends to get never fixed until the
> > entire support of iMX boards will be dropped.
>
> i.MX is an actively developed and widely used platform. Why should suppor=
t
> be dropped?
>
> > Personally I do not like
> > this series at all. Rather let's try to go the hard way and understand
> > what's going on to fix the current issues.
>
> /sys/class/gpio is deprecated and when it is finally removed, this series=
 can
> be reverted again. The alternatives are either do nothing and live with 6=
 kernel
> warnings cluttering every boot or show users the finger as described in
> the cover letter.
>
> Do you see a different path forward?
>

I recently wrote a user-space compatibility layer for sysfs[1]. While
right now it doesn't support static base numbers, I'm very open to
adding it except that I wasn't sure how to approach it.

Is this of any use to you and could it help you switch to libgpiod
without changing your user-space set-up (given the support for static
GPIO numbering)? If so, how would you like to see this implemented? A
config file at /etc that would list chip labels and their desired GPIO
base?

Bartosz

[1] https://github.com/brgl/gpiod-sysfs-proxy
