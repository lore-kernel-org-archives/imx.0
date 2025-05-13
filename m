Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1FB28E611
	for <imx@lists.linux.dev>; Tue, 13 May 2025 13:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747142461; cv=none; b=DBA3za7NL7g3WdbGcGb605b7RxlbIZRJLPnrI6GTitTjy+6FoU+KnQdw8DGjb5G/X/HT4SimGXgNdfMSrhLIUHO4at3GnFLlU2N30+LmP6KZDPewdzgPw5ONaXG3SElzh0oUhXI/X+j7Kd6wKKwI+IuPyprmfuOpDgMAJ+MngXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747142461; c=relaxed/simple;
	bh=a07HNvK2s/ifER9xOGcNCCEiUl0FR+rf5Vx8rLmQK6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M1A3gHfoIReAJa0HHUq3oxJyhsGSlYmkrHuyJ9b6rAOxk2kwDGhBda0RIHpjVvYlo1qJR6nONGRXmhjNMRCbBD3mr8ZeU6f6CzQcSUtLEXkJa1oUxDazrV5MLHRpFNgUiPf+ziDCI8DUhGjwlCs+Vs8E+rW/LK4XfBtNdEh7bmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YxFzgpvo; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YxFzgpvo"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54acc0cd458so6105052e87.0
        for <imx@lists.linux.dev>; Tue, 13 May 2025 06:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747142458; x=1747747258; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a07HNvK2s/ifER9xOGcNCCEiUl0FR+rf5Vx8rLmQK6M=;
        b=YxFzgpvoO4V/lCGQqWd0OMu+7MNo1jeOd5OGJRhBLx5FwOmEioDBwqhX/2OGc84Z4x
         DR0m5YXyqMt/z2HdZyNYpuE6xBz7zdt558bpHaYADdEowcmLZ9ZlordMiNjhE4MX2yy7
         ZBtAXp+1hae8/ruXm6/GgRewKksdureGz+DMGNLRPMB5TvdvygjfvRS+XAaXS2WzcvQU
         Usm3hAuoKs4W6ppzMUVNplgYkzMYfJXZHM1rNWzq6t+UMuz4gFPAITQUvg9SMApYzv1Z
         oZbNw97jAZLUzqa5qF1Cu5Cm+1QuN7TMKTHjV24QX2eP1ypGISUHOPHPDQsaWRSCkEmx
         Wgug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747142458; x=1747747258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a07HNvK2s/ifER9xOGcNCCEiUl0FR+rf5Vx8rLmQK6M=;
        b=YZ3M89iDmwsEgViEUyf/Xdl3XELpdb8jrk2v0RHFRQ37a3t2Z8qxk1N1IgvX5b72in
         psa3G4mF/QUk3kSD/8LVQWkW6COMVXWdeR8YmwHg0EcBSKdK438pkD6wi6r2RAiSPm8o
         ifzgpqQfR2ex6UiUFMJwsPeQErPSp8YksDIr+59p6fEdwpx8UEES7ABhzzdSnklYRujo
         YoRI2oQdZYtjzWZ6731l4JL51nPxo1ykXsesUIjJd/NdMNgqJWiSRgoWoDTVpojNb2Ej
         BDV9dATxy9FaFRIlpQ+tJiBPzmzyW2Z08P1JeQcVJiC6ib6jPkRaH6B6zqjO0w+TuCSJ
         vDbA==
X-Forwarded-Encrypted: i=1; AJvYcCUH0Umd9M0dVS3qAWa4sjDc4NHgAsg5fn8Owjo7jRNPpZNrlNKzKZLuUyKqZLciO+2/kFU=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywnbz+AjBdr+qrN0eREhuM4B50sQDqqkK9gcceKXKMDYrNW2e5y
	qQbDoIyL6aKovsS4Xl2DpoA2exrDWSlH0YH5PdZKoi74otKX/aQWmRAbyPKFgOO5Nv6vdJ7mPLV
	pyssx5ofi/j+BLHRoONtZdSQJLzg4jtWgNbs8bQ==
X-Gm-Gg: ASbGncvvX8x75hS+/Nhrt5IpiuOGdNa91GYOUyFdOWVpPOjwsfj7eUVgxUW4NqxQOJ0
	AsAmkIE2M/9vkTLLpScGamE+LoBatMBXxgpRxbod6/G+Ji7Vg0zAe1dQ+N7EZU2Eg+gd9JwgpXl
	8tU2h5q+7AuIVXCnos+z6bkjNn4VHXggqY
X-Google-Smtp-Source: AGHT+IGEAON4CqeWB7MIriXflZ3TKRdVPaHoB+BTW6X7JW4SlMZJHvBn+KzxohMwhUgzM+6fwnKvwVBVuufnBpAzy7A=
X-Received: by 2002:a05:6512:3b88:b0:54f:c66b:8b78 with SMTP id
 2adb3069b0e04-54fc67ecebbmr5256122e87.49.1747142457796; Tue, 13 May 2025
 06:20:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250512-pin-v1-0-d9f1555a55ad@nxp.com> <20250512-pin-v1-1-d9f1555a55ad@nxp.com>
 <20250512-mongoose-vacation-f81a56dd6c5d@spud> <20250513075532.GB14572@nxa18884-linux>
In-Reply-To: <20250513075532.GB14572@nxa18884-linux>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 15:20:44 +0200
X-Gm-Features: AX0GCFuZNXL7sad4G9E3lsfZTN1DW6pieeaGbeQGotqOwvfnEpDnUcCktC-com4
Message-ID: <CACRpkdYmupji8a0np0xzogjcvJ8YFstAgg_XwdxNczhQjBZOPg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: firmware: nxp,imx95-scmi-pinctrl:
 Introduce nxp,iomuxc-daisy-off
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	NXP S32 Linux Team <s32@nxp.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 8:46=E2=80=AFAM Peng Fan <peng.fan@oss.nxp.com> wro=
te:

> >Same comment here as was left on the driver.
> >I also don't get why there's a property being introduced from something
> >you can determine based on the soc.

I agree with Conor's observation.

> we are targeting a common pinctrl driver for i.MX SCMI based SoC.
> So that means pinctrl-imx-scmi.c needs support i.MX95, i.MX94 and i.MX9[X=
].
>
> Each time we support a new SoC, we need to hardcode the register offset i=
n
> the driver. But if using DT here, no need to update the pinctrl driver an=
ymore
> when supporting a new i.MX SoC.

I understand that it is convenient, but that doesn't mean it is the right
thing to do.

I would advice you to keep this in the driver and use the SoC compatible
to determine the offset, just as is done today.

If information can be deduced from what is already present in the
device tree it is redundant to add stuff like this, and it inevitably
will create copy-paste errors where the wrong offset is used
with the wrong SoC.

Yours,
Linus Walleij
