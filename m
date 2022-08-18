Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD3D7C
	for <imx@lists.linux.dev>; Thu, 18 Aug 2022 08:40:49 +0000 (UTC)
Date: Thu, 18 Aug 2022 10:40:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1660812047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q1gIxHMh59qPU1kOs+bAIG9DaQ96Gm6prqGsTrQ4bgU=;
	b=mlWCbkrjqHIFY9tD9Caxu4Eu2Sn/48h1efqwvIdb29yYBx9afg5mdHY6XUstzt+nNu6cbn
	9R5RTWSsD15jE6RShaQdhqeFyg58PP1ymeqjmsS+z6Dfq6x513+TLGnl8mrlLvkpJgBph2
	dDfGEKq7EgMAt8rlpB0/eBPztRh+ulk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [EXT] I2C_IMX support for i.MX8MP
Message-ID: <Yv37CrPtlm0WSUmd@skidata.com>
References: <YvzFPR5rwVSLzNPK@skidata.com>
 <DB9PR04MB828420CFED71AE624B11B8B2896A9@DB9PR04MB8284.eurprd04.prod.outlook.com>
 <Yvz2IA9GB2NJmc+D@skidata.com>
 <DB9PR04MB82843B074F7F2ADB0D455867896A9@DB9PR04MB8284.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB9PR04MB82843B074F7F2ADB0D455867896A9@DB9PR04MB8284.eurprd04.prod.outlook.com>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev

On Wed, Aug 17, 2022 at 02:14:53PM +0000, Shenwei Wang wrote:
> 
> The support for imx8mp-evk board has already pushed to mainline. That includes the usage of i2c-imx.
> For example, a GPIO expander is connected to I2C3 on evk board.

Thanks again. It now works with linux v6.0-rc1.

The missing piece was setting the 0x40000000 bit in the SW_PAD_CTL
registers of SCL and SDA.
Unfortunately this bit seems to be undocumented in the RefManual and
also the driver documentation doesn't state anything about it.

Can you please shed some light in this "magic" bit? Would be really
helpful, thanks!

Furthermore I guess documenting it somewhere in the driver or setting it
implicitely (if that's possible) would be a good idea?

regards;rl
