Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F753248881
	for <imx@lists.linux.dev>; Fri, 26 Jun 2026 23:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782515143; cv=none; b=mbFgcck8FhM2cpBh13ZH9eJsKlLNNDCwOP2hWkqG8Q6HadlKYqK9pmkNNeeN8SDwUmqMIiJpVN51244J09OG2CnnNf4qmT/eZWByjDAYABEHR1HKyaCa5zuZoFekvaHKxM+sjQ9uEqtUVMxnvzuMMPVLXqxdCUQPJmMRFhdapDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782515143; c=relaxed/simple;
	bh=oDgl9kzs0QzRUmOi5UCM5qXTB4zJ4OD45l3B46hOUDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y3TkCK1pwmUFAb56xdAfnWpQe2VFXXEfHKvB8D8Ogtw0op95Ru2DmlH+ENL2Rlfd8yWkjsOHkBL/QEhSx188gSj7aHjqc1XIyeikSUymLDbZQqTaS3iqUEckey6Z3fjjcWeMtQJLQOreDdkn9baJxNnjMZvFGLKQ1/5k6sNfjwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nYxRBYz2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nYxRBYz2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30FFE1F00A3E
	for <imx@lists.linux.dev>; Fri, 26 Jun 2026 23:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782515141;
	bh=CASER/cI9b9IcBcUdv5RWilxLQkJ9A/bPWjit9BYmok=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nYxRBYz2anD9ShSO7oDshQQwChbWmVCxYdnfHnb7G+x2PQRXsCtDBY/C5wQLtSE13
	 FwdnJsi5Fqa2Y6+NvysaWxqd6DcCjALSXRG4+PX9zB7esE/PPWF0VMr0Kp+708WaWm
	 N7O2IeV1w0VWvVSKAsqnwQZ4Gn/6klIm7+geKLdX+l+WF9hYcg2GfCRNabW5kYqixZ
	 sG8fkavFkE34hnnrUkwNf9G26Z+mdMRBLwiA1yykwqjo3B2ecBrAS6AykTlD4iHJ1q
	 MrElwu+8qgZBQj0FAtfpwsT4kglvPaWgKD/aBbjRgd0tc2fTuyZJPbMFV3fnB6w7+x
	 DYIa0Th8oKcxA==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aea8d5a777so450714e87.0
        for <imx@lists.linux.dev>; Fri, 26 Jun 2026 16:05:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqdVsp5y64lp50kYtfLQf9NnnzkLsDqduLblRvyAkmT6ahDygF3ogPeWUvVW0Q7tt7qVrU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwcCQai7ymINYutlIuM62c98LtViBkNp+aHrp1LG8FVOFi9R0Z4
	Zjv1Bz7gd2q3F+9a9b0t036nQJHqGuQ7hjZGFc2wB6yg+HHvSpQUXEdYOAgHz1dga1hY+fuNRX8
	1ilZR7knRGS6P4IQ/KjVLBUg3TofeQHM=
X-Received: by 2002:a05:6512:2c05:b0:5ae:a9ec:bb38 with SMTP id
 2adb3069b0e04-5aea9ecbc48mr295117e87.64.1782515139887; Fri, 26 Jun 2026
 16:05:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260626183140.3499179-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20260626183140.3499179-1-Frank.Li@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 27 Jun 2026 01:05:26 +0200
X-Gmail-Original-Message-ID: <CAD++jLks=LP73virVRs+9pF76R9qv0Ccgq7k7YUbptN4gHt8Lw@mail.gmail.com>
X-Gm-Features: AVVi8CcD2cFZ0DbaMYH43Hl9zilL9SByXS-2f9JIaqrnE4P2JDWL4l6YJSprn1k
Message-ID: <CAD++jLks=LP73virVRs+9pF76R9qv0Ccgq7k7YUbptN4gHt8Lw@mail.gmail.com>
Subject: Re: [PATCH 1/1] dt-bindings: mfd: st,stmpe: document st,stmpe610 compatible
To: Frank.Li@oss.nxp.com
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev, 
	Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Frank,

thanks for your patch!

On Fri, Jun 26, 2026 at 8:31=E2=80=AFPM <Frank.Li@oss.nxp.com> wrote:

> From: Frank Li <Frank.Li@nxp.com>
>
> The STMPE610 has long been supported by the STMPE I2C MFD driver, but its
> compatible string was never documented.
>
> Add the missing st,stmpe610 compatible string to fix below CHECK_DTBS
> warnings:
>   imx53-m53evk.dtb: /soc/bus@60000000/i2c@63fc4000/touchscreen@41: failed=
 to match any schema with compatible: ['st,stmpe610']
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
(...)

>    compatible:
>      enum:
>        - st,stmpe601
> +      - st,stmpe610

There is no STMPE601.

It's a mis-spelled STMPE610, so please delete the row above and
edit the committ message accordingly.

Yours,
Linus Walleij
