Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FBA361643
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 11:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771846348; cv=pass; b=cR72eoQm5ROnBQq+MdHB5aUudvEBKvdpOrxkdt7y+8kPsMcNwFbb5PfGMA71BhezsqRnXEVZeOHIiIW3w9RAMAMm8D9Hx5/jKMLzkMWoNEHHHBICWAZkvhv00eoPec3ioBqaSquGV50LQ7h/Dhilyk4LdeTTpvU5+UY1cRs/gts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771846348; c=relaxed/simple;
	bh=uHtxhZgqkvvhkDixZGvThzOeJrJuPZvcOjfb03f5dzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vu4Q09DYZESaQb+aEQ84+wgi3EcyEoJF8Eg9gn1pDQrg4WZUNCbwihLZRXnQvNyWuctxHkQgnaLMT07UpQwZw5g/3Dge7TF/hBKPozstH1qoAIZn4WZoIUG7n8Ado+YMsXdx7F4PMaoVAivoVCFk4KdaZ4nunaG3w50bhU552J0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=d9Xkf9DG; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="d9Xkf9DG"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64ad79dfb7cso3872870d50.2
        for <imx@lists.linux.dev>; Mon, 23 Feb 2026 03:32:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771846345; cv=none;
        d=google.com; s=arc-20240605;
        b=gC0EiOpAENVnDAssEUmpNAGlbb4/CpimkS3it7FylGGaxRphdcdwOZ2gFKJxM6yqO0
         vd/DsEKFLiRS/HRyuQulSg1WXUClLsxmgqSWIE5mnl2O/ZB1PU7GvSBL6DJLc4IP/aAA
         ToVVTmg6oBipsAHf1NROJKPGK3Kd1wXRuhqw8U2YBGvzgC7rb6FcHUddwXFg2MRtHGrv
         zLC0M3RIULtcmoGU6BGj3Re6tXJaxI8E9FhnCuxi1atGQVczxnt46XLzDWs777cY7wGa
         Mh7ZyR6ftpJ68IyeeeCcziwLI/A6p1ByuIY6bbHRrwxOKOF9S/xzMHMasbXgQcWMQQJU
         b82g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JV6MMROodIfNHs5yZIiROnA2XT+gIEtvvO+RXDqEFEw=;
        fh=BeY4BBHbq7x+KJ9/Uq7B0ztuVRcIp9YMccPiqxE9OgY=;
        b=jrZRT5d4Ub5T+Kkz0KFUz85tBC9qvEtiI8j6Toy1daD+SoIipExJ1O1nmUiI+JEvxx
         Chicb2JUTPSJh20KFkN0Vdahqta1WvOYBWjcTxuXOF+GmMA4VlEKl7WiwMLeyCMgUKqp
         imU0W5LzNLq5D5MS/U5tjQt5r/s7T61Zl7IeBpB9b/q6BHNwOggmgrLWw5Z/tSq9Z7jI
         8Yl7/LQniZAdySzvngW1ZlKYOGYbaJF3Sbli4+TniDTSoRNLqn2mkUiChGvfhN/3GT2e
         x5PJI9Ui/KNN0IVKkRR2OLiumg50bwtVfE3GRU2aecP2j5FX3uhRp4WQ18vhHgaKbr6K
         FrXQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1771846345; x=1772451145; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JV6MMROodIfNHs5yZIiROnA2XT+gIEtvvO+RXDqEFEw=;
        b=d9Xkf9DGl3hSTKxKjmKbm2W3ob+W6/c+pj6y5pByQCyP9lvntfVhiDHA4z9fwqgXst
         W3NqYj9XZhg9GrXYITYUInQLgBdMdLWoLBc1NoxGvTiPJzG58Ar3HJnnlzgMyBLSIYSL
         BwE4S8URHPAOqjhvSpZZHICUXsBus5OjpdKHaeKuOPmXet4jru9OdJhuqeCwYePSoT99
         5zKCX+intuaGyVJP8TAS1lKRYlE8/nYeor4yoDHpo0Lsc35hE+lBX2xdHFIgF8D49jWg
         2Lpul9JocndoX2dA0uos2brb4PhJfPsrm/DjkOAk2alRR+eJ0E0wiREO9EcYUx5e5HS6
         MKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771846345; x=1772451145;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JV6MMROodIfNHs5yZIiROnA2XT+gIEtvvO+RXDqEFEw=;
        b=mF9dCgiA0/HrSeS57RVhB8fFE68oj/Elg4aCpn1iUW5G1+1ILdVl8d1CjrQdQgYdRV
         SiVzOI4cFDUoYR+PM5u8kKjogHd+XRIhUttDFS0/RK6NupUXvisYAW3efOgB7ZmKZfOo
         06rqp7RiDAD8yoeIXOi60CP5Ae4LTTVj4iAqcI/5rKlK/SQt0r7hokJ4v5TuFglcQ7fF
         NdDplKjmTA1XZat7QPqDPeJBayRMpGDwuLUC1hq+ygc3xXIfxvZZA0zD33FslUK1OVBp
         eil8r5NePvp7iCK6Ub3gqrSPsorPMcjbEf/TcIJrUj0Ymw0qDx2GTaRGjWHSJxQ8jZst
         0t3g==
