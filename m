Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43AE4D8DB5
	for <imx@lists.linux.dev>; Tue,  8 Sep 2026 10:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788862439; cv=pass; b=g2xOze3SsAAfjirVA9ctwL2NQsv0SAm0sbQOmcJRhUsf7Noef8Tiw+dWawryzAdIZ9N1BKcs0nIp4iKkRZfT3qX68EJ1/rRhHKbXZSt57DB6Vhy+APRdkOCtuVUwYwE93MW20Rmjb33mRp7fFnL5y2S0v0taRUxnxm6mS29LToE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788862439; c=relaxed/simple;
	bh=kWGLXFyPHplqccz5poLz3IbI50NU/JwnfhfqrKLhw3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pe9+d3J3qi7oJN8PxaeUNrT8owtZs3q6ZARs6RPHGz/u/kPO3kzhcuxAVdEgPPTjgOdU34xdFu9EvG3gj1YS+hruV3wKq5a/8Q4ZfZEXvaZR5sVu6FUluLnyzhhIjfgftPacF8bS2ke/cMrfDg5TcRnbZpuAWwkmBv7ZlGbewzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J6QCztF+; arc=pass smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J6QCztF+"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84eb992a881so3043758b3a.2
        for <imx@lists.linux.dev>; Tue, 08 Sep 2026 03:13:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788862437; cv=none;
        d=google.com; s=arc-20260327;
        b=gQPXWGbGM1X/nvyjgpCYxWvBqpUMgu3FKuEepiDD11dEbYSMaJd3BIUL04Wr95k/Uo
         UOWcGJbLTQNBsDEtK37SoveYxc4tJL0vkWalAcuK3N1FdvWUQdWk0GU4Pm72LqgkEmRP
         NCKI7xOcP16L3S3VhJhoUYz8QcCF47OgfC6BOlZsM4KlWGV7lObvX/yxxCIXiBpvq+FB
         mL2Iw4KTPphTL/rf9aysFR9q4q7TH+4r1QYb239ax0YKOC29p/Hk5IGQduU2R0biWyVL
         EIXO6ZFhNdZ5aqGMUGycPsa4v+UdJVMhWCe8+RKaeYK90904tytB6t1deUtyHHDxQm50
         NsMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oLrwfLp8ACywcK6OZDMAVfDPAmy/xkA/7NJ1Wh6BTDY=;
        fh=BmDP4736zjNYu8HxOICp9zAqQzs0ORG98s1NxKAf+U4=;
        b=a9Z0bkx3bTo8liZKKG7uikfftCinFKffLIz3iKtsfSjmP8PfsJKGro1okcCZAXlgsM
         EzN6/DxmwZVdZ0BCAmkcsPicskpy5JNSAm7YsZJGR9bDYGfKQzjFwg//4BFAQ1rsa+NU
         DSWRnyvMV2FHj28xmeW4rvbmMIgSYBP1wd7ZgurR8VF8yMIgvO2okLmzZvMizxiMuREM
         1OKXnL6lmugCJ3zjgn+mwGl35VvE3JdfcTuy4pR1Ql4q3GeLVQ+lOmVMu+JDRbglWY+7
         ut2uSatRFpMJefez6T0HVyzsH1yzdxPGbeGT9kmscpwbDBQiLu7Xn1Lid/2RUldZM6Cq
         Be4w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788862437; x=1789467237; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLrwfLp8ACywcK6OZDMAVfDPAmy/xkA/7NJ1Wh6BTDY=;
        b=J6QCztF+V/xYeHdwQB7kIODp2YZbGO8JmCgUBkPoayzCEuCujXZYmMznYCDZBhHGZu
         YFirjdF82r6GnILLK29141js2zEzWyrVusBEcxZ7M8VtrUqt9un1NQzdDgq182MM8ZAy
         ap3xrJMIpm7Ahg4PB5q/ZETEDuiHzPoMIQlcqEUynM25hS8VB/DOYoMpeysaaPDUKuHu
         qOxqfRcIAIWlRnhoUuNkAxlSUdHuNukAaTlUVA6GbRUrL+jKrrZefR3Xm+OWHimQIsVq
         HcLFXXCLwnOzp+4eidMBsrLuxW9zquXLfSP4H8YyN8oObWUGSgkeifVt//rMCx5D7bxG
         W+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788862437; x=1789467237;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oLrwfLp8ACywcK6OZDMAVfDPAmy/xkA/7NJ1Wh6BTDY=;
        b=sEUhd4zbOkB39xiWMiBtzQMHOJ473yMFXwsC2P1gLmd7M8vbDaaMgw/EywHwd9ioIm
         enL6x7D+1VGr+qmiqJdeiUj1+wu+4HgzDBL+t2l0xIXoL0VPzbglZlqfbOv1m6t0WyON
         n2P7OG5Zm6IlJ3sM1ZBjqRCCxz8FJ32XqVPmc3mn221IzQp2W3bps20UFSYUq70NJ5Ki
         14wm+kBMIxefxYfpFB4b/X26sTVnlhp9gncV8d+q3hqFaQVzv8dH5soWOjY0nNHFaYEl
         D9LBiu661blzBqnzvxkmCi+My5M2kKalPipJdGfNxjmMzsq9k5XPmA2SLs8ZtX/Oznwd
         q8vw==
