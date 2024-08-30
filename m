Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8C01C2333
	for <imx@lists.linux.dev>; Fri, 30 Aug 2024 22:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725057119; cv=none; b=YNmLef9CzbxseXFqOjIdWG9nY13rru/EjvSvaZ1dGg9Xt/SAX/t1vZsjo1doaMhrVIiLioMmctDX4m/lB8iB0bTsuvfU7dLl9Gl0b70TO3AcsmFwviPgXjCxmomMfSaDkED9Raf8u9bkz6+QbCG/M8FVKKrkat1I6dW+qMK/bso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725057119; c=relaxed/simple;
	bh=KFKG3Hu1nlWUnpmyKv12SHPAEdjyrNL7oAPMm5KuvUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YAYJMdIDM/T7IbKOiMf+G5SVnY8SLxKUn+n7RVGW3eiedhQFQDaKSLPnmL7p0ztv1Cu2pPEEQA4/OdQ04GQ0IwV4KCfE3S811jPNKoEUnAY55nFBeACp89P4emHJOBO5HYUbuoZR96uDDgghzF8kc3azoe6X4tdkmvw7SsoDAzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WZ3VxtP9; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WZ3VxtP9"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6c49c9018ebso22130807b3.3
        for <imx@lists.linux.dev>; Fri, 30 Aug 2024 15:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725057116; x=1725661916; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KFKG3Hu1nlWUnpmyKv12SHPAEdjyrNL7oAPMm5KuvUI=;
        b=WZ3VxtP9G7Jxu4h6YVZlzkAx7nEkreqeAzOmIx/NaRQhl/ibH1igBB0+lZcWRXes6W
         9SnY7z9Di5Y1LcRtoW//tzvbVlgasOjnvXKDYlObvoh0JQzkS6r0gg0xgiuu51Zjd+Rs
         WB2XqCvxsraNmgUMSyt6XRPJD35NgY+aSClZYXpKkn8bNDK4446Z6xy8PojoO1BuoBLK
         Pmh8LJrhJRzqT/6Bu7FTXmaf8xgqM+/UgUfWJRir8RJ2O/SwMrmLZEjimEuBAXO4Yor0
         MTkLTk822V84ZK6dzIG+bgG0UKJ9unwrEmsQlHmmo+rkuiZXYGycXWZJEXEJvhTdIoRW
         Qrpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725057116; x=1725661916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KFKG3Hu1nlWUnpmyKv12SHPAEdjyrNL7oAPMm5KuvUI=;
        b=lucTsWAD6UHx3Wkb915VzdlZMGmQQtNitxcRKqSqzEEYdWbVo//21maWwcc4rTbwdi
         PTZ6VE4RNm31GidH+t4YSpgaMo3yqWcIgzU9XP2Fqkm7NXEoHOR+LXMFdvKECZ61eLmk
         LJ7x7BJQ3SSzumX1YY/Oe9don9bqbT/1oLTVA+pf4LWhfYCgzuFu+V+aA4OAjO6kudqS
         z074Ecv+LKfJYuEmW91Qu4xVeH8mx0fdMythWjF+cNTRMLRwKHMrInX1MZmQEMb0GRJM
         aG4UI4DRkRqvf4PFtsFdZdrstaLa08sYqD6cnqFAK//iQS/lbIfFcXWUup4owcY3H+Y/
         T9zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUa8BuvBEzorIxaCKBrqPslbQ0q5184mkcR+73AmXFni9DqCB47fstt6XqxjAQrWyhPuS0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyM22sMDdz1SHOhSboWK59jIR27ItQWIQ21ChAgX+pdvNWTuax5
	P8MmDoijxZhWeqxPR/rHq+jmTDOGbJIrI9jvgICwCySlkbBeiXKPyAFDTWf3Ob9Zn5xw2V71+xm
	KY54gG+CjkMsivZ6wwS7p776+rmLscEsQhSShBw==
X-Google-Smtp-Source: AGHT+IFqP+CzrvoB2S61/4pRdTw0AxY6t4jTtKN7C5yPQXEGWe74JgnEezcm+LFW4t+C4VT7OfM7HAVzLldND7oy2+s=
X-Received: by 2002:a05:690c:4589:b0:6d4:f41d:de2f with SMTP id
 00721157ae682-6d4f42d2475mr13586507b3.39.1725057116454; Fri, 30 Aug 2024
 15:31:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org> <20240828-dt-bindings-gpio-hog-v1-1-63b83e47d804@linaro.org>
In-Reply-To: <20240828-dt-bindings-gpio-hog-v1-1-63b83e47d804@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 31 Aug 2024 00:31:44 +0200
Message-ID: <CACRpkdamSDSPmTM9eEd=QAdZPM0Mb4mjh2+mQv7cx5TRT7MBNg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: gpio: fcs,fxl6408: add missing type to
 GPIO hogs
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, Bjorn Andersson <andersson@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 11:36=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> GPIO hog nodes should define type, otherwise "dummy-hog" boolean
> properties would be allowed.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
