Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB721C2BE
	for <imx@lists.linux.dev>; Thu,  2 May 2024 23:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714690912; cv=none; b=poU72VrzGpPebLxwZPAJsQ00EzkjzzI7eOLl+aDUXfiVv1jY0vLb/ncrR/Hcv9aGsRpPTGU0T7yOUWWxSQv/+f6QCZ6TBQxlRqhceNfe03oDqlIVwdCgxQSrbvKhLZC9MLWZNmT6FS4vjcmWVdVl6RS1lOo1Ql2CvcYzRrxHtIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714690912; c=relaxed/simple;
	bh=uzuM7TNYRLaC7ZjpI6en8/48B/eOKBl2O3vykFutHqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SanDkubYF9KpIfwOJ1YHA91ivCPa6LME6BmegXppfnc+ajcL8MlLH5mv2siE8a+gUZOdNaPIO5gCF00Nt5jp+h3hgkRxYCYGWNvGzbeaoqkCMEs+DNMzyr9LEMLEHohKhSK5lfRanZhxernH7AIlDN1V0NEz6dbPYC39gaH3s+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PJN+7CQm; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJN+7CQm"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2b3e2d3d05cso156893a91.3
        for <imx@lists.linux.dev>; Thu, 02 May 2024 16:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714690910; x=1715295710; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XCgtG1nwu07ZwZE9dSCljwhtr7EDaNxVfu99sHhwnkM=;
        b=PJN+7CQmsws/RqP4F7ghH/S8eK7smbwp5tQy73AhQw6atS3Xkl9OWcR/xadfVL4Tjq
         +3CYqxMPIcMFB6fbPjYjQ60GGhlo/AQzftE0Q5PfIrsLFVK4zzl4qniEKi3ioftGNnbm
         LnwmwfbtH67KxWGmmHcWVnu8nhT+h6jXaUlyGIW++wi4EoSlYuIrc2DMOiPgbmAf1TNB
         Mpo31tcHmgsvAXpM2VgEGTZxOyfEMYcDiQUTK2o0vxGrX3BqK5u3WVRTBRjUZ7kVTxmh
         8bng3HpN7IzFiRSzpjFT+NMSUsqtwIpkY2RqBqczugtlhTkKlhodIAx5FMdfSXRIkmag
         gB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714690910; x=1715295710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XCgtG1nwu07ZwZE9dSCljwhtr7EDaNxVfu99sHhwnkM=;
        b=TpLy6Rc5pJJOkyiz/Eykpu8JowAmTnAdwm/7ELLYsxvsdUEGuYlN6eZT9CQ3ejJJuy
         2loCsut0Ym5DrKPNlHOgHcLnJjfEJFUz9j6qd8mwMP/EvQfdBLoz27qTzlsa+nIbXPQa
         BAwIRlb7rrwfO2iT3bTFFS9Yy+hDEEyh5aOVTjaGSqlfk4bEn+2CkMaB6cqF7jgQOdON
         /fVwBTwZAMqc8bYZd9C4cf79CDTvNpH5GU/nj422VA86qHnNH71cjkjhNPcJxviOesa0
         A6NFV/YMrJyNQWC5nRjPKd1mAbl5gm1vIdwqA2xSNUHTnVDbEy9441SOti1safxwpWqF
         JN5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUw+07AQA4fUAqw6VcXiLXR84RJgx4qeR2clOgBCemByUZdLs4AWoxZC+dheg+2u585LckwNhZumn6w83CiQ56FgxXu
X-Gm-Message-State: AOJu0YxXIgvWi2DklRpg/I0H1XGIzjezsq/+0AdW2eW9SI+6KetLcatq
	WEx2970SG3JQTh1dSe9Dj+6Nvwm4h5VZw2EweuhrsnL37xmBrbP5k5gjbinghzq6eOk5ANBw8fN
	FtjpoOJD+e/wXO5ZLX25lNXWmQWE=
X-Google-Smtp-Source: AGHT+IFq0Ma/DIdow1xoRPp5Dc+4pREzgwQiKnt7LZodL1844R/VAlyKYhooFHEruzpy7OVyTvmmVgJEjI7sGzzil9k=
X-Received: by 2002:a05:6a21:998b:b0:1af:650f:d06a with SMTP id
 ve11-20020a056a21998b00b001af650fd06amr1353918pzb.6.1714690908455; Thu, 02
 May 2024 16:01:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240502215747.2832126-1-christian.gmeiner@gmail.com>
In-Reply-To: <20240502215747.2832126-1-christian.gmeiner@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 2 May 2024 20:01:37 -0300
Message-ID: <CAOMZO5CY8PQN7b01N+oNO=92CVtPPfWzuzxphs49gh+4H+58Mw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8qm: Add GPU nodes
To: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Christian Gmeiner <cgmeiner@igalia.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christian,

On Thu, May 2, 2024 at 6:58=E2=80=AFPM Christian Gmeiner
<christian.gmeiner@gmail.com> wrote:
>
> From: Christian Gmeiner <cgmeiner@igalia.com>
>
> Add the DT node for the GPU core found on the i.MX8QM.
>
> etnaviv-gpu 53100000.gpu: model: GC7000, revision: 6009
> [drm] Initialized etnaviv 1.4.0 20151214 for etnaviv on minor 0
>
> Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8qm.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/=
dts/freescale/imx8qm.dtsi
> index b3d01677b70c..54879ae1d7d5 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
> @@ -467,6 +467,7 @@ drc_crit0: trip1 {
>         #include "imx8-ss-dma.dtsi"
>         #include "imx8-ss-conn.dtsi"
>         #include "imx8-ss-lsio.dtsi"
> +       #include "imx8-ss-gpu0.dtsi"

Nit: better put it in alphabetical order.

Reviewed-by: Fabio Estevam <festevam@gmail.com>
