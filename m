Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3314DDC2
	for <imx@lists.linux.dev>; Tue,  5 Sep 2023 23:22:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A7AE1BF204;
	Tue,  5 Sep 2023 23:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1693956164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7Z5k5pcEAmV+x04SFylcHWHzG1422bRUlUrcZZqHpFs=;
	b=duTfldYCBRDx3ye6CtIFuo2m+CXefBdkyyozx5RcPYVEHhDjOLtW7WVfnry78hR3lKoO5G
	g4brDe73FyZ5qBp/lTvd8V4AJ1wDYosulJ2poI5NZLmiBXgzw2FcWJ04CPXmBq4xxWlIfh
	Z/YeCVORyvtE2qnxhyxG9EOZblDyJYvN07jiq0My1ftDVRmqIe/Kwi3kapag0+YyB9UaZB
	LWeEk1gPxdosjjK8Cp1fk1yL7eZGKDQPX71sjxLHmSD1yY/RwgCuXgTW2XeTqX3aOsOWav
	BKSbJji2EUudDwImspqAi82ImuGhqtW2IgHL3cQY/UqVxBY1KMCSFLtSaDgmqA==
Date: Wed, 6 Sep 2023 01:22:43 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: miquel.raynal@bootlin.com, Frank Li <Frank.Li@nxp.com>
Cc: Frank.li@nxp.com, conor.culhane@silvaco.com, imx@lists.linux.dev,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/1] i3c: master: svc: fix probe failure when no i3c
 device exist
Message-ID: <169395611478.302281.14031067702798801687.b4-ty@bootlin.com>
References: <20230831141324.2841525-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230831141324.2841525-1-Frank.Li@nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com


On Thu, 31 Aug 2023 10:13:24 -0400, Frank Li wrote:
> I3C masters are expected to support hot-join. This means at initialization
> time we might not yet discover any device and this should not be treated
> as a fatal error.
> 
> During the DAA procedure which happens at probe time, if no device has
> joined, all CCC will be NACKed (from a bus perspective). This leads to an
> early return with an error code which fails the probe of the master.
> 
> [...]

Applied, thanks!

[1/1] i3c: master: svc: fix probe failure when no i3c device exist
      commit: 6e13d6528be2f7e801af63c8153b87293f25d736

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
