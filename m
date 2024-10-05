Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5849D156243
	for <imx@lists.linux.dev>; Sat,  5 Oct 2024 15:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728143845; cv=none; b=sOgdv6XJxrO/5/nxYMLXmCsyIFs7gRC6pVxiQtnzvlJBxnNVAkFaL1P6f8r8eXhX4KglwlV690OPjsfaAyPxVFlp3vaoPmsWr6Ovz3RUApJ/xyodSFmFp3MYbe+VnhyGW/PjWHoeCliijPjkMMRv/0WYb+ZMi6dVPygr8Yr3H2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728143845; c=relaxed/simple;
	bh=rvOfxqkLW8T3+y8E0eE6uYFdvtJ8ggCwhrQBDymZLck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dBzjxLPfZCWhnlDag1FosojEK7D+r0Fg4WZ/xHGcvqGahbQCNxoKZT1hrhLF1/hfvOO7KWE65StO74iesrsn0FT2ZxGbtKHXXqWcYdfed4qO9JSma3obQxjLEPKOwp4iuBEVrz74mHRAiOM5LEuxJjtHTYc0fxqiNYYmi6vHcds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=1rc0DNeu; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1rc0DNeu"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37d04b32ea6so1933194f8f.1
        for <imx@lists.linux.dev>; Sat, 05 Oct 2024 08:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728143841; x=1728748641; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qXz9vBq3bu3888Z5jpvuBKQzYSQvLNzRZ8Js/IdLunM=;
        b=1rc0DNeuWtkeHyxg83LmnK5ZCjRIVT70P7S3Y4+99v5pbdxjRBCAlxAaKlKF35m7b2
         NB8H3+w2I0X2US06OC5g+e5Y8HeLrS9eYZY/ze85uKUyDPjqKezl2Mt6hditZFfmcX8U
         aZvEgJk/02QkBYn1xInAZN/h/cIZk93T6tvFNs58jEF8ca2kujlrIngA/5rw/kWPdSmq
         38qihqWZ2+18p4vY81EnWRIgRjNxz6RzIzgA6IP6InLCYd7UAhlA0GDV3ggrWag9/Tjt
         Ea4HI9nQ93AZbMsdGukm3LAzDRZdeucEqA/pLJWlpIIzt4m8kir270znJbM3EcO5fGG5
         7YuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728143841; x=1728748641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qXz9vBq3bu3888Z5jpvuBKQzYSQvLNzRZ8Js/IdLunM=;
        b=oJC/hTEsswq+7KWyYp5jtlA+QQwbbYisozwoOebW8YxPKB6Lt5fhqil6LBHVFohDAW
         fllYh7qFIOmUA273pBkVIMe2+Yar0VGHa4Pv4jfsUiiISi7Cih0a1HU+gwrM3VozERVz
         eVjD+aaxcNOB+ZZoZ9DOT5GIpf35Uxwpy9qFxvJp1Rc3b/iGdt/konBXA4cGaaQMhJ9b
         bC39AOYP2hcged8X3Nhqn3TWorE6nxPTmC2fYwe5Mj0vXFFuoK8v1Yb3lrdkMrV6HcI/
         D2jM1OYn0x5nB6iRgQzVRsk+PHyk+6bMLhiKOyec3QnnIzvCizRncPJTGbIJe85/mi6n
         Hj2A==
X-Forwarded-Encrypted: i=1; AJvYcCX+Eau5LSUC9kbOPyOuMaGVy2kHNCHl/3LVZWt2Ux81LwYnpLArSFPGts51RCmKJcbosX0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxIGgMoG+tHzeiWnpumXmxB4ePpyM5azNB2Zl2vvn18zdzWgVdK
	vykmVi/p6wX69pyW4oBwrvFiEno+VZ4G0aQAGoe6185d3ceE+y8xP7B7cJKOMm8=
