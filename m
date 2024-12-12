Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B6A558BA;
	Thu, 12 Dec 2024 08:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733990559; cv=none; b=aKM/E4bMgk7kfDndTo5gcavTXykV0xEZiCk0I1v+fgoTCd14PQW1iG/GwEno2LSk3KKDwJUB++n4Opjasmv3cnmT8Ac0KbBh9qWUCKXApdx+Zcy4DOns+/Z5GvyK5mPTHObFrAolen7X6YtLRSpfULG7d/QJQ1OpGirTagvsqOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733990559; c=relaxed/simple;
	bh=QjGG+uPw1phO2lbXkJHqiIAA/RKCYzFXaFQKMiuYHrg=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=k6gQaVaq2dfqMWCTAXCv//+6vyY4WfadxCVdk7ukRqGOIcB+91DGZsVPZo7wB3OepkGiBTwuSiFvM++9u7EK0bWzRiR1eHuOXEGh76kLkCfErh5o0SYgMIxiHqTlBiZ/pkl25yB3EyEpOexwpLQkJUm2NY3nAUiQZnqA6YWiy9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rs3Yu//w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rs3Yu//w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC461C4CECE;
	Thu, 12 Dec 2024 08:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733990559;
	bh=QjGG+uPw1phO2lbXkJHqiIAA/RKCYzFXaFQKMiuYHrg=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=rs3Yu//wQuOG540diDP7gIFMrT1Po6r7u7y4CvaDpyeT8XQ5DOf8/amogqp9klusN
	 xgF+158ew4eiPaPAZNXTjXj+5CA9cYR6NWDCZyi48wZNDSe79iZ5Rm0ipF3fgRiuSj
	 wk9JwG/toXsn6SWS5X0EsyL38XfbPBruEiKXPl1HBJpG1AKmpNZZBQ6dKyZ1enquWN
	 C4TU6QvyIEGYtZM/svHeXj2qpcyo9+BeEBElZUU4UWoYLguHGnmdGjXlpCRJlXqe6A
	 uK0f/jQ68Jl8OzNlPO4i/AOSrjF93ujZ19shfL5X01jFmP+JAPvgK6Hmux4sEkgDSH
	 AlSjMPUkOM07w==
Message-ID: <e3b1230308d20b4e7525952d01eb44fd@kernel.org>
Date: Thu, 12 Dec 2024 08:02:36 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Liu Ying" <victor.liu@nxp.com>
Subject: Re: [PATCH v6 09/19] drm/imx: Add i.MX8qxp Display Controller
 display engine
In-Reply-To: <20241209033923.3009629-10-victor.liu@nxp.com>
References: <20241209033923.3009629-10-victor.liu@nxp.com>
Cc: agx@sigxcpu.org, airlied@gmail.com, aisheng.dong@nxp.com, conor+dt@kernel.org, devicetree@vger.kernel.org, dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, festevam@gmail.com, francesco@dolcini.it, frank.li@nxp.com, imx@lists.linux.dev, kernel@pengutronix.de, kishon@kernel.org, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org, p.zabel@pengutronix.de, robh@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org, simona@ffwll.ch, tglx@linutronix.de, tzimmermann@suse.de, u.kleine-koenig@baylibre.com, vkoul@kernel.org, "Maxime
 Ripard" <mripard@kernel.org>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

On Mon, 9 Dec 2024 11:39:13 +0800, Liu Ying wrote:
> i.MX8qxp Display Controller display engine consists of all processing
> units that operate in a display clock domain.  Add minimal feature
> support with FrameGen and TCon so that the engine can output display
> timings.  The FrameGen driver, TCon driver and display engine driver
> are components to be aggregated by a master registered in the upcoming
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
