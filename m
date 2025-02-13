Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2D81714B7
	for <imx@lists.linux.dev>; Thu, 13 Feb 2025 21:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739483170; cv=none; b=TEJHp4pceMvEJxb0HNTcEWpjmY3uj1fpweYosSUT+fUy6PDJQ/Q+kjg1isWKlXd4tccAwDPSGg6jz2wDjLpiouRwu4yfOSdO1t5aFCBB+dPX8HgyJ0z539YYoQw/L9OSUz8YTQINLdM7eVAnHyVpnrY1ypZXBP+YWGD42gDpVQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739483170; c=relaxed/simple;
	bh=5BDKfPEQoQKNl37BH3w80oASYOsI475hq+Fhk3cevNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VtjaTpAeMhI64N/VBXt5Qhscb6DuRPwl55WdGqIfxZCbfYA6ftfdPRfwmEWtwyPlE/emOFXMk6taXWhEHF9wOm8YduCzALSvtz5qdpwWUQVtG2eV+3hSQDUgQ6b2CTqMULD7rSWMHyKHYQ4WXW3nZ7SJEs9BZLoyIE5/1A2lS9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rPA3sFcv; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rPA3sFcv"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3072f8dc069so14830601fa.3
        for <imx@lists.linux.dev>; Thu, 13 Feb 2025 13:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739483166; x=1740087966; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kVfu1NW+vppBIbPYgYDsbWT6TbEthzVowdxgCrkUjA4=;
        b=rPA3sFcvHdOgSECCzjdN5Zc2o9G5S1QPsQ46cpn+G6Ce9nYHs9xNCwyvGGp3pVflRH
         reyZcdf2lEU7lNhBykv4LTrGRFgl1Tb5WVWSYacjD12tjEjcZ6AjiKqmnEEmAQZR59+O
         zogdqs1QqD7IiJEecjBqDR5PMT+1pQS8QqyBxOo38JkfNyT0LR49KtC5RTJLz+MGRF9p
         pjYHV8w0ocZkUIPDmt537gyGPSh0CaNjr6Htt2HmZ3sHYiM6fG5YltDDPfxQlQdcOzOR
         shY22yLVbpCSio8Me2MUTrb9IsKSHlO7Mbphl1PmkIr89JB2S4cCwP1ZIkdhHKl3tusK
         nCzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739483166; x=1740087966;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kVfu1NW+vppBIbPYgYDsbWT6TbEthzVowdxgCrkUjA4=;
        b=Hu2CvGpmWNPer3rBRjq8pc1yhUH5YKxyYCGKsU0K6mevO9sH+Kqxz1D7EjKxL1SFAx
         g7m9njXD82Nfvd9s1PIC9ROMQE9ZvQ0iQ4roEJm1ZNF73Cu+TRwLfp9HizvxyLODCSVo
         LfGDBtaftt5SYK4oWhrgjERBqUlKuQgfWdT1aswUm1vtQ5ZkNvubp4br5ufq4DoYqd+e
         SV1t6vSoGOilvucxkWrToSgApym1FWMD81fvpN0HkULrhZ9ICyXghryrzV5n/AR/D9xs
         hcBAkEFYClXy+t1pQyLkP6xZmwSmxYNcWYlI6rQeJlhlYTxkR2smhmAmeBM6RUma4Wiu
         WdBw==
X-Forwarded-Encrypted: i=1; AJvYcCXG4OieNno880RdWwXxrn2zSfKvTGZx2jDsTs3IWnfzn8LZKIwernBmz/HP1BzZOogiN3A=@lists.linux.dev
X-Gm-Message-State: AOJu0YwWp73yySbABh1gT+J2OT3saqlGcespDvQmisFgPBD6cAco7vyB
	4/De/7Hag2rhfjnzhwvzhYN6CH7MVCPdSniKX+waqIWAT6+jyQnUUGDXq8OCoPiLjiJ7nzR1Dh2
	FG1axCm20yxKY7IatuVSZCC7woAa7g7uG+sM/mw==
X-Gm-Gg: ASbGncs3fkefJ+ciIStELPQd/I+RAUB/aItOfrrUZTFHz/jX9RQeYmM4WL63t5DAQAu
	H1DFA2hmaFIrgwgZvFOk/r92MCFPtIOUX7FI61ia/oZ1X2KxltDUeE2pjtwLR5L5dR6n0fuLH
X-Google-Smtp-Source: AGHT+IF7cW4HbsRSE+zEEB418//pZVxCpudCIYRSWJ9fxNosPbB13IE7XmFd5Ph5xOjv8MH4ir+hgKvJhTH6zINBiSY=
X-Received: by 2002:a2e:a912:0:b0:302:1fce:3938 with SMTP id
 38308e7fff4ca-30903643504mr40744881fa.11.1739483166542; Thu, 13 Feb 2025
 13:46:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250206181714.417433-1-johan.korsnes@remarkable.no>
 <CACRpkdaNDJrGZ4Y2PPUWQfm6BprfNACYWD7srs3sYHMEsdX1Ew@mail.gmail.com> <DU0PR04MB94963632094E71ABE730631990F12@DU0PR04MB9496.eurprd04.prod.outlook.com>
In-Reply-To: <DU0PR04MB94963632094E71ABE730631990F12@DU0PR04MB9496.eurprd04.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 13 Feb 2025 22:45:54 +0100
X-Gm-Features: AWEUYZmEX0y8tQAlD3jIqTGLm7JPlOFvKpJHyNQQoYaTgfGwxSxp-eh-ybIRuPI
Message-ID: <CACRpkda7ZRR+1_6bJN+qgrsb=GQyyujg81uie6n5rX_U3tAynA@mail.gmail.com>
Subject: Re: [PATCH] gpio: vf610: add locking to gpio direction functions
To: Bough Chen <haibo.chen@nxp.com>
Cc: Johan Korsnes <johan.korsnes@remarkable.no>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 7:21=E2=80=AFAM Bough Chen <haibo.chen@nxp.com> wrot=
e:
[Me]:
> > I have no idea why this driver isn't using gpio-mmio.
> > Not your fault though, just pointing out obvious improvement opportunit=
ies.
>
> I check the code, for vf610_gpio_direction_input()/vf610_gpio_direction_o=
utput(),
> to let the input/output really works, need to call pinctrl_gpio_direction=
_input()
> for vf610/imx7ulp/imx8ulp SoC.
> Refer to drivers/pinctrl/freescale/pinctrl-vf610.c, it implement gpio_set=
_direction
> callback. Also for imx7ulp/imx8ulp pinctrl drivers.
> This should be the reason why not using gpio-mmio.

If this is the *only* thing you need additionally from gpio-mmio
then what about just adding a new flag to bgpio_init() function
in <linux/gpio/driver.h>:

#define BGPIOF_PINCTRL_BACKEND      BIT(7)

That makes gpio-mmio call these callbacks when setting
direction?

Yours,
Linus Walleij
