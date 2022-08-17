Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157C51C17
	for <imx@lists.linux.dev>; Wed, 17 Aug 2022 10:39:02 +0000 (UTC)
Date: Wed, 17 Aug 2022 12:38:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1660732735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=x8tFMvlRPhpG3H4y7S9dYO75uaJySBzRKmW0U0GxUMo=;
	b=AvQU+qHnb13YF/Z8f8vpqnf5sY4o7WYkRLX28/69P+Hvf5pkGb6Fv2bHQx6viETKWzbnmW
	U497OPHUB5MZUua5fofFcu5gk4vRMk8eAeaptOZxEGW5n/O1jP0DEPjcEODSLOBGP4y7sQ
	DcE+D4/ezgZbF81tkpPVg/JV0flolyM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: imx@lists.linux.dev
Subject: I2C_IMX support for i.MX8MP
Message-ID: <YvzFPR5rwVSLzNPK@skidata.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev

Hi list,

Just found out about this imx ML and I'm not sure if it is also intended
for questions, but I'll give it a try. Please correct me if I'm wrong.

We are currently in the process of creating a BSP for a custom i.MX8MP
based board which features 3 I2C busses. Unfortunately I'm currently
unable to get them to live with the i2c-imx or i2c-imxlpi2c drivers.
Using i2c-gpio (with adapted SW_MUX_CTL and unchanged SW_PAD_CTL)
works fine.

I'm aware of ERR007805 and tried therefore to configure the busses to
200kHz, but I don't get any signals/edges on the pins.

So the basic question for me is (as I was unable to find any trustworthy
answers on the net) if the i2c-imx driver supports the i.MX8MP at all?

Any feedback is warmly welcome!

regards;rl

P.S. All tests were done with mainline linux 5.19.y.

P.P.S I've also sent this mail to linux-imx@nxp.com before.
