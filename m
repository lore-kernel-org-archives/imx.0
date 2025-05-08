Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5112F263889
	for <imx@lists.linux.dev>; Thu,  8 May 2025 08:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746693144; cv=none; b=chyD+JVeaSDcGo5e2xpM/1oTfc32pm/9LpMCYE+XItEQyKFi966dmTTzorWoD3pqaEhRYmZiaSXSienWQXh+S+Ho/UEefwnw5ZrDMBUzHRrVV00cEFT2hEH0LHFqHtM+I3qEmWkmKQ537pBlw5x+V5xuwFYAfpOnnjXFpJleWmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746693144; c=relaxed/simple;
	bh=99sIuYQv9yyYPOuX4dWNyMjpDSYVT8a3hkLHdw7sW/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P6zubpHuh/Z4AJcEdt8HGOpsjY/tVGZO9T3VKii5iTAFkF84JaXSEtuss1ZGs0Js/tz1GZ4nzXJaxl+SssA7LNyCOBytnZD24F0qCYBLX1i0SeGjyAmPOzCcg96t7T8j5h9RQLcSfr4mNalJ7mxCvDFMqcXw38TJmrqUKhdfLnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=qn1HrdFL; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="qn1HrdFL"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7082e46880eso6606867b3.1
        for <imx@lists.linux.dev>; Thu, 08 May 2025 01:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1746693141; x=1747297941; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quaZx11+VGNrggf88njtg5xLklc9eFfI7c4+X9LIJ5o=;
        b=qn1HrdFL88vMR28uTrfa2g01RIrFkcDIex0QQGDrYs+2qolj0458WmLurPrLY9tWEe
         5sEotivvWKq50k937rt/i9OxOJrwt9iIjW5UY+oIcxY0RJ8QdNvaojrGI2Fxt1jYSzB0
         lwkxzw5/4HM2sXU7HldjhNwqZu3jhk1U6YkYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746693141; x=1747297941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=quaZx11+VGNrggf88njtg5xLklc9eFfI7c4+X9LIJ5o=;
        b=ozJSoAJOOetyCBjS8m3KYuBN3HvuMZkpqBI+ovKwxfL/qNw2BNAEO8PgQ/TXJO4n8G
         19R0xbdOMFKF+cXc6WjQXoLyAhi4AhyrjssPlkj+P7EDgHZlorptpWmttt8vS6vTM9Dr
         NXnZKD7xh/dljquzUu8yLnC4g4K7v/pUzitDyBeguGLRugBI7ETpN66ofmALsk/M+FwQ
         vTs+LV9Wn07r6+C6SBZAaLBJlp7cD4XLW4wO0NvMWV5wiZ4RvpltYJrMnrOailcvrf0L
         M9RGsNJj+c8WrDyl8GX0RueUQZIwPRbczF8hro/agHc3+FE210sLxlDTBuB+eCxQdzt2
         77Bw==
X-Forwarded-Encrypted: i=1; AJvYcCX/4iEW4Hn1WkXyCP6JS4rxvEQg34x4CdYg35oPj3kQHhNw+Hu8oovh7lmMV4dv/IAb4b8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyudmoRHl78g2TSt/mwrN0ubyOu8wa8+UnjyJZ/2fUMiiggN6cY
	aH5nP6e2GaeJumWD5k0ntxzOiYFWlO4mEkNCLa4jPGmH5AoiSYlweKrCRcm2UPe9zJP5GUXtXOS
	Bn/Wu/24jwUWwSuOIWY1QU0He+k/D4hqDwnGuZQ==
X-Gm-Gg: ASbGncuIGLnoQx4XWVSCNEWMhP9UT02k/wS/XzuS+c5VaUSuSMv1p0Lp9NtjCMg23EX
	QH22ZlAvbEpR6Mi/c2GVW8yyQ5YJ+KBx7xmzzRd9lCrzUf1doXAoJt3Rs0j0QkNreNyIc0oc26K
	KtpxDDwY7Nh79mrUCcd3bj
