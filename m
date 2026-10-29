Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793294415;
	b=WpJSO7nLPizjWJRlrHVchMKyD5DqijFmhH0ugEXWsN1BYOWbLnDwlB8npbR+KKCtPQ+w
	 Pq8iKXCNar0jtQ0M6v6eJWeLp2Roc+ygPfE6wxc7XHBJqq8Fm02tOCUbMOxBdPEcrODkT
	 7b7Kv659f1yFQEVvmokD0uRSIScgmkxQ0RodZlHEmU6lzmfvuxim0Clnubmql/nNiZBiR
	 JMEAhWy7yvHJ/5s5OjK4osxydx0ZFeeDlUQA/Gsln4zjOx9eZNMI30+koCB96GchJKbLU
	 OG1QWm6Xtv7xSOFizrUuaLECZJ3FQC2gaj8HGAz1s8hI9nhKsK3/al2pvipJxJ0CYng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793294415;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DcHId9d7ZivTlUPflcKuYmygXozfLhAN5Qcceh+SBys=;
	b=Hn2SZf4/nwTZ1T4oYTdEjEbZrj/ZXjxn2686STbmOLxb5aWbXfdMTVUzxJQWYnaWSpCK
	 3hKOubAHQMdk63qUe5xrShESTGWxaeAvI/JDzusobZ8arACuLctJ3IQ7n6dF8djRah9xM
	 XgxnaZ5Zb+dA7bPwksdPww7/BvvAzgHrBLgbFLIFG3iT+RwZbSufrrpPoNGrxzOwd0ZVd
	 QLfStiMDpg+KPmTU2YaA4HETNbFtC8CZaYCeUVLOqlDDN/VWTloz/dVU60tg8DeB2ep2h
	 uV2f+jCx5h11sxhsHxkfTfg60H4ubBmptByFVq9tzWMWmv1FAuGsy/B+7FSLvxGLNdA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="bC/zW/JQ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F57A606A320
	for <imx@lists.linux.dev>; Thu, 29 Oct 2026 17:20:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F57A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bC/zW/JQ
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso4078467a12.0
        for <imx@lists.linux.dev>; Thu, 29 Oct 2026 10:20:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793294413; cv=none;
        d=google.com; s=arc-20260327;
        b=mwBXpBWZU5dMDAj9E9W/wiwDHJcKPYJ5bwnIQhP5gILfoNZ+OX2l94xSHcQu3i1aYz
         y9GEnjb7dfm26BDUmu2fb0PW0BH2FkRvzO9z1X+RfYVG2n3kWr4+3ObXiVCXpEQr1pP0
         YcD7fzO/dHUuJmtXcRoC+R0n77UczGTiYOzTul2/gGGMe9Pt437sAgHIdaPjfM0StNhP
         Tx7LxmhG+yzCrmLOsdssPloQodr/W4W708HPU2T87WF2aQ74I7AkrKs38poagBxp8udZ
         4cb26f7Pd+cB7ORmALnyQOVWqTO69//FF/C+LjjGJb5Mc0LmZZ9Xw08MvQ+/JBz85HT2
         Z/Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DcHId9d7ZivTlUPflcKuYmygXozfLhAN5Qcceh+SBys=;
        fh=UyEGf2/sroUab4volkaU8vA5kqKavYYMSWFjTEMK4tQ=;
        b=gIrM7Ph9BjaDE6sKoEMKbv0UR84wsxoXflOt1wCG5n2PAL2XNCSTKvJNa4bvdHKu6s
         0j2c7NhDyQ8KC4ZueGRFY4FpZQeXgXGCOXYSLW7cOrXlS7JVqtxyT+aTjFx33tv+orMd
         onUecw21HVZhrTSxyrPFcNiN7S/Zr1zxLra9rcmRdnH12hGL+p41rvtvSbIXye2ltWC7
         UiXJdFoyu/Y390tlfcfhai0skMZ7Fkcgv+7G+nqIZT/Y8T8fI85wqKRgZAgUY871G6yF
         tRrY8BOOisVW3l53MiYxwFS931f6876kBhbzgNQH1uFnLlpCS0ps4X2ME9h91FjzMQdC
         aWxg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793294413; x=1793899213; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DcHId9d7ZivTlUPflcKuYmygXozfLhAN5Qcceh+SBys=;
        b=bC/zW/JQcatRdEDWji93sqolKxGZ4Q2v8K6OP9kQ9nTdytJXTxAz87ETTZpmx+38ms
         NYCZ+hSb0IojeGXz6u4ciJA1ek8+wg4wR4+YzCXY7k5Vif25TIY4qhCVaXeAXzvKmAMF
         wCO3FFRPdXIKBad8HmyCokz5hS2ZxmfkOYTi+Ryj5zAzUQ13zjJTBQB0zRGzbGONe0FH
         pt6hk5U17Q7rys95+1ZzWXJl88LfoNigSVWGBXSXNzjOHCubr24q8gZmhIyUMAJ51Cz2
         Vek6comw1NTX7CBkeelV9Wjo0T40GFQOD/fh7xVBniDWEC9/MTwC4pjmY2OCsTPEiu0c
         YheQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793294413; x=1793899213;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DcHId9d7ZivTlUPflcKuYmygXozfLhAN5Qcceh+SBys=;
        b=uLMZpJNBhYhk2jqwPvt0/rpAl+nKLQ8hnmhOqUOccUmenh1CCrF8/RnpckeeIrxq0k
         9hHufasN3fTbwM1cskUBXOEd9gxSUj7R4aQHLoQ6ZGpkogCrPC6XznMfySbvcTNbyzYl
         lCSaZMbxro9jHgeB1mU1TOoedr8JnXi5kq/RIZRt9n8pxbmbLnFkemn7oqLXPB7f+g3W
         6uielof99Bi8b57fHAc8Lf9+4QyNJGbYrv2aJK4YDpYqZWMoNUyfFpG1w+wBD2RgyqPT
         zlk00zW7+NnjhSizOkpdquXoX3GRlOgaPNBQ0RX3ZS8EXwZxVmMFaTme9XhrFc3PXbis
         7Tyw==
