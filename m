Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0E5272816
	for <imx@lists.linux.dev>; Wed, 14 Jan 2026 08:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768377904; cv=none; b=u9+puIBBQF/5tE8/UtyS/ag7UywuolXk+CI2YEMIynkL3gyIKIoQlt7HvM+Vq1oDPCqwem8HZyLGGPdSZsh27wSa8sajbN1NrcipCdWRop7Giw2yiwm1Ilp2tGkDQXX4/euNTauXGQVBaS/NS7owG/bvEF0eCyt6kiEaHIDQVaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768377904; c=relaxed/simple;
	bh=jYPkzS8uwgSyR2vpbKtgewGdh4NqLZqcruiqtTuKQyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ch9kfqz0E7AZ1k69xSDe3v+cOcULUV2JidHdM0fylib0H+TYbfGPa04A7//i6BfKOdCVq2Kwq/MspyeXRNPB/fGV455vtMyMM0btcJthZaZppQpjt/6lkvhdpz/ZBXBov+X6VV+UMZsgXAYtpUA5bAifUwBeux2Vwkw4hbDlVE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NOavdKwx; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NOavdKwx"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12332910300so2842685c88.0
        for <imx@lists.linux.dev>; Wed, 14 Jan 2026 00:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768377899; x=1768982699; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYPkzS8uwgSyR2vpbKtgewGdh4NqLZqcruiqtTuKQyY=;
        b=NOavdKwxVZWNJKPQGHViKAp/ESewtoD6lkWyfMEOrSONkr3B5I6p7FLZb/Hvp5AwNd
         E0dotGEJYmcHbG5l10XCIU8MoKHi7Bsfw8AcviPU4cCC3UCbyvqq725my/hE3BwwneXY
         z5OIfYX/inE51cmghyXjliRWAUFJVLcyER2KxiJyU3oe7+jjJwOzsxLnrtUOLdSOybbh
         7AO514KY19BZXq8mWnyqOTIlI4ijvmbUxrC8qWDHNw/bwql7hMO3J78gMUtpVbACRevT
         h+L7ELjrdc87M8N6z48UGsFga/ZXNrI9LdvUPh6gJ652BTNe1+hh+coAsX9Ym+cPmmya
         /J/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768377899; x=1768982699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jYPkzS8uwgSyR2vpbKtgewGdh4NqLZqcruiqtTuKQyY=;
        b=fsPH7hdm4hNJjRc7FojgwyCMGK+Ce+aWDg1ERFV7gUtNdK46ajSn98kRZchV7ByIFU
         GztvpN9On3xtXJVZS9ySVtdCmDNf5u0y6JwDgU5gUNw98NqG60IRwsdfP2+8/kqRs/UE
         hPuh30UFArci0irvhfRQXprmSjOmFAA2dEQrV8oU6HCD05PSRz/4mXuWxn9DyvTCSPhi
         0o2henbDsNcOS1PmQwjOqiKgPt3X0nBh1nwkfc+58MzFNIFKdPrvPLGWrPIGPIwwFuBa
         DvxTfzMCO/HvmtZa5ndNicmn8SArJP1ASbBxCJ9qN8X1wDteqadgNXztG3NkXovHgpvY
         a7Qw==
X-Forwarded-Encrypted: i=1; AJvYcCUsdUppn8p2BG3tVWvDz8EYlha6A8BlR+MFL+Ad8caXQk1PsqFbL1yySyY0kEDSF7Swie4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxtQcoWhpZhB8IEAE1ODutUAejO1HJGYjRy5mqOAJTehsybS9XS
	XNSa9lZJBP2wPrmaaP71k39AFTd01DY2pU4M32G6TeIUF4ckE5/8sWs8fYHfUDz1rRTkC6sqMYo
	dXZbXcFzz7//U68PhCZepfURcKg0j1TM=
X-Gm-Gg: AY/fxX7tYXtm1wzDXJ3uNwPU5sDnYJisGS+CH/g53BqjeKzyBfSSFT40QmfLMMUcgdl
	8JXg8IUMk2xV/qVMT8qDVo7CwqlA9HRgduAZPcPMMwoRBMlc5U4G7+lePxuB1yJOkS7GeAipVVq
	06n2YOIndS/9vpIh4VLyG2xVr0J+pTFSLR/T7NyphPG3CDi5KBwCY1Qg0QKY3CTbdMFU4udEhDL
	3D9+ib29Lmh7X1OvVv/MlIjnJ38HO8SL2c6efZY3KJO2sS2KDnRGxgmfM1Bos2cEBAdEXdvJjqA
	tcGusSpvmOy1+YqoLq0M9vcwfI4HKJ2xeYpzptb9sh9yg0S7mcNN+X9YohCyxEOPog3S7zaRTpJ
	rO7/Km87vEA==
X-Received: by 2002:a05:701b:2211:b0:123:2d38:929a with SMTP id
 a92af1059eb24-12336ab506emr1783847c88.38.1768377899101; Wed, 14 Jan 2026
 00:04:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260114-fix-soc-imx8m-v1-1-143de91ef077@nxp.com>
In-Reply-To: <20260114-fix-soc-imx8m-v1-1-143de91ef077@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 14 Jan 2026 10:07:40 +0200
X-Gm-Features: AZwV_QiQ2GxOfUl7_qoYYXBsoM4-1o56L0DpD7bTOn0TWKITOwqTzpk0MfT3zD4
Message-ID: <CAEnQRZAX4HVjaaPbdUBp6aOreba8BNfkDXeyt4_OH9WVajcCTQ@mail.gmail.com>
Subject: Re: [PATCH] soc: imx8m: Fix error handling for clk_prepare_enable()
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Marco Felsch <m.felsch@pengutronix.de>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2026 at 12:13=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.c=
om> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> imx8m_soc_prepare() directly returns the result of clk_prepare_enable(),
> which skips proper cleanup if the clock enable fails. Check the return
> value of clk_prepare_enable() and release resources if failure.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/r/202601111406.ZVV3YaiU-lkp@intel.com/
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
