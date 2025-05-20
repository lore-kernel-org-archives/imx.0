Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6852617BD9
	for <imx@lists.linux.dev>; Tue, 20 May 2025 22:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747779261; cv=none; b=qWSi8D5TzD2Ebd3Jqu5HxMJlq022CYYH7WIaDlrsPT3nXoNpFwPFB0tqPgtroe9f4gijsIK8noKYzgnZgsI7TVISHNmy7mUXn3rLIqd024G0ajgZbu68SlpF3jO9HsmlokvR6JPxCTPjalE61xufeSJwhtQT8Ji2/iC9PHRblE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747779261; c=relaxed/simple;
	bh=0KKxr0NhS0ebwaZO5bcBif23znaAXOSTxXvDT9vZo0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QrcnD4Ve/JkyY/qXZCRWgHNo4H8wCXdN1c0wW3aVVWFR8HD2TClkKPO44A+EE14Kgx4CZYJFxdNupSShRCtTr26FaduiaTY2lN28I9B0AvvWolUJjCTQxzc/Fi8pyUHoBNCFkJ9GnOph+dk9ije174TXUpRd0gp2F5vMM3woqeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MwiDzcx5; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MwiDzcx5"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30effbfaf4aso66847591fa.3
        for <imx@lists.linux.dev>; Tue, 20 May 2025 15:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747779257; x=1748384057; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0KKxr0NhS0ebwaZO5bcBif23znaAXOSTxXvDT9vZo0g=;
        b=MwiDzcx5BzfNKeidTP5yJZvuo88f7//l5VT/bSBiU8uTfHissW7Qr77U4SfNlxcLrf
         R/tGrjZ1hpOnuJqzfS5RfueksE0ulhNn3BKQBsf944t58akEvWGMYWjCljx7f13iNdFG
         OszOkki7lRiTKe0OrB7haw1KbMlAWDpchoFWX/hBElTnME5kRIr/mj79NdNvv6Yw+SeK
         lSXBcuPiJnihLY6x/n/LBjN1K3Nnzva4grH/QX+p3qRubspEEof1lRGbWfIPiWDtVYbM
         pMiarcU8EFfekv1X4nrSn/udW/v3iyE5ctcR+YgQka5Tn0TK0HbG04qvNkLLGsqwJYm2
         55TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747779257; x=1748384057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0KKxr0NhS0ebwaZO5bcBif23znaAXOSTxXvDT9vZo0g=;
        b=e+DcfdA0dUENj65WFBJyKE+truoWaU9FkUpwyZd1ZP/X7DfWWGMiW7aNlr1ZePn7Q+
         EOqm2hiabRcvncWmwmRCGVq3rc/JfeyPOLna0NVKVsseKVR5B4iuj0CR0bgKKgwr1k4l
         L94GtK871IZUkgj7naeYZCNWoBNHptA4mEU5KuT0GxksOfQVLVSYkIJQMBhcFOL6Wgk4
         pzB+9Fu+b+0pv2kgH1rL3JQDQ100QcGmA6z1WWUqJCinIR7Io0EF0cGZSe3oryw55r3H
         xHXeQXO6654DyfJw89PIt8oNno30vkRkVpBWboNcC/fwiuaIiCJWz9DhxXO0hEHaPlmG
         BNIg==
X-Forwarded-Encrypted: i=1; AJvYcCW3FQJVMXyJnHQNlfUFcNAKY4OA+60dsCaUB6jsqeGP47vG7O2Pewus0P0Q8RgLeraBZto=@lists.linux.dev
X-Gm-Message-State: AOJu0YwMuDNuLpz8+UBC+DjYjKl4M0GWJ38cchkcpSKdflrJ9NPr+C9m
	GNEI+h82dZ88YWTyzefnyL+Bw6I8Oyk0qOvUOHWgYHIyyOSpFraN4RhA7m4iwSrvP+359UWUQ2K
	T9JI0mZXpDZ5Nlnkk5KXhobc7JiwMhvZqB9r+FV9A1Q==
X-Gm-Gg: ASbGnctbFrcR1f2a7o6T7JW/kjwshFsFC5Sgney6NFMiy403I9teIZ70uaXVdfiOTjA
	Spwm99Fw18ZV3VZdh7CpeWO4VCITrYF7ScRn11upK5zHsC+/dIkxMDcrpNYfrFyedpBqkk10Pch
	OZ2c8njFJVvoCwa9GyM0q7xpe8anBPLnvI
X-Google-Smtp-Source: AGHT+IE2I9dkpHJtUzuV3F55HIcCy4H/0xE0bIT2P9EiCFLTqHbK469GeJi8kQXTq+VvjFFqjzVGAT63GH/fgS+P2nQ=
X-Received: by 2002:a2e:bc1a:0:b0:318:7f36:da6f with SMTP id
 38308e7fff4ca-3280974b19dmr60101281fa.26.1747779257574; Tue, 20 May 2025
 15:14:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250520-gpio-dts-v3-0-04771c6cf325@nxp.com> <20250520-gpio-dts-v3-2-04771c6cf325@nxp.com>
 <f0017caf-8fd7-4046-ab7c-71c6560b7a95@gmx.net>
In-Reply-To: <f0017caf-8fd7-4046-ab7c-71c6560b7a95@gmx.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 May 2025 00:14:06 +0200
X-Gm-Features: AX0GCFujWmK7RjwxHirjq3655UF2TsXAVvYT5SDx5SrWKMcU6UcS_lP2iMrNx4c
Message-ID: <CACRpkda1OKXnma11wKTrBsO_AAXrifVK8RDCKmufdHXBMmtMbQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] ARM: dts: add ngpios for vf610 compatible gpio controllers
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Haibo Chen <haibo.chen@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Stefan Agner <stefan@agner.ch>, Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, peng.fan@nxp.com, 
	conor@kernel.org, Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 12:54=E2=80=AFPM Stefan Wahren <wahrenst@gmx.net> w=
rote:

> sorry for asking this dumb question: why do we need the redundant ngpio
> property in case there is already gpio-ranges defined? AFAIU the last
> cell already contains the necessary information. Or do I missed something=
?

Not all GPIOs on a gpio controller have to be present in
a range.

The ranges can be multiple and have holes in them.

The ranges are also optional.

The fact that this DTS file, for this SoC and on this controller
happens to have a range mapped right over all of the pins
is merely a coinicidence and not a general rule of any kind,
it just apophenia playing games on us.

Yours,
Linus Walleij