X-Forwarded-Encrypted: i=1; AKwUvByaXtf1s4yIKC20ccl0ZEme1cIJ7Qry98yyiXyIyM3Uc+Q8sw5uCQxfbfzByPak9UbgPyc=@lists.linux.dev
X-Gm-Message-State: AFq9FYL7y0yhs/3g3DRXy9l4KWORzyGxlt9ozI8ulD4Zu07dnLAX/lB8
	6jJg6G0XQj3OwyDxONhOaMwZC/Z55dqYuNJP49gRjy5VU+ycZRrYN83avhb+mrHl+4IfzD8/puH
	xzAdDdKB8Is0D3JmqYsps/79vaUrtuxk=
X-Gm-Gg: AYBFou2RQTI+8HkY1mfcHvp1JXDgliN++G7Z8kJbVMc1gqQnSsOwxJAjIIC4SqxC8sa
	RFRCeX5vgzZXiq4Nl1UZHahQVMMFTyO4/dVQ7BTO1jZYu+REh2mPqbKPBRoAbdk0grYibSQd/5w
	/QOHlBwz01IgiQ1j0yox5reKYE22Y93wv3qYRckvlE7anQyS9ymNbgQcAWvA32ivigY6I1RP4i8
	0/9Hn9wP3FEjjQuSYcnyYLFe2elIocysKgUSgvECH6tbuqnt6eMAViWK/oxuclaZkOCBWDux96N
	1aQ1Aik2xm3Hu6kmt0XAeMNI44W6Pcxt7mZdE/XJ3bkRb4uKN7QG+KqaHlGBziABgiAcskL8rSr
	Toe+ljCV1D+HouaySUQD13vRAxavxt2/0s8u2IwMHZYR7+C2S+ffbBk4yMuZ2Ye6fidWiPTj4Wx
	8yK5gencHBuYVRrWzaNeSNwy4Q7YAlA3S6C5SZ6NjpETZAgtyZHt2+sg/xYuY8xlOOrNomDJHAB
	VrhxaoZbdL74WBEr6AqNnLzO7EQsQ==
