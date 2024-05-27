Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C793915E5CC
	for <imx@lists.linux.dev>; Mon, 27 May 2024 12:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716814228; cv=none; b=sWBSnRiOktsOcEtZOKhGv76hWc5ko9AxKysMzOXUw8PBK48ryzzuefMOuCLudWPNv80YkbV+6NTaiCDnaJbkivktRtDcjqvciyMebnt5Z7zW7RGoKrXNz8qdmDE1BPMpArSQNm3WAl7okHNGNj65zqU8olikMdXJLBj7MkD795Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716814228; c=relaxed/simple;
	bh=14UMBsxwAYor7acU+f5R1XwmfsHblIByKkJ6KnVfk84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iSuY4dKa5MoBedU3F1kU19tGV9ztMqBD6/sQVdD/AO6RKd/1G987ArNcH+IqD6FfCMVAZINX0wrFFOfeSz5FWXbBy61LcsL/yQo/M26dHAu1ZNrcFee57a3rdT5XLjzzW6JPOu2BNSvRDBnIoOm3eGQ+Z9G6Rdh8ad7DG8RQW6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JNTebvNE; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JNTebvNE"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-62a0809c805so34000077b3.0
        for <imx@lists.linux.dev>; Mon, 27 May 2024 05:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716814226; x=1717419026; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14UMBsxwAYor7acU+f5R1XwmfsHblIByKkJ6KnVfk84=;
        b=JNTebvNEpu37GNWAvTgKxkgF2FANfLyuifhsdvWPSxtuAGox0kYAz9UWPocalrnFG/
         kbx4uPVsyzFtVy+jnzh3KSUKro1fkJ6DH9NfVMA8Pni2/ywoOHsvPBTBj2z1koH4jjET
         VZZRWDjIW7dvCHGK6UD/9MRfEgdAQ8cXQVfJbEALRZxCdwaApnCyiGYX0TTschKUckAc
         dFDWyDkujvRBiky3DeRlEyk+MVOePk9yQQc5ctVsvBNc2ostpukaqffDrEMd6cupY1kq
         YaAiH6OsDSq8LRBNxdxzmIR5H+cA403x2VC8VJaTnP6BjJYJovyUdS3YhX3IY5SK1nsV
         tLGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716814226; x=1717419026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=14UMBsxwAYor7acU+f5R1XwmfsHblIByKkJ6KnVfk84=;
        b=cr0oyy1QNeRQ4lpx0MMbDpNerj9lBq76BfCTPSt4NH8P3FGbbT13zWGQC0CZUNT6o5
         eWhHiCVwACahJ9XAPCc2BDYFL9kZMTdOl51BWO0FVd6ysDiG90dhdRL/wwu8V8igMviE
         RDXxNAvP17mYwakI77Cd6mKzOqL6ehmTvWXWMl61hfIIWUCd5TsA8ruxWPVraFra2Ga4
         OLXdUZBR19lKopIq3MIpPhpjmAH+XB1OnRosABRWIM0TFISAIMdkBsrrjYpZPzHijKdR
         1jDaY96H6T8SRZcUd8b3Mxs9cQCDVUz7pWVN35vZfKj+RvGZEafR4dFO5o90Ni3O93Ez
         hGSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuW0BmoA12z+O5DRGbVYjok3Cbq57j/tqudgXXDv+UJCohsSfKG+C+CHbuBBw0xuj5VCbkafWt0vI5w9z4/veNYJY2
X-Gm-Message-State: AOJu0YzX7AgFSbXoW/nnmxYLv9gkogrR9IOYExl602CYOKNkLWSg0CqR
	Bnp0EeK1ZWmAfqQdj2gx86e6+lzljUaAoULvmMTwOhRUyJVJPKyLq5ETzHpidIc5CwxBuLr1xcy
	h/ZIX7ujeDia65NikW2VLNcdyqOzaP/qVFBfBKA==
X-Google-Smtp-Source: AGHT+IHQev4ydRTgpyByOzu2HFcpu2MVKpWBI6FXCN8mebkBNMtO53w2pge5I/hqSmzhTxgE+0KR4nyVgR2HhWJO7ro=
X-Received: by 2002:a25:df50:0:b0:de5:4d41:80c3 with SMTP id
 3f1490d57ef6-df77223e718mr9210410276.55.1716814225824; Mon, 27 May 2024
 05:50:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240521-pinctrl-scmi-imx95-v1-0-9a1175d735fd@nxp.com> <DU0PR04MB941718F15619A907C15AA18588F02@DU0PR04MB9417.eurprd04.prod.outlook.com>
In-Reply-To: <DU0PR04MB941718F15619A907C15AA18588F02@DU0PR04MB9417.eurprd04.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 May 2024 14:50:15 +0200
Message-ID: <CACRpkdbpLcxZ0YNdvYCS3bpyd3e6Qx7Wf1Ju9Buy-TvkBQoYDQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: scmi: support i.MX95 OEM extensions with
 fsl,pins property
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Aisheng Dong <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 10:36=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:

> Hi Linus, Sudeep, Cristian,
>
> > Subject: [PATCH 0/3] pinctrl: scmi: support i.MX95 OEM extensions with
> > fsl,pins property
>
> Sorry if this is an early ping to you. Just wanna this not blocking i.MX9=
5
> upstream support.
>
> Are you ok with this patchset?

Patch 1 is fine as it's ACKed by the DT maintainers.

Patch 2 patches the SCMI pinctrl driver and patch 3 uses
module_scmi_driver(), so I cannot merge any of these patches
without ACK from the SCMI maintainers.

The code in patch 3 looks OK but I will comment on it, no big
deal though.

Yours,
Linus Walleij