X-Forwarded-Encrypted: i=1; AKwUvBzQgDGDLKlUUyx+CvHQmaEWKlk5KvLffYHW5esJaQ1OrTqL1jgEjngHFrfkSDuSXV+aI0Q=@lists.linux.dev
X-Gm-Message-State: AFuF++ndqkpw3MNt9z5quqnngVtwkgzZ+prOAZpP0hUKAK2uomWHduAh
	XxbWuzSZPBc4ytUSpk45RC3hdcgbacutCPzrg9KJIrPoEJggXRd5WeLAYhLjOcICslF5VRNjTKq
	HL+WxKBtPRSz+4MPu9dcZkAx8Yy2gAlU=
X-Gm-Gg: AYBFou1lpiS6nnV31DWk7mxtzIx5MXyrqeUoEA6CepwNfdz5PrIQ7IfStAVbhqqArdF
	CwpuVXr33ZQvwh1gSssXFR40uqs8DVYYNWZhKDuAQfwKqO32Vj23dOK7gYX4C+qGOvh0RA8G0Tn
	36l6yEIJWCw7BNU5tACYu7tYdIcu1KI9hoSnkAe/ke4o8l/Gy3brYsvG6DuMT/0+e5SGJxDQr8L
	XblTwX+5nSzhGAqPXoGm0EB03h4CVve8pYmo78w0dCKqtwO8Y2M8sr1alfReEDfYvVEbP8ZE8u4
	vQ2RlFgSxmFyTOfNFHvwuer9rzhtFC1yCMN98lfwN9fLfpUTxUUmZ4QqJR4aotLJoRcUm6nabFN
	5r0d1olykEiuOSuE6Qv8GhF4cdVjzdtob9X32VIA3PAZFuZlRgL1otSiG6c3nhXsTxQk=
X-Received: by 2002:a05:6a21:b97:b0:3da:15a9:a18e with SMTP id
 adf61e73a8af0-3da3a0cc429mr41624097637.23.1788862437122; Tue, 08 Sep 2026
 03:13:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908-fec-ptp-pps-event-uaf-v2-0-2a1d57121ade@cherr.cc> <20260908-fec-ptp-pps-event-uaf-v2-2-2a1d57121ade@cherr.cc>
In-Reply-To: <20260908-fec-ptp-pps-event-uaf-v2-2-2a1d57121ade@cherr.cc>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 8 Sep 2026 17:13:45 +0700
X-Gm-Features: AcwNN1VMBv-YMtUDD27KP8tWOFfyKDv8HAQFtZgWktZVu5_za_i0rbJmn6ycjPA
Message-ID: <CAABR9nG49YgFejWRAkJrCcXF8p03A=HwWhbetmoHSjk_L3h9Gg@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] net: fec: free the PPS interrupt before
 tearing down the PHC and netdev
To: Shengzhuo Wei <me@cherr.cc>
Cc: Wei Fang <wei.fang@nxp.com>, Frank Li <frank.li@nxp.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Richard Cochran <richardcochran@gmail.com>, Troy Kisky <troy.kisky@boundarydevices.com>, 
	Fugang Duan <fugang.duan@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Simon Horman <horms@kernel.org>, imx@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> @@ -861,6 +865,12 @@ void fec_ptp_stop(struct platform_device *pdev)
>
>         cancel_delayed_work_sync(&fep->time_keep);
>         hrtimer_cancel(&fep->perout_timer);
> +
> +       if (fep->pps_irq >= 0) {
> +               devm_free_irq(&pdev->dev, fep->pps_irq, ndev);
> +               fep->pps_irq = -1;
> +       }
> +

I noticed that fec_ptp_stop(pdev) is called only from the failed_init
error path in fec_probe():

failed_init:
fec_ptp_stop(pdev);
failed_reset:
...
failed_ioremap:
free_netdev(ndev);

There are several other error paths below failed_init that eventually
reach free_netdev(ndev) without calling fec_ptp_stop().

Since fec_ptp_stop() is currently responsible for calling
devm_free_irq(&pdev->dev, fep->pps_irq, ndev),
could this result in a use-after-free if the PPS IRQ has already been
registered and one of these lower error paths is taken?

Would it make more sense to handle the PPS IRQ cleanup separately on
these error paths, or,
use a devm-based approach so that the IRQ lifetime is managed automatically?
