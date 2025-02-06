Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E796225A29
	for <imx@lists.linux.dev>; Thu,  6 Feb 2025 09:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738832872; cv=none; b=LZsTyztOtrznDpOJfNdj5up3vxJommI6MQFa9FrZV/k5frvNBgkeuSSiXTy3JligeB7jZdxfGS2jYk+n5oHP86j8Yh8IA9t5RvzcuZmMAlCAXPE5T9T88TFAyIOEkz59k/5qI3xOqymGUuqh3O+rMs0xJ63XtcbkTSwBp1lWOGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738832872; c=relaxed/simple;
	bh=USBL3Bi8iE9n2Sl7YVwR873K49AsaDipUTVzCmvsvW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dM1dxOsuDoyBKz3mFYzpO/xZH+3mPu0Y1/KqUJb7rMghAi1sVH6Pu0Cs+GXNKdcrUGJDf0BWIk5COBgL6Ns2Q82svLbMT6ZNOl626sUXzhP5vzuQlhzFPRuZJH/HLQ6HmFEcsgx99wj4o6Le3wzc8YzioJB5KEiczm1McIu0MW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MYn1/h0t; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MYn1/h0t"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30737db1aa9so6206881fa.1
        for <imx@lists.linux.dev>; Thu, 06 Feb 2025 01:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738832868; x=1739437668; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=USBL3Bi8iE9n2Sl7YVwR873K49AsaDipUTVzCmvsvW0=;
        b=MYn1/h0tIrB5dSufHI3aFIInYqXtRniiEt6TO+Z+vJ9ni6Bv6PoCB/95wEb+DGgmGD
         9hlnp6WEFd/3AbYgCi75siHDdX7pCBcpyeKbGN0XrMClHA2VD1tw64uitLtYVvok4qGM
         lwe7UYJ3NVkExw/sOP1uJdSDIDc/QUJPdVtZY/owPZkcQX9msujkChWzEdCLa0wBlCos
         JIJrn2Mhqy0GIdbiUykolnVGWCT4orfPa0+8h6KfviYOgX6Q8JfZsYXSHVa4b/gFbA/3
         DjiyD+8zSlDg0VNpB5DKC2ncCozIsWZdrnt7VwDN0BHljk+j7keaPPKu44ytlIg12QLt
         EzdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738832869; x=1739437669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=USBL3Bi8iE9n2Sl7YVwR873K49AsaDipUTVzCmvsvW0=;
        b=SE/1hYlUFMRHHP2EEQBbspCEXFxbMcoSsB5Y8kDeyjCf0Snc7s7srVCmaQsO2T9W/1
         L9jjL9pzXpC1OsVWklh7J3lJxAuC2fyMoDTl8D9aSJsJX03JLbs7OgjdIelR5WhLbp+t
         W9EG5c5eDEyLfzbrDvQB2+1FJck8xHnHIoUTop+dVwKxOSHQ4U2vT+KGIynFPHcEyAS9
         vW6+NByTW2ZKTefJC4U3PZjX4+PQvi1ey3tuauwpHbQq/yw8R2et4rIHxDdrFH1Je2Uk
         fctxrfPEFDiDczmrZtj75nxwNRgSG4eF0la1KJBb6cwqVs7w+MZVoqosn/Xk5PAup2l/
         b+Yg==
X-Forwarded-Encrypted: i=1; AJvYcCWT8FlwTo7PDcnNW5s9iTJYZyhdw/bAobf8nFtHDBZyb95WFNti1WeLytVw5d7NeDaLeNE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxg4kjIIWRMBf8pKEAoVBnviLoifJy3l44rmGn9kaaTk+OL9CLm
	8lNeI0u77j7BE86OOIXKFJBI0J/uvmS3GXISVFdUQ0YIoaH1nhhaA3yV6hcwx/RvYVYe3BAyLG6
	Gh+alHw0DQq6TxwRCafYsOxISzrmzF7mDicO0oQ==
X-Gm-Gg: ASbGncvSTFDQKJU4+QavbtgYVBbJfCC0YHyDW4vxiGRNQx6GNbCxtYGaVTsYePuj9h8
	WE8kJTswfqXtttJn9BGZyyW8TV2Jy3G/XbVly/qz8SZBQ+hEHBDAEIjsVo21okJJJMEkkeno=
X-Google-Smtp-Source: AGHT+IFMvokVoCNJp7A3lkxgigywWrPi05v98IDrumPEAYrql6H51kRCzThn+r8IlTxIEYbaKMGx7LiQg6tGfTHRK7I=
X-Received: by 2002:a2e:a917:0:b0:300:1c9a:80ce with SMTP id
 38308e7fff4ca-307cf385308mr20165081fa.33.1738832868506; Thu, 06 Feb 2025
 01:07:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com> <PAXPR04MB845925677F9AB860552A421988F42@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB845925677F9AB860552A421988F42@PAXPR04MB8459.eurprd04.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 10:07:37 +0100
X-Gm-Features: AWEUYZk9rGC_78qVqTxr81SNDU-6p5M6XpnmcdwLF8h4Nn9OhqhPBv8W52Ra8WI
Message-ID: <CACRpkdZ1zBkagd478Ee+JAUWrXF1z-Hts=dH+_jgT3Vi26W84g@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] scmi: Bypass set fwnode and introduce allow/block
 list to address devlink issue
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, Saravana Kannan <saravanak@google.com>, 
	Aisheng Dong <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 4:31=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:

> > Subject: [PATCH v2 0/4] scmi: Bypass set fwnode and introduce
> > allow/block list to address devlink issue
>
> Any comments on this patchset?

The pinctrl changes look OK to me so for those 2 patches:
Acked-by: Linus Walleij <linus.walleij@linaro.org>
in case you want to merge it through some other tree.

Yours,
Linus Walleij
