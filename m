Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9555B199EA3
	for <imx@lists.linux.dev>; Mon, 18 Nov 2024 16:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731947511; cv=none; b=U7puTHp37XdRo1IhpRtwSILq76mGFkO4/gCtHVsLLqXgVCLaeuQqM6w3b9XqixYuFFnNSJwz+qVXm2XqfArY9EdpMoZnAiu0yC+KQVr1Bo+WCUAdJUkcGa3JynvKzAyX1CWHAH7CdBRHhEHof1MIfHTnwMTy2BhC/xg3DsXZwNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731947511; c=relaxed/simple;
	bh=x31hXLbjYV3wi9biP4K+7rZS3e6ndOZvglcnzxylZHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NZrHMQyqtpyhacw+kBLs/1dK96GBN43m1Z9A0YjaWxMrLoShKJBpcsn19sYMgK67hppSGY4JPvHIBYDXCSVy4mZbQ3ERftvom4JdsQO1iH6zeQy2nGj+C3QiVoynub58a9ebV7qN783/0BG9OoPizzLedHBoKb7KrOnSqiCedoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NpARf6cA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NpARf6cA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E96DC4CED8
	for <imx@lists.linux.dev>; Mon, 18 Nov 2024 16:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731947511;
	bh=x31hXLbjYV3wi9biP4K+7rZS3e6ndOZvglcnzxylZHY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NpARf6cAiEWNNEMmssyDT9yyHlXJeFhtN4Xmp+owA4i7fHuykWm9E3qAfQBmvDTTt
	 LOduWA3XtvjqgXlS8PB+7jHGRVazuJRsbZlLeBQHwhytZ10K95AGh2LtgwbbXi9hT5
	 kyw3hAF1gR+UA8ahCNwB/1OeXFLb+UsM6I3HLkia/SoZC7WEQTa4LWVpWVPqlysrpV
	 0nAD3NmiczhhcJn/O7JtIQ7KPHGPesZZegZZF5ZL1GwfOEVv8m9x2j5Xx1tg9QmWO4
	 ThsmdnJKn9TLiGKlTgP0pNRq8IVzP6BhDCcys7q61L5gRkMaSNyarzz7LnR2Zi886U
	 +dt1SMTyG2c9Q==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6ee7a400647so242537b3.1
        for <imx@lists.linux.dev>; Mon, 18 Nov 2024 08:31:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV6tkIR9luTS6EibZMD5nrW7J/bvPHabrSjYPZBsOlua5gRmGddb5GHuAghrmwjbJKhc9A=@lists.linux.dev
X-Gm-Message-State: AOJu0Yybu/y0gRmhcohLTklqoVOWVvVI2JOZmDMAH/XHhl980gwQwr1o
	5yXV+xE+KgCkhwCYrWJWA0Zwik4SxHF6ENmX+snSAGn0Af9V7xrtLN9FaX1OXtbICO8aijo6C5Z
	GcASkTh8KwcL/QRGxiMG2ytJAIQ==
X-Google-Smtp-Source: AGHT+IHgWFGBpHakcpgOPIljqoMGrStpMMrXYqwxsjF16duHhASCw+zuAKS78YVpDNsXsy2xlxtfkrziGx+PnoDYKfU=
X-Received: by 2002:a05:690c:604:b0:6ee:381b:eb74 with SMTP id
 00721157ae682-6ee55c2bad7mr122627077b3.22.1731947510541; Mon, 18 Nov 2024
 08:31:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241028-esai_fix-v1-0-3c1432a5613c@nxp.com> <20241028-esai_fix-v1-2-3c1432a5613c@nxp.com>
In-Reply-To: <20241028-esai_fix-v1-2-3c1432a5613c@nxp.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 18 Nov 2024 10:31:39 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJY5RHnfo9TWFLWBcj5h+FuvbkTYSg+gwN1L_r2ysSMgw@mail.gmail.com>
Message-ID: <CAL_JsqJY5RHnfo9TWFLWBcj5h+FuvbkTYSg+gwN1L_r2ysSMgw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: imx8-ss-audio: add fallback compatible
 string fsl,imx6ull-esai for esai
To: Frank Li <Frank.Li@nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 2:49=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
>
> The ESAI of i.MX8QM is the same as i.MX6ULL. So add fsl,imx6ull-esai for
> esai.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi   | 2 +-
>  arch/arm64/boot/dts/freescale/imx8qm-ss-audio.dtsi | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Shawn, please pick this up for 6.13. The binding change landed
introducing new warnings.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
