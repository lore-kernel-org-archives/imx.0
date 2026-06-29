Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070B4328255
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 20:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782764588; cv=none; b=RdySuAGBzeHRS3pseeDJZ+v21n00aYjQwP3uTnwz3xgmxtCyl5M77HaB2sXLz11pBLKzEMOiv013sPcZ1KWZjHoNjlZAMS8pTi5+GkHkvJK2cEeyGsVbqLQSVu6q0og6AT9xlzYOejFoXDm+PyKf5bkiamy0jvYgDJqGYRT6r5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782764588; c=relaxed/simple;
	bh=6BGCtWCSnzscsVLSmkOHT0KynDhANaGbAaBhMOXMItI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hcg4/1Dz5Ks048EPotriiXWsEEsgdp6oWRqSQ4RcbRNrMW5Z6nXkTgmsmiUFxwUnXGbx37ciFcUFujTuzZt0ATyVDAbSG7tZqcurXQ1tqhMA4nP8IQda41LqfI88aE86z3/K360I5sCvzZ3izTpWqqdRgm8Uuw6PmaQ/30+bhY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HqmG60kJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HqmG60kJ"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E7D7F8D4;
	Mon, 29 Jun 2026 22:22:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782764541;
	bh=6BGCtWCSnzscsVLSmkOHT0KynDhANaGbAaBhMOXMItI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HqmG60kJwrakddc5jSOxRNmE+QEGp5nvtf1vHx/Bk1W8vyTxkgxP6QvWpNTB2dDAi
	 C7MfRVTI29fqj5uHKnQ2OquAWNYAjgLfdjkxZ4yfe0fAURC0BT+vvD8+VKwr7R0AP7
	 9/xyQQI6Wu4/tC3+N6MVsCpUZqMcMrdJfHiAfXfk=
Date: Mon, 29 Jun 2026 23:23:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank.Li@oss.nxp.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Guoniu Zhou <guoniu.zhou@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Aisheng Dong <aisheng.dong@nxp.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: (subset) [PATCH v5 0/2] media: nxp: imx8-isi: Add virtual
 channel and frame descriptor support
Message-ID: <20260629202302.GK3054459@killaraus.ideasonboard.com>
References: <20260521-isi_vc-v5-0-a38eb4fcd58e@oss.nxp.com>
 <178276214766.2429861.1950641421457268519.b4-ty@b4>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <178276214766.2429861.1950641421457268519.b4-ty@b4>

On Mon, Jun 29, 2026 at 03:42:31PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> 
> On Thu, 21 May 2026 17:10:03 +0800, Guoniu Zhou wrote:
> > This patch series enhances the i.MX ISI driver's with virtual channel
> > support and adds frame descriptor capabilities to the crossbar subdevice.
> 
> Applied, thanks!
> 
> [1/2] media: imx8-isi: crossbar: Add get_frame_desc operation
>       commit: 3e15a3510908c990ee352aa206d5f9c23d4b216e

Is this a mistake ? Patch 1/2 has no R-b tag, and you're not listed as
maintainer for this driver.

-- 
Regards,

Laurent Pinchart
