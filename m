Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF45735504F
	for <imx@lists.linux.dev>; Wed, 11 Feb 2026 09:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770801700; cv=pass; b=mhwC58kklEcZKYC3/TeA9FpQsA/wjZi47rEHgXgc+2alJDi5Twkv0wWjProDhOdzuwon4xq15UdsipP020WO5IeErsZ8vrNQYVrAGWsObALrYK+SROwVWY4Cwai88qZfbQFq+Ldfxmz6O/gA4xVS1VAFYVyjqrUlVD4gwTMYCi0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770801700; c=relaxed/simple;
	bh=rwcYPbUyz95dte+r+KGmItRRNFe0wH+rzKz78J28p5k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AqU2OeqkvRfpj/UbU336pKPmhoL1GxqwHa4v2ifz9lm6kiXhXXt/7syqT4xOXfh1uHSzxlew2mtPUE83ka2Izhh+m9L3ETmJJfEtg3Y0hfdt4StvKQwbAwlIpwasxMC5ysMfpeMEvnb0kPxFj5zigpGPDL2JeV4vTi0//QXKGKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=GTWfXkpw; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="GTWfXkpw"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2ba895adfeaso1787999eec.0
        for <imx@lists.linux.dev>; Wed, 11 Feb 2026 01:21:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770801697; cv=none;
        d=google.com; s=arc-20240605;
        b=ez6br0bRgPyf51Uu9IiBZf3RTMxEBSFGU/WaP1xnzZNBm10iwGRVhx89M/2DLa7isV
         ItVdYgIttfVBmzwITSAXwmNv4eAIIqvxynREZgRJ4Otd0z0qWrNWRuSUgxUVK5ySE02W
         gaj3bKtH4Ol/m7caYSr4G1YBQLrrg/xwqhaLkOhNLGxhc1zgiLM2Blqxq61mKERYs63V
         LZinDoePlCtBuBZP73ThN6xBS1LjOLuldR06G31CcFOwIAQDdxtpou2rN7VLCLQQ/5k+
         3ZxmjyMzmOWOCgg1gU1ZtucnjDF2EdVlio92INE7p3WGY4ylchhykv0Zn5Sx5h7/bX9O
         G3Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rwcYPbUyz95dte+r+KGmItRRNFe0wH+rzKz78J28p5k=;
        fh=pUbVXHF4Zdu9wbZKEnL1WI5YlAYBMUwfa9uVg5Jw/a0=;
        b=X+ZMj9og9Ygku46WeEi3Hzh7i1zMBQfp8MRg2UKMcyxbHS9MJdP4nxnKKSlgOl1fEU
         cugH9/xUH6ncuDrq9WsJx3jJS7xlTf9/BL8g6SMPJZTMEKOvUk0WAIogZGPAqnCbxQ9E
         pgcX2cyS1guWIKeSIsZzLaJTh4drwEHmtjEBzlsPO4w+At9A071dE7ImtblKx89VQaKd
         +oX262ylqZuL88Z2T4riFeuS+t/ZsmGo98P249VeTogD1DhgrmA/oXB1RIZYXo94/E59
         Tp/IbMrBo6bPeO/XB5v6+yGGzmoVHl/DhgtWDazY7Z7I+Lf624oCY/m96p7VNw8XzEUJ
         90gQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1770801697; x=1771406497; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwcYPbUyz95dte+r+KGmItRRNFe0wH+rzKz78J28p5k=;
        b=GTWfXkpweBvYMVWAadfXWJU/TZDA2BgGlf3DHLzSZhQ8FnGAM+cVaEeDY4gGSaH3gy
         9mtDOsx7c/BktphbSmvM1OPbyeRuspG0JlId4pLrnV0cDF6ItERoJJy0/nJcZi3knYUe
         fjotMHnYoYkdPcRkWlJxC2oEF/v49Uz6AapsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770801697; x=1771406497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rwcYPbUyz95dte+r+KGmItRRNFe0wH+rzKz78J28p5k=;
        b=F7GmYilddfFIxy5N7oQT1gjheH+3tIoNJ0tbZ/ERpBfQHh9ouPbl3o73GwG1vs2aMR
         ulN10ubi4OCVCFuYLMDBdpJ4uFeRwcgvvGGEfM50ubCDQouYpdx8jrMCSyM4aRG0SWem
         De3dxBSNMFYeEE7KeWvWkxIdhCAZnVpgc9duQMWOzBOFeM509X4jy04P/r1BS92ZcF6G
         7RkjCGxUMWzIhR2AxQz4263dTwuX+nslBJF0qyIl9EoBMljiihNKzh+VHyBG6deDRMXx
         4Y1PqEYCxdJ5MxGRxDHTUt4e4YVO/+4zlzOkZD6CKXBR64DPkEPpBpe9H+b4rYgnAxT7
         fxeQ==
