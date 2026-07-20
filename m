Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E08E3F8235
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 11:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784547537; cv=pass; b=i1Oj1IcmZqbEUdHNpsxFxq9rpEQBCsxNmsrWdLrKnRnxqi1qFEShyeMFIiICthN1tBiFabnnvPx/Gugyz3USjIC6kHlNwpqjxL2oauW335cALCVF74ts53qXqG6GqXL6jzZgJ4xIuWF2bAxKA2+FpI/OhjwwhejK3+qceUh1cZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784547537; c=relaxed/simple;
	bh=3mFDRcZDbh/vAxE726hbAA84Hj/VP9ketvV+yl9H0x8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CZrzYzh39ydK813OJ/ocPy/E9WM+l+9NUvrDABH2nrAR+WepXA+fgUwj3KlvAo3x/DjU26W07SP6pY/9J3nrf2GdDVAF8mzDUc+jmFqQ+UmbgVdl/zltTE3CCeUIVRO7HaGS+EklFKShdN5UJ5mo/JLBS+fu/g7028la7Zq3jP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sEQB53A0; arc=pass smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sEQB53A0"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4a456e44e01so3363359b6e.1
        for <imx@lists.linux.dev>; Mon, 20 Jul 2026 04:38:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784547531; cv=none;
        d=google.com; s=arc-20260327;
        b=rU4N4QNumZeGC1UBwtmdlk0CXe/V3etmJvm79OK8GD8Sf00gDQl0GSSFO7DdBkYPUU
         risGZFTKa8mXan4S6FXKee+QtuulWNrzDWHgzadMCPkC0YIF/4PgepuNKgW41wAq5/oc
         abmLipLVNcJPlj+FTQA0iQ7ae84jFPhk0iNGX53I7dBYZYx7KFpJ0bSQgm2BOKAov8S/
         M4eELSphPWQJxf98m9v/cIDN79fMwyKgQCDLW4TDmTmwZc2rSrwA3k24q9n7iRsu7rjK
         VkdPWLXOl0gRSKlB/o9Elm5kgDDHnizsUeN5r1uRQUEApBWPTeQaI4NQ5e8oulaYw+yB
         OdlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f/gXgCuauhGKcFUWfulPTHzrfiJTz+du/PeQqhHatQk=;
        fh=ckZuMs3sKmB7XuEBW0z7IE0LKafnXsxLjzyCkC+DhRI=;
        b=GhYfFJuDZmE2PSBRSVBJ3W+VZr6PRr5sRfB1Vihk5wCGDUBY5Ga+dTy4qItRMv0uGp
         uDSTvrkJJeBbZ6RV1YTjqDP8BQIeTLDDxNjEjzrWlvz5G+wuhwt3kCc35Gw5T+q9xxBx
         c17BO3l+cX/sS6PHiVKdUmOQosxUD/yRh2cpsAac8/Vu77Dyw5VtqDT0Rrp9ELGOWv7n
         3M7rrEVFqd877RnXGcm6HpfRI9eNK7LbxP5EEaJnWnm1UcRx9PMV3Dp+w7Cqld5tJofA
         W8oFA/noa+uKF9jLYE3xgAwIdzntE8gXiGzPsSN7NZ56MDUjEFWm4n8t1V7LPBx0SJVz
         SbxQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784547531; x=1785152331; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f/gXgCuauhGKcFUWfulPTHzrfiJTz+du/PeQqhHatQk=;
        b=sEQB53A0L2yw9czj/FzO6qJIPYD3DX1G0cBwYA7GOo74tOZR8zljz4/CLM4V4TQGdi
         +OHmz9bykBPd34V0lf1T9KgFGXGzKMUUSsGqkkm/bEteb+n3edKjEV/Bf7BUKpHkt9+e
         4J+HPWTFDLMfMR5FTL07BTckm+vzmpNNLDEq29qE2YM6k1nFd9RqGMwL3ywwWHzzU9Zy
         rc3iBi7sXeVUp+FolI9DvqGE8zUn4dtRjTlLS6DzR/9OZxGMB283qwgy73Y4DpZZYOk1
         W8fDNU6TA4PaRO6nUPQ2NSOY0i4IUCvamTuW5tG9S3QSQWcxMbzFZ8rSARyZEhxTiI7D
         qfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784547531; x=1785152331;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f/gXgCuauhGKcFUWfulPTHzrfiJTz+du/PeQqhHatQk=;
        b=jX4aC+iLpKdRSKijeo7jslR7UaOzEbKukRuHlAXWgoQzDOhHY/v5ATeEF88/A96pII
         gEdpz6dtwoaE3IIu/MIFFxbDZcRGkolepdH+zpgqyFnLpT+R4DFIdWJ5uIKp9JjvOPFX
         JZgZ9HQGaLRIXaU6XsRxbRMzWYRBWRohC6GwzVBByHHDWy52sRDgZol7oH0aOBrokJB9
         XkW54banY3iMFlfrfNrrqrSkuVb9PM2qziEGKO3IeGg3pigfKo9iuYDhq9Ah23qZz/8p
         1A5/ZUjobgRuayyPIFrID26ozlYp/P5w9WdaPaQu3c/mByIHl4Y0dHy+X63e5IU98Ise
         UZFA==
