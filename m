Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D072E17B4E9
	for <imx@lists.linux.dev>; Fri, 30 Aug 2024 22:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725057076; cv=none; b=XIuZr6Wa5uAIcVnOuNAvrdFA7Ns2Ic/186bdBP+wFQ3+N+37mKaF5lD/7FyfuzXaEv32DgRxeHhY+O3JEfFzlzvxethxGXdefCSSKEPoYzmJrtIFsb7GUaHJARceaskd5+ALswZnEFRHEnMIS9w+ZyfEDejRvUa7xSEE3ATHOzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725057076; c=relaxed/simple;
	bh=pwFroKASBqejNUfm5CVZeNPQqT8/UnHI/5J0Bw9Puuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H8npesv3uuyag+5AUuYlS2jgGYFkMFs01qYk3yCkBM9/JsV7K6N2b1UasGV9HBtLwzDTBoUmJVjuCxSiFxQ/rUDIuX4PyHxMF70wTeZnF53MHqvn+sZeysZJ9t6eOe3QPbgeXwTCHxTnutKllisx52tZYbEwsonnA43VPkgBoxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vpm755ii; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vpm755ii"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6b5b65b1b9fso19156417b3.2
        for <imx@lists.linux.dev>; Fri, 30 Aug 2024 15:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725057074; x=1725661874; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jUblgEFG+0OPCJUw0oaveizC+h3CWD0I+O0FLcExw4c=;
        b=vpm755iie2mfGo6tLSGgbCYYrYX94b/W2Or7VdPN1jK2LbUIHsWBPgMx+ZZEDe/mwr
         tBmBB1zCnRy82y/RJXsWai2M6uUkqO1RDktR9M4WBdug5RhgR/BgEXw/+EU2a+2jJEDu
         89V+q5Mv+B/eH3QSE1ZtlzAGypCWBnDFBLWDPeRib7iRh5nr/QTjcFFJQ9CmwrE+XgDL
         ZgFpoxlOtz4G5hR1UgaPDVxs/QO7+gj+424pKSBM3CguNke1mr8mi6mzZoasuVMSiCUr
         XeGvPSx6lOnspSaqqnyrA9IitBjsYdx3U/HXrHrMEMJSsUT64dH5+HPoN48vojTQcdRm
         /fKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725057074; x=1725661874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jUblgEFG+0OPCJUw0oaveizC+h3CWD0I+O0FLcExw4c=;
        b=CJC4fDRvImr1+0kE1jd4NsAGFCx8DizZfyhqXFDNBjuLbYfN4CyZ5Poi1fsqvIc2CY
         u/LZPZecEIhYZFoayAUCohm43VeMbMDLXVIEGPKYCmw9koyBylHAc+1O2g7r8wveEwkN
         ZJjna7j4qwuGJ4guLqlnpgOvlBPvAwbC2Jr0Fk9V5NNmdbabIoETfRZ8xUVHzMPx9lMA
         D8PLvXHiSAV+PasjMiJ10FCRwFg2mNQamou0LzP+DADS49aJ70+F4wNycihqDB2DFdH9
         J059IIFzjr0v0oR1ys17zQCcG/4NcS1u1xkpnhsV7lmXuM2D0LOQi0xMIpUp9clhddH+
         7M6g==
X-Forwarded-Encrypted: i=1; AJvYcCWAsZ9Px8RGPej5V1QSW0R+OC4LcSdrjegoKWFT5vjvVtxMZOGJ6DfXkIK1CuLWMtw8cM8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzulVorB7K5J+4MGNhSyfCcFGaqfe9Dv5N23F2Q3KtRY5Kkc+ic
	Zv9s1EU5HdltHprjzJTDc6JQKmtSoBnG7AMrMHXb0bgFErS+sGkM+erJ6GrgThN8AUjyxHXESsr
	ljAxDfo9egHC592h/vBAhWui2ujRMAj2J7+Dlyw==
X-Google-Smtp-Source: AGHT+IGyK2LRKMFmPldiXpQts0hWvnKTRelfsOu/wi3UPmzSoWa0k2vOUkkkzaMv12N7NZDZi0YIQcRKHgMku4EEaXs=
X-Received: by 2002:a05:690c:d89:b0:6b3:a6ff:7676 with SMTP id
 00721157ae682-6d40eb66aadmr39432397b3.3.1725057073718; Fri, 30 Aug 2024
 15:31:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org> <20240828-dt-bindings-gpio-hog-v1-3-63b83e47d804@linaro.org>
In-Reply-To: <20240828-dt-bindings-gpio-hog-v1-3-63b83e47d804@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 31 Aug 2024 00:31:01 +0200
Message-ID: <CACRpkdaaxCgMuC4YzEm8NjKqnL_9MwqawYigBkp25GntWc40vw@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: gpio: simplify GPIO hog nodes schema
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

> The core schema in dtschema already strictly defines contents of nodes
> with "gpio-hog" property (with additionalProperties: false), thus the
> only thing device schema should do is: define "type: object" and
> required "gpio-hog".  Make the code a bit simpler by removing redundant
> parts.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
