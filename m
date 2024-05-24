Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2493D127E2A
	for <imx@lists.linux.dev>; Fri, 24 May 2024 09:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716541641; cv=none; b=M9WMYq/WXhERojIUADMI+YUt9nidf7G7hqVQvEPNOKC8c6NeWfk7GA8XxVBlM0E7BmmChROG5LHqNpUKHcrW7WLNoOSPIfFGlkYPwka+ydAUTqA0GIUYQhBpDwk+CeBaobehKc2Wspa/x4yBWgcfejF69UTYqZcfAAKnK45v6Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716541641; c=relaxed/simple;
	bh=Rdxy52CknPfn2K6B1fUq0eTIM1EjVHuABUJyVwPSQOE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sjhhNayG1LqJPrIEGodLwtuKdBVhs8bpUuQaU7B7WtjHmS0sbbBzgROYYiCF728zGCbIrpph0sFzeDuQPGOkRNkeAaKfDgdYZNBbtnwQE8vKTBVYPL1o2UzuusPEBz321aImLqFK7+UFBpr0E056+523A7gpyeCXeiuAcEhdemI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fqryNQYR; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fqryNQYR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716541639; x=1748077639;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=Rdxy52CknPfn2K6B1fUq0eTIM1EjVHuABUJyVwPSQOE=;
  b=fqryNQYRqSqNrpcEFogv3Ot3o/7tTFepyg3CnFHxPbGbqYCYKbduXuqf
   oU92XskW6CaKknlR2T3pUapm5BIlV0a7wQ71sp3pQA3HteUwoZw5P/8XD
   zGHXPNY5TV+SW0Ny6Vyzkt6nJzJvFHxJvtioP4L5Hag8sHTD8lPlyfzXk
   +9v2kWXgalBVneNSa0EdTqY4Ica7D0zDIVjaqUf5vAehm6PYNKZ0DzlNQ
   ZaS89jKd3mXkYGfHljOLTGXGQcvJEHG6nCka26PDMZl7VwOMKLVeY8+i7
   JW1Ts8xBc6eQJgetNIVg59+DkZzNyGlaAwqyRJk2E5FxMMe0QiYjSs2gV
   w==;
X-CSE-ConnectionGUID: pDlmwhnyRMia8VchhuWJAQ==
X-CSE-MsgGUID: Nioiy7MuTKGQjnZvL2oA+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="24320694"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; 
   d="scan'208";a="24320694"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 02:07:18 -0700
X-CSE-ConnectionGUID: phUukf5zRtmPZ1ADWSnpeA==
X-CSE-MsgGUID: jaqfYA8xQe6Rrm5GRsylbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; 
   d="scan'208";a="33840722"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.108])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 02:07:16 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>
Subject: Re: [PATCH 1/4] drm/amdgpu: fix -Wformat-truncation warning in
 amdgpu_gfx_kiq_init_ring()
In-Reply-To: <CADnq5_MDPH-WxpucjQpKsCAk8mKa75upbcGN3KJo_dqKts4kTg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1716479340.git.jani.nikula@intel.com>
 <4b9ca4a1bd8e77f2d9b912b4af5d4fbdec13e801.1716479340.git.jani.nikula@intel.com>
 <CADnq5_MDPH-WxpucjQpKsCAk8mKa75upbcGN3KJo_dqKts4kTg@mail.gmail.com>
Date: Fri, 24 May 2024 12:07:12 +0300
Message-ID: <87h6eno9xb.fsf@intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 23 May 2024, Alex Deucher <alexdeucher@gmail.com> wrote:
> Already fixed with this patch:
> https://patchwork.freedesktop.org/patch/594864/

Great, thanks!

BR,
Jani.



-- 
Jani Nikula, Intel
