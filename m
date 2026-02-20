Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9B5342CBA
	for <imx@lists.linux.dev>; Fri, 20 Feb 2026 13:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771595184; cv=pass; b=PuIvraFT8OoeSRKw4ue2eu0JbMoCHPN9aw3NzLKc9x+tCmgDFWLCOTKTU/wxDjq+E8pvWZx36PGePZib13MQRgIXqoAMM4YWMiCJM3HQaW50k9gEVTKQFU5wOj3lyPm+ph85y0TuOnEASlj1YhW0/TlAH23a56RLTyHsDvqMFyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771595184; c=relaxed/simple;
	bh=XOrJsV7xngK5oabafDdTfaQdbOak3Z+Z+nL4+6By2TE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XO4NQfOFGEFggSb6A/Y5SMGbPty4YR1zmqBjty//N/vZ9S14kFG5DESj+8SB5/jR0vgY64vIq1nmZ66pkozuTU2o9SLc/t3IVc4YssEj0ZS1fksxmj2z43TQV48DAid2+5kertOsS2feUYU/T4Dqtw8hoUZtKZyH4ko1Zu07HAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dDBKT8lR; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dDBKT8lR"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59e60b3ccdfso3038617e87.0
        for <imx@lists.linux.dev>; Fri, 20 Feb 2026 05:46:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771595181; cv=none;
        d=google.com; s=arc-20240605;
        b=IFFXiJhpDRP4fitTY2yBKpaPwCoYVdPk/GI57Ku9GzT3IJVb8/0F20/kJj2xfBn33T
         N9g6vVHvYNz0l+IeHV6YOiiR/JYDc/0jswDGTP5uhEghXy7Tgz8bEHyVZ6TZc0C4Dxu/
         SUC1EgzEeJNG17U3OcuL7z9FDOMeT3MXLEkcDGuaVbyh+bEOyz9M19XPDZNTExfJ3GYn
         XKZwHixOEEc1XX+VlkNgMhDArb3hxt3OjXVL8Lx0Mlr87aUxqKKOQwkTftT1jxsQCmQm
         Kx7JNkQMGM9PhSTDW3wKOCjI8srMaez9xdAIHiPczFdiekyn3Uos5T2TcDivKbnR0dtD
         hZNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XOrJsV7xngK5oabafDdTfaQdbOak3Z+Z+nL4+6By2TE=;
        fh=K2QrOw1AQTObm7Mg9vPNjeAjm8GeJqFpBVU5zhaJWFY=;
        b=CHds/WEoW1E5NO8nB5ul6+hjeplVVqsn6ksigABI52wFB/yPOmDHmum/QqOzsTZ0no
         LLeYdWlPKPgUF3YEY49kU9BfsicJynNHrYhqDf8Oor6FrF09Ma9LCYivdE+IDOBzaaCv
         OXPcmGpO+Q29NXRjLPxmcfG/FfyLFuXoq9WmlR8V0mCRT5rn/8Ft1dimdusVPCYjO3hS
         6IWoBRX3C+16A+/IB9pmEmYW5yhQ1G63t2idr3z1e28y/OrG+iyYHdEpRH+/VhS27BhG
         7BFDOmzD7f5Q56u9EwKDKxbAOcFv1qYFGXas/73bdmwna3WZp5l8y+rtGoqtr8ITLFDe
         NLew==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771595181; x=1772199981; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOrJsV7xngK5oabafDdTfaQdbOak3Z+Z+nL4+6By2TE=;
        b=dDBKT8lRByS5sCaMz4R+UZOtnJi52kgQAgTUk8rNMNkmys09cd7+CQBUtB2U4n0Jpm
         qJE07qOck9KLNRiL0cy6QFjNx/Io4dUEbselb3bG6QXGcwX0J7QCRlM7sXL4sbd/oTke
         /Pa4Nn0fqDU4UHgWx79y/2RYlTtQejryuBgfJPb9Vn2kAp3HMYyUpdVBsINKiyeUrRM4
         9bYdCSlTbz3G0OjV4vhQsUhp+CRZePC53u5gwKniVVo/H6M9+uhuyx/OU+fw0rqFqh8E
         8w5Ma6MJMiPlDwvBa2lnbUu6aYiP4XYfhjAyzLUjKhd21joB2mwe/HFF6BNuRme1xMiS
         5scA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771595181; x=1772199981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XOrJsV7xngK5oabafDdTfaQdbOak3Z+Z+nL4+6By2TE=;
        b=ZX1dUgHPEFLKyvxC5ghoL2t56uvT0fHpWO7GGJuH3g1x031O6+JWkmHYJSma0NUI0C
         k8X6JKejsKNUlqJ9+C1rCmCyU1i5h/TFDMXVD+vbz2boiY1GR4JO9upXSJcDEsEvpTGW
         dOy5hNCK6LQKAHHrEcPdF5fKO3E+vuJ+fDaqx8Fp3NxzDskPir1WhPtfyvTccpfjHHJR
         lliSXG3hJwrMCOV5NMfVnsycHvCK8Ae3K2v3Que/MySgQbG48CF5zwZZXaxOfseg43u4
         h75RMSIkUlUBZSr/CBNKrG4l4Stj/Wt5MQNKCLvT1wQabvzrWXjLfAnedYQLrxyd0RBi
         k/Gg==