X-Gm-Message-State: AOJu0YzqRwYETg6xzxEKp/wV4O+00qjFvtIsv8Xs/hhCNJmqDmlX5dAT
	9VkgR3BDmORx6pMNzyLiziH5wZ0zEdh+PUv2zCHfgcy5BqGrzJDstezwm3YpQRU2izISxch8g0j
	0nNJgiV8K1pYDEK0o2dKb84IBLYmsU0RckCBA3sQrKQ==
X-Gm-Gg: AZuq6aJyfhDqrBTFm1tW0qzVVIJgt8Vi6ZAI70/9o8q634DDeOPuv5bxXe5rvpXaWRf
	4DfoHYi7hfY88Kdx9X+NoxYZi+Z29DBovUXfLcBgQwALvhdj2i+mgb3pFGT2QWvvyVjk09QvQvH
	4wF08nmPDGW/tt1H3or5Uc7vSrmGlzziz7+F70b/sXb/l2AEmiAFykzp1GsY6toeqJXLonCUZGA
	TAqFp3PJr6qp6QcHyErYG51yZWLbDFeKtplCfusq7jGjH3tt0YiSIUHVrZQBCNd3UHcKiveK9mH
	xam3NBXjQ1OHR7f7LTXE11ezqjbv6r+5ogmcBA==
X-Received: by 2002:a05:7301:9bc2:b0:2b7:32a6:82bc with SMTP id
 5a478bee46e88-2b85672111fmr6959767eec.26.1770801696866; Wed, 11 Feb 2026
 01:21:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260128094644.302313-1-michael@amarulasolutions.com> <PAXPR04MB8510831BD69AA3BE71E03472889FA@PAXPR04MB8510.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB8510831BD69AA3BE71E03472889FA@PAXPR04MB8510.eurprd04.prod.outlook.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Wed, 11 Feb 2026 10:21:25 +0100
X-Gm-Features: AZwV_Qh_NKulEX6GhO2VRR6DiP2mrrXV3YahSmTeMatE-BEs1pdfJLyj_QbD_lA
Message-ID: <CAOf5uwkrGhO22SU29m2aDX2cv2nt2xm_mcyE2GDwWnpa=-c7Zg@mail.gmail.com>
Subject: Re: [RFC PATCH] net: phy: integrate reset-after-clock quirk into phy_init_hw
To: Wei Fang <wei.fang@nxp.com>
Cc: "open list:FREESCALE IMX / MXC FEC DRIVER" <imx@lists.linux.dev>, 
	"open list:FREESCALE IMX / MXC FEC DRIVER" <netdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Jan 30, 2026 at 3:25=E2=80=AFAM Wei Fang <wei.fang@nxp.com> wrote:
>
> > The current implementation of phy_reset_after_clk_enable requires MAC
> > drivers
> > (like fec_main.c) to manually track PHY probing states and trigger rese=
ts
> > at specific points in their clock management flow and was created just =
for a SoC
> > vendor. This leads to fragile code in the Ethernet driver, involving co=
mplex
> > checks to see if the PHY device is bound.
> >
> > This patch proposes moving the handling of the PHY_RST_AFTER_CLK_EN fla=
g
> > directly
> > into the generic phy_init_hw() function.
> >
> > Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> > ---
> >
> > I need to test better some boards that need this reset, but
> > I need to confirm if the general approach is ok
>
> This patch looks good to me, it is more generic than the previous
> solution. I do not have a board that uses SMSC LAN8710/LAN8720
> or other PHYs, so I can not help verify the solution, but I think it
> should fix the issue that reported on the i.MX platform. Thanks.
>
> Acked-by: Wei Fang <wei.fang@nxp.com>
>

Let me re-test and try to get rid of this flag totally. According to
the discussion seems
that should not be needed

Michael
