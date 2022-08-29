Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD16E2117
	for <imx@lists.linux.dev>; Mon, 29 Aug 2022 07:07:49 +0000 (UTC)
Date: Mon, 29 Aug 2022 09:00:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1661756432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XEgMX5l9ywmF58nAcfRV0u/exVC4JKkJyuw3N35XEKo=;
	b=jCYYAN7Fk40JuPjAVaamdXtAE6vpZX+PYCcMsef+7GsaiFQutpc14IdcSTi9GChd5QE4tK
	n+p7Z6AgyKvx3/u9u5ahwI0bmllm61Fg0UAk2IQgRmp7UEtUVsRhaW/lJP/zQe6f1JFgL9
	bcUUCD2WHxdRhWgV5vBo4TfjLResUe0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Shenwei Wang <shenwei.wang@nxp.com>,
	David Wolfson <wolfson.sol@gmail.com>
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [EXT] I2C_IMX support for i.MX8MP
Message-ID: <YwxkDuFgXrsp02R3@skidata.com>
References: <YvzFPR5rwVSLzNPK@skidata.com>
 <DB9PR04MB828420CFED71AE624B11B8B2896A9@DB9PR04MB8284.eurprd04.prod.outlook.com>
 <Yvz2IA9GB2NJmc+D@skidata.com>
 <DB9PR04MB82843B074F7F2ADB0D455867896A9@DB9PR04MB8284.eurprd04.prod.outlook.com>
 <Yv37CrPtlm0WSUmd@skidata.com>
 <AM9PR04MB827430FBD894470753E97BC5896D9@AM9PR04MB8274.eurprd04.prod.outlook.com>
 <20220818125404.GA45792@ubuntu>
 <Yv5C61+2eLgtTvE5@skidata.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yv5C61+2eLgtTvE5@skidata.com>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev

Hi Shenwei, Hi David,

friendly ping.

On Thu, Aug 18, 2022 at 03:47:23PM +0200, Richard Leitner wrote:
> On Thu, Aug 18, 2022 at 07:54:04AM -0500, David Wolfson wrote:
> > On Thu, Aug 18, 2022 at 11:59:41AM +0000, Shenwei Wang wrote:
> > > Hi Richard,
> > > 
> > > Nothing is hidden here. That is PAD control register, and should be documented in the IOMUXC and PIN Control section in the RM.
> > > 
> > 
> > Checking the IOMUX and PADs' settings is the first step when enabling
> > an interface.
> 
> Sure, that's what I've done. Nonetheless the "8.2.4.280
> SW_PAD_CTL_PAD_I2C3_SCL SW PAD Control Register
> (IOMUXC_SW_PAD_CTL_PAD_I2C3_SCL)" section in the IMX8MPRM says bit 30 is
> reserved.
> 
> So does "8.2.4.128 SW_MUX_CTL_PAD_I2C3_SCL SW MUX Control Register
> (IOMUXC_SW_MUX_CTL_PAD_I2C3_SCL)".
> 
> Maybe I'm just too dumb do find it... So it would be really helpful if
> you could please give a pointer where to find that documentation?

Any hints on where to find the documentation of that bit?

Thanks & regards;rl
