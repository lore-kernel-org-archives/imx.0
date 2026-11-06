Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793986624;
	b=CpCedk8QdWQDO28Xz7axPZefw9F0yuEWLE1aaQsOHdxBGPwhMI9YdLlR+M+9sMZ1I3nR
	 NE6hzM7qoA2pSlimDADkay/7f+z3vbV72kDmeCd5feARODl9/tPCvfjM6YeGVYHnCS2RE
	 z0BfyvCH1jmksBw1vUXxR7fJVLTVLdOdvgKbYJD80MH0q2L6S1GhHjhk2W45D7ZM5Ct+5
	 wQEeSarx3JXEL7ejWwA3EUZSrNUaUTcTpXBKLlJc8C6Wx6mxqA/KbtSXzTuqOAiw9JnG3
	 cbplveZ9cY0zIVSpYk2heJZydBXqW95CUVHTtzQXRKxqHr3iwz9n93a6zd2T8oBsHQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5bCjFCftZY+2sQA45xJDozhTjhcUphJevAvIJETfdPY=;
	b=TepXRMXb9eV4LWbW1ZMiXH+/eXQdBgTjPTQQLq0CEHrmiluL26G7kmwOUoY0lyvKxCIR
	 da9CT+6iOkV/UJTs8MkcESaTVldGTlvxUZAe+JpIdkqU1k/exluYScVZBHOH1Zg2TYf+S
	 J6bViXDn0+m66aPqfSmWFEKA/yMNIZVm3qs6mWY6A+wJQlZX+c/nC8vYu12+8bU0EJoFY
	 JJ343It2rTC2xdmGJUnpIqV9jhGyOY9YaHMTdvYRI/gSnd8F727k5xsy2jOvz0eQ/XY58
	 YevtkHhwHjI4zh/nRebjecf3H41SM2LiOZYlgcBgI3ZktmHHcLI4bYbCkTLQhhVQDmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GRofZYl0;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9C0606A331
	for <imx@lists.linux.dev>; Fri,  6 Nov 2026 17:37:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B9C0606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GRofZYl0
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b0e61a4decso560215a91.2
        for <imx@lists.linux.dev>; Fri, 06 Nov 2026 09:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793986623; x=1794591423; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5bCjFCftZY+2sQA45xJDozhTjhcUphJevAvIJETfdPY=;
        b=GRofZYl0mnyW3/LZc+NzT5hkD7JE+L2Tuzc6gHNC5WLoVTmgbPTU+OCERpKTZSu2LO
         oaSBOyRs7hQJ0s3Y8CsI7AmtRwOUV57DnaE/N0oQKTQ3WvNhMW/9iL+MCiBp8r3x9WIG
         h3xKfCJIhTj0UpC26xxZDl7+hJnnknSSuekuHtQIoAFKffqbI7EuvT3L7rfzGzvgj2V/
         0/gYMzk6YZ7CG4a7TYkMdIBpoZpo/NDlGB8nH7UYHZS0tbo35NYUvkxxtdg3iI6xfGGU
         HFjtUb5auAAkb0y42YIOKDwOzJGeYxB6LcmXxKYRDU3qQrNEa6dOMaVBbFxxPuSbHWFi
         gU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986623; x=1794591423;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5bCjFCftZY+2sQA45xJDozhTjhcUphJevAvIJETfdPY=;
        b=YjJvKGq1GX+tcgsatnj1C+wI9xUHgSYyP+hxOevw1lSog7vOR7BzyZ7WFRgprM0JRZ
         5J0Juw7lnbgL3IUY1HccSkV1wWzMgkXKX18RHF8xmuWkmqY4rFbmFvmpUyRNKJ9IUbrY
         FSyM56p2KD7o8Hx1s56zueQuBhLfWxgXa9amgeKEESkr7PUGg0Y60dHvMXQXa27ST3O7
         FSPaKp0dcMfs+EbyhsBG608WpW+gk/S8YWaJQNfAepHKLiGOzeQ7vt9s93CnhwW/3f9T
         tTLWuyN/u1yMSIkVjmi6qhVf3Asgb4WOFTqZHomjwRFUwNxcXa+lJdCIPMQ/jGqUk/2D
         cUkg==
X-Forwarded-Encrypted: i=1; AL+hErGjuq80eA4+UwKjcuuvrx6XmHJ0jDRn2LbUxpJMzHqsZ35NE6eNlPTdttv9XfsUc9AO6tU=@lists.linux.dev
X-Gm-Message-State: APuU4Z84Au89NgCyLBeB7eSTWVhJknAvcbF4Eeb4wWsdNz9v0FCz4lCt
	foJ9fdcwU0ZINVJ7zFSuBuQezBlZQbxL5vcgU5A6YfXUXEtizLqSaAYQ
