Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF80737C100;
	Wed, 17 Dec 2025 10:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765966817; cv=none; b=KfYDF30u0nSyz3c++xZbvl0tzuVDG4PCaBHxG7veccqAU6ZZK2Q95wvp7LAVCySL3EaFdRJPbKwCK+R/QS+rtQsl0cmcXUO9tgJyxwTrsymq5gdhITnqn0Azur4K+rbKjOCVkan5VTCLPYwPKzxa9lnQlf8oEFRjS3mUinWxrAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765966817; c=relaxed/simple;
	bh=uJcpfVPMB5gnCFhr0GcBKgfEw4ZGLD1pSQ+VPptDnGA=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=c0jrpEa0ZVop5Pm+6udYPYdu31NxZn09C0ac79JGuLpd7JvpOoS96mmZXizj0t8oTQp3PaXfrdlKi3H1w8BNG4tBWkKlJndBdcLL0Dquji59ABOnpA3By69FnPqPRXzwCaTLvbbXEYa8zxHB1sWyxTqXyGF7D0j0ka+iEROnjmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fWTsxN7h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fWTsxN7h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F227FC116B1;
	Wed, 17 Dec 2025 10:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765966816;
	bh=uJcpfVPMB5gnCFhr0GcBKgfEw4ZGLD1pSQ+VPptDnGA=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=fWTsxN7hsVbEvFoHdM6FW8j9okypSLWVz4W+Thu9wMM85IQfe2/WjcxyGZdvVTO8E
	 p/okodvwcbtKo+t9xQw4ARUx93vm5VZCuXD5CucY9HkDBc22WjJFHVTepCCs79M8MK
	 lac76+FdHwSrHTregOjA7q4jZjIzZCJl7OcB+38XgVVjAHePMdeLej+Ppksd1NqQjq
	 PiBLkLZ3qgP1x/4u0Loq8WswRoO+SIVHu+8XLWZ4ecn3Fw70JwMH8+q/rex5V5pKQK
	 iIQZTA4QTqoqeBnO2pNWrd28eBBgfZLtjoZWfWnQ0WDquBqA3ald1dm9uphm3D0HlJ
	 woHzxM1OGr8IQ==
Message-ID: <8c0e9399c1f8bb388eb3f0ee2cf37089@kernel.org>
Date: Wed, 17 Dec 2025 10:20:14 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 15/22] drm/bridge: imx8qxp-pxl2dpi:
 imx8qxp_pxl2dpi_find_next_bridge: return int, not ERR_PTR
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-15-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-15-b5165fab8058@bootlin.com>
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

On Tue, 16 Dec 2025 18:58:48 +0100, Luca Ceresoli wrote:
> In preparation for using bridge->next_bridge, we need to ensure that it
> will never contain anything but NULL or a valid bridge pointer. Current
> code stores an ERR_PTR when imx8qxp_pxl2dpi_find_next_bridge() errors
> out. Instead of fixing that after the facts in the caller, change the
> function to internally set the next_pointer and just return an int error
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
