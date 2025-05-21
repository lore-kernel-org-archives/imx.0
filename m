Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7350C233D85
	for <imx@lists.linux.dev>; Wed, 21 May 2025 08:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747815181; cv=none; b=A1SlHuGl2BLWzY9gcoxumYcj0uwXtYUZs7SwquTVxoB9BeGrH+EAp/DuZottbdjqAFjSWNiRpyUwCt4Ta/98i2+uoNU0YllL5xeQBovgX/+2/IR1NFJJbxt+UudApimhieGVY9j7sp8j0rt+71tyHgoIKgffkb9HIEOz0r2EQrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747815181; c=relaxed/simple;
	bh=pwr4z+M06i1mMSwv0rCr5dUsFp06XkoBxQnrw1/GtgI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l8Xe+YFrpBikQv0iTy1wUB+oKvuUriZQ0/raSytcOfA+GWPrpug89HbdaJFc5qIPdNKj6FiVR4erzVfOBtgMMhMY7L/bxQKP/2binUOo9VmwxXjjJ4NiRfYa8U2z0xRlcptP2zPPEp4CEGr1r8o1I/JBfYlNZDxrmOagS8EK8L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B9lgvohL; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B9lgvohL"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54b10594812so7625070e87.1
        for <imx@lists.linux.dev>; Wed, 21 May 2025 01:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747815177; x=1748419977; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pwr4z+M06i1mMSwv0rCr5dUsFp06XkoBxQnrw1/GtgI=;
        b=B9lgvohLiFnvINlMAClnfabbzIvPyjNDaDm+Lu/5AYsK59nVg6KOTmpFdBsY1C9E9G
         292CX8ny3xmot7W8hLaVnrMvO2KZl/JdWTsZSrFHiJjaOnEpLWRiYz+2GfjjIGRsDHq5
         oko7oM5tAyPU35gX2nbXwFpM6CpcnOjAO5it8Bgj1HHA95NBOVFfAEt/5t+4pgRobGk8
         Ll4ahEHIwoODZsfFOkL8eLwFKEm0onewpMgSiibuUR85MFoX0N/X+fDXZmfLHKjRIaPV
         MH0r+fHsiBld5arTLrTsJwM1W7VK1dQymPO1ts0QqfxwdOBgzMDhkp+uFpxx8/zLQGZR
         Xvfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747815177; x=1748419977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pwr4z+M06i1mMSwv0rCr5dUsFp06XkoBxQnrw1/GtgI=;
        b=fN86NGi+RzYMpgA2GmjAsHZxIWovVgf83CevUmvX4UTLPqXY9YwW34Sy4eMK+SFwxL
         tSoW467EE/C9ENw8JkZUeGyeDGoQoImYl3lniD629axI53/a6gmMiTAWE5eGBZ47WL7U
         BYT2HWXfCQj7wSMInHk0Jfe7oxMDt81mnUZSQtaz5Ka9GxLpbG5s3Et0zh3sr8QeegM5
         mmDx0gh9JCLvUDTRsvy7bjoAYQ2NCosN1Y1wMX6+ndAEOIYymJOGotzyLl47YKQ8xaEb
         9GlevHOL4CHR+if9ZLDilSx/CYvQ7uxLY4n3XzSmY+5l7MeS2U8LXJFTqfOcKdxIcmoT
         PE9Q==
X-Forwarded-Encrypted: i=1; AJvYcCX3bWqXg0DnpqM+3RucYDscr9uiDktw1s+JQagzslnYv/VJ6CQYl1RB9ijK5qGJWxgJo+U=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywcr8MGFBSppDLbVo9Lu+Rvc0AOiQcYbQulnYqjnh1LKUerb4x2
	Q5StdvTt1YwDKtKgoClkW9AgoBJsn0auJZZcDmkpR6GsHQSz++sZLwG15Y+eyVra3wnRLPYHN69
	o1uDR+UnT+iFUvfGE55le3NLxVN5nC0Xzw3H3mhjU8Q==
X-Gm-Gg: ASbGncuRrKdWFldAgJC6SjM86oLSt51D82wv+ITrH5dvPF9kvZU0m2WT08stECNf5OG
	bIKmHFSf6SWeUiP38Iw2QbNF8odF/iiRWLmFDAdzjivMO5N2wKYVKFR2KOqKFz2lYIuvL2PThiq
	GmWFnLoZVwxv1e7viEPW3X5+2JtvBVdYDRPiw4T3PbKHg=
X-Google-Smtp-Source: AGHT+IHypaEtLgbAx0hI1pwfX+02JjmtIZJY41Yl+79R8Nfu0dbAldHSIKhHCLmxFeUhAu+kg3UiZtw/f5zBM85OvXE=
X-Received: by 2002:a05:6512:6805:b0:54d:663b:bda9 with SMTP id
 2adb3069b0e04-550e726811emr5586519e87.51.1747815177553; Wed, 21 May 2025
 01:12:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250516100423.1685732-1-ping.bai@nxp.com>
In-Reply-To: <20250516100423.1685732-1-ping.bai@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 May 2025 10:12:46 +0200
X-Gm-Features: AX0GCFtWAB87B9iw-eCTV-w3vbrXw3ATM0xxduBEOTn9gKp9rC41cR3ebYjTvJQ
Message-ID: <CACRpkdZ7iymSvvst8Gi3EaeG--2icRgkoKEiJxxjLgC2LCDW_A@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: freescale: Add support for imx943 pinctrl
To: Jacky Bai <ping.bai@nxp.com>
Cc: sudeep.holla@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	cristian.marussi@arm.com, aisheng.dong@nxp.com, festevam@gmail.com, 
	kernel@pengutronix.de, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 12:02=E2=80=AFPM Jacky Bai <ping.bai@nxp.com> wrote=
:

> The i.MX943 System Manager (SM) firmware supports the System Control
> Management Interface (SCMI) pinctrl protocol, similar to the i.MX95 SM.
> The base offset for the i.MX943 IOMUXC Daisy input register differs from
> that of the i.MX95. Update the pinctrl-imx-scmi driver to add support for
> i.MX943.
>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>

Patch applied, expecting the compatible string to come in from
another tree!

Yours,
Linus Walleij
