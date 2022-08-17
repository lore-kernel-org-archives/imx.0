Received: from out2.migadu.com (out2.migadu.com [188.165.223.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B154404
	for <imx@lists.linux.dev>; Wed, 17 Aug 2022 14:15:32 +0000 (UTC)
Date: Wed, 17 Aug 2022 16:07:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1660745250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cRCIBtrYfHCMUbyPv0zGa/z1ZN/QIT6VsP742PAeUSA=;
	b=CZmnEhNA/o9JthMv/kvkAvvreKmMzGoquS0oQDjOs++5lTRIIvQCY1fAewsGr9Cc0SZBYC
	ehmn1ioclf9vtXtFpV9qUyZtAfFT3JdI3orvhg4kY+UVrT+qxuEX5coYAPXGGk1Kz8CDOk
	cd/4PEoU33Y1IrXhMac4n939xj72IWM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [EXT] I2C_IMX support for i.MX8MP
Message-ID: <Yvz2IA9GB2NJmc+D@skidata.com>
References: <YvzFPR5rwVSLzNPK@skidata.com>
 <DB9PR04MB828420CFED71AE624B11B8B2896A9@DB9PR04MB8284.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB9PR04MB828420CFED71AE624B11B8B2896A9@DB9PR04MB8284.eurprd04.prod.outlook.com>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev

On Wed, Aug 17, 2022 at 02:01:00PM +0000, Shenwei Wang wrote:
> Hello Richard,
> 
> This is not an ML for imx product support. It is for i.MX related Linux development for upstreaming.

Thanks for the information and sorry for the obviously inappropriate support request.

May I then ask the question differently?

Is i2c-imx supposed to support i.MX8MP on current mainline?

If yes: Great! I'll take a deeper look into my setup, I guess I've done
something wrong then...

If not: Are you aware of anybody working on it already?

regards;rl

> 
> Regards
> Shenwei
> 
