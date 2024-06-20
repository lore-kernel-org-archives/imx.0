Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3201B013D
	for <imx@lists.linux.dev>; Thu, 20 Jun 2024 15:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718896507; cv=none; b=uIR4XOztAnEFtWvD3iOEFJolso+ALNE6qHlZkKo2yQmpEPlbDfQePpf/C2vtwgJGCaJXxU4DRl1a6R7yuBesFOjvj8iUNqx8VQnBu0XUN/XFxmBa0ipDt/fDLsxVvDKVRHNQQqiRZofdxOMnzd6Pt1HoaLbTyeDp+ImiMcc1UU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718896507; c=relaxed/simple;
	bh=omKEA7183JIq4+qk4ktnB4723ZppBGp3RLv0v4fpWqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GXRCSvUbfKfGmOloS8GPyP03giuzsU0ZmvBKeTw4zgt7CPdHMv/bYM4atO6wQgVP9ztYFxMBtnqBOjavK5052t17bNmMmmXiOW+9IwtQvKsS6qojctbnFGbPyBzCNvM0RGevWmBOjtfeX1krrhLCqE21H7/Wq/beGlxrDtRZBUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nRzgBwTw; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nRzgBwTw"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-632750bf73bso8782197b3.2
        for <imx@lists.linux.dev>; Thu, 20 Jun 2024 08:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718896505; x=1719501305; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B2n5KrLTZBvGu9gEb8O17y0tpUk8+ZpfDeRqP/uAfjQ=;
        b=nRzgBwTwH+p+I+/jOFCG82H+/jsSAcJupAVp/xfBvwgBgtzkp01XTXh3ezNj+nblp0
         JkYRbncCmxyuyeR63OhCuuiwHDabg8dLx0sFUAettH7hXyXS0CPPmzINEKFNyYdLD/yA
         J+M87/Xp8HUIeEZvPsGthlzIY5TmCdHBQ3F/mrIPILPyw1y5HWrScAG/i4JkxcBKkVqm
         eAAWlg/oHGzaoKroj/Qijffcr09bh3cJa/4xOPENPD54NCoYyzLvGPZIKDsYT8RLDt7n
         YyoXHec/QtXa/Z81MHGj+W1zUCFpZ/hWhFpKGPUFa/6ATmYDTfjSlW0KqA88uGqJ0bUb
         bceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718896505; x=1719501305;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B2n5KrLTZBvGu9gEb8O17y0tpUk8+ZpfDeRqP/uAfjQ=;
        b=YAipULZbRjjzHyXMQiJ4l5NgpY2IihOEJo6EHPiYQrV+CSbGRSzk/vwsBOZQdbpLhr
         FssgQFyhW4gE4TXZ8hBZzAMD3yYwsNSSQLT+EDTNrxqE+IICopi+4pS9raO1+KSR7m7e
         qmOakxEzu/V5NTQAUxBLDUzqpd1SZU2GZKfubcyCnm58w9BHk5Y90XnLLFD7UBvLP5FT
         WBEJ2n4dnnb3WD5HLSJ8K03yQ/jopWrY/eUIS6F4S1sMhdhlTFEuVUIItrlNytn56/Ni
         8oCzQ1EX9qrY7CAh2fh4QtSa4oHfzxeFRMnwe6JtRmcY/5XuyhDAaIbWR1MevR6LUfOh
         Z1+w==
X-Forwarded-Encrypted: i=1; AJvYcCWRiFYC0ZLiJc9cwu2zzd3EVPGMSa7ePzyg2PUAvzCIvObq6n3+TYXLDqFuPkaCCK7dtaJcmrTrVAzFz7KMUQlwPwzx
X-Gm-Message-State: AOJu0YzsqOyvruzU6G1Hd36cWHB8vtYB/AgIOYxHKBDOeTJRmwS6ybW2
	P40ajeoWT4yGoT0OUM0w1/GF0PNkfaHI5Dlmy7PC7gQb8sPcHifL567EWzh1jvu7e4AaH2vdVO5
	y50zPtjISiWykTG3/UNsF+z1bLlYVn91wSgRNoQ==
X-Google-Smtp-Source: AGHT+IEgsR6Axacelg4a84hDNwZ/HxzbPZz6nBbHwPbmaUBauO4zOvR4vycjA+yQ+ptsu9Vsx+lvyO9aNTZ86xfQU+o=
X-Received: by 2002:a25:840c:0:b0:e02:b68d:b432 with SMTP id
 3f1490d57ef6-e02be17563cmr6316451276.37.1718896505132; Thu, 20 Jun 2024
 08:15:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240613-ls_waring_esdhc-v5-0-36644e2fe21c@nxp.com>
In-Reply-To: <20240613-ls_waring_esdhc-v5-0-36644e2fe21c@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 20 Jun 2024 17:14:28 +0200
Message-ID: <CAPDyKFrfQQu7GE2pHPHspKw3hkqf219kWCU2KwKMtTKQmKRbtA@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] arm64: dts: convert fsl,esdhc.txt to yaml and fix
 layerscape dts warning
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 13 Jun 2024 at 16:32, Frank Li <Frank.Li@nxp.com> wrote:
>
> Start from v4 because fsl.esdhc.txt to yaml already sent out as v3.
>
> Now only "bit-endian" proptery warning left.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Changes in v5:
> - squash dts patches to one patch and fix typo.
> - move spi-slot-mmc to first patch.
> - add Krzysztof Kozlowski review tag for fsl,eshc patch
> - Link to v4: https://lore.kernel.org/r/20240611-ls_waring_esdhc-v4-0-d0d8a5b3f3cb@nxp.com
>
> Change from v3 to v4
> - Add dts warning fixes
> - Add mmc-spi-slot's voltage range fix, (not sure why it apply to
> layserscape's dts file.
> - clock-frequency is not required property
> - add dma-conherence: true in binding doc
>
> ---
> Frank Li (3):
>       dt-bindings: mmc: mmc-spi-slot: Change voltage-ranges to uint32-matrix
>       dt-bindings: mmc: Convert fsl-esdhc.txt to yaml
>       arm64: dts: layerscape: Change node name from 'esdhc' to 'mmc'
>
>  .../devicetree/bindings/mmc/fsl,esdhc.yaml         | 105 +++++++++++++++++++++
>  .../devicetree/bindings/mmc/fsl-esdhc.txt          |  52 ----------
>  .../devicetree/bindings/mmc/mmc-spi-slot.yaml      |  16 ++--
>  arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi     |   4 +-
>  arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi     |   2 +-
>  arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi     |   2 +-
>  arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi     |   2 +-
>  arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi     |   2 +-
>  arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     |   8 +-
>  9 files changed, 124 insertions(+), 69 deletions(-)
> ---
> base-commit: d35b2284e966c0bef3e2182a5c5ea02177dd32e4
> change-id: 20240610-ls_waring_esdhc-93136a5dd794
>
> Best regards,
> ---
> Frank Li <Frank.Li@nxp.com>

Patch 1 and patch 2, applied for next, thanks!

Kind regards
Uffe
