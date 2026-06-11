Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41A2351C06;
	Thu, 11 Jun 2026 13:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781184987; cv=none; b=IgZpZsSU4svq8bKOYWsQoNoE3UNUeJsnWa1R6dW8l2GYhJHqg5z87Rj87gWQWqCxtlCCc7NGr3ZY6MDcunIN+4hw2uHjDwPZbKdc7x3v68xFJiyJ6xZUP3mb49x7QCgBrwgNLrUIrGrQnntYgiKzNgM+YTjxKJ8bTaiXgeplpNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781184987; c=relaxed/simple;
	bh=jL4RVWOMKfmO7To2mIRY2VeXK5iqly0JFuNFa8wsmIs=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=btdaiIhb6B3DXAKCnofOXN12hCI2V609c7oC+Iwfw3sTFss3lTj3jioRY/OunytHVfiZm39GIuptq0vLxcQAgawWHo2TXv5wGeaQHlb9xd65Evi0S7TDW/7xXKGjeVwzhHyEGzWSJlZxwi8x2aA+XgN/7kRb2DgZeI5H3bp7/Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=nuKzse3C; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="nuKzse3C"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=default; h=Content-Transfer-Encoding:Mime-Version:Message-Id:Subject:Cc:
	To:From:Date:subject:date:message-id:reply-to;
	bh=fxfUrM2C5cSU/ZQ2peV7mA0YDwTurUP7o3lWO7jM/k4=; b=nuKzse3C6h8sLjkBdRJ2jY5Kyl
	5FSAvCnDp6hhjOsiYNBDoT+KHNLAl8ju6okPofvst2NtyiQu/eosRRMoKvywhWvV6JIJtin+kmbkQ
	b1Xl/BXvFUHdnwlm0ohbsEHGp18+37omxU/rGL9QWTPZhvnQ49ekfSmgHQxffgBw5pHw=;
Received: from modemcable061.19-161-184.mc.videotron.ca ([184.161.19.61] helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.98.2)
	(envelope-from <hugo@hugovil.com>)
	id 1wXfZl-000000006dp-3Owy;
	Thu, 11 Jun 2026 09:36:06 -0400
Date: Thu, 11 Jun 2026 09:36:03 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Frank.Li@oss.nxp.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, shawnguo@kernel.org,
 laurent.pinchart+renesas@ideasonboard.com, antonin.godard@bootlin.com,
 Frank Li <Frank.Li@nxp.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Hugo Villeneuve
 <hvilleneuve@dimonoff.com>
Subject: Re: (subset) [PATCH v2 00/15] var-som-6ul: improve support for
 variants
Message-Id: <20260611093603.898cab77746853acac1e740c@hugovil.com>
In-Reply-To: <178111898079.1109057.8610962818602994576.b4-ty@b4>
References: <20260305180651.1827087-1-hugo@hugovil.com>
	<178111898079.1109057.8610962818602994576.b4-ty@b4>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam_score: -2.0
X-Spam_bar: --

On Wed, 10 Jun 2026 15:18:16 -0400
Frank.Li@oss.nxp.com wrote:

> From: Frank Li <Frank.Li@nxp.com>
> 
> 
> On Thu, 05 Mar 2026 13:06:15 -0500, Hugo Villeneuve wrote:
> > From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> >
> > Hello,
> > this patch series improves support for Variscite VAR-SOM-6UL based boards.
> >
> > The first two patches fix DT/dmesg warnings.
> >
> > [...]
> 
> Applied, thanks!
> 
> [14/15] dt-bindings: display/lvds-codec: add ti,sn65lvds93
>         commit: bd584193a91ef2e190a2cf19f9320387fda1a21d
> 
> Other dts part already picked by me. This binding have not picked by
> subsystem mainatiner by twice ping. I picked it to avoid CHECK_DTB warnings.

Thank you for that.
Hugo.

> 
> 
> Best regards,
> --
> Frank Li <Frank.Li@nxp.com>
