Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE8747F67
	for <imx@lists.linux.dev>; Mon,  5 Feb 2024 17:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707154166; cv=none; b=LKl5hQoyHekaDOmr302cDvXoQKVR1vQmEfqrhKTfZAtVvYUig7EqWz2eGs2rbdCvduBAkiBTMQG9FQpoSfvaUCIkxbNMQmq21uFhhZFvdiAlsIliP+75vxM5eN2sGuip6acCEi++/BAbhQehU8EnsHKm+5gki/Qly5jGuRSyaAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707154166; c=relaxed/simple;
	bh=O4lFQwozpj8qAdWZazPZDdbBDVBBZtmrxmGiue5/8bI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J4KX3WzWx04NfloyEWATVwRe8Y4BZdVx36NnJzSLNpkxaTBVfrdu+jjVPAZpazDZBnadDTQcJR0crUjjCO8lXjYlXEngjlpDrDY9msZj8gQy9C/YcHTcsJMExZxpk/9KqMvxVb6lxV9ev+l/3G9QFMn9II7l10L9vz+YiVh3AG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nn0Lp7yF; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nn0Lp7yF"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-60460399a33so10580497b3.1
        for <imx@lists.linux.dev>; Mon, 05 Feb 2024 09:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707154164; x=1707758964; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ki2OMFRAxrlw+OBGxKHQKH7ycmBBVTQveh0bKzrpyb4=;
        b=nn0Lp7yFG8rNcbBUAkunULDdyfeuBjNWWlMhe/H8nZ8Y/nfRHnFqzdae6pYkZEcKrN
         Vpsw9dUbjeEBT9f4JeYdWCXT3XwssavaVjJzCWTMTyMYOd07Cw7yYSzpYcioZyiCPCx4
         eGGhtdXyUUS5qdCXcIA9C4KQtPxmeP4rgcoGtUTyyV8uIPCz8ksEsM8Noq0CCTsaAUID
         7ruJTf81noXpbZfXbQ73R0lxWAhXC9qISvXxcPQmYuzzAsqMxLgw3DORIr0nUwlPchwS
         Ebe427Jw0VyeVCKrJR/Vfq51dZ2XgnjOG0md7R44s3ztulOOclE2w3ZNQBhYOewyPKaS
         qOYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707154164; x=1707758964;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ki2OMFRAxrlw+OBGxKHQKH7ycmBBVTQveh0bKzrpyb4=;
        b=bP9mHZt+nFkhdrUtUge+qViZpuBlnqvlTFAXFuyX/isZhO1eeL/AZQykBBoxF+EbHK
         akjzEv/cRPvvc5+Go9G+sBXM/wzDbZOs2r7HULnU0hw9zjDMAfre/qmqoj1teKQTxQw7
         bInUrL0UdsRJmEI+NGqaLHvfRIfWsGhjnBC35wh15xnX+dfdBSeCwtynPzEh8jqJc4FR
         Q8T3wxW9sCIwl3kFWUicStgqu3UM5tkaUNiNQi9d44DJa0+DTFZUwSkHACf71E9o8X2O
         ucrG6usHRyHv4m4sKGl0EFTweCdBlsH3kBodBfnP6ekuHL36zQ1Tgjfo1ZEh9ydHhCjG
         KJ0g==
X-Gm-Message-State: AOJu0YxhABlOaVD/FjqvTQ+X5oU9FQ2vwWThMh6vtc4k/tqy+CMd65jz
	/s+6qe3RODUCJm5gh/TiNwfnn6vGUfklxCugg4NNwRMbeL4dd0jKmJRkAjKddsYwcg0Hereumca
	xKUCRhtL1QYnTAELGD/P/Q7R12NbtL2yiIiroDg==
X-Google-Smtp-Source: AGHT+IHJ0bSwgVgKi9CF80Bt1Cco6PZ9KNY0zznjDRrM1zGPsHC4Y3lV/AsXifZpn4hO8tJQZqwqC2/GIdcA4wM2N6Q=
X-Received: by 2002:a0d:dbc5:0:b0:602:cf62:6590 with SMTP id
 d188-20020a0ddbc5000000b00602cf626590mr151874ywe.34.1707154163772; Mon, 05
 Feb 2024 09:29:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240201-8qm_smmu-v2-0-3d12a80201a3@nxp.com> <20240201-8qm_smmu-v2-1-3d12a80201a3@nxp.com>
In-Reply-To: <20240201-8qm_smmu-v2-1-3d12a80201a3@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 5 Feb 2024 18:28:47 +0100
Message-ID: <CAPDyKFqyQxo+SSYb_+Nf3zcPcmhzCJSp69gJ15qexbuD_mJ=Yg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: mmc: fsl-imx-esdhc: add iommus property
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Wei Fang <wei.fang@nxp.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Feb 2024 at 21:23, Frank Li <Frank.Li@nxp.com> wrote:
>
> iMX95 and iMX8QM have smmu. Add property "iommus".
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> index 82eb7a24c8578..0d8ed9d055ffe 100644
> --- a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> @@ -162,6 +162,9 @@ properties:
>        - const: ahb
>        - const: per
>
> +  iommus:
> +    maxItems: 1
> +
>    power-domains:
>      maxItems: 1
>
>
> --
> 2.34.1
>
