Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213312222B6
	for <imx@lists.linux.dev>; Thu, 17 Apr 2025 07:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744876027; cv=none; b=VWJ/H0LrvWkWQmN+VlENSUkTYGRshQPzIhU3dJKVQYHwyZ9bBaPN2k0Pzuy0stZDQSXqECdLo4h2lIk8+M2UoLnJbkiW4KML5VSu41or3icOUrmzNkc/b2MB8ZjDvENafEMouerd4cCWs37+EbB4CIyEWL62XaY6LXMQmXCtg2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744876027; c=relaxed/simple;
	bh=WEyznqoBqrdJu6XKj04AtQkuSGwFcw9ym4LfF8stkeo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uZlEyfE2T/9ir7e8AovTC/0OC1vobZVF4f6vWdBj/YbxZi6Yg1wMqW281YpX7GqS2pDyGS6FLE/f5WHwj+EutKJO7y28u6YRlhBGS/0s1Z/hv5m9mga8yi3ECB8B4FdCVyAybA6ssAVgfscop2H0/BrWOpJnF3eL24Fe/PnQwog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KzBVN7Cr; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KzBVN7Cr"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5498d2a8b89so494962e87.1
        for <imx@lists.linux.dev>; Thu, 17 Apr 2025 00:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744876024; x=1745480824; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEyznqoBqrdJu6XKj04AtQkuSGwFcw9ym4LfF8stkeo=;
        b=KzBVN7CrdIahWBeWVP+yF4ydGVbfLdbuVB+GeiUQD+9LbMB8BZJXzYzf3l+mJ7FOst
         nZnTpaMEXll5ldan3OX51g1nrmuN8Brt+BqjgdfrysbQdkt85zrEJjg657YrmiK4rDva
         f7t1TofjUbysNSl+kFOWTFsJsBxjqBkGptpvfPpWn45h46xJrYxXVeeBowitauBUNsk+
         /UlbY8E0UJrwzhKRDrtZXyJLBxsEQaHxIAwL5dhDPjlX5xd7JH6cXWfi+4A9gXZ6Vjpt
         IMCnOU8YsjYb/tvWZ/Z0DmUSmdHeRzrTKe4htH93M2LWGvCw2CRKOyuGNUdIUgKmmBBI
         NSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744876024; x=1745480824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WEyznqoBqrdJu6XKj04AtQkuSGwFcw9ym4LfF8stkeo=;
        b=KMzhT7lYDDTuhEQVia1LyQHhFYy5B8fPluW6D4BDw+J/cEkvmxnsTlJ8C7Ze/nplCr
         muOUS+xrRhE/q7wvoXY5Vk4SkCZCDD7ww4RtNujrjTmPdKfpijR5jEOE9diOvt/m61l7
         WehJSz/pGhubC7b8Ie0jdXLyo45UTSdWWbI1tjNlYuk7BWoWVyTVmlvi3mNu9M7YYpER
         V3bIPrP0u3Vdii1vCvb93xUAi2JnW7V2M92y5682rvy7Hu8N5mUsayVkfFA6G9wRcFzJ
         uYj7Ge7JmTcJ0/xSfjOrPG1LEo5Xdi63aZlD8L5qowVZlDMw4dDSvZgsoJhg+5V62hpq
         aWnw==
X-Forwarded-Encrypted: i=1; AJvYcCUwxlMAWzoGDl4q/QJysbMhwoPGS66YyV5sNNgYBEKrtxzsJhp6SOx7Cc7w1NXfbmRgt6M=@lists.linux.dev
X-Gm-Message-State: AOJu0YwgFDU9qGpLcFTIrJO0e+ptkhuMgywlMxCuUsOJSuWp+qBMhEnI
	uLksYQaqrP7y+5GH7uAsMij8UogVbIeUX2rgNJCzQg75+15HOZ0DSpYQ4het4laVkiRjokjp57s
	aIcEvcoC/hSxPFd798o0gKxSakrWCJ6N99gYU6Q==
X-Gm-Gg: ASbGncsZy+o6FKkvYnpws18bvu4Jp4gRPG95A7xAqYdlttOYotweiCVFFtxWYAMg1VQ
	E8OII24jSTKcR+CF48fvgW+9ItCu12o7yvxXnABn2OQuZT19AYMAOWm5LHwPNcpcwcqV9RhFRF/
	Wa7kGMPAoqJdNt5iI0G0FAjw==
X-Google-Smtp-Source: AGHT+IHsWIAbtRpfryXnt3qAIwy3EE4NveEHC7HyLBuEny9/7E3MO+B1CV3UsgSfANPfkNtKQcLRY1ygdj94mYcsZKI=
X-Received: by 2002:a05:6512:3d29:b0:54c:a7c:cbd5 with SMTP id
 2adb3069b0e04-54d64aab2dbmr1542697e87.33.1744876024309; Thu, 17 Apr 2025
 00:47:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250416150847.3422218-1-Frank.Li@nxp.com>
In-Reply-To: <20250416150847.3422218-1-Frank.Li@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Apr 2025 09:46:53 +0200
X-Gm-Features: ATxdqUE6Yg7082az8t1vUSLeJgtF1F2xgv02wcz0LZ7Q-4BmoWJnqMUoGaW2MtA
Message-ID: <CACRpkda42xO+7tmp+CHPfNgx1YEXn6tYDoDXYJo-EnphH9cTXQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: pinctrl: convert fsl,vf610-pinctrl.txt
 to yaml format
To: Frank Li <Frank.Li@nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:PIN CONTROLLER - FREESCALE" <linux-gpio@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 5:09=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> Convert fsl,vf610-pinctrl.txt to yaml format.
>
> Additional changes:
> - subnode name force pattern to 'grp$' to align other imx chips.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Patch applied!

Yours,
Linus Walleij
