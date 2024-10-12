Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4006784D0F
	for <imx@lists.linux.dev>; Sat, 12 Oct 2024 03:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728702903; cv=none; b=aAfrmPhCrlj/kvl+enr7pMdYQkXZm1sn3zBQxV540nBJS07EDo2DKeYLBg8SprDLxQ4P8tYOya+WwtzhD2ar1IlsWizQcgGFO/zd3owUgebQohvPd/TyBdZ7AFLKXMcyAFuQ6xWBfCcvfzHWIpvo5lqiRwtbgwCztJCUCti68d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728702903; c=relaxed/simple;
	bh=OTDgu8jhVl1DFdHGtT4yhTF5TaSSF0DlH9QNL+bb4dg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dKX0dozEphiZE2SSXQY599sadg3nojcJcJb0ifZCUREJLk6Z21J9Ucje6tYkCb4qC2L34WXM8gcYMa3TuziJmL+x0Y1eiceS95K0bnY5DiOuvlaZTE4R9O3bhSgbO+uC+LSUhc1c/4sYizA58/dcoRUOBfo4ZTB6DzvG1oJoUSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iR/WlNjf; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iR/WlNjf"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5398996acbeso3041143e87.1
        for <imx@lists.linux.dev>; Fri, 11 Oct 2024 20:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728702900; x=1729307700; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxL9nvKGuwRSk+ewXCIf1iRkcw07YPNnh2XwkpZ6saA=;
        b=iR/WlNjfe+uDsJtpiEUCoqUfTx/erAXAfeEJXicLArrKUcJ5tXSubaAZqkADcWOmY2
         RmCuTr5VznSznpHlTEyejKYwavyv5digMnqwoFBaZdKk3DTh1izfx8bUEeFITl2+2a1s
         iOsE99gEVVrrxzc4fhLosdrjzrUb6Po4DmlNXrYxFC1QLTR3tFQVYFjIWB5aHuVK/dcB
         1Kqd3e5Y/PGy5qC4P0099FMpWg8JniqkrlykjZxF5q6VuZ0CC0ZRi+7AAWgH7zwJvXy1
         FV/Q133b85hiOfbzQVP6piy/htXxwlIG+XpPtYmW4FYzNHqoZemuCKAvR+i1NTr5Zwfn
         aeOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728702900; x=1729307700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LxL9nvKGuwRSk+ewXCIf1iRkcw07YPNnh2XwkpZ6saA=;
        b=kFRakFxESgTUptrsBEbj8B27ZrX3I518zH9rtib8lKkqH6kCRKsrFPHt400bT/gJaf
         70chlX8GSgj/trug7RQtszXoMg8l2Yz5PmLJj6nNC+bzyY3EBRJsTbnMm7exon5GFy8r
         3SBkMjMPeKofQckFnsIHKvrmZbmqKHBdD+8qhA75q+iEOd0nQNU4PNGH4rTFu+e6mjiG
         cCBEjL8ZeFredG802DfK3Ko3v1+zoJRQhRVB8jPhdLSq47qeciEzoSTcd/EMlpKCfOeY
         V7tNseRBlTCcCBaaUeCctP3L5rJhbZGPkWOJJux1rEbQdMJAUoBY92o9oy43ctSrpPts
         pHtA==
X-Forwarded-Encrypted: i=1; AJvYcCU8B8VZd08FIvKJq7K8GVrgTCIxPj4HATkAg3livoOhAhi6BRbSMf8jPqH26lsxUtOOeCU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyatbU6yEYAOi2/AbKPE4kcqex5KRaJyGDvL8eua0Rj3SOnzihZ
	v39R3ApSQFO9x4LZ8doEYGCh6rSHkIDd2KlTKi1rkvgumxfuOAxYyD6znSDHrK/jUjyo4264Qti
	MtaQfalhD1ST5vLU2Z6TIMCgXSSI=
X-Google-Smtp-Source: AGHT+IEvRnxuDVwrSJxR02cOsGUYh33KaNUsbLik74VahkvohMz1+I0s509Yr79jtgYy+sbIRXHpuW1sL4xfx4ecVx4=
X-Received: by 2002:a05:6512:2398:b0:539:e7f8:7bf1 with SMTP id
 2adb3069b0e04-539e7f87d5amr61469e87.2.1728702900040; Fri, 11 Oct 2024
 20:15:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241012025221.1728438-1-peng.fan@oss.nxp.com>
In-Reply-To: <20241012025221.1728438-1-peng.fan@oss.nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 12 Oct 2024 00:14:48 -0300
Message-ID: <CAOMZO5AB+onb-zc6oW-N=TTkJa=tNMXEekXGvwBFTNdAqabM+g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8mp: correct sdhc ipg clk
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 11:43=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.c=
om> wrote:

> -                               clocks =3D <&clk IMX8MP_CLK_DUMMY>,
> +                               clocks =3D <&clk IMX8MP_CLK_IPG_ROOT>,

This looks good and aligns with the imx8mm/mn/mq dtsi files:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
