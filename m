Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C6A69DF5
	for <imx@lists.linux.dev>; Mon,  8 Apr 2024 11:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712576945; cv=none; b=J9hsVI+LyS5ywG1eepQ8ZP1ONSerIIFsF9w4kUd3WrCIS7EldWAzDORVqhXYgEN9L4pz6DXgZ8TBksmBo2GCC2vjyOLt39wEPQoOPPfEYp/1HOMWRUNmJFVFZIKif3xEDkb8tPJxL+5tBi8O+5yLH3OpiwfsOe11o7d/C4B+U2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712576945; c=relaxed/simple;
	bh=5+GW2zqSXOcVY6HLiP1isJnrQthfe56oJBTjTreix4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ALRsAHRFvju92YjWG3wsIowQjW4WzPU6rfG/6Gtfh2BfQGGViXf7isZf0UHiPgB1796RPq8AY2F1VMypGAPPtgwaMavaPkNYY3T2BJVEwVQZRoiI4R0XpN+ZZyvssEWazENl3S7ycMSHFq0cuSL63vBXzUQJtYgDEVx9rC7OoZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZVo3jYJT; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZVo3jYJT"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6ecee443c79so499711b3a.0
        for <imx@lists.linux.dev>; Mon, 08 Apr 2024 04:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712576943; x=1713181743; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GIQh6B6U2unyStwftymRPGVI14zoMCWts9Hg0rctxvI=;
        b=ZVo3jYJTArsRK2Od5J7wavPgaZXZhVhKzlgDdAvrDiiFXEfD3K/XEuFb0uIHB1LJa4
         SDuoj1BThM6t3T57z+DFTsGBF6C8dBnqC/Q84pcbUujqGhFC7Vl6webw0rklfQx/pJR7
         jocd8YSroBh26fYRkSgpsZTII21Y4H2uOrp6EIUzXDom4Iku+zVT8TGqNZyM5nMx6YiU
         4Xkx+Ep5YyVuS2RIuKUGvKZcmWAAlE7wrEdZ0fS1y0hDh1d7hE8Dh7WxJO8V4fFK5uv9
         y4qdp2sdlYaqfeFYTc/qmcTg86corOKvp8mJE/wh8pGU5rsTb1aS5QPUH4qwk3cv47yX
         aRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712576943; x=1713181743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GIQh6B6U2unyStwftymRPGVI14zoMCWts9Hg0rctxvI=;
        b=hrYbv3d+9qi03ni7b/HTKcmXFJvRv7jJxlI0qfk1c5zN9dzBaWiLbx0RyzN4o+xC6o
         YDLPKeB7AzlojwJg549lfiMBg9Thijn5eFMcH46Dtx8TcySvDfQyG0GTbL+8aqIxBH6g
         l01koJRYQaK2vxGBBhqpM+jDYOJsDUoB6+JHXYXMXbkj0ZImTakkr6TIxkcX5nAurmH/
         OxpOAhZFRM5zcc5gK+i7N/+vqdZQFF7r19yv/x7fgtqpDxMvZJENBHsoUlylp552lHhN
         /qg93j9ZdO//mP3ERn366xy9nshlT8EkmmJDhgSNGJtSwOKMRLCGmbapr4STFnNhld/T
         gqfw==
X-Forwarded-Encrypted: i=1; AJvYcCXwKoeWTDugytNFRBEJkwOro5kuyJKPl0jYrCsOia9W8esPkkv7j1FV7K7ung5SvhZpxAVbiuQoKX1Eo0HkbQy2mVM9
X-Gm-Message-State: AOJu0YyeOGKU+6GBOA12CYqUNyNYcuNlgF8p5D1IQPIWdNZesn+G0Gxz
	rHDFe1CfcbM1oi+zrqu7A8PFpmYfw5Wx2e9SA5FYdnRczyLScTs/1y5FsNMrVQh5Qtx19gbMlZX
	1uvlOP3cgLa1bIzZ84IRzPNHrTuo=
X-Google-Smtp-Source: AGHT+IHth8BZ/ZebZFfLxBn0WT6zE10ZV962hJtv6q7226AlZXO+232Jcw6YYySMzlV1ysO95yXj8UyPZtQEfm3p3vs=
X-Received: by 2002:a05:6a20:6a14:b0:1a7:c66:121d with SMTP id
 p20-20020a056a206a1400b001a70c66121dmr11270850pzk.3.1712576943546; Mon, 08
 Apr 2024 04:49:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240408092449.6-1-ian.ray@gehealthcare.com> <CAOMZO5B-vTRSfi=tNc_iZxnxYstL8JJOd_1rMf4ps9WHyfx0GQ@mail.gmail.com>
 <ZhPYkGLM_b5IEKs2@de2cfed78370>
In-Reply-To: <ZhPYkGLM_b5IEKs2@de2cfed78370>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 8 Apr 2024 08:48:51 -0300
Message-ID: <CAOMZO5CaOYt72pZJ7fsdQgz3Vz=G+WXNE==ZO7nC32M3oBCKxQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8mp-msc-sm2s: Add i2c{1,6} sda-/scl-gpios
To: Ian Ray <ian.ray@gehealthcare.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 8, 2024 at 8:44=E2=80=AFAM Ian Ray <ian.ray@gehealthcare.com> w=
rote:

> Thank you -- I will submit a V2.
>
> Would 0x1c2 be more correct?  From the IMX8MPRM.pdf, it seems that the
> lowest bit is reserved.  Example: 8.2.4.158 SW_PAD_CTL_PAD_GPIO1_IO05
> SW PAD Control Register (IOMUXC_SW_PAD_CTL_PAD_GPIO1_IO05).

Yes, good catch. It is better not to write to the reserved bit 0, so
0x1c2 is preferred.