X-Gm-Gg: AYBFou32q5WGhGeCJ5AC8qtLeRf5UutTgzpspRAwzPkR69/MVYyKMID9JGkuiRbdboQ
	aruIn8QJ5uKKY5mSlhKDBk1PmLUKOncnNQtIDXs4yjvnHKLapQy3QP+7d7yIqjn4Y4wauAVuYLg
	dWZE2Ci+SZRurE7Qsp+cERNIEyFfA7aFmyBotrIMF3AizyRRlEPc9IbZZhdoCastJznGZUrRMwI
	dabmpmTvMmGfUOcv78VFMtZQuRlizBa4SxV0wxAfdOefBjknOLLlhTbnG6llyF05q5+ibJxw98W
	WsP+u/C1qockKdUN72TF+9sfZS1P1Ra+C1SDg9EXUy4gj96EKCxvr81QacNVJjYw2rHWjDjjBxm
	earVdfmWNE+C2Xwq0BWlLzlGy86+UYY+B38Szj/pSB7vAqpfyU48Bm5dU1dACQYH20KZvZgxC2o
	wvgKn+NBzKX4iTsV/EPB/li04rV/GmIQucpQhRWF7Sr/fqP9wXGPwHhSQJ+bjCZE1TjI4ZvU5ns
	i9jhCWL8/8pKHtbfhgeGYDd7xkpQbpWdE6XhRNz6pm28KwH01pMoKUqYDbYboWW/B1mP7utA6hW
	akfhvucxdbf4fyeKimeHt6t0zVdvPe4NO6zB9b4zrFLwvKfDRYhoTqF4O/8ZRrNyQL+P
X-Received: by 2002:a17:90b:5410:b0:3ab:5832:727d with SMTP id 98e67ed59e1d1-3b0db6e7fa8mr3207259a91.35.1793986623300;
        Fri, 06 Nov 2026 09:37:03 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:64e:8358:c9cb:c17b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0f76ff45fsm983355a91.17.2026.11.06.09.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:37:00 -0800 (PST)
Date: Fri, 6 Nov 2026 09:36:57 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Liu Chao <liuc63@xiaopeng.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Juergen Borleis <jbe@pengutronix.de>, Denis Carikli <denis@eukrea.com>, Lee Jones <lee@kernel.org>, 
	fangxy@xiaopeng.com, linux-input@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] Input: mx25-tcq - clamp the FIFO sample count to the
 buffer size
Message-ID: <au4Pt9K9145wF2r_@google.com>
References: <20261106075127.3105907-1-liuc63@xiaopeng.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106075127.3105907-1-liuc63@xiaopeng.com>

Hi Liu,

On Fri, Nov 06, 2026 at 03:51:27PM +0800, Liu Chao wrote:
> MX25_ADCQ_SR_FDN() reports up to 31 pending samples.  The IRQ thread
> aligns the count down to a multiple of the sample count but never
> bounds it by the size of sample_buf, so a FIFO backlog larger than
> TSC_MAX_SAMPLES overruns the stack buffer.
> 
> Clamp the count before the alignment so that the result stays a
> multiple of sample_count.
> 
> Fixes: 4f7ed234f2a5 ("Input: touchscreen: Add imx25 TCQ driver")
> Cc: stable@vger.kernel.org

This is a platform device, not something that can be randomly connected.
SO barring silicon issues the condition should never happen. I do not
think this makes sense to backport this.

> Signed-off-by: Liu Chao <liuc63@xiaopeng.com>
> ---
>  drivers/input/touchscreen/fsl-imx25-tcq.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/input/touchscreen/fsl-imx25-tcq.c b/drivers/input/touchscreen/fsl-imx25-tcq.c
> index ff270b3b8572..fa8d8b736723 100644
> --- a/drivers/input/touchscreen/fsl-imx25-tcq.c
> +++ b/drivers/input/touchscreen/fsl-imx25-tcq.c
> @@ -319,6 +319,7 @@ static irqreturn_t mx25_tcq_irq_thread(int irq, void *dev_id)
>  	 */
>  	regmap_read(priv->regs, MX25_ADCQ_SR, &stats);
>  	samples = MX25_ADCQ_SR_FDN(stats);
> +	samples = min_t(unsigned int, samples, TSC_MAX_SAMPLES);

Why is it valid to clamp instead of refusing invalid data?

>  	samples -= samples % priv->sample_count;
>  
>  	if (!samples)

Thanks.

-- 
Dmitry
