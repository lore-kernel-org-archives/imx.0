Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176E21C1AAC
	for <imx@lists.linux.dev>; Fri, 30 Aug 2024 22:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725057159; cv=none; b=o0j4lx/Cs2k7Yigg4aLW1GW0lIq6IG5VCGGRxO7c3oiMjbXzUwFv60NRh3cEiaKzHpza3iU0Pg0jatDXmVLsqQlYJUDmfY7dnGW4/CjfOSl13PPLUdgfeohoKRlohXQeXPE+gnxob8OsekRDODetO2Spdzk0qGwjt3Vp689mQ8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725057159; c=relaxed/simple;
	bh=O4BVzo4/O12zJnAXRC6H/18YaBmS+B36iZcOSvO8Wdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lhxDuU6eTTkY5UdOkzHP2GL5CKK9FJrKWNTmpePl5iPNecgEWBtGmg0jrBRNkP3KzSWYbvUKoJ7NZOOPm4rHMKfCtu6S3E4/VsPZ+lrKb5HKx94QENSTD8JUfPhL4ORtquVp60jhiA2szOKYaeUBzPcjewFiq1/uxYeDGd6euHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wcwaaMnk; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wcwaaMnk"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e03caab48a2so1944641276.1
        for <imx@lists.linux.dev>; Fri, 30 Aug 2024 15:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725057157; x=1725661957; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4BVzo4/O12zJnAXRC6H/18YaBmS+B36iZcOSvO8Wdk=;
        b=wcwaaMnkIyq2F5eBPwctNhnlGbwlTT7eRz4ewLscjrdpiFo0hNanT8GytlcX5aYS4u
         /tbCPvjsKmxNO+o+E+gf6WmO4gqGRI1JqV5GWp61NxWZDxcCshDSOVSK20L7EBa8BiJB
         Sjjbg7cMXq5SVxmpzgVfXJcuRnKvnc2F0p+2TObOEFcsSOu80KdYiomJ7uh5dG1dBBwg
         e+AjMDFM+LUDW48lXLDOmUo0tUlXHrPzYjgBjCAB0VL4vvkaAD3WY8RdvEAmAUJKTUkO
         fvOCJHIVy6agdq/omJ2VvLL/+RiRo5aCzNtHKODUImnb1AD23NJJc3HmdTtR1pRXAMnP
         hMEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725057157; x=1725661957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O4BVzo4/O12zJnAXRC6H/18YaBmS+B36iZcOSvO8Wdk=;
        b=G5FG5e4nWc4yu14R1F2NnbDBToRE3F/XBPHhRaIdFSZg1VEL1YV90QjzNfypvOTb3X
         XXQiOS7u/rDDX8BR5UgTHUrLtXgFrW0po6xIuiosJi/rErBKzwMnDz65Fvxx1OJpItUL
         jgqd1F0+qsbAsDek9OuiP+4TZlLN/yoson9BLiXboTAbxLlBUeAg+j84P3mFlvfSBQeF
         Wr1dphHbiR04I+5SU10xsjzwojlhbZr1xQX+1/9ZJ586vMkJGiRH3jcRAXIK66i5xguQ
         jlshtaQ6iH/4tGlvxet1+BZrAJfSeexZ5pMFvOkkykAbt2NkycdeeHkD+eP9+nhCeLZa
         ko8A==
X-Forwarded-Encrypted: i=1; AJvYcCVT2Y2nVzDx6d6FEFwVL4SCalb6Jpaknx/vkEJ6/4I++AVFuIsxsJWSLMWnONZZCrnyEec=@lists.linux.dev
X-Gm-Message-State: AOJu0YzwoYC6yh15InvGU2hhIj1772pe2mkvVwupYu0ImwJQpmWYPcou
	dfCCAI+NftEb+DF0m6TDMctd6FBiBfMlcokGiGzI4IPXLAnVxgyR47GeAR1Jn/UnNXBgdlpnq9g
	Q/n3fVs3bSZXHyas5IK6PPKnzcAndR6h/ug9SGg==
X-Google-Smtp-Source: AGHT+IGY8O84DiR2Aaig1136Hn1BZ4NVKNmKGEF29tIOvuMMt+pTTKh5RAqmh/aYiy5yQpsPuZ+gYm0rdnzyEcUt/SA=
X-Received: by 2002:a25:8391:0:b0:e16:7070:97e6 with SMTP id
 3f1490d57ef6-e1a5c648a4fmr6700554276.9.1725057156927; Fri, 30 Aug 2024
 15:32:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org> <20240828-dt-bindings-gpio-hog-v1-2-63b83e47d804@linaro.org>
In-Reply-To: <20240828-dt-bindings-gpio-hog-v1-2-63b83e47d804@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 31 Aug 2024 00:32:25 +0200
Message-ID: <CACRpkdZzF5yJQnnDsjU8cTr9Fpe7wZZXoW3K-wFYuAq2vv8XxA@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: qcom: add missing type to GPIO hogs
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

I suppose it's best of Bartosz applies this to the GPIO tree with
the rest of the series?

Yours,
Linus Walleij
