Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE454FDE69
	for <imx@lists.linux.dev>; Fri, 16 Oct 2026 16:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792167417; cv=none; b=UIvNpMz2CvzSa0J7Pk2Pz1vcSepX1GOP5iuiO2GnphD0EnxTfnxDzG4wMJZM9ezmGRiiwum1818vzGCR+h7jbiOe7WjxGYhnIs8JNDLe6hR5a64H5CkhYAnmr/2bLCWBFPBz2/kSuun/ml3F1MbyS6ryb/P1vWuiJPLwNmhZGOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792167417; c=relaxed/simple;
	bh=mQDmWQYO3ZoFImkk166fHrJ4M/bc+UFOiE7tflbCqAk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=R13sqmZP5CnhwDAnd2j2PXjGYkyYuaAsDR8YD8AdSq9bZnVDPAddG6x4RX0c/lRtvwhQNNqfTMSHrQBJ/lSXNy7VScC2H+cghvaO4Is54foTs30SDe8tk9YVlnQEjf8/o0msXNb4JbmWB5C93lB1oO5i8vNwz0DOCfncqCbhYhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=iwuG1Inx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dnAiEPQ4; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="iwuG1Inx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dnAiEPQ4"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B97581400062
	for <imx@lists.linux.dev>; Fri, 16 Oct 2026 12:16:49 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 16 Oct 2026 12:16:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792167405;
	 x=1792253805; bh=rzDIQw6h4NECMqKciLXPkVXDGpsarl8SfpMM/RlbL/M=; b=
	iwuG1InxKakBgP7fRT9+0Q7WQtZLLw5iRywDPeL3AI6awnAVB8y2DjrGDeZJIe7n
	zNqFWdu0ZKqWJF401Iaf+lktSsGTdnE9zl6KvyOvmrkfyiITePNlVzuwyACqH0ZK
	2NUpkgq7HnqBKYngjVyF1xKZGxsIUhbg43WblU2uq8gNOb8XA5RvYt462k0ZFFsP
	XLrR3E/uqQ+/J7Wanv5YYsIXXjfjYz2lRiltjsyu/LWB0dslqMJlv5RN9BdwWrhQ
	JLRyXX8thZLmnHOLZOjximvVhE/Hz/gXozrzNkgOVq1nAqDifo4h9TWS6gPD1E3I
	tvdnsYM9iugj2uxQyJou2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792167405; x=
	1792253805; bh=rzDIQw6h4NECMqKciLXPkVXDGpsarl8SfpMM/RlbL/M=; b=d
	nAiEPQ4CkKI0vgyPOchYaua3hqJ8nDWf245kIRRU+08vE0LtLqKhWkIceOHzokHE
	O0vQk6pvNQk5FLW+wbtl4jq8CfBFoxs5a4TpO1OclLY7zzjq2zpRUkaPfabx5At3
	g2yD7V747dTSkOv0lM0+tUoVrOr7TdCjbVjnxcKn7SLVDuriN7bblFgPkktEuLpM
	e1CTJnSmr8dTo/c4XBUDDYlkRYQq+wNE+xWIXR4yoPZ6NquEN16DyaelA4BXwre2
	IvuXqyg7kaU5/w0HOof4Mu1nXSDKaO/5tsj3ptfZO0SnmHRmVog3ydMIVGoYFcYl
	iboh0PYMlUGibBb8p2myg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792167405; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+; rt=PGlteEBsaXN0cy5saW51eC5kZXY+;
	s=fm1:rsa-sha256:mSQdDfH5FcaEZKYVn34RMqcIH09DS9Rkzu2lT0KlBdSFTpI
	zLckRM5XPGe7Si4RaLthdkPJpQqIcLFwMYiqsrgCGT2JMq5sWNEwhuM7WLF7SJnw
	NZFA78x6s9T7lqiPqHfrWZOT2NJ90gpD4/efcV5rzxr13FGsu8+4ec+3ypZXf5jw
	viX06a5IMzU7GVuzh2SoJEUK2Nv/nWqNTZjnX+vkWyifk/RUui1d7PQ7tRTWukJw
	y/xSJ65H0HRZp179BJiXLwINbXNX7Bbqvz/zwGPjziWCYFwjjkhnCcRvXK3IFyXl
	B1EPby8i/bpQu01Vl+aJEpWZ6Gzp/eu+ccEZsew==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:EW6Ujl8vplrbtqeoPFBe3RxPQq6XEhz/1LxpfCwfpFM=:mQDmWQYO3ZoFImkk166fHrJ4M/bc+UFOiE7tflbCqAk=;
X-ME-Sender: <xms:6E3SahguXvk6dkK1xeuK3evpD1w4LOi8HhTK8pZZCo7WlSXJorUL4g>
    <xme:6E3Sag0EMvRrM5bdfI6PCjxjLftrZ-enR70xOnfwhsvd9ret_0qhPyTiviYa_vTWV
    1TPg40vVmgq-ZYBpqtGPfnhlOkfp_XVNzqHBgygYyjcqRprXhHhP9iU>
