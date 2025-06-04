Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7108317A30A
	for <imx@lists.linux.dev>; Wed,  4 Jun 2025 07:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749022678; cv=none; b=P6uZs/AYAPzRONkdilyMpFbP2J4nUIOzHg0jLN2NcIBcVZzXyyC2vOf0Pk1kntpMTvtvmgvBF3fPwTqydPP15ztTrAkN7d+XjHkMvI46lYdZTcT+3IbsjSq8zUL3HrKMf2hvJtmCgw/icJ7oicKfqBHYI6i2Vp5J4Yx8lC+Qjao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749022678; c=relaxed/simple;
	bh=zIk2ydo9E6QXmGm0ISkrWF68PhwzLa29sD+7eFnm62k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HjKSAHstiEWfNH2KxtQOBVRj8tp5Jx4MLc4keYmSeEKgZdPEElZvSkltj4DDO9FI3lKqtjBwrLJcHfhq2VDyTNYU2JHhZlWipkobjzV/Viav+1Oo0fnq2dleu4uj4FWzcpvpX5X9oBqNsRub8IrMIqQ3+1SxmgplNJcOJ6/QVT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LUQQ8uC/; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LUQQ8uC/"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7086dcab64bso58996657b3.1
        for <imx@lists.linux.dev>; Wed, 04 Jun 2025 00:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749022675; x=1749627475; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UGyEvteZgKnU06vg7rbdizKIZLoS7zNjKeoB/6iPxjM=;
        b=LUQQ8uC/SKcME5VdQ8qaVgYBquueT+kIr2HLFzDZq7ojI44bnT/I8Ty2OcQ0Mp2rrR
         H6DeaTuDldLwQjyfIrs1VY/bVdGpdCsELO8bwSTugdmhG5q7VAdiDDcyauhJv11hlmOX
         tHq0LOi5yaMWiF/6E1Fr4AvySKKa07bvMH+qsEzJobj1FIzUKezE+PNnWqrDmkBffeqR
         8oYApzprNsFfKCVzKp+kvtkD7fpRgGIAgRu9rsbSgYNK2JLc1KnBhknsZ+Rzqhb/5bKj
         +eXfuird+RlJ9V9FOnLtsLN7VR0JfDBmV0gh/4sAHv8WiIyqpNwbpzLC+vkzKDW3Aikf
         0BsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749022675; x=1749627475;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UGyEvteZgKnU06vg7rbdizKIZLoS7zNjKeoB/6iPxjM=;
        b=fGf7PY3AI/BFoFCWAZ9gQHEGA7eiFNSX0ivvvrDA2KkSA9nGdlH+degJWrnjt9CQ0Q
         388Lc4UzVSa/o4CZvPa41Vk9KN323HXatTtQBflIhsZVV3xiUSCz/DeYWeeRQCKDID4J
         4ZJhhdRde1RaFGrYMxM2QpnARh+dyz0ERa1FWTESeqakJJTAw+OzQMb4ecgWidmWe5F/
         ZSTcK1E3ixm+ykMWtA/Xa8mj/n2CAE/yqkpVu9GEZ9fE789p2b5R0tZyR1tRdhnrCXn1
         J65Txox/FcXFPKv6wj/s4y0RH7J5zh9RcIHsU2QSnMznxN7VJuSrnp2mF7XSqjr7dgC3
         +FbA==
X-Forwarded-Encrypted: i=1; AJvYcCUKxMWOFOFf3/YEUMdetyqv8xkO7ME037oHF2paaYCxBr5D6hdl1EI+BYBxRYh8aAyzdf4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwaHHGGLIqvhss7EItzpYtAwfN/scE08t/bNprDT7cs1t1+UZiF
	zqAlWIfgd/YOq1RMJVrjyPupad+QEIxdOnwDTT96yjBB8TiRmUoRxM0eI4NG6KSrUNytmAgjhgb
	KkwY5vmDEeDjeiilN6kWUCHSuaCArL4k=
X-Gm-Gg: ASbGncvpJm7f9h/oXMYAemndTHG9ngTj1hOvxDDEXZteiD/UhoJieUKkFNeoYPXDqjm
	QKtmqp3QWBL9FDVGvpeIXYPnzWLTE1R9UpaEJX7KnijrPG6ZOMrOVA3CJLegI6BhqOoOfp9CAgR
	e7QLzJ/GtDZDkOZKQzRfTU4kBSdoCy/iM=
X-Google-Smtp-Source: AGHT+IGHg4yQNqLxlEDyCRgZJI7fvT2fCV18b3MewIJSWl1vbtr5SlMeusJ8GHaIW23IfmQnep32kSeTquJrDU0sBd0=
X-Received: by 2002:a05:690c:fc1:b0:70d:f6ff:cc6f with SMTP id
 00721157ae682-710d99fd79bmr21852057b3.4.1749022675335; Wed, 04 Jun 2025
 00:37:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250603221416.74523-1-stefano.radaelli21@gmail.com> <54c4a279-a528-4657-8319-c9374add54b7@lunn.ch>
In-Reply-To: <54c4a279-a528-4657-8319-c9374add54b7@lunn.ch>
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
Date: Wed, 4 Jun 2025 09:37:39 +0200
X-Gm-Features: AX0GCFseUcNPKK85MVzyXpWJtxDlkMihOveN5Hr-KtFZ69h6Q8KR1YgWhWyHsUg
Message-ID: <CAK+owoihxp-2xAvFfVthvNELshti_3V-pFgD7D7jzd1XqiLgGQ@mail.gmail.com>
Subject: Re: [v1] arm64: dts: freescale: imx93-var-som: update eqos support
 for MaxLinear PHY
To: Andrew Lunn <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

I double-checked with our hardware team, and it turns out that all required
RGMII delays are already handled by the hardware on the SOM (trace
tuning + PHY config).
So "rgmii" is indeed intentional here, no additional software delay needed.
Thanks for pointing it out, it made me double-check, which is always a
good thing.

Best Regards,

Stefano

Il giorno mer 4 giu 2025 alle ore 03:19 Andrew Lunn <andrew@lunn.ch> ha scritto:
>
> >  &eqos {
> > @@ -39,6 +26,7 @@ &eqos {
> >       pinctrl-0 = <&pinctrl_eqos>;
> >       phy-mode = "rgmii";
>
> I know this is not in the scope of what you are trying to do, but this
> is probably wrong:
>
> https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287
>
>         Andrew
