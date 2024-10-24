Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC74018B477
	for <imx@lists.linux.dev>; Thu, 24 Oct 2024 07:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729756331; cv=none; b=c7/0AU4tqqGqXBuP27fSb/2gHZ8S6uR173Jf5HAvmCwmpPVL2Zcj3As0zGaZbP7KKbd243K8YEB6jEcLrbHcQ3Va+RV8mH7J3+BjzRaduSQy4hho5hOPEDKTj6LyJbV7XkiIcAduC5bZLMcZFPhP1IipIR7jny8wSWQ46AEMuvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729756331; c=relaxed/simple;
	bh=pn1YGm5bTJvzIAVJSwFls+B3zLaFehop00/DygkHELg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qdfk6hRZv9JMbSUxyJUnmShi9K8ZjkW5heJuBqvid6Ze5e3VsC40AYhNyx6JPSVab8pNSk/JlHgI/DnL8tI7qO8+3GrB4HZFpXOXtyi/Kq2Q4P9A7x484y/2IS6TcJZ77+QQ02LBQtSKU+mCIBPeoNZbNhb/zBTUqCUtkYbE/z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNWD6ima; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNWD6ima"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a966de2f4d3so9442366b.2
        for <imx@lists.linux.dev>; Thu, 24 Oct 2024 00:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729756327; x=1730361127; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dfJuRq/b6qwtgMPyTFyvJlc2k8o4i9OgvL9elbu5Hpc=;
        b=aNWD6imaP2rH1bm6MrwjmV6BKB87DuQ88tFMXqVBQ9SgXGwl5DkXwsaFuptJxlTFLQ
         QgafvpObLRornzZFUg0B+W/iWzgkwXwAqpP58ehtwml4qRyJ/uI63m+YOjOLoYTXrsDP
         T/mPRTkrlGQZHGMEO/disK9DftlnPrQJQLyQcUMv1W5BTk0sQdy5gcL5zcbI53qRfeCU
         chH5t2dHReiKq6mhlEjWr4yq/WktQqvby2rUMmnfEsh6VPMrwretzfvVqiZp/TVg/F4k
         8cGzKhb71LEUQW/XotZmDZbC8/tNh2wmBldkNvTE/mijb6znkgdlNJhphlrJk7oZqn6G
         LWPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729756327; x=1730361127;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dfJuRq/b6qwtgMPyTFyvJlc2k8o4i9OgvL9elbu5Hpc=;
        b=qxc7J6l72+eDxjAVCzbxpVWr0dImxXNWGDNxvy4JJQH+oHYkPG0L/UubOcNi3wDgqX
         Hz2oZ/fhSnCQEZ7jvJTIaa3h9GMHf6l004DNwCHfsIttFD7PqSSKHjwRB20vxAl6/GsR
         /qbSwjmxOSyLnzCic03l1pRPf7ty65Ar5hI110zVwEvXWx2HypowObJMVyRdtbehxBFh
         krk53BXoVYFTBTjfrXCOoLsd8GQkunRXhBy5SHZS5T6rjhPq5b9Be44ZTDw4ltuJ73Ij
         p/9LJKDEITvv8ZB5Mjl6Hola/E0BTpcbwZfPJ3gHg9SnAaQAZQyaz6/0ZkeppqhHa4E/
         xldw==
X-Forwarded-Encrypted: i=1; AJvYcCWZXO46Trhs5SNvxIieaER0cdstLxxpVC+ZRAgIz+Yh267BC8KdTJ3ABmG3FWt3q12Kc8E=@lists.linux.dev
X-Gm-Message-State: AOJu0YySHJyVD5Ncl3H7rYbfPHkAPXg5+Lrd6/5TiiCGI9SNgXQacD/6
	omzy4P3ThqupRDP/W6BB4p+9Hyug9L4HSOffFF7PLebUrXKCprLI
X-Google-Smtp-Source: AGHT+IHZkWypryMqz4bOsre9+5N72ivCGvCDfFrtcuQw5at0TLFywfrbAHOiAweigPae4YmGuyaAwg==
X-Received: by 2002:a17:907:7d88:b0:a99:d6e1:6056 with SMTP id a640c23a62f3a-a9abf927d9emr232957066b.10.1729756326879;
        Thu, 24 Oct 2024 00:52:06 -0700 (PDT)