X-ME-Proxy-Cause: dmFkZTFmYhpPEy0XQM040EQO/1o4r3h5nElx6hPDkkJqVhUiVqgTg8tNbP8FEYoNbTUm50
    c30Ur18QKQ4DS4kne48uGyWifm5vqa+/ec/+SWtL/G0QYzMQxG2No5lRGMvNha7tzDsh0Z
    6ZG5a1k9KRFNykIGO8DnwChNJgiRyVCyWZHUIjn/kc8CPCqTFYE9fNNyPHTgQKe6cy+ESy
    H6D8oxOWB6QYRRVMYz8414tP2JUjjUug6ehKrBMxdckvAM1uLs4BLSDdaoEr9NOTYZJn5o
    K3Zn41lItAk19HwTUAXClwsXqjGseMTOGd+wh21TmcUxoXgHSFphkA0+RjnmKV6qudAgdM
    FtDZO9pPZz2yNTK5jrrsju3XuQ7dYc8BAssPIEcveiyNlWWP0QEJixfx3d1imeU3v8MCLu
    bllw2C1LO9bMKGMbl3NB8d96Gfw2sPhzltGhuCJ2ZS/x6SWn4EV3b0/RrfgjSq7y+8Udt/
    cEo52dB9A/zCJRv4Msg7jkygZv7oqEUyU8Sm8EpM1LxCv6jkv2TrIUS0sKaUyVUePX8ndf
    xKTeLrCw1UWFRyYy/jSiXM5fKixH4Io8oFLDO98kvVtwyX2XwkJ+F/iSJwOBJrFhgHKQ5f
    84oxo+8p7QJNdR3G5kkx5w0zCFt4c3pnTAs+upii5jvkmHJqE+tjm8PzGgRw
X-ME-Proxy: <xmx:6k3SajaMcfB3Da9PhWdZeVi5ag4KQTM6km6hjykoIWlDb7ongvr_XQ>
    <xmx:6k3SaqgIGKXj24d5Kh7y1m_b2C5ATJnOUJkGABH-sKntBy8t0vkymA>
    <xmx:6k3Salete1cOUkilfaVdvF3q5FyocWfvfqdjF5ObTgaqSXgyVa1_-Q>
    <xmx:6k3Sapl2A-77lnjTZkJpameYe9Xux_geBqS5sEZ3w1WsrAcgSKS66w>
    <xmx:7U3SaisGIF59RdD2tFM43Fo6cEMw7PJyTYEzn-bAey5cyH89MRt80Wsm>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id A23BB32A008E; Fri, 16 Oct 2026 12:16:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: A4WN0AQLOakc
Date: Fri, 16 Oct 2026 18:16:20 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Hugo Villeneuve" <hugo@hugovil.com>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jiri Slaby" <jirislaby@kernel.org>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 "Hugo Villeneuve" <hvilleneuve@dimonoff.com>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev
Message-Id: <5743b352-ffa2-4d38-9abb-a06085dea56d@app.fastmail.com>
In-Reply-To: <20261016115604.a89ef44986bb3620c327feaf@hugovil.com>
References: <20261016130328.1037616-1-arnd@kernel.org>
 <20261016115604.a89ef44986bb3620c327feaf@hugovil.com>
Subject: Re: [PATCH 1/2] tty: serial: remove hub6 multiport support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Oct 16, 2026, at 17:56, Hugo Villeneuve wrote:
> On Fri, 16 Oct 2026 14:59:47 +0200

>>  	retinfo->custom_divisor  = uport->custom_divisor;
>> -	retinfo->hub6	    = uport->hub6;
>> +	retinfo->hub6		 = 0;
>
> Would a comment here help?
>
> 	retinfo->hub6		 = 0; /* No longer supported */

Good idea, added.

>> @@ -924,7 +921,6 @@ static int uart_set_info(struct tty_struct *tty, struct tty_port *port,
>>  	change_port = !(uport->flags & UPF_FIXED_PORT)
>>  		&& (new_port != uport->iobase ||
>>  		    (unsigned long)new_info->iomem_base != uport->mapbase ||
>> -		    new_info->hub6 != uport->hub6 ||
>
> Maybe keep this so that change_port is true if someone sets hub6 to a
> value other than zero (see below)?

Right, this would be fairly harmless as nothing looks at the field
afterwards but it makes sense for consistency.

I've moved the hub6 check up before change_port now to behave the
same way for regular users and root:

@@ -935,6 +935,11 @@ static int uart_set_info(struct tty_struct *tty, struct tty_port *port,
                if (uartclk == 0)
                        return -EINVAL;
        }
+
+       /* hub6 is no longer supported */
+       if (new_info->hub6 != 0)
+               return -EINVAL;
+
        if (!capable(CAP_SYS_ADMIN)) {
                if (change_irq || change_port ||
                    (new_info->baud_base != uport->uartclk / 16) ||
@@ -950,10 +955,6 @@ static int uart_set_info(struct tty_struct *tty, struct tty_port *port,
                goto check_and_exit;
        }
 
-       /* hub6 is no longer supported */
-       if (new_info->hub6 != 0)
-               return -EINVAL;
-
        if (change_irq || change_port) {
                retval = security_locked_down(LOCKDOWN_TIOCSSERIAL);
                if (retval)

Thanks for taking a look!

     Arnd
