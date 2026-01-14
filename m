Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0FE355020
	for <imx@lists.linux.dev>; Wed, 14 Jan 2026 23:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768433259; cv=none; b=urA3PsoaZJ93URNNucXtLXm531kDrb4CO01tpkBkLYXHaXWpYeFKyhgZmibTuSiIquMpuM3O73qdFDb5GBLBTPr0P2aXBf4W04rbF+CG4mVXHyJYkTx33Pzgil1L8zuL6LjbJVu9lXBm+UGDQMjf43fpz8NWdl32LwKsxWFpr6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768433259; c=relaxed/simple;
	bh=7CUg3xaON2YJyNDUAfyHXm5zz5PYeFuwzhozRYxq9FY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SZhJIT1cqwS3yb4UrL0T1gXMnHus5rYnptuD6re1JvVXhr1QUIsJDF8rwgJ31fHVpQ3V8RSOedN8c8TL7RRfmO+/MWqFgBv6g2XNpRLIjDxgvVj0YOsL5V13j7+cTBKIXuzGiqtIBjbBzYDChbHgI7enUh/nBV9RsEsPX62J+0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cyP2ZbPm; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cyP2ZbPm"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59b679cff1fso306854e87.0
        for <imx@lists.linux.dev>; Wed, 14 Jan 2026 15:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768433250; x=1769038050; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zO7/rwLXC5yGRDXneYIJQs+eB1xaWdUmRL6MCrxGUVo=;
        b=cyP2ZbPmmC1f3nDbhYEJwjMC0VIv9nrDNYHz2ToTeZNxV9DVRLaZYRq6XTGsOsp2Bo
         tEQFEtM6vgnURdg+zk40Wu4J12WMxAuFJBzRn88YdiU/vbfAJaFhqSrt8WIo5/734xNm
         Y/wO8S3BMh85QetxD0sUQ9K3SSaMAdPJQdXZ2cpUMJNopV07/ULp+rU5k5Kr0ghAjEOW
         ZTKNMICfiNFFlHhkK+0IWFTyHrxRt50y1wBN6S0bYLsLo3bIsz6cgVHvzCDBwxah6wk6
         i8mdXi6tnR+PJZFxDjPUJY+lR+0OJUqxCW+lIyywQpWTXSGR+UWeV8iR2Jam+8GMZu2d
         DJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768433250; x=1769038050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zO7/rwLXC5yGRDXneYIJQs+eB1xaWdUmRL6MCrxGUVo=;
        b=eU2+K/tBhmZi2dCbVLMcJ/nfdDGHiBTk0l4L1IfB8Spja9CcmFWCnNLm0IYthIuJ7E
         Y/TEFqNyHa+okL5znDXSDLZLxb0bzskuGeH+nXFVQ6efc9KGet9Ys+hBNL7eJzDIOmH1
         ME1Ge5gBOK2zJETr2zkN2Vku7zcO1PjO9aheX/3abvYnT6tEYtCrC3xmpO8tA7muAY/o
         z0cfq3XtlxLOC/yHz4pVxQJygslmHRvcBTq7KBAMWBx3VDDnh5FiuXCMgKIc1Z79muKt
         3Dkow7bVC+VZf0u92sapnZ2cUHmNaxpTyzzWTKpW2Js95BFviLJEG62sxeEXwCK3Iv1V
         J4Cg==
X-Forwarded-Encrypted: i=1; AJvYcCUWs6VPzoTDKcHRfLlNytXwCy5pQ3CxXOLE1NUpbZU2zCWuAWcBIxJAtqdVxZzvcoei4FI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwUY00bRM4XyVnWRG1xvvqypjMyP16Lx/saQSwoh6sahopAA4/h
	+FnOLFaue5GblssbHdjkwDw411FdP0DErWOQsD30bjH11vQVkPpMzlCCfX55AeYFone6cilPkVo
	CWv7hwaZuZ4IZk1fCGPeC8+Emt+DV6vU=
X-Gm-Gg: AY/fxX6c+lWs2bOP/qtrvW3RoYjYuaN8b0G8WusB1V+mC4vaVNCKUovra8ldXKm7lIA
	nPcRZ7rh30ZJoOgyC++CPCFyMuOi02gnELrbvKqg3pRLTM1uD2sTdRhkU+RnQMI94Mq02WlNDO4
	5WCUa0v0t6GggP0EEwosxyQvsI3JbTsDGjMlfMdM+P0vzB08Oq6KSUEQHbKVeE7q7H/hemFp2V2
	/HXNSUBfnNEY0tFr7fAhAnDtLULR3E/QaVJupvHSbkL5h+iwGUT0/E20GDt0A1WkQtpKi2h9hQs
	DCJlD2t3w39XHiLOvDXnHdFOR+A=
X-Received: by 2002:a05:6512:b90:b0:594:25a6:9996 with SMTP id
 2adb3069b0e04-59ba0f5fd8bmr1478472e87.10.1768433249392; Wed, 14 Jan 2026
 15:27:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260114-mxsdma-module-v1-0-9b2a9eaa4226@nxp.com> <20260114-mxsdma-module-v1-2-9b2a9eaa4226@nxp.com>
In-Reply-To: <20260114-mxsdma-module-v1-2-9b2a9eaa4226@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 14 Jan 2026 20:27:18 -0300
X-Gm-Features: AZwV_QhLF-nZE9rj0D3-1M6Zo3V1EfOAoeRCu5Cv2BQMtPfiN1SS9FZTgf1Ap2k
Message-ID: <CAOMZO5AF5-=-2F2W_U9=VbkwtBp2_hzKkJziefLeufD97xNj=g@mail.gmail.com>
Subject: Re: [PATCH 02/13] dmaengine: mxs-dma: Use local dev variable in probe()
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, Vinod Koul <vkoul@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Shawn Guo <shawn.guo@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2026 at 7:33=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

>         ret =3D of_dma_controller_register(np, mxs_dma_xlate, mxs_dma);
>         if (ret) {
> -               dev_err(mxs_dma->dma_device.dev,
> +               dev_err(dev,
>                         "failed to register controller\n");

Better put the dev_err() into a single line now.
