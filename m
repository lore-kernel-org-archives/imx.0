Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2069042AA0
	for <imx@lists.linux.dev>; Fri, 24 May 2024 09:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716541741; cv=none; b=G2yDMspChu0b/E/0Ug0yZoTCxOg40YsZIHIWMe/1GqSJ8hIN3J09NvqR86oT9BKTnrj5rvaRzXToFu+N34n3MSCmHtxOqBUxXnGehkK0kOl1jrE6JPlkcsgHRP6gtKeg1KzTkZImdfFyai90RAoWdL1akce8CapxUjtlUMr7Z4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716541741; c=relaxed/simple;
	bh=xe/mCiADKWKoHmV7LHdspv3GXZyRbUw0F1g2MLd8RMc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VhGjDdQzglV7OzUYPnlEPttZGudhYCHWpri8GhjdCKbE3jqv0XzMQ6ENvAUzmjEOUX7iWawqe79RQy5Vq1EHf5ijiBm/rHlCE8wyn9cL6diQ6WI26t6pq7NgCxoAXRSNHYhtKDLKGG9zBZSsEB1w7GPyjNTTXHVzq8WAgo6Z3WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jDYlct/e; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jDYlct/e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716541739; x=1748077739;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=xe/mCiADKWKoHmV7LHdspv3GXZyRbUw0F1g2MLd8RMc=;
  b=jDYlct/eBi4ri8B6r/Q1T3KLF+8tXOgx9RhqpY/WPOSGvuedWg60sUW+
   hgb5v/OuXzl3h0HVqCzjJw+I5ThGgVDF8SE2J9UR9rU7ZrGj4uR14sPfN
   ZJNUhma5KfuTLWR7mq+fJarV2chUx0qQZup1JPcIZWIx3KDJoh4r8Qxdu
   1Z/WT3CrYfMZieeKsxJJLhCL63D4pYMl5y7TkjENsEp/OnU5NBkeTUXLz
   BldoJWopaSep2pb38+m7v8bE6KDaXarAEitec5hezKKvDjLV0fu3hft6d
   7h9XMuqxKkxggIiu1L5B8RtsWvuOHTzKOtzL1EPZU3OBEF2urh7lWBEI0
   A==;
X-CSE-ConnectionGUID: eH1qBK80SNi4lecCJLsPjQ==
X-CSE-MsgGUID: XwiQZsjXRlKDfsKXP7B47A==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="16737377"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; 
   d="scan'208";a="16737377"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 02:08:59 -0700
X-CSE-ConnectionGUID: pZZKcbw2Scq9QlM7prupww==
X-CSE-MsgGUID: qLyhjg0QRQW4/K9BALCm5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; 
   d="scan'208";a="34066966"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.108])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 02:08:55 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH 4/4] drm: enable -Wformat-truncation across the subsystem
In-Reply-To: <20240523184128.GA523806@ravnborg.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1716479340.git.jani.nikula@intel.com>
 <719debc351075abc36b2573266bfd4d963361e40.1716479340.git.jani.nikula@intel.com>
 <20240523184128.GA523806@ravnborg.org>
Date: Fri, 24 May 2024 12:08:50 +0300
Message-ID: <87ed9ro9ul.fsf@intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 23 May 2024, Sam Ravnborg <sam@ravnborg.org> wrote:
> Hi Jani,
>
> On Thu, May 23, 2024 at 06:51:09PM +0300, Jani Nikula wrote:
>> With the -Wformat-truncation warnings fixed, finish the job started in
>> commit a61ddb4393ad ("drm: enable (most) W=1 warnings by default across
>> the subsystem"), and enable that warning too.
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> When it is enabled for all of drm then the explicit assignments here
> could be dropped I think:
>
> drivers/gpu/drm/i915/Makefile:subdir-ccflags-y += $(call cc-option, -Wformat-truncation)
> drivers/gpu/drm/xe/Makefile:subdir-ccflags-y += $(call cc-option, -Wformat-truncation)
>
> Just a drive-by comment, I know this patch was mostly for the bots.

Additionally, I didn't want to create any conflicts with [1]. There's no
harm in having the duplication.

BR,
Jani.

[1] https://lore.kernel.org/r/cover.1716471145.git.jani.nikula@intel.com


>
> 	Sam
>
>> 
>> ---
>> 
>> Gut feeling says there are more issues, and my configs just don't catch
>> them all, but let's see what the build bots have to say. ;)
>> ---
>>  drivers/gpu/drm/Makefile | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> index 68cc9258ffc4..644613dbedda 100644
>> --- a/drivers/gpu/drm/Makefile
>> +++ b/drivers/gpu/drm/Makefile
>> @@ -16,8 +16,7 @@ subdir-ccflags-y += $(call cc-option, -Wunused-but-set-variable)
>>  subdir-ccflags-y += $(call cc-option, -Wunused-const-variable)
>>  subdir-ccflags-y += $(call cc-option, -Wpacked-not-aligned)
>>  subdir-ccflags-y += $(call cc-option, -Wformat-overflow)
>> -# FIXME: fix -Wformat-truncation warnings and uncomment
>> -#subdir-ccflags-y += $(call cc-option, -Wformat-truncation)
>> +subdir-ccflags-y += $(call cc-option, -Wformat-truncation)
>>  subdir-ccflags-y += $(call cc-option, -Wstringop-truncation)
>>  # The following turn off the warnings enabled by -Wextra
>>  ifeq ($(findstring 2, $(KBUILD_EXTRA_WARN)),)
>> -- 
>> 2.39.2

-- 
Jani Nikula, Intel
