Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBF4238C12
	for <imx@lists.linux.dev>; Wed,  2 Jul 2025 19:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751483994; cv=none; b=lP+ZZU6v8/YSwyJR9AcvQ5gz8PDPuKfd0USf8vzecyWLMrfzHHoKsozmX14qrhTQqX5WwMtfngImnDDgJNY8jJEGp2Zw3uegNKqTaStOO/7iSK6Xj4uLF6rmI8+LTpqevc0QqCjzPhwTcX7anvmeLEA6LrcZlSEGWlk3Lw+uFUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751483994; c=relaxed/simple;
	bh=U2A2n/nNOOE5Lr+/Zh6nkttWy5BZRLjM2gogFdEHc2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nqt1ubEC6GrgSIpq+1j7rGFRcWI8VSo14xNo4g3oRi+PaAIDs3F1h9zZJd5G5zjBdQHpuBUlbn27j18FF9bfi3IwXpqeO+Wp6wUbBuEDFN77R6Dlxqdhabpme/mRnSiouR3fyzCh8FDxwUZpEzYGai2COCClT/px76qDwHS0fSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bVs4qgJy; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bVs4qgJy"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5561ab55c4dso3899611e87.2
        for <imx@lists.linux.dev>; Wed, 02 Jul 2025 12:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751483991; x=1752088791; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U2A2n/nNOOE5Lr+/Zh6nkttWy5BZRLjM2gogFdEHc2c=;
        b=bVs4qgJyJGLloAVrRsdl6+dOwacNasGLqkD3FMNJFeWD6tamuGDKv7SVQABvqVcmsb
         ifLd/Oi6s7WoaI4hVfeDCPrWKKgBV9agTve+3ysIX1piS+D/ovZAyynKq+7p8at8KIXr
         RqNIx1EfSjlan1oFfwsDinDmQCtTE5M8YCtPyodmrAHMeYTiOJX7eusMMQi3yrL9oWkB
         WZe8eXAfmvETwky1Se5b1CK9vxKx6vUa/CCFDF0MVp2gTvq9THfvM1BgRiJlTfK8/U4T
         ZpmC3/xQfuqJl/HbbbnUiT03ETKy8pyXjYK9k4iZNqXxgaBxYFubPh+lo2aCq5JtSeJc
         DBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751483991; x=1752088791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U2A2n/nNOOE5Lr+/Zh6nkttWy5BZRLjM2gogFdEHc2c=;
        b=FDWEdUygjih4xUqUCq/94Oqp4lDtT3scAaaBrvNfGxNYfrmzuEq8fbqWTXtArLwiEI
         /DsuGp7Vvnaq283BJ11ewXqAeMGRi0+Rriago4y0dG6zuT2GMqhrIFUr4jkRhuln8TQ8
         VV12VhnYiEK0QM4zNCt7uowkqWRyLb+0nl4cCpDdRgOsFI23VsJg0cJvXmQ034mcc0WP
         1N/SCFf8m4Bvww22D9iXVzllUX22XufuNT3UWL4AzrhTJ6X14nesWZcTnx7Hff1cMCQh
         vWVE2nJ3NNH2KPDqwDsB4u34axvtc6RW9eBqoHIiY8u80Vu8rQ9IFW/Dae4JBRYH6Bn7
         LFJQ==
X-Forwarded-Encrypted: i=1; AJvYcCV32atHZdAiAwuWMYWpy5TUraMISHrjWDVYvQhItDGdwP8jnRWQiUGooPS4DbT6E3HUsw4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx97CTOxHH3WyGmghMcjsKv3RzgqzaSCkSCSyUrVzwiVpEjOLc0
	Ru/VeLFkygfUunFLdXQmHMIldw7VtXMosDbJRiUBpZHz+NBMxsK/SO35473XhFjkpCgZkUV6dMz
	QUghFe9k/9pu9LCg3dsdP72qsZUG0DVI=
X-Gm-Gg: ASbGncsBkuR3yzTmNA+goJNMLyALeULMkfNwYcdkYkDZJWcmMnYrsIL0DD0A6cmIHw2
	8+h64rYV9Z2if0Mon4vtcvm2nTCwLBPCN9rvgrMWu9iKb/XwZF+nEtyqfCILXv2nCNNI/7WD4kZ
	xF9L+u6j/j3PjHjAAEch2SSeCvUVzW7oA0Sqy8Gbq/C5e8VUqAsVRIFyP0oBukQsyTQQtIY64SB
	Rl0mfykCDHwgg==
X-Google-Smtp-Source: AGHT+IHvelr2Sf9x0pHkrhNzudbB0N7XiiusqPIR1wY9p47fZeSLcVsNT/JVRmmR8/qM5y2EGSD02riNIPD+nyU56ig=
X-Received: by 2002:a05:6512:3994:b0:553:5d00:be7e with SMTP id
 2adb3069b0e04-5562ef25a02mr169873e87.39.1751483990547; Wed, 02 Jul 2025
 12:19:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250702-hb-dts-lic-v1-1-bf15c0a74577@prolan.hu> <ae71768f-303e-445d-971f-e5feaab39e22@prolan.hu>
In-Reply-To: <ae71768f-303e-445d-971f-e5feaab39e22@prolan.hu>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 2 Jul 2025 16:19:38 -0300
X-Gm-Features: Ac12FXyKYcQK1-FZVNpekraID_F80XT5-HRO1qYNpYDshT-udtpBPslocc_9D9I
Message-ID: <CAOMZO5AYXvq7W+SY7H3yb3n1-WwGx6yFGA_q0VGDWmj1FvJtEQ@mail.gmail.com>
Subject: Re: [PATCH] arm: DT: imx6: hummingboard: Replace license text comment
 with SPDX identifier
To: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
Cc: Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Rabeeh Khoury <rabeeh@solid-run.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 4:17=E2=80=AFPM Cs=C3=B3k=C3=A1s Bence <csokas.bence=
@prolan.hu> wrote:

> Several (7) files have been left out. I will resend it tomorrow; it has
> only been 12 hours and I don't want to spam the lists too much. In the
> meantime, please tell me if there's anything else that I should
> incorporate in the v2.

Just a nitpick: the Subject pattern should be:

ARM: dts: imx6-hummingboard: Replace ....