Received: from skbuf ([188.25.134.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912d62efsm575009666b.44.2024.10.24.00.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 00:52:06 -0700 (PDT)
Date: Thu, 24 Oct 2024 10:52:03 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Mark Brown <broonie@kernel.org>,
	William Zhang <william.zhang@broadcom.com>,
	Heiko Stuebner <heiko@sntech.de>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
	Dhruva Gole <d-gole@ti.com>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	"open list:FREESCALE DSPI DRIVER" <linux-spi@vger.kernel.org>,
	"open list:FREESCALE DSPI DRIVER" <imx@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] spi: spi-fsl-dspi: Fix crash when not using GPIO
 chip select
Message-ID: <20241024075203.ifih3rxwyzl7dn4s@skbuf>
References: <20241023203032.1388491-1-Frank.Li@nxp.com>
 <20241023203032.1388491-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023203032.1388491-1-Frank.Li@nxp.com>
 <20241023203032.1388491-1-Frank.Li@nxp.com>

Hi Frank,

On Wed, Oct 23, 2024 at 04:30:32PM -0400, Frank Li wrote:
> Add check for the return value of spi_get_csgpiod() to avoid passing a NULL
> pointer to gpiod_direction_output(), preventing a crash when GPIO chip
> select is not used.
> 
> Fix below crash:
> [    4.251960] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> [    4.260762] Mem abort info:
> [    4.263556]   ESR = 0x0000000096000004
> [    4.267308]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    4.272624]   SET = 0, FnV = 0
> [    4.275681]   EA = 0, S1PTW = 0
> [    4.278822]   FSC = 0x04: level 0 translation fault
> [    4.283704] Data abort info:
> [    4.286583]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> [    4.292074]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [    4.297130]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [    4.302445] [0000000000000000] user address but active_mm is swapper
> [    4.308805] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> [    4.315072] Modules linked in:
> [    4.318124] CPU: 2 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.12.0-rc4-next-20241023-00008-ga20ec42c5fc1 #359
> [    4.328130] Hardware name: LS1046A QDS Board (DT)
> [    4.332832] pstate: 40000005 (nZcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    4.339794] pc : gpiod_direction_output+0x34/0x5c
> [    4.344505] lr : gpiod_direction_output+0x18/0x5c
> [    4.349208] sp : ffff80008003b8f0
> [    4.352517] x29: ffff80008003b8f0 x28: 0000000000000000 x27: ffffc96bcc7e9068
> [    4.359659] x26: ffffc96bcc6e00b0 x25: ffffc96bcc598398 x24: ffff447400132810
> [    4.366800] x23: 0000000000000000 x22: 0000000011e1a300 x21: 0000000000020002
> [    4.373940] x20: 0000000000000000 x19: 0000000000000000 x18: ffffffffffffffff
> [    4.381081] x17: ffff44740016e600 x16: 0000000500000003 x15: 0000000000000007
> [    4.388221] x14: 0000000000989680 x13: 0000000000020000 x12: 000000000000001e
> [    4.395362] x11: 0044b82fa09b5a53 x10: 0000000000000019 x9 : 0000000000000008
> [    4.402502] x8 : 0000000000000002 x7 : 0000000000000007 x6 : 0000000000000000
> [    4.409641] x5 : 0000000000000200 x4 : 0000000002000000 x3 : 0000000000000000
> [    4.416781] x2 : 0000000000022202 x1 : 0000000000000000 x0 : 0000000000000000
> [    4.423921] Call trace:
> [    4.426362]  gpiod_direction_output+0x34/0x5c (P)
> [    4.431067]  gpiod_direction_output+0x18/0x5c (L)
> [    4.435771]  dspi_setup+0x220/0x334
> 
> Fixes: 9e264f3f85a5 ("spi: Replace all spi->chip_select and spi->cs_gpiod references with function call")
> Cc: stable@vger.kernel.org
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

Sadly I do not reproduce this NULL pointer dereference. I also know from
hearsay that the GPIO consumer API is more or less NULL-tolerant. Could
you "make drivers/gpio/gpiolib.lst" and see what's at offsets 0x18 and
0x34 into gpiod_direction_output()? The first thing in that function is
the VALIDATE_DESC() macro, which does:

static int validate_desc(const struct gpio_desc *desc, const char *func)
{
	if (!desc)
		return 0;

	if (IS_ERR(desc)) {
		pr_warn("%s: invalid GPIO (errorpointer)\n", func);
		return PTR_ERR(desc);
	}

	return 1;
}

#define VALIDATE_DESC(desc) do { \
	int __valid = validate_desc(desc, __func__); \
	if (__valid <= 0) \
		return __valid; \
	} while (0)
