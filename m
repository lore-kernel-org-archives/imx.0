Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEEB3DDAFC
	for <imx@lists.linux.dev>; Thu, 30 Jul 2026 10:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785407361; cv=none; b=UDd8kLFCRUcWNlYKfu3JU1Rtv2H91yZKiifO9A8dKDMwRmiwVoFUndhlVz8ulPJvjeRD3PnCLMdXYXGVeJ1MY+4235egMdhbyZZwdddRQ74pQmN/ECx4aeHy/3neLQR/iQXNXHL+1/mVtBalQyw9OihXt9zY9r7s7WZ+HNiA7yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785407361; c=relaxed/simple;
	bh=Pssg7KNJUVYttiyVbquUpJgAxNBEhb6U/giluJc7NXE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=WHWt8Y2halgZTAco6iojz41HqNMiE00GxfH+CWXz0vXMo8Hsh1VPLoQLqgxaY4xrTgkZwp92Jk4mtK2H7BPkncl4dxl3HREpIANL4GXRV+9tjDyX8EaTk6Ry+2uNkk7k07hrrJ9BjtOvfvwYj9zstcIfgPHdVNjZdUMJhvlHHXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=fT7HidSj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nuqxy/+R; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="fT7HidSj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nuqxy/+R"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id EDA13EC0484;
	Thu, 30 Jul 2026 06:29:16 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Thu, 30 Jul 2026 06:29:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1785407356;
	 x=1785493756; bh=+MoKTv+gUm/9yZeD/+so0VapxSVD6JHLChmPeFz93WM=; b=
	fT7HidSjoJ/EpfsNuNwe2CLt7DhSST9veKDdVKFRAAPdC+zxl3KuKwfY6F6XGWo7
	lunzH8dsOPj5Ezh377EVMbF2fRqthWAwqicWSrUU5E2p96m7zBDwIwyWM/aIYj8J
	xwkTDejZhyaBGNZ9ralqc27AhOxdHnvl3t46OknDUK+6zwOBrzdl5CJZa9QlxuOB
	6E6BnlF2eH8I7Eve1whSWV2czsUV9Yx/iH8DmX+1xYwyl0pS0viIMWdphYjDPItd
	6SspqyWpnQ6jfXKuhPldHY6pKwU/4F0QSAPQEFGO7rFbBkRmMokU0NVakrK1chNj
	nsIx4hZ5kD8bX0OAxV8kEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1785407356; x=
	1785493756; bh=+MoKTv+gUm/9yZeD/+so0VapxSVD6JHLChmPeFz93WM=; b=n
	uqxy/+R0Jr4jyOAPS7HMVTXgkPft9oTYiRlij2iThhZq3HqKF39f8j8PRDNd2ZgA
	IajNXLNkT8ycbc5hrlYjIFOpTadfxzH5pCGXYi1hSe4jkh5qAbFpAcyY4CU7Kl34
	g0kVMWWtPAHWC0ayQZxnYhCoXGfaFs+RvNjrtY0bQANbybOb8cHX1rF3VHlXy+Ng
	pkxyXT7xVNwvikNbPjHt91gW7TXUfcbi+MrNwhHt0HXaOn/UwJ07sBvMSfnAE/ig
	rL6uqZZQTFdUrBUomGu3Gppk3TH8uNzRJe212+2nraJPyScua89ZcvNgoa42q4Py
	gG7bch9JowaAPAQnHXL7w==
X-ME-Sender: <xms:eydralgiA9GsFxxyoHPzmaHAkUq3STjgpUhVFS38BWDgvWkabhtG8w>
    <xme:eydrak2D36NfFNvMMi7qZi7BcZMkGl0R8OzRsoHw-FZZzZv1OH9FrnGhG-jf58Hjv
    -R2vpXBMRJkDpK-rEmqCI3yTjeAmjiwaV5knWKlfgaqKrxs2oWWHw>
