Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A253E3C78;
	Mon, 18 May 2026 09:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779094937; cv=none; b=GGX3x/1bqQUKX6VPxzxpmTh6tBrCaDa2MFuumJRl503EO8uGoaoa18shiDluG7v7O2CShmbCWdQHL+9k0bIvejPlxbUDPkdi5zYqoJWFmINW6f+mSluCXVITGyvgVgUe5lL+HoNyxZFne/dHiU4pw9SQZxJzgMQKxERkfbkoa8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779094937; c=relaxed/simple;
	bh=aTG40c4Y+EMGK+d4CAZ/N98jpaLAu/y5lJ167xYZW2Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uaJzMK4FFi/H0oAMRfanukPN855lYWUkiwGzN2YpGMH2/Y1JNvfef+YZOVgs+ApRiB+5R25Z305kcXGbiVal+S2r6/T0mT/QXxy79InER+oSyLvq1JS7QFqsIb+VurCCYcZ4qjfxpWbC4xQ6P6BUpCJs51cXaG7KPzSCKH2CqJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A2xyQunE; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A2xyQunE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779094936; x=1810630936;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=aTG40c4Y+EMGK+d4CAZ/N98jpaLAu/y5lJ167xYZW2Y=;
  b=A2xyQunEdy2LD+l4JKtOZ2T4Bx3DktmzYGFV22B+TJ8cDCrZmOBwvCdy
   7/xsBwAi5F+A33WX/x8Il0wLu6k6+1NIE8gLm3R/WIa54zQte++zAtNvz
   tPjSe5X6vPv0PW0JjUB5/pobX+jhZRXwedKJ6Lnalpyemw/Qs+/BCA7qL
   ua8SbKDkGGtcAg4WKY1v03JxKss6u8z4FS0SE/LseCkpcY3l8q38uv+OW
   P25afX+7IgPWNQZ+g/y7bZnqzmHEe4V1bactM3SBITkjZ7PgtHa4uv9cX
   Av7gSypK41GMZoSwTcV1Z4a3oxju8JgfxcbOc1+dRxY8VZ1XZbiclq3+R
   Q==;
X-CSE-ConnectionGUID: 8bS6HDWJQ/WxdAjw6T4ofw==
X-CSE-MsgGUID: SIXjyotzR/y+Y5pVIfayNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="80115894"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="80115894"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 02:02:15 -0700
X-CSE-ConnectionGUID: rgiK3bF5SQqLbFzGvOQIYA==
X-CSE-MsgGUID: YVgfR5HuRPGOTbE6/t83LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="239627066"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.1])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 02:02:06 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jonas Karlman <jonas@kwiboo.se>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Liu Ying <victor.liu@nxp.com>, Sandy Huang <hjc@rock-chips.com>, Andy
 Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@kernel.org>, Christian
 Hewitt <christianshewitt@gmail.com>, Diederik de Haas
 <diederik@cknow-tech.com>, Nicolas Frattaroli
 <nicolas.frattaroli@collabora.com>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 16/22] drm: bridge: dw_hdmi: Use display_info is_hdmi
 and has_audio
In-Reply-To: <20260516183838.2024991-17-jonas@kwiboo.se>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260516183838.2024991-1-jonas@kwiboo.se>
 <20260516183838.2024991-17-jonas@kwiboo.se>
Date: Mon, 18 May 2026 12:02:03 +0300
Message-ID: <937d97789b78c4ad463c7e17f48f044837402537@intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, 16 May 2026, Jonas Karlman <jonas@kwiboo.se> wrote:
> -	/*
> -	 * FIXME: This should use connector->display_info.is_hdmi and
> -	 * connector->display_info.has_audio from a path that has read the EDID
> -	 * and called drm_edid_connector_update().
> -	 */
> -	edid = drm_edid_raw(drm_edid);
> -
> -	dev_dbg(hdmi->dev, "got edid: width[%d] x height[%d]\n",
> -		edid->width_cm, edid->height_cm);
> -
> -	hdmi->sink_is_hdmi = drm_detect_hdmi_monitor(edid);
> -	hdmi->sink_has_audio = drm_detect_monitor_audio(edid);

Yay! \o/


>  
>  	return drm_edid;
>  }

-- 
Jani Nikula, Intel
