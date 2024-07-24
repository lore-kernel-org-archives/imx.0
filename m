Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CF015F316
	for <imx@lists.linux.dev>; Wed, 24 Jul 2024 18:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721845293; cv=none; b=Ri6vhAVmPj4ehSNCosx4KVQFRU43raJU+kd6SxdljuZXvT85NIxPwKu4ZZ5dS0DoB5H0dJkqxdHzEHRLrQV+GXz5fSi6k+/62msKuNfw79BSRY0K+nyIUVCDaziNqMo87cHDospFwachyAeJmU0aMap0MQncj5U4DIopes7CGno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721845293; c=relaxed/simple;
	bh=AchHhKwoH2XTRDncv3aZ9DVHgH7DNtyJRQ7cNb7zWX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hnJPmF5oGaMXa30idDkBTWoSXvh0C4wRSwV4Dyp+kqB+rpd0bm9RR9etkixHG1O3OxNg4guf+ke2ehdsNLzX+WgPnAL22KE5XtGuCsNm4t5AYSEWp7uC4RbMFKKxk+brvRej1InsXwG5xIjckDQeRBNy5/VsetfHc9qmID7C4Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O1AA4HiZ; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O1AA4HiZ"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-70d2b27c115so76631b3a.2
        for <imx@lists.linux.dev>; Wed, 24 Jul 2024 11:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721845291; x=1722450091; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7WCpmXa82zyOZ922g0iRuHBkONYRB7p6kOaLY9TSJIg=;
        b=O1AA4HiZakyNIaGzXHAbc1DWPzecnizTnkOM4taysbYzr/lYQJFjNmUKK/zw1WGuzX
         2Lvnz1t8qiyzEMlxvsbBHOPZDaYEZ5EPrJ+RLDrs8WjJr3ZEXD7/U6CtVkf2I568ruir
         qHaHVHRye50v/1qPUlkG5NyvDWnrmn6cOgXHd6NCff6cn5jV3MRoO4n2MOBdHdaA3T5p
         QFJPv6kEoOu+m5tQ3UH0I1UAqSC2Sm+81PL9jZlYsRlV6yON6Lf0SwHKBltDSvlRJpmg
         U0p41dk1NlKwVjfVMxA0PR0VCdiTobghP4AkYzzuGm7/q26CXBivAI8SJFEn5T+JI3PF
         FA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721845291; x=1722450091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7WCpmXa82zyOZ922g0iRuHBkONYRB7p6kOaLY9TSJIg=;
        b=dNrgeMXWLuWKwnN3KCT9vE44kI+LF4lTF04wM41/7BO/9xxk+mIo7wF8Gvqm/Ovv9k
         eaJ8jLDg4sMa2jtM1Svv9bBAEZIzucuMnl9zpSGag7MIka7Dk7exIrJ1uUlyxYFnyR4h
         /AIPx+vH3k6H23dO+rFPRVWp3FheJC/SEYdSrjnTXQ1Rpszm/+7HllyV2YtzZgTfqBay
         IUCZdSfUR8LVL7PVWTlYIpoVcbBHgE/SGiSuOAXWUZUVdndWmeILGxzHcMW18QYXThsu
         tbxCosgtRJml0IACLl5po64xUGfbGxu22LUxRXuG+3Fa8UZHrny/OBIkZ47sU9DVUxkT
         TTZw==
X-Forwarded-Encrypted: i=1; AJvYcCXZr4b8rFXMvBd0BxH2AiRvA4NevldxfrGmF1Gqi+zOMdsglmpvUGdm7iptlzgdlF4qVbxhEASH43+uk4EF/65p/OBe
X-Gm-Message-State: AOJu0YyccSE+1KBfWrLEdvgOgJKxCH80nnZdyK7YeCFF5FKE+lhdJMSQ
	FsgfFILitFTKaLLDi99xmd/dpByK9mnfeyYR4t14bWvueXskoKwy
X-Google-Smtp-Source: AGHT+IHbXJnA2o0kEdtq8KjKxSCdIUUIOh5dEi8uNKi3kPgDUGk1zRWNY81M+lRRC8/X2Nrwwr7hGg==
X-Received: by 2002:a05:6a00:6f61:b0:707:ffa4:de3f with SMTP id d2e1a72fcca58-70eaa8c59a2mr414328b3a.17.1721845291027;
        Wed, 24 Jul 2024 11:21:31 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:c2d6:b5c3:537e:3830])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d1a09df58sm6258957b3a.112.2024.07.24.11.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 11:21:30 -0700 (PDT)
Date: Wed, 24 Jul 2024 11:21:27 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Nitin Garg <nitin.garg@nxp.com>,
	Abel Vesa <abelvesa@kernel.org>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] input: imx_sc_key: Enable wakeup according to dts
 property wakeup-source
Message-ID: <ZqFGJwb-0MU_GP28@google.com>
References: <20240719152259.760457-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240719152259.760457-1-Frank.Li@nxp.com>

Hi Frank,

On Fri, Jul 19, 2024 at 11:22:58AM -0400, Frank Li wrote:
> From: Abel Vesa <abel.vesa@nxp.com>
> 
> Enable default wakeup according to dts property 'wakeup-source'.
> 
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> Reviewed-by: Nitin Garg <nitin.garg@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v1 to v2
> - change int to bool
> - move of_property_read_bool() just before device_init_wakeup()
> - drop !!
> ---
>  drivers/input/keyboard/imx_sc_key.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/input/keyboard/imx_sc_key.c b/drivers/input/keyboard/imx_sc_key.c
> index d18839f1f4f60..fc1492088b645 100644
> --- a/drivers/input/keyboard/imx_sc_key.c
> +++ b/drivers/input/keyboard/imx_sc_key.c
> @@ -110,8 +110,10 @@ static void imx_sc_key_action(void *data)
>  
>  static int imx_sc_key_probe(struct platform_device *pdev)
>  {
> +	struct device_node *np = pdev->dev.of_node;
>  	struct imx_key_drv_data *priv;
>  	struct input_dev *input;
> +	bool wakeup;
>  	int error;
>  
>  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> @@ -151,6 +153,9 @@ static int imx_sc_key_probe(struct platform_device *pdev)
>  	priv->input = input;
>  	platform_set_drvdata(pdev, priv);
>  
> +	wakeup = of_property_read_bool(np, "wakeup-source");

The driver uses generic device properties, why do you use OF-specific
variant here?

> +	device_init_wakeup(&pdev->dev, wakeup);
> +

How does this actually work? Doesn't the call directly below
unconditionally configures button as a wakeup source?

>  	error = imx_scu_irq_group_enable(SC_IRQ_GROUP_WAKE, SC_IRQ_BUTTON,
>  					 true);
>  	if (error) {

Thanks.

-- 
Dmitry