X-Forwarded-Encrypted: i=1; AJvYcCX9xImyDTma5EjEsDQEqfYvwkmQRolMvarnqLVUOhtsnI+VSiMK9iFEThShQcAC+dJfwls=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxj797ZAlyWiEP9IDdSUOTr67a9aa/ZqMccLSMNO8yXLMIhmnlP
	l2rFsCiGlzHE2o9/hv/daI9ndC17vi7E4OhbT93cImQZpmcbbkyArycCwC3jwVWN5EuAjAL9+VD
	78vI1E8zMJiG7HX7XKs872xjhvuvqdt0=
X-Gm-Gg: AZuq6aJQ9saS2LRcuvZ66Xte0+p0smboZoU6yk5NmNdG7quM+EvHwGqlmfzcn+QCpfH
	u2D7dlJQ+1mdPM+2IzudJe+mgu2mWXg0B32K39QzLj+TSBp6jKziVQt+zTqcIFicFx/8bYPl2xW
	SUC/oMJRqX/GEbtWXY/Ucz7pC2gzK361kHIIGyckG7K4Id8Dp3EyToengml/0EhFfxSp5DK3a4J
	3Ohd37p4mBbBf8Uqe6UNXCAg5JFAhZPuxT81Eu+u7XJqqYiQgLecAtKGHKnBAL7s4CJUMSubiog
	v99oOGaRkoyx8XUI8Zg1u9F43GaMmZlXfiAEFtH0IiQZrShV0CuFI209DnUxuwBpovozDT8=
X-Received: by 2002:a05:6512:15a3:b0:5a0:4345:3b83 with SMTP id
 2adb3069b0e04-5a043453cd8mr632693e87.47.1771595180578; Fri, 20 Feb 2026
 05:46:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260218132339.32157-1-Max.Merchel@ew.tq-group.com>
 <20260218132339.32157-2-Max.Merchel@ew.tq-group.com> <CAOMZO5B5k_i_q4cd7SMNAkicF4WfEYNVUSrg8AamQHNpGys5mA@mail.gmail.com>
 <be39b302-a29b-4dcd-a3f1-1f3781476951@ew.tq-group.com> <d1a87e01-f887-44ad-9b95-08c0e29be6ee@ew.tq-group.com>
In-Reply-To: <d1a87e01-f887-44ad-9b95-08c0e29be6ee@ew.tq-group.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 20 Feb 2026 10:46:08 -0300
X-Gm-Features: AaiRm51_GsoZDQD00zZcBnGdIZ49TtjBpvahUOln8EYXFWstEClOh9muiMle6fA
Message-ID: <CAOMZO5A1+kynXqCDXA=aFw1y9UxnS4SQN2hbQXEmdXVgA8PjUA@mail.gmail.com>
Subject: Re: [PATCH 1/4] ARM: dts: imx6ul/imx6ull: add boot phase properties
To: Max Merchel <max.merchel@ew.tq-group.com>
Cc: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux@ew.tq-group.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 20, 2026 at 10:14=E2=80=AFAM Max Merchel
<max.merchel@ew.tq-group.com> wrote:
>
> Hi Frank,
>
> I forgot the boot property for the spba-bus in imx6ul.dtsi.
>
> If Fabio gives me feedback on my suggestion to improved the comment
> messages, I will send a V2 at the beginning of next week.

Yes, it looks good to me.
