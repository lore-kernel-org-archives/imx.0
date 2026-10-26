Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793014107;
	b=z2HnlyzyncP8UjE8vi0cftQQiHU14d5lqBxVDC5eJhcUOAdYpXHv8i8bp9txkWZLU5Jq
	 WVdVmI9B58T+BQtTGiQPe0x8qwoLQBeSbQ0wACo3KwgB7Qk4lt84Il23jCaRDwE00AFGH
	 Z+P/oWc53+5FtOnvS2npExUzS028fsPUGcBFoWMUztV6EBzoPouR+V2eXpAKuXWdwEFh4
	 0GoZeCUpQCxxEI1U/4LSyAY7OVsuYVeXR4tCBQFKKb0VI5OoFewEGE2NetZZY0a4+xr2b
	 r6L/tjfT0pYwNPFfr3CCcALv86zLItpOE/xwsmf4elCJYO5q7LsImc3LWCbDSgSMWOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UKeZl1Gw10WMRIflMK84zHY+twgH7FBBQrDMYUxvQug=;
	b=Cxs7jSq+/vIpI2meT/9sN1Ez8FlR3gAP+OSgFAFBn6CO/Ji9zKzi7hRe0P744D3LZ8uY
	 eZwiclE7wMoIX6aw5D+gDLzCPqIuUo2tN8xRm3we9DwEucHILwgHIvoGYskFbx0U6KQov
	 oBvKwNgbzsDCbfgVo4wrwfOP+/+2CjHdUFw1leVtwWkE5vT+xk7Ubm0OvaDLkEjhlNzXh
	 AHgjw2olY+/3I22Y8SEhmYkaiUPGIq5/EBVB7i2ZKjMAbftRq+Zd+vS8AJS4M9exwmh7a
	 5Jbs0619xJ+cHe5NojM9aOz5e7rUrxlXGcqlX2PVVovC3VSBhUJ/vKUJ0B+i7/7Q/SQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BknLw5bd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428FA606A31E
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 11:28:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 428FA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BknLw5bd
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a064dcfcfdso858254b3a.2
        for <imx@lists.linux.dev>; Mon, 26 Oct 2026 04:28:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793014101; cv=none;
        d=google.com; s=arc-20260327;
        b=e+qaJtXrmlqeVuFAB0PZjNDfmDs64HsQzQUbbi6dVKQon+JWlaikroeN8MBxVORXLd
         WAhmdQli5EBKVGK+jl+zRVfypsi1mnjZyGyh8taR7aM0uOiarylgQOQS6WWj7NjVTYUL
         6J4vFTWBP9I66zsJ8PQmO7hSLW7+vhm3RphBEt28gmBnQikx2Pof1eyN4+9k4Z8HwHWR
         MiNXAJ6FC//Hm3wYaxVglA6ac+Oej7ifXu6S0pGiBLlQYpX9YEiWTCNZQPhYhzdBW5Y4
         k+nc7WciLEm76EF1jtGaU3DkjQryKxLR5sGi6WGHodv5SOPw8/UUp2HWkHIoCTrLdv1T
         pXoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UKeZl1Gw10WMRIflMK84zHY+twgH7FBBQrDMYUxvQug=;
        fh=E4tSnYJ87hIBtFzsA/dxSw+pqSXFB05fh6iqq3XRgFY=;
        b=WF8V7QIalRz9Ep5/z3E0aVB0y6URnAp1xC4v48E+Z+0xbIouKUJqNM7Gpu38G+9Zei
         p44H5tpNRVFkRanh1kFrBuSMCWnerKCE22mvnhflA7yJs4WYM/qfDIhc7LHt0PhR4LQN
         Ms9D5ykVqZpnS52ezT8sY+gIU5p/rNqiLm8BwN4L3HoEPWO74dPaK2A8PnNnIuC9pHVk
         jgvY7wb/eIaxUDlT9PiKE1wqZoPFsMXRoMVKE9/6RvdxK9AWAg538Xs5fIVcP8p8qPST
         l5akzSgUYZlXt9ecpze5HHhSMvkJ60IK+mXo6apR6E+fcR7rMr3Jx3cma4rD2+/dvasH
         B2sg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793014101; x=1793618901; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UKeZl1Gw10WMRIflMK84zHY+twgH7FBBQrDMYUxvQug=;
        b=BknLw5bdk9EE2WdGqrJ+wsjFbrVLJe99w277SrPjbYFGEnCewcgbOS87ZdboUrU35+
         Xf6J40Ct9GnAShhmrE11dwjNMmnT9ZVW0/dJhpvCzxj+dc9XWQ3STGSv8I978w3mnMX5
         rytzpaWHjIkolKxg5Pu69svSwDlyOA99b6kxZD0AYe6VojaOwJSyqdaI2wHaX48LC4wT
         Kl47Ke0OWOm9lP1sqQVDrHSnbC4fQCObUjmfwhyWO5JeeSHTF5iFuNHMnPHX5mNwTDE8
         7h1lOLw9VZnMy863LRSkI7a6WMRcFSsLVeDv7PqCxDnjEXQ4YSYKKxWRZLecAwFHzdtg
         Byrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014101; x=1793618901;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UKeZl1Gw10WMRIflMK84zHY+twgH7FBBQrDMYUxvQug=;
        b=I50c45TWy6WqpC6PgWq/RH93u5TeP3cGKTPtV2vhj3m5jC5d82tehV5ow/7bBtqwli
         wbRmzq3WeEJS3Jmw2+6fXi1mE70AImRmFFhKrpfo6MAGLvh1njp1gtVYnxjzO2EXm++Y
         YBdiy6kCyHaIbXvPRXWoDL1FI4D/yaTzQUUVfJ8ThA+PHDq0E37pTflXyPdWC2bK9hz2
         Y097ipypZH7wxcfWNccoFVi9Rgdy9j9aI9DVnZG5LqpFfc61/qQAN0/HqdoNNtK3gtEy
         0XaS81s1us7gVccvr/bNwZoDCT9W6XpwqXafa4Y1Rrfj6UXKwXhiv4Ij2Rrf+NZm3s4M
         VjMA==
