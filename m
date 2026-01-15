Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5603733A9D6
	for <imx@lists.linux.dev>; Thu, 15 Jan 2026 08:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768466484; cv=none; b=c0x7bnaZX+nOUQ9B9M8xVCCEq8fKb5bnBmR2x/v5lzsd5LmSv/hALu97bIYPSrop23Jm2mPVdaL4zJw3ev9ASoncB+Vz34d7mzleF/STBrNvRmgZPDR1RcingeNbN6Gjo1mEOyI7F+0RioQ5aOC0mwqBipC0G4IFRiqCcCT8VWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768466484; c=relaxed/simple;
	bh=pebBiil2ei/oib7mZd9mepzUxVShBPvTNogkSnHrW1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YFdxladeq4Ns+tUzNIDskuQzm46ExdwD0RJR/y6uvC4a+/Xds5Ro5ipn8mWuOxTrOmuSqJFufESIk9eT8+SMG+92xI8voXbfE6vgtYI9XafxIijlczSrdwCfrxfpeJgNPjsWK/UOfOzm2z2oNbI6YjumYaz2+C26GC7PrmY67bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQkZPOIE; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQkZPOIE"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-11f1fb91996so1516983c88.1
        for <imx@lists.linux.dev>; Thu, 15 Jan 2026 00:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768466482; x=1769071282; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pebBiil2ei/oib7mZd9mepzUxVShBPvTNogkSnHrW1U=;
        b=lQkZPOIEDads59B+r/STTruORNxgNgzeJ7dklkCSjMHCJaG3I8qqBtnAW+CDJ0c6U9
         VuitiRJamH3tnSWLZ6O5rkPkJkeUqZQvy5CIppBDsb2lwMBOHGo9n5+E1btVrRdBMEjO
         nFp2T2xs3+/kihZWrTAl0JIc0C+uSwapyjHytJGlnfEt5IxetQAlklz4QhSzaEVd3DtS
         gNcFPFQ0isf3N9rbIhYcENtBqxH5a+BiHnax9AUMmA8h5MZVFc7v31ZFEs0kQxsuPpck
         pweeZ2X9/btHbI4EJp6WjUFS9eR6j+Veb5Lma6lujbCodhfTOEdUYLbc70+ATZaF2kZ/
         iCrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768466482; x=1769071282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pebBiil2ei/oib7mZd9mepzUxVShBPvTNogkSnHrW1U=;
        b=GLOxesqPRnU78X4RnMJHuAII92UXNQiUIJ9gRm+OlVko6/IKCvHHDAv3fCM76JJ8yw
         PTM7xRTOlzn5YPDfXu6DUUxztlqf+geg90fuGRMByftibYJ55UUEasGcsRpdenQ7ovSx
         Z+Mzs+iyZIhwZFPbsDB1g+4OvdyBeuxqBYbkzMAIVVFiNVFNPdQwSkrdWOerCG+fh7+Z
         nGQDiP+F3S7TqU6kJbuwEkuU8/cuBBy0R09MhvebKj6D3bVJVzyQPDtlq//HYpjhViNB
         b/vZnjZnkei1vcYkmvesZWn6lw8yW8xEB2kvOtXSsYNWoCSaYN0uWVZvdzVsVKIw3yZE
         Rnyg==
X-Forwarded-Encrypted: i=1; AJvYcCXmX6yR8+ROUuOo2LuCfgtcRn07IlBCSonJbWZaO1SD+6EmrDy4AGdRnh1Zw4oQ6mlvw7c=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1y2HWIUzlPTSb8A4+9MXtU4f4iOHSdTKmElIQEAtoctOwiqBB
	o/ksVSoyvuIt8tF9faWopREmTWrS810RHAkTEab0sKq6LrVQcJBJwJARnL32ZF1gUKa85xEZvPX
	etJm16RdcvlXElozhwrCPJIgtDsbDToI=
X-Gm-Gg: AY/fxX7TYqQyHaOsTfoD67Cw+VeFAVNHaWyJ2I+Ln3sUhhkZFefcScPVOQgzqlwZJNh
	HEpz817Co8OQgvln78zG5jbjjKrLLt9huGWdUbpVOWuBMS7x+Ur4CXwbTyC+5lXA70vJt8jov3+
	VWdjCMNFm8xm4+0YhLASt0rhdOd2srNBX3trZuXuvCCAAhNIMvOQX6V9dHXaec0x2HmOBC0nDaK
	ymvKSeH1Dg0x+Uu4ThZb2of0FvhxGXSHGrLosro4EONLOzglBK2Lfqt1QX6l4+FMlYVUGbNIWBs
	+htjRy+IdAW7KN9MDOIeuLMoYe653SgK42F2oVuRfEiUGw8MPL09XO/6gGDVQDRJHji4NSD9lMC
	FmtaPC8i6qg==
X-Received: by 2002:a05:7022:2392:b0:11b:9386:a3bf with SMTP id
 a92af1059eb24-12336adc557mr5402464c88.42.1768466482362; Thu, 15 Jan 2026
 00:41:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260114-mxsdma-module-v1-0-9b2a9eaa4226@nxp.com> <20260114-mxsdma-module-v1-1-9b2a9eaa4226@nxp.com>
In-Reply-To: <20260114-mxsdma-module-v1-1-9b2a9eaa4226@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 15 Jan 2026 10:44:04 +0200
X-Gm-Features: AZwV_QgLOj1RDdzVccL_41XskfEEs9aTrYg8yhWQDuDVwvWQC6YUiA6AbKgDm9g
Message-ID: <CAEnQRZBkxugbzhNk+HE_t=2z_-1OZ_mgON=8=5Q6wV0zJcNHbA@mail.gmail.com>
Subject: Re: [PATCH 01/13] dmaengine: of_dma: Add devm_of_dma_controller_register()
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, Vinod Koul <vkoul@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Shawn Guo <shawn.guo@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 12:34=E2=80=AFAM Frank Li <Frank.Li@nxp.com> wrote:
>
> Add a managed API, devm_of_dma_controller_register(), to simplify DMA
> engine controller registration by automatically handling resource
> cleanup.

<snip>

> +static inline
> +devm_of_dma_controller_register(struct device *dev, struct device_node *=
np,

static inline int?
