Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5961DC988
	for <imx@lists.linux.dev>; Fri, 14 Feb 2025 22:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739573793; cv=none; b=ZNPoQ7CF2lqahAGIvN2sb8HXjcEctl/saHdRnSevj85H7vuy+DZ8HifrpxWMUdtb0hiiAIZDWUSSntlGh64PHL8CZ9EufQYXU23KpQQMqS/74v1O7BEowMuk8VTyh/JEykb+ThFi+pIqXnMFGCoqj9HpaSPe7maP2VkZ9zjyamk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739573793; c=relaxed/simple;
	bh=/yhmfcxSxHlQtGT/4b/eJHb5cN5NdisMaRpl7TNf6w0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m59rstfkWQNd5EG2KaHaAjEAHDIgzH0txtApOeIxLMp+I68i8vOFBHe3zFWTt/0Bb2/jFi6oHe1fGrBB6NV5xzhEpsjaATmf44X+y4jDy79mlie6DyYfO4q3RHYzQrX+SqWd9jNTicEufMB+kJjos8y4vZms1Bq0pHZY97sUCyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pDA+sEQB; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pDA+sEQB"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-308eebd4938so24416371fa.0
        for <imx@lists.linux.dev>; Fri, 14 Feb 2025 14:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739573789; x=1740178589; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G7s2oBa03f7imynSEMhSrTciv4QWSAvhHIGyHnMNs5E=;
        b=pDA+sEQBodYNPSEDttpZxh2CHzHOAvLkKelQb/cdvezEhT0or++jLQEXteQy2XwE5H
         0vuy3q72+NW25YKgSn/S4L6WwQWG8FyH3WID26Cj62CVha5k3QYdCYDnQlMr4G8z8pJf
         4vvEcJAlL0VBn4gc8GjqDnlsu2snz6CF1W0IPK7xj+ZgeX3vX2sY1fOpptu2Vyq0PNe4
         /vGuO0FnMGwyDj99RLFRkrjrPXBA8cbxmhyco5BUQdXnLRYPsJmax3p9dKRFZ0I56GxS
         dg4VL96Q7JUxQT81oYMNuDchdTghogGK+0ISjk/9ZKnZIxP3frQX2bhbVswaD/F9j45A
         pIBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739573789; x=1740178589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G7s2oBa03f7imynSEMhSrTciv4QWSAvhHIGyHnMNs5E=;
        b=lMHxk7I99gNDhN209nslH/OGdQubeqbUWbT9Reo70YTlTKGbsdFESJADCO6WRnfzNr
         Y3+QmA9r6DKso/XtK6Yn1jZZr1G+KPZdt9EesPJwJ458AkqDiwELSrv76GFC2i32eRh7
         JcBfAeYNch2nGqbf0O70v1gzZ48ei+d5W8MfQqt+WjsVD6dxVHSKbDqiYxemo5q0LDwy
         U9m35ivCZsvDwG0Mx1mZpIDZ+lPMxbgCkk6BF+KaQ3fbcy4eLu0UHMRlQN7humUqlAX1
         KMnWDgmrrWCzXLORFcSQhh5Eaxy5s+ez21QxlTwdQL7cvmMKBdQp0DMydwCds2i/BkVC
         jC1g==
X-Forwarded-Encrypted: i=1; AJvYcCXOMq5WrjNJRqY5Svh0nhifHkHkILbn3JGIydeJGlNEfSe+9tFCferUH9m6uyYndMN4iCc=@lists.linux.dev
X-Gm-Message-State: AOJu0YztUUySRT27UQFJh8zkHBtiMHI9U+edepZkiEZ//dSSWcrKECx2
	tKowZCjF9H/pdb6wHavvVS7OvFReHWPzAkE1UFMRMvBaVSJF0CyaiyP/vRZBqo/WxggTAmEZEnc
	sn6yUl90YI9jwXcQvd27uBICOGVUMvh/Rk8ovSA==
X-Gm-Gg: ASbGncvImSxHydIXJeGF2ZsEqD0eNN3YhH73u17774qDIxrNpu8y0tgYkL7XYt8SVBr
	4DUn2UtN7Rw6jOf7e7bJeAl/hDz/i1adNv7l7ZuyHAHO34iVUm8s87j2tKBQKSHNNXoWRvy/i
X-Google-Smtp-Source: AGHT+IGtCLytUd6iKf0ppSdRNZRXXS27j10ot1Y0d8DZarpARc4OfB+Kt1lcsrcLrJhHDOli3LBm2AWVAvM2B2L6CR0=
X-Received: by 2002:a2e:780c:0:b0:308:efa4:d277 with SMTP id
 38308e7fff4ca-30927a74ef1mr4142841fa.15.1739573789109; Fri, 14 Feb 2025
 14:56:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250214-vf610-mmio-v1-0-6cccd0292e84@linaro.org>
 <20250214-vf610-mmio-v1-2-6cccd0292e84@linaro.org> <DU0PR04MB94966159FEE966ED235509B090FE2@DU0PR04MB9496.eurprd04.prod.outlook.com>
In-Reply-To: <DU0PR04MB94966159FEE966ED235509B090FE2@DU0PR04MB9496.eurprd04.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Feb 2025 23:56:17 +0100
X-Gm-Features: AWEUYZlmN2bmWNppz300m813ozN9q3Rm-Z9EUt7o2OWmXxs7N_YLUPz6LPpxc3o
Message-ID: <CACRpkdYTiQW_q6C+9HrX=LK+DTS+2rc18wGic35gtY4k=N_Zgg@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: vg610: Switch to gpio-mmio
To: Bough Chen <haibo.chen@nxp.com>
Cc: Johan Korsnes <johan.korsnes@remarkable.no>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 14, 2025 at 12:28=E2=80=AFPM Bough Chen <haibo.chen@nxp.com> wr=
ote:

> I check the code, seems vf610 has another limitation, refer to the origin=
al
> code logic in vf610_gpio_get():
> If the gpio is config as input, need to read GPIO_PDIR to get the input d=
ata,
> if gpio is config at output, need to read GPIO_PDOR.
>
> But for bgpio_init, we fix GPIO_PDOR to void __iomem *dat

The logic is that if the line is set as output, we read the output
register instead of the input register to get the value, and that
is fairly standard.

And gpio-mmio is using gbpio_get_set() which looks like
this:

static int bgpio_get_set(struct gpio_chip *gc, unsigned int gpio)
{
    unsigned long pinmask =3D bgpio_line2mask(gc, gpio);
    bool dir =3D !!(gc->bgpio_dir & pinmask);

    if (dir)
        return !!(gc->read_reg(gc->reg_set) & pinmask);
    else
        return !!(gc->read_reg(gc->reg_dat) & pinmask);
}

I think my mistake is in that I didn't see the dual
PSOR (set output register) and PCOR (clear
output register) in the driver, as the old one does, I'll
send a new patch.

Yours,
Linus Walleij
