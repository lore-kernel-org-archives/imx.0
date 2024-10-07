Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A61118C03C
	for <imx@lists.linux.dev>; Mon,  7 Oct 2024 11:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728301894; cv=none; b=YUNosaXb8G9hSxfL+/iqdH0Mt+uYXcQO41NIcN+vB92l1o5uZf+5Uf4z15HF1E2pUlaAD/+0QJrFJ0mnPNB59Lu7ghmQ/wWIsmWKPf4+6P2X5vRg4L//IiRFlbob28Rx2O/AgnEt59UhGnpj97JmR3Apsf0uzK1hmdJdsqLiHZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728301894; c=relaxed/simple;
	bh=Rar3gRgYHpcgBLUPr1prICpjuU8qRDOzk+bp/0TNuBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d1vCu63HiJar78VWihqDhTyKtPmZY07x4CI/ZqbiZ6v1X8MCUhlPqIB8ILjFYlsNnqBRyvOLPtlUwtRBFM3Zkbh0VR4+kCOdUftXVoemU4eydJbb6KUTqHdBOy+gTNdWRKZGV/Oc7rWSpzJGbS1iJ+NxnTMS5lQCKCs+DpFvtSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZMGIW+Gp; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZMGIW+Gp"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5398e58ceebso3807927e87.0
        for <imx@lists.linux.dev>; Mon, 07 Oct 2024 04:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728301890; x=1728906690; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rar3gRgYHpcgBLUPr1prICpjuU8qRDOzk+bp/0TNuBc=;
        b=ZMGIW+GpPtIWkIrATwFvkNaOWyGrA5L/0zx8f5NjcS4V437OzeO9oBdBGP7Gv94Acv
         0tYp21YyKKkfapK6rLi5Oqiqw8+9CnodDFJyLZco2yI0JeAcZP5if1P5m19zEABK9iot
         1FeqTgkz0JcZxrr24z2GNwz0mUNhAMrbtY28RW6lImrNY8HvWECfsVQ3ZDpgBsw9vhAv
         3PzYN6hSc3xEEzh21l2cYqK7kiDGyODVtSr+CJfast8fTPfvOXijovtJsx3cuAr0SFYK
         +5hFoc+tGaZy1U4g7DXH7RTIkJRhV7qWzVdn38Axz8+Q3KpF/KjBeIDApa1C4j9z9KJO
         FSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728301890; x=1728906690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rar3gRgYHpcgBLUPr1prICpjuU8qRDOzk+bp/0TNuBc=;
        b=pC7fnzKn/++yNOAvYTzkZKZZJpx2QxlQkATrYFqleIYRCQ47CDcjWNuzoVdzZOrWYr
         vzXW66JH3pCc2fgAn7q+3K33pRQSUwhNJ8VrNhayvCZHKq9gOGjf7qsu7LzukQ39lKyV
         uvpQnxTSfJrbSeXujGXQ1suFKHxU9QJxOCSsD5gtywwFPp5wm0fdQIuruFMe6AktMnBZ
         Na+0/q++DfBEbg0KsxCEocBlP9mwCNqn8dQAlFoPjQe+0f/maYScSCtvMUal6VOdLEEe
         gDAfHiFqZzCTK9P/ocNrAVF7qrDQCRshYjYFMY4sDRbB3o0aEp7L2zGf1HYAAluWviHj
         GANA==
X-Forwarded-Encrypted: i=1; AJvYcCXTTPe63seRxNkKtRb3ZHl9c0me5UhhGiKcmjOCh6Axm6yQjOecCCTOLgUalHRh6Bq5mds=@lists.linux.dev
X-Gm-Message-State: AOJu0YwutPupYXgWSmHhrl/nvWSHPjLTiYvXsw8V8/KCfURlw70Ojvdk
	/OTETs/MrFeNyRMsksE+dZWHC8Z4fvqC/7YPAsgvJ03dfMNr/LzVDuFSSYEiAdA/9ePFjcGWuR9
	tvIDDRFR7igFK9HN54azuXktW7Ow=
X-Google-Smtp-Source: AGHT+IH1b7AtDRdmVaSfJv3J1FI2YdaXAbDlTylH1s44fuUTjzLJGm/Lz3zXQL3hhmC94ehxBHKmM7+qFNFRaW/3CWo=
X-Received: by 2002:a05:6512:6c6:b0:539:9155:e8cb with SMTP id
 2adb3069b0e04-539ac0a9e01mr3723679e87.0.1728301889319; Mon, 07 Oct 2024
 04:51:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241003-fix-imx27-pc-v1-1-0e78d1fc6175@linaro.org>
In-Reply-To: <20241003-fix-imx27-pc-v1-1-0e78d1fc6175@linaro.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 7 Oct 2024 08:51:18 -0300
Message-ID: <CAOMZO5DqwcM1U8FtybUHbHYZjLi-5BO6nGfifHXguKtcEY4DrA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx27: Fix too generic defines
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Esben Haabendal <esben@geanix.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 11:16=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> The "PC" define is colliding with the (apparently broadcased)
> define for "program counter" on Loongarch, so let's rename all
> these 2-letter defines so they don't collide with stuff.
>
> Fixes: a55222b7a132 ("pinctrl: freescale: enable use with COMPILE_TEST")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202410030214.dPrgmUqd-lkp@i=
ntel.com/
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
