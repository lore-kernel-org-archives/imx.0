Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.27.42.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794850207;
	b=PJtyw/tkgm/eByoMGk93MOTaoHpqN+lqs4GtfC4BOvzKdQBn/5pEqyzqQKPs/ZItH47/
	 G9BAyIFTR0Gk/D91uf4l89Z884WTDgfnJgUC+BSAH7XQaQyMYR38voY9glq5+v4kiq/AB
	 WNO+qX8jdCUAnZm6Y0tTuCqxtvZOqlv4Mra3FZOEIUY6XG4QvgibwCSmNRnBxgpfp1nT+
	 4MotxaZVMrnmcHL31q0gPCXFRVg/tY18BalBjRMSxIcWvXLxdHVz4n4uJKlyp+8MYwjOz
	 +3zjynsl7Aw1yzujpBKZ7t85YULBwbaHEEMQdWO7XwiAKfhtUZd1u8LdV+kPcawbTLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794850207;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=+TAV8zxCLaQRFWFko9N1+gmI6Hkj/Ua5ZfgjdQ0uN+c=;
	b=G48ohF5fSpJhj6Xu/DlxeathBB7kQ8ODJeQ5RhVFI0nQCO6LTeaa2PQh5R2rr0431Gfk
	 Ash1qGDAfK6ZRlLI/WSRCZvgjinkcYjj5q4vz4ujp+HbXAHc8sAdn88oBidrB2gRVkrRL
	 dZuR03uZcWq0R/TksiGZmUZheq33pXLIxONXNPWydFoPcX5HcaccmXJAMkMJjcVeieQ8b
	 rgfWNmgro8EeUPpzscg9byVxpkZ+N6mhHPtis+qo8h0KhKGhLMlunMDOyelsk7lsKwPGA
	 QgNPgBWj8g4kyCscDPT6Hi1VjsB7OoeZI0GMLNiwAlP8XFR5S84Jduy9c7tGr4CqrMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=free.fr;
	spf=pass smtp.mailfrom=free.fr;
	dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=gbLeb4W2;
	arc=none smtp.remote-ip=212.27.42.2
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD39606A335
	for <imx@lists.linux.dev>; Mon, 16 Nov 2026 17:30:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AD39606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=gbLeb4W2
Received: from l3017729.home (unknown [IPv6:2a01:e0a:ac2:22b0:3d85:8d5d:9362:361])
	(Authenticated sender: vjardin@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 86EA52003B4;
	Mon, 16 Nov 2026 18:29:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1794850198;
	bh=gf1KXaGSHMTIuSeGKV+TB854dq3D1ziSlvG87KmVRac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gbLeb4W2rC8PAAvj8pCV3t044hT8rRb/fjjcJF0QXEsHHx5Wvl6EJRID9+XFgvan0
	 k/h/Zg2xuybp/Cr06X62gOXJkliBIwvDvO8DmPch0Y/x3jVshlJPaTlVT0ehLChUlh
	 Wrg4ArJ0gToAJCMhHGbY0n6sTSAzsDCgCc0Bq+QnQsYQ9T38S6LTr4Ev9EmBCdWtad
	 bWVAMmm25HKALgIbEKmkDUULK1ykDTAnRXj20z1oibWJ15IVVtLoa4tvBKhQK6PsmZ
	 AwTQkNuUAIPpXBVhxUE6dxwkTPf10NcpeIu0RI7k4q+m0zWOdSVe5c42c3WPqdCjVt
	 n1V2pqTzTqoQQ==
Date: Mon, 16 Nov 2026 18:29:34 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Vladimir Oltean <vladimir.oltean@nxp.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: Re: [PATCH v6 3/5] soc: fsl: guts: add the RCW override of the pad
 muxes
Message-ID: <avs9fmJqYShOIPMK@l3017729.home>
References: <20261115-for-upstream-lx2160a-rcw-pinmux-v1-v6-0-fbdce4565a5c@free.fr>
 <20261115-for-upstream-lx2160a-rcw-pinmux-v1-v6-3-fbdce4565a5c@free.fr>
 <avs4l1otw6ACW5P4@SMW015318>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <avs4l1otw6ACW5P4@SMW015318>

Hi Frank, Vladimir, Christophe,

> > Suggested-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> > Signed-off-by: Vincent Jardin <vjardin@free.fr>
> > ---
> 
> You missed my tag?

Frank,

No, it was on purpose since I did many changes after Vladimir's comments.
The goal is still idempontent for lx2160, but the design is now more NXP
CPU generic.

Thanks for re-ack-ing.

Next, let's make sure that Vlaidmir is ok with 4/5 (if the driver is
generic enough).

And, let's Christophe review/ack the 3/5 regarding pinctrl.

I guess that 1/5 needs Rob on the devicetree, not sure ?

Then, since it was unclear for me if the patch 1..4 are through
pinctrl and 5 thru imx (please, Linus Walleij) ?

I hope it'll go thru the proper reviewers,
  Vincent
