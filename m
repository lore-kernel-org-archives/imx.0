Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C1029AAEA
	for <imx@lists.linux.dev>; Wed, 25 Jun 2025 16:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750867483; cv=none; b=oCCu7VbcqThY2IYXFfaD4NRfLoWoAwQFtzUJie/+S+N0nNEjnb8VNDU/5EWVAA9AGMEQ1AO/myTwN8VQZrPQXFhv77eifMi8z7r0JRTcs+oHjduxl4VfJc5cqniXdYlgporOHEicjLq/KPq9L81ud/KNbXNlL3FBTfnfUbJERs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750867483; c=relaxed/simple;
	bh=otHmhz9qKbneCAY/qZt+a5oqKkpxMdFANunIpnL3QQM=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:To:
	 References:In-Reply-To; b=COOm6BZt8142vQa3VjhDFWoBNzweP9jllv5chd3tD9JzpjIG4qBdnjnWNsip66Gkruk5+wJN3lN6nAkhGvx7TtJHVAtjlROtRBTCDUg1GvFo3wTfrV2B+l19+IPh8x9DPhibmeru7xmG6cXerA7bosEk0EqvIDniRJkiiQ+4k1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M2YiGF9V; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M2YiGF9V"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a522224582so954287f8f.3
        for <imx@lists.linux.dev>; Wed, 25 Jun 2025 09:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750867480; x=1751472280; darn=lists.linux.dev;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWKkFAFg9O1FS34EdKG7yTUZEGesEzF1QQfwKchWpik=;
        b=M2YiGF9VWQ0Vzyzesn1stkfsXzZ1uDEzX6FHCkNMY15xYZUFTfdJ3gMdCC5vNsInun
         bZB8XMHxcOhKP0naXtdwnWyKC/UpjdH77VTQDrXzPpfsY1VxCE8yhLmAtkNdN+QaxbjX
         wk+sKTOYDj+MqATfOaGUdEyQlx6yKZePUyO0s8bVWGXT3TJJYfSiKiBY6drXdYghPSzP
         Mm7VraTCI2LLM4qROvipBZBvTp0O22UzczHyedXNRSw7kUUYaXn/0+uvMVYHgo3VNjlD
         mew7rN9/3OwfS7NmbHhHmvASo2XQIVTwdSOxIlBjK5fhCHq89NJ3p/JMeRnQCK2jbEXG
         DStQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750867480; x=1751472280;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uWKkFAFg9O1FS34EdKG7yTUZEGesEzF1QQfwKchWpik=;
        b=bgXqFlVPS8kpDOmP6kL1nl43cFBhaiulELQ9EEDLR3ZVCxLb7+OmVd8JIYkhWxS2SH
         x6I4ymhHqrBVGOpLsuu9VgG5uWp1AdgezPM9iOmNkd7uobXMRU9UcPbnLZup5Jex+nEr
         X89awGd/nmWOWIHm4odCTxZF52TolH8X71dn0jr8+ptT+70pBShpAfaGf1F3Jfzygd6c
         KW70NU/xkl8BGjXUyvNljnUJmpJOgQqxB8ef9KBBVD2VixlMFmEOQYFsY82q6Dyl1mLi
         oO7mtn7fwAGxOez7xQPznCMUrebeEyUOh3ml8BCVZmqpgqEfuBOQVZsFHig4CRMU6YdX
         bVnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXuoU5i2ekK4BI7xLuTV+2iAvwd5w0W7IaHv9RwMw21f1kL2hUhAaKDA/4gl9bxEs9i0I=@lists.linux.dev
X-Gm-Message-State: AOJu0YwA1UqcmuCxTeEseJ8VAi2WXKsMuJd4Xe9HXPZnlAKxgV+Ye5HQ
	ISZduNBiMJJzPfx+h8dMZu63wEnpwz4JUV/EGbldScErQ9ocxd8aonnJ
