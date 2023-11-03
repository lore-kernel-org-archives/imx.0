Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A7B224D7
	for <imx@lists.linux.dev>; Fri,  3 Nov 2023 19:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AotkSUlt"
Received: from relay9-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::229])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 3EE31D1520
	for <imx@lists.linux.dev>; Fri,  3 Nov 2023 18:51:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 20399FF806;
	Fri,  3 Nov 2023 18:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699037471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IDuaV2o26ipn18Dth3c/+CRuMDxlnBDkzFnwfW4wPK4=;
	b=AotkSUlt+cvUxCNRruWpyimBanIZ5u43UQp2V7aTrUb+lRvE7OzcN4hwD6DJlN0IpcEUxw
	lRAJcrQ3KG/Pdv8dcm8HSy86f8M738+nM+QkKxa9O764AwIVkhCsTntKlbh+956zAx7zVB
	lAYygv8WB/IeKYLmeQJ80anvxqdZatFulL7bytfQcSYN2bkvCVZMJ26M9+ClT6idI9gNxr
	B1KCHcpIC+IasoPIJOPVtR7uTcHv4XneDpT++dRKFniF0h+v8usuhVK6JS/qDBlKpxuyaS
	SC1Fh5rtgXRgZ/5xJQ0dX9qW4CFf5vCaTf/oBz9hL3rorHIgtC4xmNMR7yNn+A==
Date: Fri, 3 Nov 2023 19:51:10 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: miquel.raynal@bootlin.com, Frank Li <Frank.Li@nxp.com>
Cc: Frank.li@nxp.com, conor.culhane@silvaco.com, imx@lists.linux.dev,
	joe@perches.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/6] i3c: master: svc: collection of bugs fixes
Message-ID: <169903733135.383554.5820823171048383962.b4-ty@bootlin.com>
References: <20231023161658.3890811-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023161658.3890811-1-Frank.Li@nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com


On Mon, 23 Oct 2023 12:16:52 -0400, Frank Li wrote:
> Each patch is indepedents. See commit message for detail.
> 
> Change from v1 to v4.
> See each patch notes
> 
> If there are not notes between v2 to v4, that's means not change.
> 
> [...]

Applied, thanks!

[1/6] i3c: master: svc: fix race condition in ibi work thread
      commit: 6bf3fc268183816856c96b8794cd66146bc27b35
[2/6] i3c: master: svc: fix wrong data return when IBI happen during start frame
      commit: 5e5e3c92e748a6d859190e123b9193cf4911fcca
[3/6] i3c: master: svc: fix ibi may not return mandatory data byte
      commit: c85e209b799f12d18a90ae6353b997b1bb1274a5
[4/6] i3c: master: svc: fix check wrong status register in irq handler
      commit: 225d5ef048c4ed01a475c95d94833bd7dd61072d
[5/6] i3c: master: svc: fix SDA keep low when polling IBIWON timeout happen
      commit: dfd7cd6aafdb1f5ba93828e97e56b38304b23a05
[6/6] i3c: master: svc: fix random hot join failure since timeout error
      commit: 9aaeef113c55248ecf3ab941c2e4460aaa8b8b9a


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