X-Forwarded-Encrypted: i=1; AHgh+Rpul/aZeb26QCjpEnX0X8Axa2cqi5k+U5O47UdHPfBAKVYycEs59W1fyKgMj1fHuQAON5o=@lists.linux.dev
X-Gm-Message-State: AOJu0Yweebcer8i3dlWUe0wbJia+EigDElH7rtIBFQIQI4qvNKvDi7ML
	JnyGG4qvuKO5jzJeOaty+dbS3FHJAWHvmQD+RRmWP/MN3z2/zYhpczE0llE43sn/t0pt+iQESBI
	qjBuup5RFExe9VtDDUp5dOJ83+d9zBd5L7w8eg3QU
X-Gm-Gg: AfdE7cksbl1JbdkOJ1NtpCDURUFoU6QskpCGqLsXxkaBN5ThWrWwQoJXpD16JDw+NzR
	WP4kqsPwthZ+60TOS4zaJcDBIlM1aArC+WPjYlw5NjOLPJwVvcbmAEe/WdENPx+bI2W7QicB3FN
	/gtZuqRAowk4MazsE9ijdednmOX79wFRFlr8/hsIOsI8HjhduskE0d+DJ2eDyIQznGucXIXeTU8
	u9CH9S00zQthXfwV8oToJrL+uz2b4a1G1Tv1XIzyl22t5RRPNr6wf6xKlS9zK3Jv0DWT9iDdRGh
	SPlox2ouOxfLVKEmKw==
X-Received: by 2002:a05:6808:150b:b0:49a:3094:57bc with SMTP id
 5614622812f47-4a4d057091emr7828138b6e.43.1784547530438; Mon, 20 Jul 2026
 04:38:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260719-usb-ptr_err_patchset-v1-0-85f7f2e4fefb@gmail.com> <20260719-usb-ptr_err_patchset-v1-3-85f7f2e4fefb@gmail.com>
In-Reply-To: <20260719-usb-ptr_err_patchset-v1-3-85f7f2e4fefb@gmail.com>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Mon, 20 Jul 2026 04:38:13 -0700
X-Gm-Features: AUfX_mxW23vWV4YHSucfnpNg2RwqWb4K0lV2PtTDbAAqVY6VN7Bv5eoCWZEPBx8
Message-ID: <CAPTae5L7CaQoa+Zy7r3ezZQ_giY5nWOut82P5rC_8v6YeC-0Ag@mail.gmail.com>
Subject: Re: [PATCH 3/3] usb: typec: Use %pe to print error pointers
To: Subasri S <subasris1210@gmail.com>
Cc: Peter Chen <peter.chen@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Duncan Sands <duncan.sands@free.fr>, Chas Williams <3chas3@gmail.com>, 
	Minas Harutyunyan <hminas@synopsys.com>, Hans de Goede <hansg@kernel.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-atm-general@lists.sourceforge.net, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 19, 2026 at 5:56=E2=80=AFAM Subasri S <subasris1210@gmail.com> =