X-Gm-Gg: ASbGncv/3UK5kV1SA1gvUAfO5DkFa6FR8fbbro/TeA2UzTVOEyfiMJr1C77krFIDS9p
	W/EXplrOo+mAy6O3qAxXd+eIbocumwFTsaTX5g8fd1RHucEwLx+aR8e/1JWpkyyS865Zr3CdOPQ
	lIcTJZM8RoQsnrn3qGihwZ3/dwft+L4wDo53L6nGHO/zQX911XPDx07i3eb4NJQU8YniJrr5IWM
	uBvkaPz8COS3RKKWsWdwg0ZaEMLaZO2ibJaclCTAnGqIoDwmW6MTq6hSnDqROg5VA34bW/BvNrU
	vCXtxFPwM2MzfZD9OsY8wPHM2sOJI4ilfZ5912+ovdX+fHsS1WwluhPd2FscgdphPT+Kez5NPN6
	Y6iohmdsatB5wIhb31cXLbFkt
X-Google-Smtp-Source: AGHT+IGwdBKEOpjpvucseGnRqSYsFTVnLPoA4uCi0Dyrn7S/hacATqeX4eEhHO0U4z09yQRUY40vHQ==
X-Received: by 2002:a05:6000:230d:b0:3a4:dcb0:a5f with SMTP id ffacd0b85a97d-3a6f2e8e330mr249814f8f.16.1750867479407;
        Wed, 25 Jun 2025 09:04:39 -0700 (PDT)
Received: from localhost (a95-94-245-170.cpe.netcabo.pt. [95.94.245.170])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a6e8109e1asm4934842f8f.84.2025.06.25.09.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:04:38 -0700 (PDT)
From: Rui Miguel Silva <rmfrfs@gmail.com>
X-Google-Original-From: "Rui Miguel Silva" <rui.silva@linaro.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Jun 2025 17:04:37 +0100
Message-Id: <DAVQPZC0K30N.308T7KKXHN7N1@linaro.com>
Cc: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>, "Martin
 Kepplinger" <martink@posteo.de>, "Purism Kernel Team" <kernel@puri.sm>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "Hans Verkuil" <hverkuil@xs4all.nl>,
 <linux-media@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] media: imx8mq-mipi-csi2: Fix error code in
 imx8mq_mipi_csi_parse_dt()
To: "Dan Carpenter" <dan.carpenter@linaro.org>, "Frank Li"
 <Frank.Li@nxp.com>, "Rui Miguel Silva" <rmfrfs@gmail.com>
References: <9b6c7925-c9c4-44bd-acd5-1ef0e698eb87@sabinyo.mountain>
In-Reply-To: <9b6c7925-c9c4-44bd-acd5-1ef0e698eb87@sabinyo.mountain>

Hey Dan,
Thanks for the patch.

On Wed Jun 25, 2025 at 4:22 PM WEST, Dan Carpenter wrote:

> This was returning IS_ERR() where PTR_ERR() was intended.
>
> Fixes: 642b70d526ab ("media: imx8mq-mipi-csi2: Add support for i.MX8QXP")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Rui Miguel Silva <rui.silva@linaro.org>

Cheers,
    Rui

> ---
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/medi=
a/platform/nxp/imx8mq-mipi-csi2.c
> index 6501843ae72d..3a4645f59a44 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -966,7 +966,7 @@ static int imx8mq_mipi_csi_parse_dt(struct csi_state =
*state)
> =20
>  		base =3D devm_platform_ioremap_resource(to_platform_device(dev), 1);
>  		if (IS_ERR(base))
> -			return dev_err_probe(dev, IS_ERR(base), "Missing CSR register\n");
> +			return dev_err_probe(dev, PTR_ERR(base), "Missing CSR register\n");
> =20
>  		state->phy_gpr =3D devm_regmap_init_mmio(dev, base, &regmap_config);
>  		if (IS_ERR(state->phy_gpr))
> --=20
> 2.47.2



