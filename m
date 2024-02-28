Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08835E086
	for <imx@lists.linux.dev>; Wed, 28 Feb 2024 20:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709150709; cv=none; b=AIsG8333DpN0rQ5i5QLNAADfv9NT9UWR3l42yiZ8gLOBqfK6Xwkz2SIWMYja3SKLy5LoEB3U0ZVW2gZ5e5dP9l5FghYkirgVnbHQY0QlQANbyfBStVcwI8GqZLjWPCPPYb7uy/3ePCB32IP54BJmhNhVZdKnZyqXQKpOQQcW9rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709150709; c=relaxed/simple;
	bh=ts6LE4uaweEwgylH9vL9YuaXUhDNctkwvZFo82XQiT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nWvyDfmKZHmgrnMk2Am9QeehIkclr3cpQ23jqrjhveJUzE5EGEp5FFVa2+PWPwFUl+gFBLPwt2hwn0PIykqRcdhUl9ti14Hqc0w3vgfirPSVlX3NPc7zZUpfShUt4GPiXsBFxFHUhZz5LoEJC3p3GTVwFLiyAC/TLZszaW6Y1qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JeAnwbxs; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JeAnwbxs"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6e28029f2b4so14393b3a.1
        for <imx@lists.linux.dev>; Wed, 28 Feb 2024 12:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709150707; x=1709755507; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0knxogonTr/yjT6gx+hi9WmMThRVPOwQow3XCFImyS4=;
        b=JeAnwbxsGEqdWd7tkPcqXnUGIhBfWpfRdOiS1h9WIGFGoKC4Jn30tqzG8q4h2i5zLl
         Xzicws8GB4va+8SrHaJVq4HBXpJz7vJtZJ+W5/umcK1qkLzY+n9NKf2Gh1AH0UA6C7Bh
         sc9cu/3p/EEWNjQYAKbu8KimbbtJJLuN2IqVJVAD7ASe49fwD9aTVANTkW3fenxlR8/E
         sEIKS9sy1+zUb5HHSsW5fM46dzM06eHfaQhnYnER/oOHBP2grqGf/3ozC0vszizoUn8G
         3jFM4QH6ooY0PZa+i+XKnUorDALSY0fRUcZIjDa/sofn+MQe3FXzgsEUIa8DZtEu/rV1
         j7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709150707; x=1709755507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0knxogonTr/yjT6gx+hi9WmMThRVPOwQow3XCFImyS4=;
        b=KDJyKZ8n5v906oh5pjlJAHsseReW/z2HyeJx9qzOBauSK5ptbM9qfy+0DYSeDVOn/e
         G/AWsHGVsQFEGyWcyQPXjFRRFIseWYOIGVeA8N2DpU4OHTASbTkSbxejm04k9PgbDwLK
         NkRMrGote4ubSWSbEFaNmwF+eO8QY3P8L8T2dvPrpeTWZWOjUnpIZ2tHH7fNu01DNByL
         9HRu3EPFZb53diwkXvWamP/6T7Bj3RbCKxoTGW6yavc2A3alTo4RMtV0Tun9xCpdfLg6
         onzZzvUKTv2snjmfAGjY6TB8AdEf2mQntgOKuvngxf8xujU+M0WhMuq/Tu7Sn030f7GF
         HZ9g==
X-Forwarded-Encrypted: i=1; AJvYcCWT5h2Fh/DrpKRpURbBMfW6a5HvzKjc016EWNrWRKz/qWM1EaYurhWoriuIrK3ZFM5suS5P+BPXE0BdekawvEL4YH4B
X-Gm-Message-State: AOJu0Yz3VjLGDgj18M595tl0zml+h8riJc8nl/jrtE5je6irbWy//fN6
	bOcwIDEHzYtJxAL+esAes6RMtLknqlw/4XUmj+xU8fw2xetjL0f0sB2Cnk8JQz1VRRvskA28ugK
	DpfEbvcTirrzClk1Y4HGBWhi+oO0=
X-Google-Smtp-Source: AGHT+IGWaOuOj00eCLL+e0fMOr+0DQVFTXBPG2HVJ3olnvHFs3MNtqF8A6JwL+hnJK/4saJva8Xzl5TOrwJQA1cwj+0=
X-Received: by 2002:a05:6a20:1602:b0:1a0:57d2:1f96 with SMTP id
 l2-20020a056a20160200b001a057d21f96mr366436pzj.0.1709150707203; Wed, 28 Feb
 2024 12:05:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240228-m4_lpuart-v1-0-9e6947be15e7@nxp.com> <20240228-m4_lpuart-v1-4-9e6947be15e7@nxp.com>
In-Reply-To: <20240228-m4_lpuart-v1-4-9e6947be15e7@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 28 Feb 2024 17:04:54 -0300
Message-ID: <CAOMZO5A0iNpU702DBEyPgkHyOR6M-xDkw9SQTxiFQK65Af79yw@mail.gmail.com>
Subject: Re: [PATCH 4/4] dts: arm64: imx8dxl-evk: add lpuart1 and cm40 uart
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 4:55=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> +       modem_reset: modem-reset {
> +               compatible =3D "gpio-reset";

I don't see this compatible documented.

> +               reset-gpios =3D <&pca6416_2 0 GPIO_ACTIVE_LOW>;
> +               reset-delay-us =3D <2000>;
> +               reset-post-delay-ms =3D <40>;
> +               #reset-cells =3D <0>;
> +       };
> +
> +       m2_uart1_sel: fixedregulator@101 {

Why is this @101 here? You should remove it.

Passing a unit address without a corresponding reg entry triggers a
dt-schema warning.

We want less warnings dt-schema warnings, not more :-)