X-Received: by 2002:aa7:c1d1:0:b0:6b4:201f:17db with SMTP id
 4fb4d7f45d1cf-6b49cbdfd84mr3081067a12.18.1793294412721; Thu, 29 Oct 2026
 10:20:12 -0700 (PDT)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com>
 <20261029-submit-serial-8250-dma-cancel-v1-v8-6-3fd56ba352ed@gmail.com> <auNW_Oc-Ao5Iw-Gw@ashevche-desk.local>
In-Reply-To: <auNW_Oc-Ao5Iw-Gw@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 11:19:59 -0600
X-Gm-Features: AclHuK-0pW6JI4DxQzs96I_p0R94o9xpuy7K0elsSNWPWKpDy78P7tTWYrgR_Gg
Message-ID: <CADvTj4pOg4w5LpFW_E3qzP7FZDnDgpB8LyR9xxhT_mZre21vFw@mail.gmail.com>
Subject: Re: [PATCH v8 6/6] serial: 8250: retain DMA resources when
 termination fails
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Raul E Rangel <rrangel@chromium.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Tony Lindgren <tony@atomide.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Richard Genoud <richard.genoud@bootlin.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	=?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Timur Tabi <timur@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 8:24=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Oct 29, 2026 at 01:37:02AM -0600, James Hilliard wrote:
> > serial8250_release_dma() ignores the return from dmaengine_terminate_sy=
nc()
> > before freeing the coherent RX buffer, unmapping the TX FIFO and releas=
ing
> > the channels. If the provider fails to stop a channel, the DMAengine
> > wrapper returns the error without synchronizing its callbacks. Hardware
> > or a detached callback can then access the released storage and state.
> >
> > Checking the error and returning early would not preserve their lifetim=
e:
> > serial core frees the TX FIFO after the driver's shutdown callback retu=
rns,
> > and port removal can then release the callback context as well.
> >
> > Require successful synchronous termination of both channels before
> > releasing any DMA resources. Retry failed channels after a sleep outsid=
e
> > the port lock, leaving channels that have already stopped and drained
> > alone. Keep the shutdown gate and storage reservation in place througho=
ut
> > the retries.
> >
> > A permanently failed DMA engine blocks close or removal. This deliberat=
ely
> > retains the buffers, mappings, channels and callback context until the
> > provider can establish that they are no longer in use.
>
> ...
>
> > +     while (rx_ret || tx_ret) {
> > +             dev_err_ratelimited(p->port.dev,
> > +                                 "DMA termination failed: RX %d, TX %d=
; retrying\n",
> > +                                 rx_ret, tx_ret);
>
> > +             msleep(100);
>
> Huh?!
>
> > +             if (rx_ret)
> > +                     rx_ret =3D dmaengine_terminate_sync(dma->rxchan);
> > +             if (tx_ret)
> > +                     tx_ret =3D dmaengine_terminate_sync(dma->txchan);
> > +     }
>
> This is unacceptable. Sleeping is okay, but value should really match the
> baudspeed and other parameters of the transfer.

This sleep is backoff after dmaengine_terminate_sync() has returned
an error, rather than an estimate of UART transmission time. Each
retry asks the provider to stop the channel again; elapsed time is
never treated as evidence that the resources are safe to free.

The particular 100 ms interval has no hardware-derived justification.
However, I don't yet see a sound way to derive the retry cadence from
baud rate either. RX can be waiting for input, TX can be held by flow
control, and callback retirement is a separate requirement from
moving bytes through the UART.

Do you have a particular provider failure mode in mind where retrying
termination should follow the serial transfer timing? I'd like to
base the interval on the condition that can make termination succeed,
rather than substitute a wire-time estimate for an arbitrary delay.

Regardless of the retry interval, shutdown cannot release the buffers
until the provider establishes that DMA and its callbacks have stopped.

>
> --
> With Best Regards,
> Andy Shevchenko
>
>
