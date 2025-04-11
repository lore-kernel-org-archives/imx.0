Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FF42980CC
	for <imx@lists.linux.dev>; Fri, 11 Apr 2025 08:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744360711; cv=none; b=aQ2Kook0nntgRXdFvof7AQXo2NWLotS03cbJvzplIm+PUeB9ptSYGgTGusF3WOav66LMnQ8vVnJ8UcpghEKf6tlfwCST3r1Hs/bi2ncOu2X7uVX0XkGvfxLCdm5ylC2vvvcZPlzA9TKcuv15y69ITF8hw5djXR2Xa95xYka5En8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744360711; c=relaxed/simple;
	bh=D7R9oFDs5xYoXN43Ulwrouo3nLF61el6kbjtNoLpuyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HVjbnTj4gYBQIlcx79o8xJbmEcL/JztLgMuGI2LlGWqws8QjMWy7V6HaHRjF/JjfsNhzN15t4ahd6U4h1MjzD2ARUAZx5wtjmlC7FMKxs+Ac7ji1cx/9xbZs2uPUlaD3mo2yerojC9Kwtu6oQPMdc4tDBIpiLlml4ReGt2BwTJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=mwhGPbJn; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="mwhGPbJn"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e589c258663so1652453276.1
        for <imx@lists.linux.dev>; Fri, 11 Apr 2025 01:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1744360708; x=1744965508; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RtU+pOoZbsLOnPjUI7YZ5FGGjZ40GzcCM59B/7LbYr4=;
        b=mwhGPbJnYTIQMcpCIXVgIx/Gs0eD+81an2fVsoklFW9ImyVFnKrHtDLE7+LctHVsjk
         ts+iFPDbNBAuGt96y7TKMrEJ+ACv7P13HczEdzaciM8ab+VgNXBgjYRfBwXtWSOylh6u
         x+aMl/1mL8e4AqTuHV69kJvg33j6SB+Quct/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744360708; x=1744965508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RtU+pOoZbsLOnPjUI7YZ5FGGjZ40GzcCM59B/7LbYr4=;
        b=lMahwdp3LDT233Q+hFCctmGTD7WAz8htuMYGJUzouEDXQSVTV6oqTkUOSGOvZfwd+e
         CDxveaaL5Y38Iy7dkueyIwXleOEPrzG/N4RPz3DF+V5sP1EzAuyb0j+iubqktULJqzxB
         IUu8ISrByKRmoFK2HzS423H6ut9xk1H8HeIubiEJDKgbxEyNEaSQZ42ILQDoJ5iHwoyA
         osIC8IgtligkVuLabUs+Wk0I4olAu0Otx4Wo756fe/zvb1yriy6NJ0r64pWMiUx+SDo3
         BM3RRes5OB1qX5OKSSC1s1F5Hvbx07Um6aOg5sKdH9WuA6kOaJtcu4foiv2LKdaeCv9M
         VoPg==
X-Forwarded-Encrypted: i=1; AJvYcCXjfJzkWSwXF0BR+JeahqJU0Fgf0hlCVWKl6pmuZHelPfevIhL5TZmKe1JlTuR/pfV/ETA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwrI6LUXPM6PVq8IQAPHIqh7NwI/ikVHaX+iCxoPGxqVem2J/o+
	rdsAiLZ5vBnLu3VflDw+qJ+Ld56DVQqQebd1k1gpuQr6KFC5fmaXGgnZ3Ou1oYjkpxZgOM/MzG9
	MCryTjfyxTYzCkepKtw+tQKABARK7kT/wX8kR5A==
X-Gm-Gg: ASbGnctuGM2uVPIGK9WbiSYNnGms6r5Y8d3G/z4f/qtIXJWYT3xPBppG6qiQMoqvzgQ
	/NtQc8rhGYsDv8/1dU5Yl6RN1o397NuJ5hDAmhNVWHxRoPXiLoaKSIOzM807+mBlCw19z/hFmp4
	o9NOMUkfkigEM/sAa4bXk=
X-Google-Smtp-Source: AGHT+IHCodNLsYqxPgYy8KacCIFQ8uMbF8eAgpfHHABuPW/r+cXCzHR5Dy1G6JiUbudEZgEzb8V1wt8pBrFYRs9UU4s=
X-Received: by 2002:a05:6902:2012:b0:e6d:dfea:8f09 with SMTP id
 3f1490d57ef6-e704decd54bmr3276455276.26.1744360708185; Fri, 11 Apr 2025
 01:38:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com> <20250314093503.GD12210@nxa18884-linux>
In-Reply-To: <20250314093503.GD12210@nxa18884-linux>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 11 Apr 2025 10:38:17 +0200
X-Gm-Features: ATxdqUF7idGp2hnH8dEoppZJLC3ZC9jhgwG1uStDtkKfsGzYjzpE_DfoJqtsu9k
Message-ID: <CABGWkvq2X9L6P39K5OeQW4+c2OmSYGHN03mUW-96U5okO1CK5A@mail.gmail.com>
Subject: Re: [PATCH v10 00/18] Support spread spectrum clocking for i.MX8M PLLs
To: Peng Fan <peng.fan@oss.nxp.com>, Stephen Boyd <sboyd@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>
Cc: linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
	linux-amarula@amarulasolutions.com, Conor Dooley <conor+dt@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 14, 2025 at 9:27=E2=80=AFAM Peng Fan <peng.fan@oss.nxp.com> wro=
te:
>
> On Thu, Mar 06, 2025 at 12:27:49PM +0100, Dario Binacchi wrote:
> >This version keeps the version v9 patches that can be merged and
> >removes the patches that will need to be modified in case Peng's
> >PR https://github.com/devicetree-org/dt-schema/pull/154 is accepted.
> >The idea is to speed up the merging of the patches in the series
> >that have already been reviewed and are not dependent on the
> >introduction of the assigned-clocks-sscs property, and postpone
> >the patches for spread spectrum to a future series once it becomes
> >clear what needs to be done.
> >
> Although I give R-b, there is an idea just come out in my mind that this
> might break OS distribution that use firmware(e.g. U-Boot) to publish
> device tree for Linux Kernel, such as ARM System-Ready complaint OS.
> I overlooked this point in previous patchset reviewing.
>
> Since this patchset is to move anatop stuff to a new driver to reflect
> the HW truth.  And requires new entries in CCM node, so old bootloader
> with new kernel will not boot for OS distribution, such as Fedora/openSus=
e.
>
> Not sure how to keep backwards support as before. Leave to maintainers
> to say if they are ok with this.

Many thanks to Peng for the review, and a gentle ping to the maintainers.
This series has been ongoing for a few months and has reached version 10,
thanks to the reviews from Krzysztof and Peng.
I kindly ask you to consider it as well.

Thanks and regards,
Dario

>
> Regards,
> Peng



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
