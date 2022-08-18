Received: from out2.migadu.com (out2.migadu.com [188.165.223.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0218B23C8
	for <imx@lists.linux.dev>; Thu, 18 Aug 2022 06:55:17 +0000 (UTC)
Date: Thu, 18 Aug 2022 08:55:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1660805715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2ARqhiLT/ZyDrdIcTJJjCDfCotUUs+01JW0fo+Y5eyk=;
	b=b8c59kFKF1IElscNAtEM6A//L7gUkQR7s2VwwA9U96M6qPzGlRBQW0vo00rQVV4Ll+zRKq
	gM/pKqYxkaQuCXkDBFYxcRTTVHKt0+eSpGzhgaFI1517E/iVnoBAnkJGtO0Ek5PCRishDR
	9fGUGr1wrGl8eU7lcPgGtLqS8mIACM4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [EXT] I2C_IMX support for i.MX8MP
Message-ID: <Yv3iUH32HpdTezqe@skidata.com>
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
> > 
> > Caution: EXT Email
> > 
> > On Wed, Aug 17, 2022 at 02:01:00PM +0000, Shenwei Wang wrote:
> > 
> > Is i2c-imx supposed to support i.MX8MP on current mainline?
> > 
> > If yes: Great! I'll take a deeper look into my setup, I guess I've done something
> > wrong then...
> > 
> > If not: Are you aware of anybody working on it already?
> 
> The support for imx8mp-evk board has already pushed to mainline. That includes the usage of i2c-imx.
> For example, a GPIO expander is connected to I2C3 on evk board.

Thanks! I didn't thought of the EVK.

regards;rl
