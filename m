Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=161.97.139.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007471;
	b=aDKnYVAOTic4Z+Nz12EPQOnkcv6/JyMHyQIIQlscFOOSQ/YXbq+ziw9k47teOO5iTMHG
	 JJwNP6dmSf9EzHDbecwcL7oG7J0BIo1uWD/qQoDLEqAI8y9F6Fln2dEZ9xuja4lj/FHEF
	 jH9KAb/oOAHa3Wzf0af3uBXZAVzIATDoohPWZwKVSckZ57fKPV6XZuGyvz7TOzSaGk9m5
	 pp6xL/44hsw9kx/0vku7/fuBHIJSM3aQx11M/tnyQONnZ1Gcv3C7qvZpEwdshUTEzyoOE
	 wesvo/eCHk0onEbbY7NVg1An4axI8pBu3HUrtaYn1taDh60k77iJl0xaZ05QKjSuuaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007471;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=UmXjLJOP0mzdBm7GFoPR8yYMqhsvVQOQgwUqLKU0OJM=;
	b=pvHSKoQfW3q/ufMiRK6U0cujYJ7/2ONLNUP3PMCrz8XS6afE8vbtfu1SpjHCz1dFMeYa
	 EYB0MZojYW5L+wlWh+sSdxscEBRqAtlGaEqfaoLbR4vQuQccsXSNieN3GNgxRjfLlP08y
	 tkuvEeec4saDBlxeREjmd0HzQMJrcri9L3BWQ2Dwpw4fXIHb+u2GckUh7cwLH5jvfy66I
	 DC7K/dWAFhCxMyFSDUOvIOGw7YkO7wxVcFn69VnH+i6OJcBaqrHk9FhtGMIVopF3jH0kT
	 irfyoG5lD6EKRvhwfZI1o40J7GPWmJ2LlEdqgAi7TnVME594Ry1u+AngCu7p9Ypo03g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=YGY7ti4c;
	arc=none smtp.remote-ip=161.97.139.27
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFD2606A320;
	Mon, 26 Oct 2026 09:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EFD2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=YGY7ti4c
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1xLH9I-00000000j4B-28f0;
	Mon, 26 Oct 2026 10:37:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=UmXjLJOP0mzdBm7GFoPR8yYMqhsvVQOQgwUqLKU0OJM=; t=1793007468; x=1794217068; 
	b=YGY7ti4cym1iwvhu1O3tPuJmwf+BrpXUBcBhRRZQag5UlJo3bTCiSivUb29ju5204v4WFPYduG9
	Wunqr+d+dCPYye+UEMbFO/KXnVJ4q2fh/7pM+Xr1ZcDCAw9Yymd0vmqb8IaJ9UNcbQmwaDpI8DiLz
	hoWVJ0Z7SL9h8D0avCORgUN6ivOC0ZtL+EebvdfYw5gArSSVX/o+ZNonoc9tdfPBEzi71JqRfFabP
	9ofuYfLQRUKPtMes0srGEAE7vhXUk9i0CzO+tK6Q1FXWNkzCwhnbTzHN6//LahxVJcve496N9RDFF
	mJZKvFYNBE7ZuHFn//NsfNazX/77ExigHiKA==;
Date: Mon, 26 Oct 2026 10:37:30 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>, Frank Li
 <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Alistair Francis
 <alistair@alistair23.me>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-hwmon@vger.kernel.org, mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] sy7636a: power the panel only during updates
Message-ID: <20261026103730.3a79c2e6@kemnade.info>
In-Reply-To: <20261026003918.155321-1-pmazzini@gmail.com>
References: <20261026003918.155321-1-pmazzini@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 Oct 2026 00:39:11 +0000
Pablo Mazzini <pmazzini@gmail.com> wrote:

> The SY7636A hwmon driver keeps VCOM on from probe, so a display driver
> can not power the panel only during updates.
> 
Yes, that is the common use case, power things on, tune update process
to the temperature, update, power off. So it makes completely sense.

> Read the temperature in the regulator driver instead, as the TPS65185
> and FP9931 drivers do, and remove the hwmon driver. Boards that relied
> on VCOM staying on mark it always-on. The regulator also switches VCOM
> with VCOM_EN, gains VCOM voltage control and binds to the I2C device
> directly.
> 
> Tested on a PocketBook Verse (B288).
> 
Which kernel do you use? Just curious, maybe some further upstreaming
actions might be coordinated or cross-reviewed.
There was discussion about in-kernel hwmon readout interface like it
exists for iio.

Regards,
Andreas
