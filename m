Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A5B306760
	for <imx@lists.linux.dev>; Wed, 13 May 2026 14:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778680850; cv=none; b=n4OpD33phEWJk22OvzQJQX1taw4+xlBWpAMdLrJEiCGEW5RuytFxiDjAcnGb4EupVb5HXlwt9Kgog6P9bzdTS5xcIqXSBOuitJAHKTb8gYdeRYFUZYAVgJwYdVr0ihTE6zgBuU+HlSYuwurv6l4VJRKqQ/nR0mPrQnbDJsP+GO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778680850; c=relaxed/simple;
	bh=Bw1C9JL2piKJzvwC5VL//CVGEW1j0mlc7RMZSghq6tM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GAgq8DSrOlhDLPnRtu+fRJopmD7jFHaAZ/RFhAQDTDmtryx8TN3F3HIrArvcGcML1Xunla8+prYbcfCGqwtzcFjHZgahesJmIV+zpqAlOIYnifWutjy7Avkdd9KMRKTDsZdA+bvk0eIY9yrWRjksW3tQrcLNskzUjdGQOjK569E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bhijEQ/H; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bhijEQ/H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778680849; x=1810216849;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bw1C9JL2piKJzvwC5VL//CVGEW1j0mlc7RMZSghq6tM=;
  b=bhijEQ/HhHWUs+SMyXu60xsJkqSC2NR1QNgFxHse5qOi+Ns/kG/I8RR0
   MrebFenvQ1OENxkF5dCWFbHYFqGJjYbcHvZOz0KV8uGWdX/URJ9scsPk7
   glO3TsxSLa84QADLK+2D3lPZE0sgXEp/2bYJDGntK4DfRNChHsICjYYzo
   RNWmGN3zGGH44FSDTQVHWb8m1eQAT3keEggiLz083wF+ujtCW2bkHG4je
   u6FDO2diHIhE3EwNAqjcYERYgZ9WsJxeRgMO//IhoGphSN4LdNltZgPbW
   VgbRvga2xvLOZIIXUTv8yDVPOFFXZZJrSs08zHBy3nX0u25uNtgGceBop
   Q==;
X-CSE-ConnectionGUID: S7wXOXFsQMO69y8UjQEALw==
X-CSE-MsgGUID: 3IxOM4uLRLCrbrXUtCe3vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79786083"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="79786083"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 07:00:49 -0700
X-CSE-ConnectionGUID: 0GOQXddWRsmNK6MjzDE6vA==
X-CSE-MsgGUID: mqz3WQyNQiGCqUCReIfDsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="239902049"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.111])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 07:00:44 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 012BF121C9E;
	Wed, 13 May 2026 17:00:43 +0300 (EEST)
Date: Wed, 13 May 2026 17:00:42 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v4 3/5] media: hi846: fix modes handling for different
 lane cases
Message-ID: <agSECpQ2xiP80E24@kekkonen.localdomain>
References: <20260511103927.279550-1-mitltlatltl@gmail.com>
 <20260511103927.279550-4-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511103927.279550-4-mitltlatltl@gmail.com>

Hi Pengyu,

On Mon, May 11, 2026 at 06:39:25PM +0800, Pengyu Luo wrote:
> When using 4-lane, v4l2_find_nearest_size may return an unsupported
> mode, 640x480 mode, and it is set to the default mode.

Could you use v4l2_find_nearest_size_conditional()?

Ideally we should get rid of the cur_mode field altogether.

-- 
Regards,

Sakari Ailus
