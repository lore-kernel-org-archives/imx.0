Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2E515EFA1
	for <imx@lists.linux.dev>; Wed, 10 Apr 2024 13:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712756435; cv=none; b=l3UhkGKW37hU10sjMWx5+HJgtfQP5VS0iFIF3TD1jfk2nsB+G5EPJ+0Hci6pkj0cyqI4l8QBBcYsiNAkOtePNuntufxSxCFdqhUgidMaQ6WVGhiWr0Ugap8Uh7jzEau4LgTeDK7W9yeXKm2GmglzmfJhIaV2k0SRU06ldYU72vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712756435; c=relaxed/simple;
	bh=p18qotW+KxhzNUSz13Cq9m9XVyU+HW3r6Ugdz1OAnps=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l1UZOoDxBqU0TToKaWevGj7lv+D6BEQwKYyZvXqG6yai5xUsSqavf+6Wpn+1m9+GrAVmPd0J+u8UzmErTeFFqU1S6T5f1iKvkqvFzDyYyizviA3OLT7JNEVhh+nhOZYY/oUOiQCC4HyamxPze1zNwHoJ/E16fyhNV31YU8YSo5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EuOWvRYO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EuOWvRYO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06818C433C7;
	Wed, 10 Apr 2024 13:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712756435;
	bh=p18qotW+KxhzNUSz13Cq9m9XVyU+HW3r6Ugdz1OAnps=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EuOWvRYOHfdbejlUerbsP8dhtUr1Qgu6w26fvX7cBEKn2lmz6xed35MKE+xtwk/z1
	 ez+VfTqQrwwKX6F1OucTyqsiwACc9iPGB+YjNcDo8OVxnCiyvSPCLLkAqiRewyNpwK
	 agdlTopV0dLfiwyXs8JNRdwTgQLG5GD4AJAxe+OL+NQpmjlXoObvqK2r1uAzFfKMol
	 RmaOMvf3mNX0IlNbfCf1cE6zgyqS4ma/0oKA8quqfZZoptiGJ4JaunAHTAhwR1Ir6Q
	 BwUyLmLUKzx6SYE/PAyFpXI+1ufhtwmpscWjMOF8GLOXJvFfWUb/VDKEXOXRmg2hap
	 X4pc6gN78flYw==
From: Robert Foss <rfoss@kernel.org>
To: Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Liu Ying <victor.liu@nxp.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Uwe Kleine-König <u.kleine-koenig@pengutronix.de>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
In-Reply-To: <20240304091005.717012-2-u.kleine-koenig@pengutronix.de>
References: <20240304091005.717012-2-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] drm/bridge: imx8mp-hdmi-tx: Convert to platform remove callback returning void
Message-Id: <171275643072.2948280.4830683289450618114.b4-ty@kernel.org>
Date: Wed, 10 Apr 2024 15:40:30 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1

On Mon, 4 Mar 2024 10:10:06 +0100, Uwe Kleine-König wrote:
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

[1/1] drm/bridge: imx8mp-hdmi-tx: Convert to platform remove callback returning void
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=2caad4f7b024



Rob

