Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D94387B0A;
	Wed, 17 Dec 2025 10:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765967106; cv=none; b=KMOBOG4uAkdO1dhaRzUrt80FCYwqKo4AepHKzQNazArjFxFdjvKXHcsDIfqb+LbFmXQA5Jdj2z6wFISc5HvaIdf2SHjiGeOuvkoyrFbMKyUaLnnjUy/VwN8BnWfh6AfFxCzhOMbR2GB4W9WeXKf3KgQIwp/qoydWWKmKigL+RsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765967106; c=relaxed/simple;
	bh=piGOz6XLwLmQStZCMaEswKGAlrxEZpMArYG0KMxzGk8=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=buiBUHxfLgW0VNEBYXxftSlghTbQ0J1nAfBQCdvU8Y2/PWqvJdWVibaLZFzm+QmmsN0jalCrSGqo+1VoGFsG4jkzdWikD5+Qv9chnXrjxYRdBScZYxfYhqgwR4Rcch11a5eiyOHszKArGmXhX+xCvvU57zEX/iCS52pWotNUTZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EOPQSEDw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EOPQSEDw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0376C4CEF5;
	Wed, 17 Dec 2025 10:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765967106;
	bh=piGOz6XLwLmQStZCMaEswKGAlrxEZpMArYG0KMxzGk8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=EOPQSEDwOiu0mSJu6Z6W+EyM/uxhXk+FScR/RinD0cNHcpBI7I3cj1OQmLCTWQ+X2
	 tqE+aofbQTtv1f7Y/wexf/hv5B4V3pvLPXt8fkCwQYrjnefOnxy5tqhkzCYKgUzU+D
	 gpyaKz6NlQOg2xzefPeeJoSRPl1iSCpxUav59vCf40pIoO1zhV+IheALsivwNbK0ZC
	 E6Sb81XYWfo/ztTcLp7GrWzS8WrCq3FDnsYSAWYK5aBjpkHJ3X8KcB4miZYD234f/l
	 +3kadcdvNwrABQdoB+9eQVC4ffG9NDALtOjVpJVz4vAY4IgzJc68mlLgvyottomNHx
	 ecIFb7Vc+6xDQ==
Message-ID: <aabaa59f3204da6203c62c5ba01dccd0@kernel.org>
Date: Wed, 17 Dec 2025 10:25:04 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 21/22] drm/bridge: imx8qxp-pixel-link:
 imx8qxp_pixel_link_find_next_bridge: return int, not ERR_PTR
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-21-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-21-b5165fab8058@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, "Alexey
 Brodkin" <abrodkin@synopsys.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "David
 Airlie" <airlied@gmail.com>, "Fabio Estevam" <festevam@gmail.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jerome Brunet" <jbrunet@baylibre.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Jonathan Corbet" <corbet@lwn.net>, "Kevin
 Hilman" <khilman@baylibre.com>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu
 Ying" <victor.liu@nxp.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Phong
 LE" <ple@baylibre.com>, "Robert Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn
 Guo" <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

On Tue, 16 Dec 2025 18:58:54 +0100, Luca Ceresoli wrote:
> In preparation for using bridge->next_bridge, we need to ensure that it
> will never contain anything but NULL or a valid bridge pointer. Current
> code stores an ERR_PTR when imx8qxp_pixel_link_find_next_bridge() errors
> out. Instead of fixing that after the facts in the caller, change the
> function to internally set pl->next_bridge and just return an int error
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
