Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630370;
	b=Al28j6krVsPhrWc4j0KLkK1UaGBK2QBhUtEQGcjkJMWG5OvdDBxVe+eiEd2xT8b1Bu9M
	 bsD+Lwgxxe2ZSJ2B0tO1E+P7jOC7SCYK1J+Ck94d+IfIV64FCmunu0Qr8+9Qrx4SDu1jJ
	 yaiS8ttUs4P1WIZ0pVm8vCCKovc+K6c2s9wvneiuCfIzAx6WPCAs7txosQrD9XXLgd+g7
	 eEYD0MzdBgyE9yN9ItrB9LmL+gTczOPf4KqzYaBvYZ2u2ETwOIdJF3rFVDxRMd6d3B3fi
	 5DboRB8C6jlCjMO6SO+7JDuxaXjkKI+3qPluKBanhRhVuErWxoQ90Xj7ldNSyEhDcSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630370;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4jTbRTZRitaWiCSV09T/AEZ1U865c63Eb8AZUxy/ufw=;
	b=FWaNVz+Ui4pv39zAQuk+zcNl+s9bR5cjAcIxvLV0eozgPx+bRizUmzPr3G0hsCmzMFaa
	 pSCeGXtQ24fedVdTzBRB9Z1D4g6ddjbzGnuSytn+7G+oCLthFT/EzWjZXPbgOUZSBCz9d
	 kGmW9JcMFSeVlfPn0++Jk8pz/x976AvSDGwmBlFJeP3r8RAO3aUcr7E0UogXKlbdhJxn7
	 u2xeI59rrNUW32AtktmfIh1f3n5Lx924+P44LIHUwF80AJZd2bywc7UxBb1vneTdf7hlv
	 WpjI/36hoI8EWAlQF0+Y3YLiQYUmDsm3r4qEiyNsnixuhNFztgx8XdNiLTKkBTQwzXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E1vZt4bz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B699606A339
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 18:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E1vZt4bz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAB871F000F4
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 18:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795630369;
	bh=4jTbRTZRitaWiCSV09T/AEZ1U865c63Eb8AZUxy/ufw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=E1vZt4bz0JhSxEtEeTI7AoUtNANPm+CYHwBUNqhHgFr/iJU34ypA4gyvEobRGVVWG
	 9sNy2Kp4eRirU984KbHPbBQwRxAMBw0cF1sENozuKbbGNZb/O50pacgvRU6EFJnoFB
	 e0663LxDQsaZnwh8If5SheyJM/1JF5a1ioNQQWnt8O1SqtINZLxt7JmM8TIBcYnl70
	 fj0eds0EpB+nRqjdBY8K3MX2wK2PshqxZbTAerzI0E9u/sPsDPNFFX/ITT7JCW9mrz
	 FhC37POqO+y8cdgD/Fld0E0zttEIf8yVuZhvk+yS4l1Nym+PDNrT+ZV1zf/lgrACLN
	 IfMhEfOT1UEmA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c1479a959aso4589519e87.2
        for <imx@lists.linux.dev>; Wed, 25 Nov 2026 10:12:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHuVPbI9uF4dLD0cGOJ42vNUrHPdXuzZ0xsSYjSkT7yLDDgYSkiZiU4kLpS/hBBYIchEk8=@lists.linux.dev
X-Gm-Message-State: APuU4Z/CVxaP2GB/tLmo0HI+LnndUYYK7Vx89k+N6d6MbnGs1Sixgq8h
	eH1I64WKvMt174BUkBCKPg/IakxK0aEgvvy1GVzY89aRFW/g8vYBsbI+iTyLCDLjWqA6cG99ESP
	TRqJK8OboNoO9hy7ljovD9ZR4UbC+2PQ=
X-Received: by 2002:a05:6512:b86:b0:5bf:ce24:2d20 with SMTP id
 2adb3069b0e04-5c1bc7bc30bmr5709392e87.22.1795630368568; Wed, 25 Nov 2026
 10:12:48 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261106230746.21954-1-wahrenst@gmx.net> <20261106230746.21954-4-wahrenst@gmx.net>
In-Reply-To: <20261106230746.21954-4-wahrenst@gmx.net>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 19:12:35 +0100
X-Gmail-Original-Message-ID: <CAD++jLn3Se-NzQDMatXN__8+xFQUjVr2DJbigjFfy=PE20266w@mail.gmail.com>
X-Gm-Features: Aa3M54rzEawPDtXAOeD0tX6yiM-y94vFsxRv9P0IIXZxjhuCad4qET9fZgXDR1Y
Message-ID: <CAD++jLn3Se-NzQDMatXN__8+xFQUjVr2DJbigjFfy=PE20266w@mail.gmail.com>
Subject: Re: [PATCH 3/5] dt-bindings: gpio: mxs: Allow gpio-line-names to be set
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Vinod Koul <vkoul@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Vincent Mailhol <mailhol@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de, 
	Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 12:08=E2=80=AFAM Stefan Wahren <wahrenst@gmx.net> wr=
ote:

> Describe common "gpio-line-names" property to allow DTs to
> specify names for GPIO lines.
>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
