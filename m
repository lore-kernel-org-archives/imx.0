Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922058;
	b=QBZRMt12U5InFFks7Znqgu05fbJhZ4JDpRQnTUSVsVg+JIu+PDu69pd4mFDD0MhgFI9t
	 3dRIM9z8gynBArxBrdno11S2AV6KKWpASexFhtR40TRKyNNQaOH+Aiq7tG2Gf83BwuiWB
	 /8hQ2bzr8gKllSEENi80ZCVljwt47rLHqNwijaIE93ga4efapzBbZpDLC7VITGslLWV7F
	 UldXciEYR68YfZPhu/qUt4xUlP8nN4nD63XZCO6qV2AIojr9D6aZU1vKBZLqCSUHGVXll
	 G1ze2+rSyWmJT7xG9t3SXGHClXBZTrAeJ6KdqQYLUnrYdi8z0B3kWqLw/81LlS5RZpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922058;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=hMTRae/7dai+hIUARFlVZIWWrBH0aaFjeRGhcjedEQw=;
	b=HLc+K/Unox48wNqo8ihM/veYEX570BQpRJEdNzWQQdWBqqWH8fcrzA6FKa0/3NlnbFFr
	 JS9LVZ5Jbnw/yiHa95AjpzJX29pyb6++acXSnR1jp9UkTFz+6+NPbigjIyAo0daUX94ZR
	 fdzIyZ5rQ4BlJkAAUWlKSudkg8FsLvyFKlnCnzkQyudwVamS4PIxsWLBX31qM6Qp87bSM
	 F3bjDZMZegf2ZP03IMT1wIBCmMLUqkH9sPdO8rAuSFmf1lI7CyD9PHaYDs0lwWbS09/FF
	 r5vIh3B43eIVkAx51YG/nFvwA4iaFNOuoQlk1kEwWr1D7y/YtLXwla/St/NCVWAKIEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gGAZ0XFB;
	arc=none smtp.remote-ip=91.218.175.113
Received: from mta0.migadu.com (out-113.mta0.migadu.com [91.218.175.113])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E95606A31C
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 13:27:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65E95606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gGAZ0XFB
X-Envelope-To: imx@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=hMTRae/7dai+hIUARFlVZIWWrBH0aaFjeRGhcjedEQw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794922055; v=1; x=1795526855;
 b=gGAZ0XFB5QNCHerJj3LBLNtoVrV23V2S21pAJ3xVsjvinRE3aCVm6i7Oue0MPbAS8TdiFMBB
 NoAsqesw3fDcTdlL8DfzVwdOuj5vEnNQ1qrPKO3i2kTVWAUlnAer4dAaX+fP34/DYa4tRTbWcEr
 6uOXFSlRZBTnQZqz+QDkBA6s=
X-Envelope-To: imx@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 07008d2eff61e532;
	Tue, 17 Nov 2026 13:27:35 +0000
X-Mizu-Trace-ID: 07008d2eff61e532
X-Migadu-Flow: FLOW_OUT
Date: Tue, 17 Nov 2026 21:27:17 +0800
From: Peng Fan <peng.fan@linux.dev>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 0/8] irqchip/imx-intmux: Fix and modernize resource
 management
Message-ID: <avxWNZii97F9PZE-@fedora>
References: <20261117-imx-intmux-v1-0-189e7e0ad98d@nxp.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117-imx-intmux-v1-0-189e7e0ad98d@nxp.com>

Sashiko reported some findings [1], please wait V2.

[1] https://sashiko.dev/#/patchset/20261117-imx-intmux-v1-0-189e7e0ad98d%40nxp.com

Thanks
Peng