X-Forwarded-Encrypted: i=1; AKwUvBw29FoBlorlZnnEHWQk7bqvW2KXgO94V9CVsIgatyDy6j09R2ODRJlyImNQXVZzqWrtCd8=@lists.linux.dev
X-Gm-Message-State: AFq9FYIIldOZcAL6SgsNeu0zg31dweqevwMy4zRIbKHeUCjHtffc3v/i
	BX0JfVx12k5660B7EUbDDr1X/T7yCNzPtRNo30vw/5uSn0EVqsLbmun9NzLDrovLM51IvTjEbZW
	+tZGywEd72G5279d08aYBnrdQlHFgBAk=
X-Gm-Gg: AYBFou3pJKUpi4r9CFmSrAesZjzv4iMurrHqsK7FcIk2dM9WVptpZ+jrWW8nhwDffpL
	VKHxdGXMiVvRBFQe97OQnPQZAIg4tooHzkSbrJtXLcYObnZHSW0a43y9Fzb9DXo1bQxBxgZKuoS
	ww8R8u9ZVAfT8AGl/Q66ej5ZlHte1vz4YNmmc+0Wvmd9waJ/OpL96+lJLCVksr6UU8yaqBaNGk+
	xGWZPFSjTDKshPjelZpzDbhoBkbuuLfQ1rYFcS8O+IMiWTqceiMA3jjZBo6OLUlyTxqZUXVWoLq
	v9FROh88NJUP3AmbFc5KGPWYmE6jtY1jAslw9TpDn4sFNZYqPvJ4MDJ8Hz2GQIzSUMC+EeNlOZp
	vU+e/KcpNssOFLip40Kvu2rPkqCuFDkXaoq2uBNG7QOy/oAbzmkDY
X-Received: by 2002:a05:6a00:bd81:b0:89e:8915:24aa with SMTP id
 d2e1a72fcca58-8a367a36becmr5121820b3a.18.1793014101519; Mon, 26 Oct 2026
 04:28:21 -0700 (PDT)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261026003918.155321-1-pmazzini@gmail.com> <20261026103730.3a79c2e6@kemnade.info>
In-Reply-To: <20261026103730.3a79c2e6@kemnade.info>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Mon, 26 Oct 2026 11:28:11 +0000
X-Gm-Features: AclHuK_DqqwJbE8Mxuk5nig_6kiigbCl4FyLzQRmggV5Ihs0oknU8AOuwlyhfVM
Message-ID: <CAAxh=jtYnDNQTUOf-cBN=w1Km+cBFOgrW8moNbHfqcApwxXbgg@mail.gmail.com>
Subject: Re: [PATCH 0/7] sy7636a: power the panel only during updates
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Alistair Francis <alistair@alistair23.me>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-hwmon@vger.kernel.org, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mainline, on top of linux-next. I started looking at the hwmon IIO
bridge. Coordinating and cross-reviewing further work sounds good.

On Mon, Oct 26, 2026 at 9:37=E2=80=AFAM Andreas Kemnade <andreas@kemnade.in=
fo> wrote:
>
> On Mon, 26 Oct 2026 00:39:11 +0000
> Pablo Mazzini <pmazzini@gmail.com> wrote:
>
> > The SY7636A hwmon driver keeps VCOM on from probe, so a display driver
> > can not power the panel only during updates.
> >
> Yes, that is the common use case, power things on, tune update process
> to the temperature, update, power off. So it makes completely sense.
>
> > Read the temperature in the regulator driver instead, as the TPS65185
> > and FP9931 drivers do, and remove the hwmon driver. Boards that relied
> > on VCOM staying on mark it always-on. The regulator also switches VCOM
> > with VCOM_EN, gains VCOM voltage control and binds to the I2C device
> > directly.
> >
> > Tested on a PocketBook Verse (B288).
> >
> Which kernel do you use? Just curious, maybe some further upstreaming
> actions might be coordinated or cross-reviewed.
> There was discussion about in-kernel hwmon readout interface like it
> exists for iio.
>
> Regards,
> Andreas