X-Google-Smtp-Source: AGHT+IF43/A7zCrs3+gI5xHgV4LbW1A2YYw/wvq0IVL4OE5XX61u/Z+s9jLqofsLCP7Kzw+4y8PJaQ==
X-Received: by 2002:a5d:5108:0:b0:37c:d522:af6d with SMTP id ffacd0b85a97d-37d0eb1ae9fmr3448004f8f.58.1728143840880;
        Sat, 05 Oct 2024 08:57:20 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:69c5:ee3e:d780:d02b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1695f113sm1988217f8f.80.2024.10.05.08.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 08:57:20 -0700 (PDT)
Date: Sat, 5 Oct 2024 17:57:18 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Marek Vasut <marex@denx.de>
Cc: Frank Li <Frank.Li@nxp.com>, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, festevam@gmail.com, francesco@dolcini.it, imx@lists.linux.dev, 
	jun.li@nxp.com, kernel@pengutronix.de, krzk+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	p.zabel@pengutronix.de, pratikmanvar09@gmail.com, robh@kernel.org, 
	s.hauer@pengutronix.de, shawnguo@kernel.org, xiaoning.wang@nxp.com
Subject: Re: [PATCH v7 1/1] pwm: imx27: workaround of the pwm output bug when
 decrease the duty cycle
Message-ID: <gnlm4u7dc2aktycxzn4nqw3anzeit6tbtgcq7kv3pzbrorwg6o@h35yxit5y2a3>
References: <20241004193531.673488-1-Frank.Li@nxp.com>
 <5cvzarqkldstuziokdbxxne75i35odexkcykzikyq2gm6ytdyd@5wkm7mhotgej>
 <4166d68c-5eca-406a-936f-412dd2ae72fc@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ctgpfajami44sg5x"
Content-Disposition: inline
In-Reply-To: <4166d68c-5eca-406a-936f-412dd2ae72fc@denx.de>


--ctgpfajami44sg5x
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 05, 2024 at 02:41:29AM +0200, Marek Vasut wrote:
> On 10/4/24 10:58 PM, Uwe Kleine-K=F6nig wrote:
>=20
> [...]
>=20
> Why not simply duplicate the ERRATA description for iMX8M Nano MX8MN_0N14Y
> errata sheet ?
>=20
> "
> [...]
> "
>=20
> That is very clear to me.

Fine for me. Frank, do you want to try creating the right mix of the NXP
text, your and my description?

> > 	/*
> > 	 * At each clock tick the hardware compares the SAR value with
> > 	 * the current counter. If they are equal the output is changed
> > 	 * to the inactive level.
>=20
> I would skip this ^ part unless you can surely say the IP works exactly t=
hat
> way because you checked the RTL.

That it works that way is clear from the errata text IMHO.

> > As a new SAR value is applied
> > 	 * immediately to the currently running period, it can happen
> > 	 * that no falling edge happens in a period and so the output is
> > 	 * active for a whole period. Consider a change from
> >           *     ________
> > 	 *    /        \______/
> >           *    ^      *        ^
> > 	 * to
> >           *     ____
> > 	 *    /    \__________/
> >           *    ^               ^
> > 	 *
> > 	 * where SAR is written at the time marked by *. The counter
> > 	 * didn't reach the old (bigger) value because it was changed
> > 	 * before the counter reached that value and when the new value
> > 	 * becomes active it is already lower than the current counter
> > 	 * and so doesn't trigger either while the counter continues to
> > 	 * grow. So the resulting waveform looks as follows:
> > 	 *
> >           *     ________        ____________________
> > 	 *    /        \______/                    \__________/
> >           *    ^               ^      *        ^               ^
> > 	 *    |<-- old SAR -->|               |<-- new SAR -->|
> > 	 *
> > 	 * that is the output is active for a whole period.
>=20
> The ascii/infographics is nice and would be good to keep, but regarding t=
he
> description, frankly, the NXP errata description says the same thing in
> fewer words :)
>=20
> > 	 */
> >=20
> > > +	 *
> > > +	 * If the new SAR value is less than the old one, and the counter is
> > > +	 * greater than the new SAR value (see above diagram XXXX), the cur=
rent
> > > +	 * period will not flip the level. This will result in a pulse with=
 a
