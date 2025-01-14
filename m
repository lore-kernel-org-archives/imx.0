Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A491494DF
	for <imx@lists.linux.dev>; Tue, 14 Jan 2025 14:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736865441; cv=none; b=Pgw0KCPxjCTARmqwd1cVmoHbDvKifhIuSLB8U3QHY6n3GvMYEwlfbXYe1InmASRY+NFoK3SyoW4aLKsbRQYHh9w+qWVdOaMTxYWPGb6Ddl49iPOCYdpvnfJ99cXJMi86Bl6V8Rz9ZcDcRSRlvxRoGbHMwn2n/xVFf133U4UBtFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736865441; c=relaxed/simple;
	bh=AA0aBoqrZg/WACjAZN52vkKnO6JJJbTCFcrDiMPAINs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mKJeYWT2Wbqimjqz8nY9y8XlLSOyH5MCDEBEsOPwqOR7gWzde6CY69B6e2VGBWqsQIXHkrUldnlW6SsHRfLe9SpDgKk9fI6ECH1quQ6Ny5SbPYKHA7wPlFS+8yRKxIoHqmeiQBPNWExlZxq4tuHVXX8g3muorPryMESYpGcYROY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=idQLCqQ2; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="idQLCqQ2"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3003c82c95cso40840511fa.3
        for <imx@lists.linux.dev>; Tue, 14 Jan 2025 06:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736865438; x=1737470238; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AA0aBoqrZg/WACjAZN52vkKnO6JJJbTCFcrDiMPAINs=;
        b=idQLCqQ2dLtB19X20MDaj+jcYc3f2DpPBwpBQ76l6A54wzmxtv5lVEvj9/NCiUyGwy
         SS7VjTaVwE40mMJog9y6TjsQ0E8nV35xpj/7bKG9574DSLT6NlI+7i3XHB5xWY+N+fMr
         zdF8AnI7Q/5cZv7L1Oxq1BNX8gttfxY7asYMKNnSYx0tXDIPWRDxLZ8kJ68U5PfxY/vH
         H1d9vB7iI5BVs8WJoCpMRDkiLmm54FIVqcDhARl1DrK5vIUhKIwEuK+WRvGzX2a0r5A8
         ib4jsk/cCmE8vKKgj9CWoYxFkR+FiiTrdDVTjeUVP/0OW8LH9wKSWL7wOsalx+t3wN7b
         w2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736865438; x=1737470238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AA0aBoqrZg/WACjAZN52vkKnO6JJJbTCFcrDiMPAINs=;
        b=w+0hLJ4YpaMcMnQwPvs85R1fYbLds3X3Cfp43teInF4ROTWvbQSVEqym9gDXKMWzOh
         ciK2wwWP4ogrQ+5Ov1x2eHLduKqvomMaAtv1AoNQZD3Vpw7q5k/xsEC4gClqOXlM/+17
         7FyyArFy91RbOUcIvU2mCo9EniTZ3Tm3DiBWhdOCurQ1f4bexuB7kr0SZLtqJpgO7+cu
         RQZMqjXWZBFLS/RrhwewctL3fmMtO3lVCy43DdN5hrRyeruiUm8GHjGq7baR5Hlk4hU+
         hPn2U4ouPTJNDIuExoeKiEF6guKYiyBoCEcSRrIRC55ET5Li5ab2JW6VYibLBZoiwuHt
         dZkA==
X-Forwarded-Encrypted: i=1; AJvYcCXCXfUXIEIaWGS/o5Nu1yqnOTfJX6KtXXIh0zJqCSzFUQPPskUdTRz8MwwUHgRWytl1X0U=@lists.linux.dev
X-Gm-Message-State: AOJu0YzNiyCKjRZWn8AbIFgx/gqMq0aUqeHGXw11oi1dzeThe+fxvwA7
	dR0L14sHK7k2gBseHsTJ6gdqjK2Ayo22i//dGrl2ku8Pcv/8iZ+nVnlFo8QMwFfMON9DLhzidQb
	WpQYqdClme/K60cRzu2CSqqlSTgppGJ1ipcZ6kA==
X-Gm-Gg: ASbGnctsGcZYYvGsZCxZD4prdXf24JWgxF3pH3mBYUb0yuNwO93NnXLKTg2kvT+2cII
	obQSXFURuKmu+rhsSiFpQ7nGFSoaLMVtLLuJW
X-Google-Smtp-Source: AGHT+IHXHhRBxekKjdM3gRgsDo8MxfQbmM2TrKqIHQrqSEmhLq5g1p0hvMa4d+Gj1XQaBUyrDoQ+cJNCESr9wOng/Qk=
X-Received: by 2002:a05:651c:544:b0:302:1d24:8d95 with SMTP id
 38308e7fff4ca-305f45f6484mr75556711fa.29.1736865438026; Tue, 14 Jan 2025
 06:37:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
 <20250113-b4-imx-gpio-base-warning-v1-2-0a28731a5cf6@pengutronix.de>
In-Reply-To: <20250113-b4-imx-gpio-base-warning-v1-2-0a28731a5cf6@pengutronix.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Jan 2025 15:37:07 +0100
X-Gm-Features: AbW1kvbhH5ngJuoPoguwTmNwlT9OfxN6ZoGKMuwu-HJLXJn6jxhr1EDmY9GG7Us
Message-ID: <CACRpkdZtxVSn9D-ro9mjYU=yv0FjE=BO=vPmObT=8=x9coCy5A@mail.gmail.com>
Subject: Re: [PATCH 2/4] checkpatch: warn about use of legacy_static_base
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Catalin Popescu <catalin.popescu@leica-geosystems.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 11:19=E2=80=AFPM Ahmad Fatoum <a.fatoum@pengutronix=
.de> wrote:

> gpio_chip::legacy_state_base was recently added as opt-out for
> existing drivers and shouldn't be used for new drivers. It's thus
> sensible to add a deprecation warning whenever it's used.
>
> This doesn't fit with the existing deprecated API check, because it
> requires a `(' to follow the symbol name, so a new member specific
> pattern is introduced instead.
>
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Thanks Ahmad, much appreciated!!
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
