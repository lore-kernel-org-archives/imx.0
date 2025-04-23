Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108B742A8B
	for <imx@lists.linux.dev>; Wed, 23 Apr 2025 09:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745398872; cv=none; b=maRojOcnr71tI55D1KNUh9D35/VQ6YutwieV2bRIdlVufUVkT22k2qH3gl/+g+apbcs6F/husWSHG3kl7zTJWTVplRJQjV29CcVfbyM/lpXZaQDJj5+dgkGyWyQjm0WFFD8HikKOSWC6CFtyY8fdySBRdHCmLrcbtk/Vh5SV18c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745398872; c=relaxed/simple;
	bh=l4ONh9IizedqA6W3QPhG+iwsoh6uJslCMo9BpNc/j+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UMIimePiE+r4zxRgDDsB3pY3IAsrY7WOt5If1m/N8uWaqMX0S+6X3DeiIMcWdr2Bk5C3TogFuFl/J/ljwdyNXFg5tu6AAU1owHVPLhfypbXjXsCk90vtjECx8+iv7KtI4YDgIW/W5i3hWdK29960Cg+zDevnUemMQbei72Vd9L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Awyyld1B; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Awyyld1B"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54af20849adso717256e87.1
        for <imx@lists.linux.dev>; Wed, 23 Apr 2025 02:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745398869; x=1746003669; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4ONh9IizedqA6W3QPhG+iwsoh6uJslCMo9BpNc/j+E=;
        b=Awyyld1B/8li/ylGKUP2XWCYpl6DijiFbpK8g1m0CqhM2R5gfs+PRwOaQFCtZKrHq3
         mKctg+mMhY8tK7IJn3DtuHsXaF8pHL0/G89m/FIvSoU7ktiwnRqu3jwq8X+ufrLwE0wt
         oLGU93KRg9ugoArDZajIXRTXFXMu23ChezZKpPGZNjHfkqQf1zlKjZN53NUrzEgGa71Y
         r7TbtsUCp8b64d5zDY17RMqYteJgwjRbdHPBBGsoPQH28hwH66iklxymQbar69FoWc+i
         Gn83p7ibizmVYwxu4C8S5o3sQW3vw5S4oZ0I8NzctMYIMW5X0joyp6hqZjqLf70uokjo
         zqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745398869; x=1746003669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l4ONh9IizedqA6W3QPhG+iwsoh6uJslCMo9BpNc/j+E=;
        b=e4c1w+s5ov10Iulhfi05eWpHHmnyeaNwT5PZ/iUDAfviU1mUe1y1mJuZs1hl+kQunu
         jfZ+9c2yVPmeVoz9z35tlBHgshRtP9vWaLOheTCjS+qkGdKdx0bQtA+MJw7t0PcrM2lM
         Y1zF85TSiWnUqCgii+c6NBE2q1A8d/+KyhmvoQzw9+HsKGLWJyS54FY2P4yXusppjyMj
         0IZLT4Nkm5yV5iwftYMcbjWmcVJ4w090xe2nnp2CHhR87yR6z7WKctF3t/k7WscyAJbM
         XIi7ClbDBgbuN0/34Zn+rjmlE7IrKYGPiwBBndqeUCWntxuWNKjeoPsP45plP0bHt5SH
         2YZw==
X-Forwarded-Encrypted: i=1; AJvYcCXZNygVW7jsA0gAWw+JrSSPsDcVlJFpBdfNvC22Jc85/h46+/NLyoo6upNvhTN4+UHt5aQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwiCMhGB1kc+JHn0peZfXrTy9VN6Vj51ZAVX/f52yVmr9k73/Fy
	gpX1CXfZ9l22p+zwDOzw92M4uoI7LdYklYd+PJvgnDXRN+iM7IY20F1KdpnFVTAZlwJxx6k/Z8J
	XlauPuF43Xd0CF70fxiYlecjiUTA8+8Hrq7zmAw==
X-Gm-Gg: ASbGncvdrUCuEnHZYY5UO3lSkjCCifibrxeCNoY7i8OiZXGYM5SneI1qf78gaqWSwXs
	ETR7SJLVTBihTf4CMxQ5Z/EW+50mxFHZ9vg7iE4in2SBsgpT2UTvaxIPdNnsA7yies0X3MA/f25
	jIulV67nT9Er82WbOunelRjw==
X-Google-Smtp-Source: AGHT+IEEUsAi88UCbofnaku2lk+aEb48FzRJxri8OckiCKB/AVx4JpJsbdKyriMomMEWTnYqEIv4ataPoB16Fz19o6E=
X-Received: by 2002:a05:6512:a8e:b0:549:8d2f:86dd with SMTP id
 2adb3069b0e04-54e76b22a2bmr572698e87.20.1745398869092; Wed, 23 Apr 2025
 02:01:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250417152158.3570936-1-Frank.Li@nxp.com>
In-Reply-To: <20250417152158.3570936-1-Frank.Li@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Apr 2025 11:00:57 +0200
X-Gm-Features: ATxdqUFs6bNpuAZ8C-mefVn5vnH3rPvKnGkG9Xz5ALDijczN73qOaRKozbezrQE
Message-ID: <CACRpkdZkhQRdDCTBxOUifT3uX047us8cFExhZiuAUueegD-zeg@mail.gmail.com>
Subject: Re: [PATCH 1/1] dt-bindings: pinctrl: convert fsl,imx7ulp-pinctrl.txt
 to yaml format
To: Frank Li <Frank.Li@nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, 
	"open list:PIN CONTROLLER - FREESCALE" <linux-gpio@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 5:22=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> Convert fsl,imx7ulp-pinctrl.txt to yaml format.
>
> Additional changes:
> - remove label in example
> - fsl,pin direct use hex value instead of macro because macro define in
> dts local directory.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Patch applied!

Yours,
Linus Walleij
