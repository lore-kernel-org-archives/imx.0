Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0282DE715
	for <imx@lists.linux.dev>; Thu,  4 Dec 2025 12:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764849882; cv=none; b=nAJ1mDjsd4drSS3dE1JpdPgjitcKwq+RMmH/ej8Rbe7KE703Mo70kymkyDbKp2wVtLLMM/by/BVrh34asJQjCAkTKD4hEOxA4N+KHYSTOtMMlEavTjHkA+b9EaO4etSHMf/Z33L5A6YsYBJcu0nM4MMGdAAwMlGe2vholLpjAxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764849882; c=relaxed/simple;
	bh=gahuY5j4rl/CtnfZX+Oxd0AZSKt23iPZjS1LKaxOyig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HWCTpl+3KC4AStlnKEVL6/pfshR6fiRhrLQOBFZ1T+aO+/ZgTwtFtRnmOvzz77JUqBgCM3QFqkdaJUUgPwrcOyYjjlBmPsAcpASH1KVgzhbjQ/keXUe4Id693c65LRcGzXGw1kaJLXH1a908ErcWpsIIrpz0tYeEyQpjNwwJyac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mwMfR45G; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mwMfR45G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764849881; x=1796385881;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gahuY5j4rl/CtnfZX+Oxd0AZSKt23iPZjS1LKaxOyig=;
  b=mwMfR45Gtp7+2hbqN1ZcJn7kO9muXgNc8M2DbQYIHgDL0wVyj6tfGp1c
   Zvnvf6Fmw2lJOcYZ9aKUCq8wkFTzAUrJxw6lk7qNEKWhm4k0XLfRU9aVg
   K845Cs/PLVkvA9m9PEQBL1mJCgQVc8Gl+LP/smRTGzKxUgM8hVPWA4F6m
   qCw6ydX0lB8XVBuRBIDtupba4EFC8Lv8qLlZJEZHqfczTU1BxNZMn7hMn
   tx59FwkLvdZTEWpXZmk/k653RRNL/En2SqarnAAKJBYe1lrrwLWrbVheK
   9QrrbfNF/qt4qphpsSFkR+4uN8eNnXsXs2fbqsw+ovEXHwKsFIXAT06XW
   A==;
X-CSE-ConnectionGUID: HHATQExWTXu6pyCD80kBMw==
X-CSE-MsgGUID: +8DGq1f2RWeHeNkUwk0E5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66941074"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="66941074"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 04:04:41 -0800
X-CSE-ConnectionGUID: XZTvr8laRxiwi8TbSrRJzg==
X-CSE-MsgGUID: mLq186wHTMKddEFlXQFHCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="195777812"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.222])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 04:04:36 -0800
Date: Thu, 4 Dec 2025 14:04:33 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Kalle Niemi <kaleposti@gmail.com>, Rob Herring <robh@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-arm-kernel@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com, linux-gpio@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org
Subject: Re: [PATCH v4 01/29] Revert "treewide: Fix probing of devices in DT
 overlays"
Message-ID: <aTF40eLT2YTB8OoO@smile.fi.intel.com>
References: <5cf2a12a-7c66-4622-b4a9-14896c6df005@gmail.com>
 <CAL_JsqJjm12LxpDg6LmpY=Ro_keHwnrWiYMLVnG=s_pSP4X2WQ@mail.gmail.com>
 <072dde7c-a53c-4525-83ac-57ea38edc0b5@gmail.com>
 <CAL_JsqKyG98pXGKpL=gxSc92izpzN7YCdq62ZJByhE6aFYs1fw@mail.gmail.com>
 <55076f4b-d523-4f8c-8bd4-0645b790737e@gmail.com>
 <20251202102619.5cd971cc@bootlin.com>
 <088af3ff-bd04-4bc9-b304-85f6ed555f2a@gmail.com>
 <20251202175836.747593c0@bootlin.com>
 <dc813fc2-28d2-4f2c-a2a3-08e33eec8ec7@gmail.com>
 <20251204083839.4fb8a4b1@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204083839.4fb8a4b1@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Dec 04, 2025 at 08:38:39AM +0100, Herve Codina wrote:
> On Wed, 3 Dec 2025 12:11:45 +0200
> Kalle Niemi <kaleposti@gmail.com> wrote:

...

> Saravana's email (Saravana Kannan <saravanak@google.com>) seems incorrect.
> Got emails delivery failure with this email address.

According to the Git history his last activity was in August 2025 with
adding (surprise) his name to one of the MAINTAINERS records.

And according to lore, his last message was in October 2025, so I dunno
what's going on there.

-- 
With Best Regards,
Andy Shevchenko


