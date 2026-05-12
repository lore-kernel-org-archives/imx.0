Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DD6330B2E
	for <imx@lists.linux.dev>; Tue, 12 May 2026 03:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778554917; cv=pass; b=uCqrUyOt/jz4C5JEJnCi6QiD+2PchYRrtdSr0jabW9J7n9rXHbpM3nlOvKGntJC/JBtZG5Ey7hWzlgwuXzMJpBbSyZvTpOtRuQ2ohBjHCee1nXFIrDkLoeJGuHq3ZWE9boHZe7AVfjdkG8Oi9ny3Gn0WOXtBuv6Unc+gwGprf+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778554917; c=relaxed/simple;
	bh=es3nmtoXk5y9d0D9b2rbXD5gJD3EyXcg97z/f2vWDBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eXcJlNhxpai53HI/m0Vk1pSDKKF0DkzHWw1sBDMmv91hM/K1RbhaZHXBLDV/5Bie/Ugh3ksynzJji6wQEHGQw+jToYFWSZtFoSTaJ/0iKlFCdu+SJo+Wpqw+WDwr49ZTrXLDB6TjCKJeRpjfh4FJRlnXaH2j/XDB24vTEc5jmG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Obki7094; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Obki7094"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a8704dc3a8so5020211e87.3
        for <imx@lists.linux.dev>; Mon, 11 May 2026 20:01:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778554914; cv=none;
        d=google.com; s=arc-20240605;
        b=E6ntyqgBpYh5mJnhlQ8cl3w24NxuCkBtPS28KF+VpRjhtCa8AqetheUT0t9z4M8J1p
         c0jSjDqiwOUiX/Gype1h6keo0x/1yiDqX6cJ11VhoszOeiHEqM5D9vzgpkin0ppAIomu
         wv4wb/HIB9JRw9kB70jKciWQ7N/u7kLT4k5Ps2Lt5M8viRKY4UI5xu6xNpxr+f8DcfOl
         1S03P0++gfAc3Jd79lvG4Biw03Pjsa+S6f8rZhVeHFTcHXd1+/veD+40CB8dyGPTkAEy
         +he2uThKRxTT871L8bD1erPW7KbpKNaOdiHZ46sfLCnZWWKjn3AFZtu9rUUe33w1IG3N
         9kTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f5afZUW8VRAgRwwZqxbpryqh9Su0hrtmWrw6tgsZctM=;
        fh=9ZICvFtkDKyqDQoB+7+nncBJevAdx3XDxLLvFYjNdAI=;
        b=hqfLnHqtLZ2K8p1N+Nr3qUtHe3Pl9261fSWZdPDg79L8l3fKAgW6NX+JRho5e8lYD5
         pLzL98qYHRII4Gjtz20hyClFOy46PJe+d9zQxDldnmYnCxjUK/4v4Gs72KejOyGJl6Z5
         7fYep+Ss14fquXwkQKubtk4z5O3//NtGHSYH/iSvgGnY5yDA9Q4beprwGig1r+hJO+qp
         yGFTpjuMy7gBRzbjyL6/AA930hPAlX39+GlqOgrmQXzG9nfApsO8kS4T73anOJAWNcz9
         gs2tJv8yQYEL0SM6d81sn+LjFRizKGq1ghtwU2LA795GRW5nGy9GydBTcwWHAdAof1D9
         rtQQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778554914; x=1779159714; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f5afZUW8VRAgRwwZqxbpryqh9Su0hrtmWrw6tgsZctM=;
        b=Obki7094TlnaebvtK8yeG2CsabpnxjmqabTZtuyQpNx0kverMK/Q2UcHYsPqflSnZ8
         Ll33+7/ZnIgKetvZkfQfYxVYdFD1VrPQaCDWBVNLed9RjzzCdBsXCVhsVBP61++TbJyw
         +R5vYSXBPwzK1rC2KHKLfgZm/pEQft4mSOyOWCds2mn1ZZ+RipgkhcSGryoaDvppdKvq
         yZo8B2KDiVdBxkZmccsClN1RXrrG+T8TalyL1+DuogiyBhI40pIAoPRJpqZ6AQDFJKUe
         Dumtbutuo3p4sq09+MFf2z0ughNX/9WzYrfNnulG0II0hq5oYhRUJt8VToPqFTYBsjoL
         Uh8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778554914; x=1779159714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f5afZUW8VRAgRwwZqxbpryqh9Su0hrtmWrw6tgsZctM=;
        b=Qhh8Ls0G/QthKwldo8rdUzmZlaZs97Fb4ZtlD8dX2tZEMApSOR0FdKb5gAenwbHaR7
         y09874DUUUL0YAKaeFZzZLFw5hsxnxg0yD5hiwMemuW/Crk8f7v4L8ST4ZbxBCqqojEw
         LNgsHxfnwXs9N+wYDFQTj66L3e5eKUhDnl7Kuhz27esmB8ub6Qi0zEHmX/OZ47ylEOWw
         omzzyHWyPV9gLxXSXfeBRCFR/WxucOiR6iUxHUYnY+4A2CWJUZfAAb3kkm7eRJ7b61+7
         ctghXnnlFRVyPsZ7UqarsAc3yPyUe9/Enup5sE2u8reYid6gLeSTQpypyso1PyUuNitD
         ToMA==
