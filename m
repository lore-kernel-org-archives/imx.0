Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F73B181319
	for <imx@lists.linux.dev>; Wed, 17 Jul 2024 15:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721230544; cv=none; b=uWayPRD+feQhokpqWGHgut8yIfjAZ3uD57tOpp7o/CDdlMFeFrqbLrwhaQWTxYWqSYPNWjxHWIXNhouh5S5noIShLoZ0urFxG1sx5agSWBBkyLxSmCg4Rw2EmY2ehhF+pP7AWra3KQcNdHi5RkfBZhr4NuAAoPQFH3zRyN/yQ0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721230544; c=relaxed/simple;
	bh=igKSkhh6A1mnqf1e706OFohGjxcTqllM85CooIxAVwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i1WLpqNRtFvVWYUtcGHjtffrSv7Bj7kF1WE9RDU7I+7a5T284c6oSBOnSHyRztswPMFbKlFvyxdBW/iHRRvztnwWfYmw8wDSsJbi+Immy+jI5Tv0rUMgw6eMm3j/3Zu8Ve6OxwrNf09SFUXlBJyXsD0raDBkr38TP8/3bfU0yos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nb3bYIZw; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nb3bYIZw"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e05ea6a2808so130170276.3
        for <imx@lists.linux.dev>; Wed, 17 Jul 2024 08:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721230542; x=1721835342; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=igKSkhh6A1mnqf1e706OFohGjxcTqllM85CooIxAVwE=;
        b=nb3bYIZwNB/bwCFGu/wxmK05HVR5mAypHOuPVulIVWYtZHSYgSxO29NzlzBD++n4NT
         kngiJyYUEZuieoroMYWU2AcUF45W2Y2DaOfc6RGie4b0yIWHzs2nfclfjVVARC84XY+o
         3UY+8Qw0udHyxzdhnyVrHaZjngoYOpgvoIKGpD8e6FJS9MQIMkZkgvmvEXrFOVjrpWYG
         JT8+Ud3DR4ZkzzoHBKNFfA74PLl2Uz0mQhKCtsUV2ae9TYGKJD4M7ck58KYnpqJn9gB2
         nbwwqVQkBpXvUsVcnDxdymPAogQdLtYHw2fnH9H0aeQ28L0SQgOryvj64GXoG/lGToG0
         EHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721230542; x=1721835342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=igKSkhh6A1mnqf1e706OFohGjxcTqllM85CooIxAVwE=;
        b=meQZwDenC8gW/xUWOmOEglQEZR8J1vyDIQv2be15okHFoTxDBtj8xLG0tx9O+jE8/u
         BJ81mhTSx7gG5Yp+EfDjYV8c/pQiwbUOzDJWJfgmnbYW96ud1M315kBeHdzlKUdj1hl/
         Kvi8hf8nijmt0b7PxuuEasSYmn11UTaBqqHNqB3XMxi4jR/foelNb3vmz2Y2Luaao+Wz
         6w/1e6DbnS6ZotfeLBr5LRrliJ9Re97NJSZFePVUXLpY+uvlLljlLp1E1AnYkTPPJgrn
         XaC7xd8yGzocwoPzdEXWaOvKpMxUASFhBfRunX5A+g+4IUMH/d0WWK2HC6kLiaMCRVO/
         g0/A==
X-Forwarded-Encrypted: i=1; AJvYcCVJSBePxsAdsL1IIWiohgotHNUDGPb/nTPVCeIbm2sI0pQSZD5roV/FV+4IKtOSQhAhr0E=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxw6dqUFw403yJTW38KRnpUjMpMxhPp0IXJr8JI9CxybTf+OMF3
	5V+OGdTGTLDnp+bYi8pGGRhWFUnTVMJOB/O8MXYsB91KOoPhEzP+ED1qfY4ZN7j7ZIs+hXR03mT
	YgeY3NZve33+eCn3Z1nJcMdYUaIY=
X-Google-Smtp-Source: AGHT+IHe8OrFLg3ciltrH9UGah27A80WUE2vi6fq7nZNul7uqH2m67h9SsuJFdyNWxvxpLOezUdSHmc4pDBlQVlAl3w=
X-Received: by 2002:a25:d34b:0:b0:e05:e16f:e8a5 with SMTP id
 3f1490d57ef6-e05ed7a649dmr1163650276.7.1721230542549; Wed, 17 Jul 2024
 08:35:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240716-adi-v1-0-79c0122986e7@nxp.com> <20240716-adi-v1-4-79c0122986e7@nxp.com>
 <u7xii4lfvjk6gbpmq7qtqckoznddiyno7xsaa74ufuxwdob532@wxuawwiwjpgm> <ZpfVNHQQaJvdnB+B@lizhi-Precision-Tower-5810>
In-Reply-To: <ZpfVNHQQaJvdnB+B@lizhi-Precision-Tower-5810>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 17 Jul 2024 12:35:29 -0300
Message-ID: <CAOMZO5CGqMXmcUg=J0OOtsq4ZpnVD7GnpxzEQQQ1Cq_dR45Hwg@mail.gmail.com>
Subject: Re: [PATCH 4/6] pwm: adp5585: add adp5585 PWM support
To: Frank Li <Frank.li@nxp.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-pwm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Clark Wang <xiaoning.wang@nxp.com>, 
	Haibo Chen <haibo.chen@nxp.com>, Jindong Yue <jindong.yue@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2024 at 11:29=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:

> Thank you for you review. I just found someone already submit similar pat=
ch
>
> https://lore.kernel.org/linux-gpio/20240608141633.2562-5-laurent.pinchart=
@ideasonboard.com/
>
> Let's wait for laurent. If he is busy, I can rework base on the above one=
.

Adding Laurent.
