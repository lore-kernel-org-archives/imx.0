Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AE3DDBE;
	Tue, 31 Dec 2024 01:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735607070; cv=none; b=rW0dZhtuJ02hKrR3AYcDxlN4/o7ENXn1/yDkLL+I3XfP1zzMqUXNXwr35S7QbJHvKSkZMiLiW+KLmFsnYdeTSXHvRhKleOIAYprJMLxVTpQqsIOgVm2XG3ObUshju9/LMwyOhkN9OLvhZWubKmDnZ7uHTV/a/UnKFZxP6diHMS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735607070; c=relaxed/simple;
	bh=RH7kiMlpAI/s9h2kVGwIXwlCQELmu+Tyxzib/pl8Jko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EA0Gah1IlEES4FP3lFcVh/+2trDKynAJA1Ob6yQeF2eFWnjAv9xwwaiX0EJRs1GnJRc7OMxJPQ4AV9NAeT79LkALE+jqgOBDJVrquTDjNcPXH6NIpwZXGdGRlTOWxF8JWaHO4D59S5cFHSjDvKI8oufSCbpRk6CuYbAun4NhtZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OAhZCtBL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OAhZCtBL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BF7CC4CED0;
	Tue, 31 Dec 2024 01:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735607069;
	bh=RH7kiMlpAI/s9h2kVGwIXwlCQELmu+Tyxzib/pl8Jko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OAhZCtBLrHh3TXXoNx/BpQt+jcLzZqP3GygqEuviZj9mVkGsUQ0Aa2peOAkQXgWyK
	 gxh46RJqW2OpgTi6O5GxrJ9ZfJq/w43873IXXBCvER7LN/4XQwabDpxhJywLktgLRc
	 S1c2NK5Px3YRJtWmE8cNNJa5FCO6bDdOGfcW5B7QRHk1ilKmYrhWkYt5dL7fCJ42pG
	 Pg+QJkbFnFplVX1mT/S54/eALZq4vJIi68bOZoAyzSFOVdfSKkNDMRVga2pz6xiLV/
	 iWvGkxZPdSmAxqOCaF2LxhCRu8AzuroBZmrvJXqLlrmHGYj1ZpYxaAnoJwPw8TzQTZ
	 cRlzjaCgvGbGg==
Date: Mon, 30 Dec 2024 19:04:27 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Jonas Karlman <jonas@kwiboo.se>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Robert Foss <rfoss@kernel.org>, devicetree@vger.kernel.org,
	kernel@pengutronix.de, Oleksij Rempel <o.rempel@pengutronix.de>,
	"open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	David Airlie <airlied@gmail.com>, imx@lists.linux.dev,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Maxime Ripard <mripard@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 05/10] dt-bindings: display/lvds-codec: add ti,sn65lvds822
Message-ID: <173560706743.2857783.191576326455714393.robh@kernel.org>
References: <20241219-skov-dt-updates-v1-0-38bf80dc22df@pengutronix.de>
 <20241219-skov-dt-updates-v1-5-38bf80dc22df@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-skov-dt-updates-v1-5-38bf80dc22df@pengutronix.de>


On Thu, 19 Dec 2024 08:25:29 +0100, Ahmad Fatoum wrote:
> Add compatible strings for TI SN65LVDS822, a FlatLink LVDS receiver.
> 
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
> To: Andrzej Hajda <andrzej.hajda@intel.com> (maintainer:DRM DRIVERS FOR BRIDGE CHIPS)
> To: Neil Armstrong <neil.armstrong@linaro.org> (maintainer:DRM DRIVERS FOR BRIDGE CHIPS)
> To: Robert Foss <rfoss@kernel.org> (maintainer:DRM DRIVERS FOR BRIDGE CHIPS)
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com> (reviewer:DRM DRIVERS FOR BRIDGE CHIPS,in file)
> Cc: Jonas Karlman <jonas@kwiboo.se> (reviewer:DRM DRIVERS FOR BRIDGE CHIPS)
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com> (reviewer:DRM DRIVERS FOR BRIDGE CHIPS)
> Cc: David Airlie <airlied@gmail.com> (maintainer:DRM DRIVERS)
> Cc: Simona Vetter <simona@ffwll.ch> (maintainer:DRM DRIVERS)
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com> (maintainer:DRM DRIVERS AND MISC GPU PATCHES)
> Cc: Maxime Ripard <mripard@kernel.org> (maintainer:DRM DRIVERS AND MISC GPU PATCHES)
> Cc: Thomas Zimmermann <tzimmermann@suse.de> (maintainer:DRM DRIVERS AND MISC GPU PATCHES)
> Cc: dri-devel@lists.freedesktop.org (open list:DRM DRIVERS)
> ---
>  Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