X-Forwarded-Encrypted: i=1; AJvYcCVTKOgVfGPTOrNgDo+QEKrofFRlWsKkLM1zgMRsQDWq3hj3TfJcs0EwCzfVhCvhRZn2O2o=@lists.linux.dev
X-Gm-Message-State: AOJu0YyEwcRqheNaceGHIELlIroj/apL7d4DBc/7s8ODfdCcjikD5DUo
	iex0RBFrdP3tJBRYVLYSfXKxQiFeYWoRyQkmBUPYiPNPb7tIoEHUIFHTma4wn14g3/hCMAJGeZQ
	yWkdIP9WXU3mkhDnJqTJIAJxyb0dqmuCm5U2LjnNXRg==
X-Gm-Gg: ATEYQzy/GxLOCmUlmgAj7EszGbqTWOufLa2qpyukOq5mHWxjfDVXObuzDarlolpfcEK
	iSJt76pZbvV1uu/yh/1gn9VkTjLXtVHew0grLmzbV8refBV8qss10ICTOD3bz4Is1OGWU72Vp2O
	IxYsyMrpSy1tkg5ulTFlSINVkrVfl7DS8jEr5v9GkJmpYzG6+0SMcZ/loRKfCBtOY8ADDnN+naf
	XMyXvNg5sIeqh/h+aV2qm4K2GsRip4xkHueq/YVs2F+nWBFllKvfIwAAPbvmBc1z3tKsEZNtXxe
	S3lo2iUHVbCzeva6uuAe7CO9Ht1T4KkMICcCEg==
X-Received: by 2002:a05:690e:1601:b0:63f:a7dc:5661 with SMTP id
 956f58d0204a3-64c789c7e4dmr4751859d50.12.1771846345547; Mon, 23 Feb 2026
 03:32:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com> <20260223-i2c-adap-dev-config-v2-12-d78db0a6fcf7@oss.qualcomm.com>
In-Reply-To: <20260223-i2c-adap-dev-config-v2-12-d78db0a6fcf7@oss.qualcomm.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 23 Feb 2026 11:32:11 +0000
X-Gm-Features: AaiRm53g18kb_D8a8Rz5gsK9_gN4L3-bPSeoZhzvicFe1V_X2f1sAQaShwQ_SAw
Message-ID: <CAPY8ntDgMHgjX65ZW8dFvo5jb+yZDUQq6cEJuw=zP6DddmTPrQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] i2c: bcm2835: set device parent and of_node
 through the adapter struct
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Vignesh R <vigneshr@ti.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Feb 2026 at 09:07, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> Configure the parent device and the OF-node using dedicated fields in
> struct i2c_adapter and avoid dereferencing the internal struct device.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

When used alongside [PATCH v2 01/12] i2c: allow setting the parent
device and OF node through the adapter struct:

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/i2c/busses/i2c-bcm2835.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bcm2835.c
> index 0d7e2654a534e92a529f27fdc049812359678522..4f7e4a178b33fdd172657cc625a34018b18f88ca 100644
> --- a/drivers/i2c/busses/i2c-bcm2835.c
> +++ b/drivers/i2c/busses/i2c-bcm2835.c
> @@ -474,8 +474,8 @@ static int bcm2835_i2c_probe(struct platform_device *pdev)
>         snprintf(adap->name, sizeof(adap->name), "bcm2835 (%s)",
>                  of_node_full_name(pdev->dev.of_node));
>         adap->algo = &bcm2835_i2c_algo;
> -       adap->dev.parent = &pdev->dev;
> -       adap->dev.of_node = pdev->dev.of_node;
> +       adap->parent = &pdev->dev;
> +       adap->of_node = pdev->dev.of_node;
>         adap->quirks = of_device_get_match_data(&pdev->dev);
>
>         /*
>
> --
> 2.47.3
>
>
