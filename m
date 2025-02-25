Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D2D1DB375
	for <imx@lists.linux.dev>; Tue, 25 Feb 2025 19:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740512370; cv=none; b=PgQa06vB0yWH6v+b6/vQ7SQyZsbR9/UdKHJXCN48u2d23J3JcdNkv5RmGtt6SHo0cVko6i+G0HbNONSH+gLxABwdg4tXCuU+188nSLtNqIp1pjCPS+tnB/oDKKDpGJQwNoGVvP2LmxKqkxld27dA3M0rHrDooA4EbmCvoVtVrUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740512370; c=relaxed/simple;
	bh=Uwf7eWdavyjH5gGwV2VxH1xgmznfjmK4oAqMn+DVDPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JQtLD3YERtM/J/yqkibXs+K2X2JLMxa+61uPGNCKuVcWn1yAgPJXYKfn1XG1nQhaLme7RJ+HPk/HtWkaOKnvbXCoXsukJyXwwf3ZxnEOKSKnSL4i4fx8Udmr+78pBe23hio6vfZlG5pTIgLxXwR1QuBpHXsRpz8rnqMmLYjr+2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N5Kn06fc; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N5Kn06fc"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30918c29da2so64278151fa.0
        for <imx@lists.linux.dev>; Tue, 25 Feb 2025 11:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740512366; x=1741117166; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rRfwiNue6KLLPaOFrmVXrPuXrw6AneOIZ7brZ38AEvc=;
        b=N5Kn06fcChJQR7CUzhp6GSGne9SycuLtro0+w/fXJ9KY+XW09brrqc8cUTjBdVXri4
         GqkBcDrkD1tzBlU6t44GLacjB8kAs3luMPKMuQM9LjN655010MxhG+FUyFxoux495NqA
         IUHOXlRz0Pv8k9+BIBD8jGoEt+jmFcH/kF8xnlju8rd8VDZMAxL1bqZIflxXYbksVE0V
         pc56lUFv/oOHSnCYKzzI7zQYc/W6LtvJsUHrhu0YZ3zqNNzE/4QIzHWqO3/k6QzrYU98
         hafQr38rvZHFzD77KuzUpf9c43ccsHckB4jcYHwZt1kF6P1L7HVt7MWPc9nxwMlGqn1c
         6Kng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740512366; x=1741117166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rRfwiNue6KLLPaOFrmVXrPuXrw6AneOIZ7brZ38AEvc=;
        b=SHdhkt81wT8fLDxfpSMIMxj22B7q3IQQzcuf0ccy5lMG8lbwLAGOsMF+jlG7GVZhig
         Zsn10BIHGAOwhmqMwS1YuDO2Bi93iMfImdMGzEUsi5M18RaKgcaF8dyvSFNu59OGCIU/
         8R2vXIoL+Jgx4h/MZpiRKihJ/oOG+wKhEeJ3X1X426TK9APyH7h2T/VZBbwEIWEOZtdO
         CVRT5TJuBI6hLRK3vEdLHpoifPKIOdFp/Fp3YGVUKpkx9R7cTaGJrHwLNdd9rJ9UxHz+
         cvtusNC0v4voAYenF1uMnYm8X7Q4zdviAn/+5AQflGfU4eqjj23hvMsgaL/1dApg63s8
         2wTA==
X-Forwarded-Encrypted: i=1; AJvYcCWHpaIPcu3auWQiuAegNaJTC2BHiYEs3AiFq8bwrZyblR1T9QD6HS8kxbAq9n+Gg8RI7EU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzRdXHHWfANFXB4v4ewAIKzn5lLTFtqTL5iNw2e53Y2nnOrESpk
	JhddKUaLOzMQWrFR02Ck7BF4pxZdRrR8tbQJVeSIGy8Y/e0hJlVgP9y1F0bDVSUMzxEk8TlJxtP
	X5hHp7wwxbYLQ6j5hTrY0U8GGH6Y=
X-Gm-Gg: ASbGncsP6V3L9NP1smL1+cE1thX4GgPTpw8BtkXmuFu7jTNpyyS+cl0lw39BsvSCqvp
	2ldZcv7RH+MDQsZDXAaPslc/JF1UU4w1bkrVTfPcmpLfrdmdu6KPSB/b3vhfpyZ3X9TUyDScrSV
	0KACiU3U5ZXS5x7Z8hKcZUCgDgAl4JyBd+/yvsAtE=
X-Google-Smtp-Source: AGHT+IEKk084A4djpTZdcYmY7yRIuhYdq72PxE8lKK7wocMcZos7nA2xNjrdx5Wn+I+t1aoqdI5qFo8Lb0jS8y7rkGo=
X-Received: by 2002:a05:6512:158c:b0:545:169b:9b51 with SMTP id
 2adb3069b0e04-548510dba17mr3031808e87.24.1740512366062; Tue, 25 Feb 2025
 11:39:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250225192557.2914684-1-Frank.Li@nxp.com>
In-Reply-To: <20250225192557.2914684-1-Frank.Li@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 25 Feb 2025 16:39:14 -0300
X-Gm-Features: AWEUYZkycYP4AmimIz7AT7PNtXzinXlNotQzIz-bQOQJJOzcBgdenJ2hhbqyzlA
Message-ID: <CAOMZO5AFy288CEeZLhbDvpL=_ETnFt2sAYnJH_VbiXzGe5UiQw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx93: Add the 'fsl,ext-reset-output'
 property for wdog3
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 4:26=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> --- a/arch/arm64/boot/dts/freescale/imx93.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
> @@ -692,6 +692,7 @@ wdog3: watchdog@42490000 {
>                                 interrupts =3D <GIC_SPI 79 IRQ_TYPE_LEVEL=
_HIGH>;
>                                 clocks =3D <&clk IMX93_CLK_WDOG3_GATE>;
>                                 timeout-sec =3D <40>;
> +                               fsl,ext-reset-output;

This property depends on the board design.

It should be placed in the board dts file, not the SoC dtsi.
