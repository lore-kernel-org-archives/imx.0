Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2198219413F
	for <imx@lists.linux.dev>; Tue, 10 Sep 2024 14:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725978033; cv=none; b=Sl4DFcJWjv4fP0ftuYob66fN+AkK9nSBGuPXvVLVUpPGw5WDed9N6uJmF4ydw4yZsmnRINgKAjk2RUk505+r+aWMuVwfIZL+IovgQRV4W4F/K8/1Yb3dbLHlN0dkht4/cMigQD9ckG+q5HF7ByJILXDVgvNhUreqrC2eF2WgjCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725978033; c=relaxed/simple;
	bh=4KDF1e8TVKxPgvhlss3fyOwBw5vqSdkC+rz2EjSllDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p/V8CFPrtjo2UoNqBUmISzG+Vv7ZURJVQg9RJToOxhzberGIIpER9opPUJrg5k/kKGlUiODfuLRM+AM63Q6h3UwoRRE+nJzCgLPNpzzn/hQxE3vDrgpuGRFbwLZQaha5i0bEs719Xz1Ea3ZJZgjl4zHFw1v4lkaCRGwqLqkw+gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aNtgNXN2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aNtgNXN2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 804D2C4CED8
	for <imx@lists.linux.dev>; Tue, 10 Sep 2024 14:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725978032;
	bh=4KDF1e8TVKxPgvhlss3fyOwBw5vqSdkC+rz2EjSllDs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aNtgNXN2M0+bC9YBAM4MoB3fsY0CFKsVYezVrX1QptCfBsjHU4Txb1bR7p7eIY8wj
	 JrxjCsu93ObAPCngSiJOEDp9fTaV8GvcFIxtvOm/A6X6vK85U1UtyIvcC5soVAZLIX
	 VQ6gKYIAwUCprXwzY7hFPSn8VUtQKzLl9FBfe6Hf8k3Xba9aHWNyOXl0wdSDkJK3S6
	 xRNpDG6H5h6933g7rUEjs86uMWqfuH33vvg5Tq/fN6crdX+IJZSSwNjcaiXBDgVA72
	 rBTiHV+4yXdG2BJhAQlnm4qWXgpuRwUe7VcFoi4SNZUKIAt/hmsRxe5CKjjIMLGHYj
	 HVVH3DmOsl2FQ==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53658f30749so4895803e87.3
        for <imx@lists.linux.dev>; Tue, 10 Sep 2024 07:20:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV+xP1KnAabPYJ3cV6NBZpUbIMLps3fgwqUzxZoq1Td1PlWR/y4kWg2B/tgXVTrSBUHQhc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwECT9XZBKLi/rMCeLO/6AVRloaHGbeqseLt7rB1LcZg2jp17+A
	jMqhkwQbFQtk/mMThsL8ykOWdRSoCbFtJvIpaTsegFrh1FZc3NOy7Yzipz0sn9XRYVQRdpWCmLJ
	JQOcGCWsYnc77cNS4ITrL/JOVKQ==
X-Google-Smtp-Source: AGHT+IFRvPc0UNJ2YwfVBz4VuqnSdznayKEw+oCjGom392hIonmpBTgsOkxTdF2NiiPAiOAo97MJcTXUNCSpMShrVB4=
X-Received: by 2002:a05:6512:ac8:b0:52e:f9f1:c13a with SMTP id
 2adb3069b0e04-536587a5831mr9910684e87.12.1725978030716; Tue, 10 Sep 2024
 07:20:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240910102326.927544-1-lukma@denx.de>
In-Reply-To: <20240910102326.927544-1-lukma@denx.de>
From: Rob Herring <robh@kernel.org>
Date: Tue, 10 Sep 2024 09:20:17 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKDo662kF2QDFOQZoGg+ox3=N1vWZOAiB=R+FBY2gTFKg@mail.gmail.com>
Message-ID: <CAL_JsqKDo662kF2QDFOQZoGg+ox3=N1vWZOAiB=R+FBY2gTFKg@mail.gmail.com>
Subject: Re: [PATCH v5] dts: nxp: mxs: Add descriptions for imx287 based
 btt3-[012] devices
To: Lukasz Majewski <lukma@denx.de>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2024 at 5:23=E2=80=AFAM Lukasz Majewski <lukma@denx.de> wro=
te:
>
> The btt3 device' HW revisions from 0 to 2 use imx287 SoC and are to
> some extend similar to already upstreamed XEA devices, hence are
> using common imx28-lwe.dtsi file.
>
> New, imx28-btt3.dtsi file has been added to embrace common DTS
> properties for different HW revisions for this device.
>
> As a result - changes introduced in imx28-btt3-[012].dts are
> minimal.
>
> This patch also adds entry to fsl.yaml for btt3 board.
>
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
>
> ---
> Changes for v2:
> - Rename dts file from btt3-[012] to imx28-btt3-[012] to match current
>   linux kernel naming convention
> - Remove 'wlf,wm8974' from compatible for codec@1a
>
> Changes for v3:
> - Keep alphabethical order for Makefile entries
>
> Changes for v4:
> - Change compatible for btt3 board (to 'lwn,imx28-btt3')
>
> Changes for v5:
> - Combine patch, which adds btt3-[012] with one adding board entry to
>   fsl.yaml
> ---
>  .../devicetree/bindings/arm/fsl.yaml          |   1 +

I said 1 series, not 1 patch. checkpatch.pl will also tell you
bindings should be a separate patch.

>  arch/arm/boot/dts/nxp/mxs/Makefile            |   3 +
>  arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dts    |  12 +
>  arch/arm/boot/dts/nxp/mxs/imx28-btt3-1.dts    |   8 +
>  arch/arm/boot/dts/nxp/mxs/imx28-btt3-2.dts    |  12 +
>  arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi     | 320 ++++++++++++++++++
>  6 files changed, 356 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dts
>  create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-btt3-1.dts
>  create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-btt3-2.dts
>  create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi
