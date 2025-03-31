Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC85211A3C
	for <imx@lists.linux.dev>; Mon, 31 Mar 2025 18:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743444853; cv=none; b=V/b3ayxLXZpgwDeQwootbMgE1aSvDHYSsm5C7GZfjLY32OvQq+JluJadYmG/V2vkS4pcZsIf5Kn5F6dxuuc/8xizAYUSYEUMxvOj5IfhIMnr+4j/P1ajmA922XlHKa0IOuQnEVb3MmmbW2Xdn60hevmP5P/OQPck2xiKc0PaBLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743444853; c=relaxed/simple;
	bh=R8z5shiXlAJJhQoIwb83l7c8bOKbIxipiJo6viYBdqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qRIH4Y2ZBMRGSOV5PbKTwVuVMIyanCFwl6yit/pwyWoCU8QXY6wETznqP9hPAMVlBkf0xkXhhu+MK7oBHxRbVillj9E2I9g700UM7UcN3MMjU+0E8O+D7FWW1Zhrzkqz3IPVVPqX+Q37Td044nVP/q85Hxt4jLt873EgHLdFUQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XYSYPYdF; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XYSYPYdF"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5499c5d9691so5026182e87.2
        for <imx@lists.linux.dev>; Mon, 31 Mar 2025 11:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743444850; x=1744049650; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A5lk9jhdHxqhJGM2EvAiNOOlsC8BNa3794LCUzwdQio=;
        b=XYSYPYdFNtTWw38EEI/OUs5tQJzPTTTvP9qKVDpigm7flprm0KrqViGzcU9qrQZV0D
         VOQ3y/a25sasu6UhZx7SZBBTzyHpRk4tAyN1vBdgOcyWs5WazV9vnjfrEZ8ZuXaN2N/q
         D9UsPObJKdeaVFzhgElaN8fq1DfJyNdgqnOH89l3KvwqMck0vZJKMid6Q5jWtKw8thC5
         vIswPeJLCSLzrPJgJ5dedVwJJ6dCKk9ys4xtGdePrg5GigpK3PmIY+u64IZ8RwD75FGs
         R0va167dZUM/RY5thN4mg6WimJCbIIO5cWOG9RtmyqklLQJkM41GJ7PSwIOBQUXFgo1t
         SKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743444850; x=1744049650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A5lk9jhdHxqhJGM2EvAiNOOlsC8BNa3794LCUzwdQio=;
        b=v2NodxhvlNe+sjVdA3YrVSjkpCyxeEJBiXhvojJKg8kPZwMn8drj8RCSbPI0BOa6JZ
         nWvfTXLqO6AHBFytf4vFtA0HsqByvKKz1SKAaJUBwto4HeBpDoPribUD6eMF1/uRXc+2
         usBN2ZTu7KMKzozZl+qlcSJk41nt+9rAFO8YEbKDU2jvdCXAtPvAWRi9SBREhCEfdMl3
         3g6YaOGVMf3Ko1b901BWwGDWEDuL4h1N+NWWqq8gRE86mpEcduZchVRzl3LwhKpMv0bY
         nxM2XtqzJ+8ea+GbuY07eVwLcDGldeEY+/7vWOAU0QzMZX7FKlLV4NU6EzoNQg4ZZOvf
         NLdA==
X-Forwarded-Encrypted: i=1; AJvYcCWt4SA/JuwsOB9IMv2xy/CKrmNcadVLmy10errfwBOPcmmuVVbOlWWB7PrwlI3yuHLZz8E=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9Q92IzPRMyCEOT+gYsY88M/ylQX/wJLyUJT9jB1So7OHAyDuN
	44g4V5jxot526o1urYkz60xifrPdt8rZXQMS2k0AIQ8MfDFAXkRN9/vQxLakF4D0CLNgFsh/uB9
	Gw4diiEl8ZhFnRFxwS9a96fJxHug=
X-Gm-Gg: ASbGnctFQvj2iL3C6zQUAi0qSV74edLNnz374MUsD7DuU2XZyVfCsMXFxSKcCrgU4O9
	jgDu+lTlGt5lRiKP29GI4x4JsAv/Y5jXK4hqNujT4MUWlv6WHiSJMnqfowH5Wmhp8/TK2PRaWya
	KE/zg1XgYxj1ol2boAIXKjilwcMQxtTW/gzijtyNVxrGfI/ZOUKPgZ97zujVitjp0p8dtL
X-Google-Smtp-Source: AGHT+IHKzL9HwLPvv//AcrZpsGw9jXwcmKxRn4dqH2+JnEGKxalj4U2wocYAbP1m6LV80Fp1ly5wMt1Lp9f4JagIqw4=
X-Received: by 2002:a05:6512:31c3:b0:549:4a13:3a82 with SMTP id
 2adb3069b0e04-54b10dc6b6bmr2519774e87.21.1743444849596; Mon, 31 Mar 2025
 11:14:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250331103116.2223899-1-lukma@denx.de> <20250331103116.2223899-2-lukma@denx.de>
In-Reply-To: <20250331103116.2223899-2-lukma@denx.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 31 Mar 2025 15:13:57 -0300
X-Gm-Features: AQ5f1Jq-g5W90csHkjK9HYDezlRlK94-DydnLNjU-qHoYaOMSuEvsPfN0-r6dq4
Message-ID: <CAOMZO5A4P=JbmXRyz91e3DSFbXjG7aRxMyBaTMsfB9jpVG9tww@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: net: Add MTIP L2 switch description
To: Lukasz Majewski <lukma@denx.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lukasz,

On Mon, Mar 31, 2025 at 7:31=E2=80=AFAM Lukasz Majewski <lukma@denx.de> wro=
te:

> +properties:
> +  compatible:
> +    const: nxp,imx287-mtip-switch

For consistency, please use "nxp,imx28-mtip-switch" instead.

imx287 is not used anywhere in the kernel.
