Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2DC226D14
	for <imx@lists.linux.dev>; Wed, 26 Feb 2025 08:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740559977; cv=none; b=dv0GJePGVby3Y14keHdftSmsVKZmPgWZJnanAp0J+UptrbxbiuoMNaCBgni/LkfoQ/uWDLlV1SPu2Sag96z3IkBXFtzhcGU7wTCYQtwkIbZw7Ah3fEr1nRXEcQiWBHFu9a+HgWtwY+LYVZV9wyhHw1fUVS+4ykMl3iz2UKIrwwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740559977; c=relaxed/simple;
	bh=sWyxuVp5GIn2PyGiKOrfhffWXLzuRAsQpL6ER1bVxKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H+4yDl+h609oNIjHuqq9zhGMRbLcVrUVhflawk7tDG7iXpRqpfykhRL+1y9iESOxl822CQCbyaGyy6T8KwATW7cZOA7OfdF937xeL0bAxTEgcBOUqvJIVl/876MHqTnfeUiP7Ju0MNqWN3vz4p5F6n6cz+AL+KsowRXPljq9YVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bm+3tYIR; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bm+3tYIR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740559975; x=1772095975;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sWyxuVp5GIn2PyGiKOrfhffWXLzuRAsQpL6ER1bVxKA=;
  b=Bm+3tYIRHp1WWe6KQHWRMMkGTy7ubaZVK2H6ltsTlSKkTR+dQ0pFmP3m
   QWP4y0GM/6Mb6eLxkNZ481uxZFbCXx7KzhZwdR7zKq3VU9YTFRIebM62k
   1O5aXxFncEtdTPH8hMuVOZBG1EjbPzkXTykGxO5cgn1NV97RX88qnobtn
   zk3P0IUqJ6lC5Bep4tBstfY9p654mNyWIls0clIUTHju1SQ0VKcxVEfAz
   1ehzZHLV0MjbabHilFEjM5ou8lcqIlgzfLeT0NWC9s2MxjSYDK4fr7BT5
   UrXR7tPBQA+Ao4U4NwaxkXyBR0Crj+0LII/XHc0DPALv6H3goj+gHVsRv
   g==;
X-CSE-ConnectionGUID: 2MKj+4A/QLaMTsCc6J6RgA==
X-CSE-MsgGUID: 0yK0HKw0QXqzYip6GgNi1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="52389682"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="52389682"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 00:52:55 -0800
X-CSE-ConnectionGUID: Ij3kjip9SWyZdE5qJLB6Tw==
X-CSE-MsgGUID: Pr4CVODQQOSIt8dTwipeBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="117128677"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 00:52:52 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id AF9D911F944;
	Wed, 26 Feb 2025 10:52:49 +0200 (EET)
Date: Wed, 26 Feb 2025 08:52:49 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] media: i2c: imx219: Report streams using frame
 descriptors
Message-ID: <Z77WYcoV1MhWrpV3@kekkonen.localdomain>
References: <20250220230818.275262-1-demonsingur@gmail.com>
 <20250220230818.275262-6-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220230818.275262-6-demonsingur@gmail.com>

Hi Cosmin,

On Fri, Feb 21, 2025 at 01:08:13AM +0200, Cosmin Tanislav wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Implement the .get_frame_desc() subdev operation to report information
> about streams to the connected CSI-2 receiver. This is required to let
> the CSI-2 receiver driver know about virtual channels and data types for
> each stream.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

In addition to this, the idea has been that the set_frame_desc() could be
used to set aspects of the frame descriptor. My thinking has been that you
could modify the entries, up to the degree supported by the driver, but not
add or remove them. This should be properly documented in v4l2-subdev.h.

-- 
Regards,

Sakari Ailus