wrote:
>
> Use the %pe format specifier instead of %ld with PTR_ERR() for printing
> error pointers in various typec drivers. This prints symbolic
> error names (e.g.-ENOMEM) instead of errno numbers (e.g. -12),
> making error logs more readable.
>
> This patch fixes coccinelle reported warnings:
> ./typec/tcpm/tcpm.c:4799:60-67: WARNING: Consider using %pe to print PTR_=
ERR()
> ./typec/mux/pi3usb30532.c:143:3-10: WARNING: Consider using %pe to print =
PTR_ERR()
> ./typec/mux/pi3usb30532.c:155:3-10: WARNING: Consider using %pe to print =
PTR_ERR()
> ./typec/wusb3801.c:281:5-12: WARNING: Consider using %pe to print PTR_ERR=
()
>
> Compile tested only.
>
> Signed-off-by: Subasri S <subasris1210@gmail.com>

Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
> ---
>  drivers/usb/typec/mux/pi3usb30532.c | 8 ++++----
>  drivers/usb/typec/tcpm/tcpm.c       | 2 +-
>  drivers/usb/typec/wusb3801.c        | 4 ++--
>  3 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/usb/typec/mux/pi3usb30532.c b/drivers/usb/typec/mux/=
pi3usb30532.c
> index 985683fe49e9..a2357a28ecf4 100644
> --- a/drivers/usb/typec/mux/pi3usb30532.c
> +++ b/drivers/usb/typec/mux/pi3usb30532.c
> @@ -139,8 +139,8 @@ static int pi3usb30532_probe(struct i2c_client *clien=
t)
>
>         pi->sw =3D typec_switch_register(dev, &sw_desc);
>         if (IS_ERR(pi->sw)) {
> -               dev_err(dev, "Error registering typec switch: %ld\n",
> -                       PTR_ERR(pi->sw));
> +               dev_err(dev, "Error registering typec switch: %pe\n",
> +                       pi->sw);
>                 return PTR_ERR(pi->sw);
>         }
>
> @@ -151,8 +151,8 @@ static int pi3usb30532_probe(struct i2c_client *clien=
t)
>         pi->mux =3D typec_mux_register(dev, &mux_desc);
>         if (IS_ERR(pi->mux)) {
>                 typec_switch_unregister(pi->sw);
> -               dev_err(dev, "Error registering typec mux: %ld\n",
> -                       PTR_ERR(pi->mux));
> +               dev_err(dev, "Error registering typec mux: %pe\n",
> +                       pi->mux);
>                 return PTR_ERR(pi->mux);
>         }
>
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.=
c
> index 89eec20a2064..ad10470ea73b 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -4796,7 +4796,7 @@ static void tcpm_typec_connect(struct tcpm_port *po=
rt)
>                         port->partner_desc.accessory =3D TYPEC_ACCESSORY_=
NONE;
>                 partner =3D typec_register_partner(port->typec_port, &por=
t->partner_desc);
>                 if (IS_ERR(partner)) {
> -                       dev_err(port->dev, "Failed to register partner (%=
ld)\n", PTR_ERR(partner));
> +                       dev_err(port->dev, "Failed to register partner (%=
pe)\n", partner);
>                         return;
>                 }
>
> diff --git a/drivers/usb/typec/wusb3801.c b/drivers/usb/typec/wusb3801.c
> index 6062875fb04a..86d13ab41670 100644
> --- a/drivers/usb/typec/wusb3801.c
> +++ b/drivers/usb/typec/wusb3801.c
> @@ -277,8 +277,8 @@ static void wusb3801_hw_update(struct wusb3801 *wusb3=
801)
>                 if (partner_type !=3D WUSB3801_STAT_PARTNER_STANDBY) {
>                         wusb3801->partner =3D typec_register_partner(port=
, &desc);
>                         if (IS_ERR(wusb3801->partner))
> -                               dev_err(dev, "Failed to register partner:=
 %ld\n",
> -                                       PTR_ERR(wusb3801->partner));
> +                               dev_err(dev, "Failed to register partner:=
 %pe\n",
> +                                       wusb3801->partner);
>                 }
>
>                 data_role =3D pwr_role =3D=3D TYPEC_SOURCE ? TYPEC_HOST :=
 TYPEC_DEVICE;
>
> --
> 2.43.0
>
