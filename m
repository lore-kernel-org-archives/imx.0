Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2017E2E8E03
	for <imx@lists.linux.dev>; Tue,  2 Sep 2025 12:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756815029; cv=none; b=emuU2e9FBr/Duabla4WdZu1UJmhJqHUl7sFJXQEV4yIscS4HMtBBZC/4tXUni6GviGD4ofACOlPKY5h3XX6fdbIC1mIqDokFksvRpL/hkJsJ98TXq0CMoIahzK3ljYnKWZMFcYNOvIDLBCRAXt4ZLJXSNP7WSbilDVDNcCmmFFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756815029; c=relaxed/simple;
	bh=EIhkVcqZh7xoh6EwQB0Ef5Yl6j+ZOHuN2tJZwCUV8XM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HQkKF9zClnjgrHZ7v8Cow4nea3py9WwS4YE5muUKSKXvr/h+xBZ+QIX6fqo7njWx0PjzkJBFLAz6lP3JDeW3p0Hv5OHLc/k2B01b4Hb2oF7EabrxLlqEnErbn/sKI3vINkgyaz4bfhPOkQ8H7TmiEb6MJ2Ne8hkEg1AFxlohgC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RKUMsxHY; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RKUMsxHY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756815028; x=1788351028;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=EIhkVcqZh7xoh6EwQB0Ef5Yl6j+ZOHuN2tJZwCUV8XM=;
  b=RKUMsxHYpPtksYaO4+9i6R5h/DNjmZGdkJ+N2GRHIb871GHMz9U0EaRg
   NNjszKe+dezfhzkQ9fTSKWpvAJNv6Q7gNpOqg2XDVdgFE+yu05EEk5pO6
   +6RhuTyEghEKehNLMhFH8l3hDhrAmh91Sus8AnEX0bIcmvEjdnxQHr8cX
   JfnWm6g2QnpyPodQaVNYR3ZbOjrD9fm/o7Bqb+NyTnzv125qHhcMbguy6
   XENDPn3f6LqWThKqSHrswQDamDrk7hINCtWRU7OEMfH0jR2H3HsNMvA9s
   nCrDmULQx9pvGB0s6PXLFVcM7AufEaNfnSnStiJtlL8W39Rdffxbzi6Af
   Q==;
X-CSE-ConnectionGUID: /VOH56LiT5KkbhXneAdbmw==
X-CSE-MsgGUID: 57cL7UzES8yxEQSpqeNg5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62916782"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62916782"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 05:10:28 -0700
X-CSE-ConnectionGUID: sqCCoMu9QZOFalIu441odg==
X-CSE-MsgGUID: TeSFeNUGQKyxcCnu6WSKPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="172104612"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.246.193])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 05:10:18 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Liu Ying
 <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Andrew Morton
 <akpm@linux-foundation.org>, Zijun Hu <quic_zijuhu@quicinc.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 1/9] list: add list_last_entry_or_null()
In-Reply-To: <20250902135709.19e1ef54@booty>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-0-888912b0be13@bootlin.com>
 <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-1-888912b0be13@bootlin.com>
 <aJJ9ttmL7wiw41fY@smile.fi.intel.com> <20250814183609.3788a6df@booty>
 <aKXRHAyfPHPpZmMs@smile.fi.intel.com> <20250902135709.19e1ef54@booty>
Date: Tue, 02 Sep 2025 15:10:14 +0300
Message-ID: <2f156cf6c57d0054c20b10f931ceef9a575d533f@intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 02 Sep 2025, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> Hello DRM maintainers,
>
> On Wed, 20 Aug 2025 16:43:56 +0300
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
>
>> On Thu, Aug 14, 2025 at 06:36:09PM +0200, Luca Ceresoli wrote:
>> > On Wed, 6 Aug 2025 00:55:02 +0300
>> > Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
>> >   
>> > > On Fri, Aug 01, 2025 at 07:05:23PM +0200, Luca Ceresoli wrote:  
>> > > > Add an equivalent of list_first_entry_or_null() to obtain the last element
>> > > > of a list.    
>> > > 
>> > > Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>  
>> > 
>> > Thanks Andy!
>> > 
>> > However I'm not sure when and where this should be applied.
>> > 
>> > Except for this one patch, all patches in the series are for
>> > drm-misc-next. Also, patch 1 is currently not needed by any other
>> > series AFAIK.
>> > 
>> > Based on the above, is it correct to assume that the whole series can
>> > be applied on drm-misc-next? (when other patches will have a
>> > R-by/Ack-by of course)
>> > 
>> > Also, is Andy's A-by enough to apply this patch?  
>> 
>> The list.h is common for many, I think going via DRM with my Ack is enough
>> based on the Git history of my changes in this file. But if you want more
>> reliable source, get an Ack from Andrew Morton.
>
> While applying this patch with dim on drm-misc-next, dim push-branch
> failed because:
>
>   dim: ERROR: cb86408b1fc2 ("list: add list_last_entry_or_null()"): Mandatory Maintainer Acked-by missing., aborting
>
> Looking at the dim code, it is looking for a Reviewed- or Acked-by from
> people listed by `scripts/get_maintainer.pl --no-git-fallback -m --nol
> --norolestats`. but that command returns an empty string, so it will
> never allow me to push.
>
> How can I get that commit pushed to drm-misc-next?
>
> I think `dim push-branch -f` would work: am I supposed to use it?

Try 'dim -f push-branch'. The parameters after push-branch go to git,
and you don't want that.

BR,
Jani.

>
> (not sure my committer rights allow that)
>
> Luca

-- 
Jani Nikula, Intel