X-Forwarded-Encrypted: i=1; AFNElJ+QbyjpUMiU0UMfGCnHI0O/SAlZoKx5TUMXAJFXZkEjbYNZIN5+A4QSPGM/3b8KTQ3A6Qg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyyI+cjC+XvfUOeroEPK5z7Rj7XnrhlMzkr4wgxK2QRPJNDLPLK
	02cNWOR135DpDmFT+T4+n62uI8eRKIaqn3wjVIUAD0jLbtkf8ydUVHtApT4U3KJYYxeeKBqXwPP
	2ZxiALPG8vQWtQv3N3QTQfdR6FCg4Et8=
X-Gm-Gg: Acq92OHdHMi0AnT35xl4nFw1ppQwLmCI9To4okbs5h50lQdQNuNyGORVOcVOCJzjNgY
	mbtV7UYMzfbtg94Sz3LNCQ/U+cn0hhKhLS2h0i+4JyZi7uXZKJgOOxm9bIrj10B1btuoHghu9eP
	6IEdQbQqEpG7OqiUu9iJ57l+3sPgwa0twoa9P589btErdnpaz84OnEunNymN5sfuWPN+u000+w+
	LgwI8pFWh38l3u0eB485sGyxiqy6vFQYit1K3BlCGtQO+x5mUC4gK0cl0scfFflw7elIaaytmUG
	/AfHxRIgJGMOvJd4igAGsw8D7kuBMityGe1rpBZ25H+6n0I/yUtzRJ9TGt5nDXZDaNsAvGx4c+4
	GK9AWW6k=
X-Received: by 2002:a05:6512:3d04:b0:5a8:2b1a:26f5 with SMTP id
 2adb3069b0e04-5a8e31f5a98mr270389e87.39.1778554913320; Mon, 11 May 2026
 20:01:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260512024850.904551-1-alice.guo@oss.nxp.com>
In-Reply-To: <20260512024850.904551-1-alice.guo@oss.nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 12 May 2026 00:01:42 -0300
X-Gm-Features: AVHnY4JM8xWYId7_GEwqhTuQbzqK_Z2r74tfHHyGe9m6Ozr37EBkt-UJHpZx-e8
Message-ID: <CAOMZO5AzNnpL2bCf3h-4Q+sp6Y7aPgGJoGC6_xLaN4dOOZdUKw@mail.gmail.com>
Subject: Re: [PATCH v1] arm: dts: imx: Add watchdog support for early boot stages
To: alice.guo@oss.nxp.com
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 11:46=E2=80=AFPM <alice.guo@oss.nxp.com> wrote:

> --- a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
> @@ -325,6 +325,17 @@ smc1: clock-controller@40410000 {
>                         clock-names =3D "divcore", "hsrun_divcore";
>                 };
>
> +               wdog2: watchdog@40430000 {
> +                       compatible =3D "fsl,imx7ulp-wdt";
> +                       reg =3D <0x40430000 0x10000>;
> +                       interrupts =3D <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&pcc2 IMX7ULP_CLK_WDG2>;
> +                       assigned-clocks =3D <&pcc2 IMX7ULP_CLK_WDG2>;
> +                       assigned-clock-parents =3D <&scg1 IMX7ULP_CLK_FIR=
C_BUS_CLK>;
> +                       timeout-sec =3D <40>;
> +                       status =3D "disabled";

You missed passing bootph-all here.

Adding wdog2 would probably make more sense on a separate patch.
