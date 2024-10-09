Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3C87E765
	for <imx@lists.linux.dev>; Wed,  9 Oct 2024 15:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728487836; cv=none; b=DOkXSeZsE/gcF+k01Gta1HDMl22cfDUxuJ6owuIdQbDpyFDCndotTMDaHPqSyQIwaSuStezbgK114TDe5vdh6mzp0/nHE4HDBtFp/hGi07rpSyPmdgQZ9wvIoYkj4hQIdqzTrLFx+ZFArW6+gp3qjqtkkZfRI9yJvPIpz2a6Z7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728487836; c=relaxed/simple;
	bh=Y+Jl8wTTjGy5pJpFL+qGyh85wq5U1JLARWcextm2vp8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nau9wdsQFWsFZxqhk+/3A2rqvh17y5YXv73XRqggBpx5v5BHnqwn8/kVme7JD9vMp9LHCE41wWMV8leir9kyk1zSJVeqLaKX9CwoIz9bdoiK07QE4wA6n5GKezaKkHAFDXDGV8IW3NDvAismUJvs0gOHe6reovK8rroD3zCGPeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jZ+jmaZV; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jZ+jmaZV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728487835; x=1760023835;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=Y+Jl8wTTjGy5pJpFL+qGyh85wq5U1JLARWcextm2vp8=;
  b=jZ+jmaZVoRJe5SxsKmPjReQw0xsL8tJ6ZXtKcaEs252+c7Kk3VCJKVok
   Wwug1yntzl7ill3IQDMf3yJ6RUmlZOaKDo50oZdwDpJMCNDzuiOnGOZGK
   e6ovXKlIpcIAdfEA+XcgaaO9wvHfN4p74PRXY+Ost+/aL22i/S44fsAUy
   /SXay8T0G6U44apgC7Nz4Q5Fly2TK+4v7qH3DIvHtYjELDMBX4JMK/PgK
   XTt2eOLfDh7gdbN/8wlymILjw7Xxy6nPdma1HbyW6UKbGCSA4f9PFtS53
   NzbMpjHKw5E70Fc8IB3niRnSIPL0V4c//rLFBEpH+6I23//3Y1a8waAKO
   g==;
X-CSE-ConnectionGUID: rhdc2CJJSoSJPM1JVpx3hg==
X-CSE-MsgGUID: SlwVhGTPTdml9EOMNDXveg==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27927346"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; 
   d="scan'208";a="27927346"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 08:30:34 -0700
X-CSE-ConnectionGUID: TLdg4cLXQb2fYuj9rZwE0g==
X-CSE-MsgGUID: KLhvRvpiQQyfrKBCrX9uiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; 
   d="scan'208";a="76383690"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.246.80])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 08:30:32 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, dri-devel@lists.freedesktop.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] drm/imx: add forward declarations for types
In-Reply-To: <d371a079ac984103f0a720e25f2e47b4206348cd.camel@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241009140452.1981175-1-jani.nikula@intel.com>
 <d371a079ac984103f0a720e25f2e47b4206348cd.camel@pengutronix.de>
Date: Wed, 09 Oct 2024 18:30:29 +0300
Message-ID: <87iku18fai.fsf@intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 09 Oct 2024, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> On Mi, 2024-10-09 at 17:04 +0300, Jani Nikula wrote:
>> The imx.h header does not forward declare the types it uses, and the
>> header is not self-contained. Fix it.
>> 
>> Fixes: cc3e8a216d6b ("drm/imx: add internal bridge handling display-timings DT node")
>> Cc: Philipp Zabel <p.zabel@pengutronix.de>
>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Cc: imx@lists.linux.dev
>> Cc: linux-arm-kernel@lists.infradead.org
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Thank you,
>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

Thanks, pushed to drm-misc-next.

>
> regards
> Philipp

-- 
Jani Nikula, Intel
