Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D1369DF4
	for <imx@lists.linux.dev>; Wed, 10 Apr 2024 13:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712754632; cv=none; b=eGGP5Obx0TdAX1hqUrLIIvByH7qkwBL9WBggh8+5fQBmRNcg5ZxWMBYU1JI2MhNTToVcZzhbHkM32bgnLoinczEbt55lSfDNxEZoikktpDPhiuRqwL7kGbYW9flBWkX3x2OzGtY9+XCqFKj3HqBCvemfN01w8xKAhx7d96x+MM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712754632; c=relaxed/simple;
	bh=Zq+7gHwQ6xZobxyODoase2TKAeFj0EmUWkWykilS2hY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=otDDImkoQ5ksbe2EOVfznmR42flF1uYaetLmnqJHwLQAM2YmxBvMaKTBq9oilABkMMpk2/o0ZvaHjjrJlxl5Fg7n5JXvLkHLHgNzVDAZcbU1sX0awVvcaOslBX577X1B59nqTaeeYr0KDUl72yWXYNT7YRImyrrXRuTug0TwXHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PeIUrgB8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PeIUrgB8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D2E5C433C7;
	Wed, 10 Apr 2024 13:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712754630;
	bh=Zq+7gHwQ6xZobxyODoase2TKAeFj0EmUWkWykilS2hY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PeIUrgB8CWxxtsd2po2hKzZsOqxStY0VfOmyK0fE4akFvxANN5w5F9hXyFNXV1HqL
	 g1cAjiazx+VkT8qCmHE3syKNyGS+i71VQZG3gpWW55YTAwEObXO43sgIUEGKF58SqL
	 BVACPbRZpTo3BFq/FVu1Rbe/wXcdmnu4YdAvdrSjhDhLkxylfVaLuwUpwC5+2bw1/i
	 FFERQOwYKLIP2eXt8hIeeDdHgrroLxhEYWaWkj2/nJFcQxyyqHzQTBE3RYDfYqa2gg
	 MGyz4GGNhoyjMiAkApYw6Yq52Yfou5Uo4XzOGf9gcsFIRpYLZuKQY0ucYyJsPuy8uw
	 z35V4frzTc3lQ==
From: Robert Foss <rfoss@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <neil.armstrong@linaro.org>, Lucas Stach <l.stach@pengutronix.de>, Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Liu Ying <victor.liu@nxp.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, linux-arm-kernel@lists.infradead.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20240304090555.716327-2-u.kleine-koenig@pengutronix.de>
References: <20240304090555.716327-2-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] drm/bridge: imx8mp-hdmi-pvi: Convert to platform remove callback returning void
Message-Id: <171275462600.2936896.18026577866490629134.b4-ty@kernel.org>
Date: Wed, 10 Apr 2024 15:10:26 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1

On Mon, 4 Mar 2024 10:05:56 +0100, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> [...]

Applied, thanks!

[1/1] drm/bridge: imx8mp-hdmi-pvi: Convert to platform remove callback returning void
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=29b39672bc1d



Rob

