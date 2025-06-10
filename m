Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82A12110
	for <imx@lists.linux.dev>; Tue, 10 Jun 2025 03:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749526577; cv=none; b=Kn01e6K2wypD8oF4La0Fn0eubrU6dRTwM60TBBQ2sdzKUNNeX1pnM0AeyYHQbBD7X0l4kpnktQkQQvsupO7ruOhzjzB+cmYjtiDHsGj+RmostZeqGAywek8dCWFvb7s0ikeM+xXFgaQ7a043PR4Pb8mxpHlLGBb0wyEFCEH/nnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749526577; c=relaxed/simple;
	bh=avO+mpvfE5wXQHQ2LrbvaocbDPERuQtijditQmDk+9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TSRlHxq1yhKuciRn+uaky2ynBgFm07BDvN0rCttiILiSeXShz4IzPYpTjPrRSm32zKpXWZNa5/NRBPOJnVnbnq/u2lddSo7usUf/+Kkl7SV7cUVUzQL25MS8qdov56qihHFCE4wLQQnX05VS/xZKfwsXKQVU43orlUHoCiK9ebc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=T3fXJE10; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="T3fXJE10"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=bPCNvaiweglADLcDUZiaSHWSdRXaEgPafPmAEsUXP6w=;
	b=T3fXJE10vejU41LKzdrPWuTUns6SjQOmeRrEvrVLgaqIwiKIYITKGz/9ph0Ai+
	SwFdd1vMNo9CS4O2Jq9oe8fBNWttECuh9a+YO4tbkdX4bg57EX6TFJ56d226VDgV
	4mkiQTOFF04SAc0BgQ1L6ZmDAy4Ha0+YNtT/7t2DEVSM8=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3HzjXoEdoKoVPAA--.46618S3;
	Tue, 10 Jun 2025 11:04:56 +0800 (CST)
Date: Tue, 10 Jun 2025 11:04:54 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: John Ernberg <john.ernberg@actia.se>
Cc: Xu Yang <xu.yang_2@nxp.com>, Peter Chen <peter.chen@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: i.MX kernel hangup caused by chipidea USB gadget driver
Message-ID: <aEeg1s9A0F8x0U2+@dragon>
References: <aEZxmlHmjeWcXiF3@dragon>
 <c56pgxmfscg6tpqxjayu4mvxc2g5kgmfitpvp36lxulpq4jxmg@ces5l7ofab6s>
 <aEbstxkQmji4tfjf@w447anl.localdomain>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEbstxkQmji4tfjf@w447anl.localdomain>
X-CM-TRANSID:M88vCgD3HzjXoEdoKoVPAA--.46618S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxJr4kZr1xtFyDJr4DZw1DJrb_yoW8XFyrpF
	4fCr17AFsYqa4UJr1qqrsxuryrJa1kJrW8KFy2939YqrWa9w45Kr1UX3s5WF9rKry7W3W8
	tFs8Jw1UC3WxCF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UjYL9UUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBhoZWhHgimwwAAAsl

Hi John,

On Mon, Jun 09, 2025 at 02:17:30PM +0000, John Ernberg wrote:

<snip>

> We probably ran into the same problem trying to bring onboard 6.12, going
> from 6.1, on iMX8QXP. I managed to trace the hang to EP priming through a
> combination of debug tracing and BUG_ON experiments. See if it starts
> splatin with the below change.
> 
> ----------------->8------------------
> 
> From 092599ab6f9e20412a7ca1eb118dd2be80cd18ff Mon Sep 17 00:00:00 2001
> From: John Ernberg <john.ernberg@actia.se>
> Date: Mon, 5 May 2025 09:09:01 +0200
> Subject: [PATCH] USB: ci: gadget: Panic if priming when gadget off
> 
> ---
>  drivers/usb/chipidea/udc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index 2fea263a5e30..544aa4fa2d1d 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -203,8 +203,10 @@ static int hw_ep_prime(struct ci_hdrc *ci, int num, int dir, int is_ctrl)
>  
>     hw_write(ci, OP_ENDPTPRIME, ~0, BIT(n));
>  
> -   while (hw_read(ci, OP_ENDPTPRIME, BIT(n)))
> +   while (hw_read(ci, OP_ENDPTPRIME, BIT(n))) {
>         cpu_relax();
> +       BUG_ON(dir == TX && !hw_read(ci, OP_ENDPTCTRL + num, ENDPTCTRL_TXE));
> +   }
>     if (is_ctrl && dir == RX && hw_read(ci, OP_ENDPTSETUPSTAT, BIT(num)))
>         return -EAGAIN;
>  
> ----------------->8------------------

Hmm, I just tested the change on i.MX8MM but didn't see the splatting.
Maybe we are running into a slightly different problems?

Shawn