> > > +	 * duty cycle of 100%.
> > > +	 *
> > > +	 * Check new SAR less than old SAR and current counter is in errata
> > > +	 * windows, write extra old SAR into FIFO and new SAR will effect at
> > > +	 * next period.
> > > +	 *
> > > +	 * Sometime period is quite long, such as over 1 second. If add old=
 SAR
> > > +	 * into FIFO unconditional, new SAR have to wait for next period. It
> > > +	 * may be too long.
> > > +	 *
> > > +	 * Turn off the interrupt to ensure that not IRQ and schedule happen
> > > +	 * during above operations. If any irq and schedule happen, counter
> > > +	 * in PWM will be out of data and take wrong action.
> > > +	 *
> > > +	 * Add a safety margin 1.5us because it needs some time to complete
> > > +	 * IO write.
> > > +	 *
> > > +	 * Use __raw_writel() to minimize the interval between two writes to
> > > +	 * the SAR register to increase the fastest PWM frequency supported.
> > > +	 *
> > > +	 * When the PWM period is longer than 2us(or <500kHz), this workaro=
und
> > > +	 * can solve this problem. No software workaround is available if P=
WM
> > > +	 * period is shorter than IO write.
> > > +	 */
> > > +	c =3D clkrate * 1500;
> > > +	do_div(c, NSEC_PER_SEC);
> > > +
> > > +	local_irq_save(flags);
> > > +	val =3D FIELD_GET(MX3_PWMSR_FIFOAV, readl_relaxed(imx->mmio_base + =
MX3_PWMSR));
> > > +
> > > +	if (duty_cycles < imx->duty_cycle) {
> > > +		if (state->period < 2000) { /* 2000ns =3D 500 kHz */
> > > +			/* Best effort attempt to fix up >500 kHz case */
> > > +			udelay(6); /* 2us per FIFO entry, 3 FIFO entries written =3D> 6 u=
s */
> >=20
> > I don't understand the motivation to wait here. Wouldn't it be better to
> > write the old value 3 - val times and not sleep?
>=20
> No, because you would overflow the FIFO, see:
>=20
> 137fd45ffec1 ("pwm: imx: Avoid sample FIFO overflow for i.MX PWM version2=
")

val holds the number of uses FIFO entries, so writing (3 - val) new
items should be fine?!

> > Or busy loop until
> > MX3_PWMSR_FIFOAV becomes 0?
>=20
> Do we really want a busy wait here if we can avoid it ?

udelay(6) is a busy loop, so we're already there.

> We can do udelay(3 * state->period / 1000); so faster PWMs would wait
> shorter.

state->period is the new value (and you want the old, right?), but
otherwise I agree

> The delay is here to basically wait until the FIFO is surely empty and has
> space for 3 consecutive writes (see the commit above wrt. FIFO overflow).

Best regards
Uwe

--ctgpfajami44sg5x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcBYdsACgkQj4D7WH0S
/k7uuwgAryHou4sFu87uurvIotcWUKE3UOcqqY5ITxmszZHlYLbHtjxWc6nKPXg8
FfDoH/A2Jf3US9mmdD+a24P3re08XgJisyGHdMeQonTuUznsfsNH6yPwyTNJX6k+
HZdk+7t4orcYA8aulNs4I85QB/+UPqwJ/P+szn2IvSfOjuy1hSNCuvMrL0VT6MGZ
dMwSKWoYDhmtf9/YiYbNvCFec5hvePwkcQQvjwKaF1bhJEVDN9iKeVB0HWVgfsWx
MsHGlTf7tjp4XhI4PJMLV2yqCYKMkCs/mHV/lQjJSqTE8vusPMUUAe/jNx5iIkVr
mk2wXkaesccaUsLMjRzR8Dc+DwrAuA==
=WUha
-----END PGP SIGNATURE-----

--ctgpfajami44sg5x--