X-ME-Proxy-Cause: dmFkZTF451LBXYI4j6NEK9hCZOBaU5/6KEaQvCWRqHjTDYA3asyt5srekK924m/jgNEzcd
    DBCwpbHCzUBssNqYXBKMJFEqmpiLsH7zRrbcxGoCFxRPdI+RsUKHuNHa/qEzlb2dodiB9C
    Npd5ZHi4Voz0QXZbBSxiFETt/M6/KAxtjlb46Kj2jV3Ya8DUQGUZPeFrFeZwtwetbRHgmF
    T4vbQ3ZYfqfBZrz1GzJrlaB20ua/dVprjrDCsfRPCfartNb5LLCYIPBAWwBuhq1F2hXG5z
    /rcOnwHkao85KrqB9t4Hc6t2/yJKVnotdAOhUEi/ODTZkzGc8M/IEG51M0Bxp7eqegktSS
    QcLZHCSI8NeeFFCxprPA1EHtfLW+ThT1BMJ79USraBpMdPSUY4ek3lqteZMmtvaw0Dzk3b
    J3pmfx7t7Cbw0YKFlZgndT7nYIDNTkITfjAM8GRC/r1dQhNG/7F2KzbVRzdUBBpy0MHuqn
    GRiL+ol8elyEiAoOpLIhuWks/ccAUgl08fwn3qBCUfIxKkQLH8qJJWZyYn3d/z4c+dKZhe
    4mkxq+OfiLQAO+LPcKArty5CUMT5rSmbfB4NmLkW7t3MNP0BSL28+LsRkSOZVTj+AeGa9a
    EkhrYwO7Uy+G3nyS50P72huHR8b3OYnAhFfqn1LJGElfgFFAhTFVgrC1YnKg
X-ME-Proxy: <xmx:eydrasdbuSR2A2KuSjdJQHRXsNpw6WCeif7BrGE-Tg13YSZ4-QruSQ>
    <xmx:eydrajYlVYnV1qaLrgP_3A2HkslLTrE0-bBg3_UGEAhNgn-DxcrdSA>
    <xmx:eydrag7k4TliYOQwWYYoSWOWURthM_MN-ejq0-uLIK2YnCUQGB74Rg>
    <xmx:eydrahftGJcFx_lW6vl4qXGeIWQfFoz8jywdVI8Pu7Nk7tJS2oV0_g>
    <xmx:fCdrauOd974YnS-3anIrLWrF-bnRn5fFIYf1SUK6EDARgIuWaONJUFFr>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E16A71820082; Thu, 30 Jul 2026 06:29:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AoDbeUyM7k0c
Date: Thu, 30 Jul 2026 12:28:53 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Frank Li" <Frank.Li@oss.nxp.com>, soc@kernel.org, arm <arm@kernel.org>
Cc: "Frank Li" <Frank.Li@nxp.com>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dbgh9129@gmail.com,
 geoffreyhe2@gmail.com, griffin@kroah.com, lijun01@kylinos.cn,
 "Pengpeng Hou" <pengpeng@iscas.ac.cn>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Message-Id: <8723f44e-fb43-49ef-b7eb-64267216f53e@app.fastmail.com>
In-Reply-To: <20260729193402.533533-1-Frank.Li@oss.nxp.com>
References: <20260729193402.533533-1-Frank.Li@oss.nxp.com>
Subject: Re: i.MX SoC Changes for v7.3
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Jul 29, 2026, at 21:33, Frank.Li@oss.nxp.com wrote:
>
> ----------------------------------------------------------------
> i.MX SoC Changes for v7.3
>
> - Fix OF/device_node reference count leaks in imx_src_init(),
>   imx7_src_init(), and the AVIC interrupt controller driver
> - Drop obsolete/unused declarations from `arch/arm/mach-imx/common.h`
> - firmware: imx: scu: Refactor mailbox channel management to use a
>   per-instance handle instead of a global one
> - firmware: imx: sm-misc: Add NULL check for `kmalloc` return value in
>   syslog_show
> - soc: imx9: Add error handling for `devm_kasprintf` return value
>

Hi Frank,

I pulled this and the other two branches you sent yesterday,
the contents all look good. A few minor points:

- The soc@kernel.org and arm@kernel.org addresses both forward
  to soc@lists.linux.dev these days, so just use that one
  directly.

- please split the arch/arm/ code changes from the drivers/*
  branches, since we have separate branches for upstream as well.
  The changes here were fairly small, so I'm not asking you
  to resend them for that here.

- It looks like the automated patchwork bot messages again did
  not work here. The git://git.kernel.org URLs failed to work
  recently and I added a .gitconfig insteadOf rule for it, which
  I think makes the pwbot fail to match the URL and not run
  its maintenance scripts that update patchwork and send the
  email. I've removed the rule again as both now work, but
  you might want to send https:// URLs instead of git://

     Arnd