X-Google-Smtp-Source: AGHT+IE4CmJhrdoXRe32HoBH4jbtzbQ2hoNMjPwxRG6sk3WrTeunXaOWumwPqctZu6MIIYqzIKZAUd1PKmmcUuwqfyo=
X-Received: by 2002:a05:690c:6085:b0:703:d7a6:6266 with SMTP id
 00721157ae682-70a1d9f9304mr89735297b3.10.1746693141277; Thu, 08 May 2025
 01:32:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com> <174643143452.2950397.16722215892279685541.b4-ty@linaro.org>
In-Reply-To: <174643143452.2950397.16722215892279685541.b4-ty@linaro.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 8 May 2025 10:32:10 +0200
X-Gm-Features: ATxdqUGGoyMhD-TPgWfLjSDF0XqnBspVuNvo1SR1O8IpFOj15QasDBjp5hm1sY0
Message-ID: <CABGWkvrkVLRocFsZs9JLni4KDZCDyYDZxMzwA9AzAwipmUyTzQ@mail.gmail.com>
Subject: Re: (subset) [PATCH v12 00/19] Support spread spectrum clocking for
 i.MX8M PLLs
To: Shawn Guo <shawnguo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-amarula@amarulasolutions.com, 
	Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	Abel Vesa <abel.vesa@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Shawn,

On Mon, May 5, 2025 at 9:52=E2=80=AFAM Abel Vesa <abel.vesa@linaro.org> wro=
te:
>
>
> On Thu, 24 Apr 2025 08:21:30 +0200, Dario Binacchi wrote:
> > This version keeps the version v9 patches that can be merged and
> > removes the patches that will need to be modified in case Peng's
> > PR https://github.com/devicetree-org/dt-schema/pull/154 is accepted.
> > The idea is to speed up the merging of the patches in the series
> > that have already been reviewed and are not dependent on the
> > introduction of the assigned-clocks-sscs property, and postpone
> > the patches for spread spectrum to a future series once it becomes
> > clear what needs to be done.
> >
> > [...]
>
> Applied, thanks!
>
> [01/19] dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
>         commit: 20e5d201b5d8f830e702d7d183f6b1b246b78d8a
> [02/19] clk: imx8mm: rename video_pll1 to video_pll
>         commit: 26a33196b5b68cf199b6c4283a254aa92d2aaf4b
> [03/19] dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
>         commit: 2d50415e2457c6f6621c2faa3b01b11150fb9c67
> [04/19] clk: imx8mp: rename video_pll1 to video_pll
>         commit: 21bb969f608cefd8d847cf6eb50a193d9f1fbb87
> [05/19] dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
>         commit: 2ba124053687c933031a6dc5b2e16ceaca250934
> [10/19] clk: imx: add hw API imx_anatop_get_clk_hw
>         commit: 17e3c1a272d97e49b4f3fbfe1f1b889e120d2be8
> [11/19] clk: imx: add support for i.MX8MM anatop clock driver
>         commit: 3cbc38cf42ca42d2dc9a93c949e0381ff919df71
> [12/19] clk: imx: add support for i.MX8MN anatop clock driver
>         commit: 80badb1d7264e83b512475898e7459f464a009c9
> [13/19] clk: imx: add support for i.MX8MP anatop clock driver
>         commit: 4c82bbe8b5437c7f16b2891ce33210c0f1410597
> [14/19] clk: imx8mp: rename ccm_base to base
>         commit: 1a77907dbbecfbe5e6a1aec28afd49a1dc184b7a
> [16/19] dt-bindings: clock: imx8m-clock: add PLLs
>         commit: 6a55647af3334f1d935ece67de4a838a864b53fc
>

Please check the remaining patches, as they are required for correctly
building the
ones merged by Abel. The kernel test robot has already reported build error=
s.

Thanks and regards,
Dario

> Best regards,
> --
> Abel Vesa <abel.vesa@linaro.org>



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
