Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057513AEF55;
	Wed, 19 Aug 2026 16:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787156899; cv=none; b=NSw2vOGyKRp88bWCBi5/wQr+oAYB/teVPIz6CSsaxsQse/aC7QdTHCEYXQpG1HSYVIS8n5sbblrUlMkS8omNjkmt8r2MNYrE9DHjI+Hn6+LMOVkBjvSSUCrxmZipVqb4nFM8W3EE345xjrW7FR95MT/DCnoaVlyAY6qCjbmH+zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787156899; c=relaxed/simple;
	bh=IdepXRfOEoQRVYwcpWcyKZs9GtmS+di7yb74Y6cRJNg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PtO8tivrtv6FGA57l54BgIclO8FuasDfQucC2GNTeIoDep9rA1DGZF8zYEnUsr3nROZaH0PjhDQ3oz0N1flniY00x3xt3gwvYESfEacar+XssJawGbpzAiPIDVn/yJszCMu7M1O6YLGueGPB5t6dxMvOTl9NhkHbQIfMO9kSxlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l/6WUj6Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l/6WUj6Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E7531F000E9;
	Wed, 19 Aug 2026 16:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787156893;
	bh=IdepXRfOEoQRVYwcpWcyKZs9GtmS+di7yb74Y6cRJNg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=l/6WUj6QP3QWDdH3LfH9Wm5cGOhFPpX/LGylk/NmXBqs2lDQNmODI5cjKtoQoePdh
	 9luPw4NMCmRaT90Y4ioOU/Js/yg0jbSiVC7WJsifTFwSic2Ns0JZ3B0ES/bKj9Uinz
	 kuCmuErJzjFh6GsZYPgU+Ilb9oO2OssYBGRHFLWUKXcRtjMAp04TOXWsIfb71QlCUl
	 NkMrmcqGJJlHsA0mZA35pFYyu8jIJI4PjYwCyHT1OVevBtTUBz38+YVy72poW2jm3r
	 IpIENmIwECCvJzK3VU6JO322abbhyxs1Hv8X/ONMiNWm6ockA9jTA+Py6Lqh7WZp/2
	 MsCHtzBWw7wIw==
From: Thomas Gleixner <tglx@kernel.org>
To: Frank Li <Frank.li@oss.nxp.com>, Zhipeng.wang_1@oss.nxp.com
Cc: Marc Zyngier <maz@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Jindong Yue <jindong.yue@nxp.com>,
 xuegang.liu@nxp.com, linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/5] irqchip/imx-irqsteer: Use devm to manage the IRQ
 domain
In-Reply-To: <aoW8tbTmjMKs1IEO@SMW015318>
References: <20260819090543.585131-1-Zhipeng.wang_1@oss.nxp.com>
 <20260819090543.585131-3-Zhipeng.wang_1@oss.nxp.com>
 <aoW8tbTmjMKs1IEO@SMW015318>
Date: Wed, 19 Aug 2026 18:28:09 +0200
Message-ID: <87tsoqjcrq.ffs@fw13>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Aug 19 2026 at 09:24, Frank Li wrote:
>> Fixes: 28528fca4908 ("irqchip/imx-irqsteer: Add multi output interrupts support")
>
> Nit: First patch also need fixes tags to backport.

No. That first patch is not fixing anything and I just explained how
this is done.

