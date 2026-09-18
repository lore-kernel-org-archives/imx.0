Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1203AAF73
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 07:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789718344; cv=none; b=rJJi9B4g2wB9+t5V8ZZlhXBAuuqIDS5o7HWppqkuxKsl+orvJs77onklFKUywFG73LLAS870CWUW9LnSURct+Tjyz6LUQuewMwh8sJj1E+2VQaOYqiJBSnKNoRVCPN1qCvaefgD5kJRm/lXhY95U/c1ZBisbm3kabFPc+mOo1F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789718344; c=relaxed/simple;
	bh=8haK6WgiFEOnoHWyvEcWLkTNSRdMPzhjH/+6AqmcWbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=edSuWdru7ByhghM4qKeG7l1PE5Rv0t0wnE3YKYEg99tidMh/HvorFgPKwFKkIEEeI4jlL+JtHWntOI0+6klHKXRaa3tFeCYFUB8CF93gbUBWhWoVR/xLvfHCXy2jbSAn3qwqlrIxKHBGlV8VSSQpEHImb+hy13FXBcBY+P3DibY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HSK1CATb; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HSK1CATb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789718342; x=1821254342;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8haK6WgiFEOnoHWyvEcWLkTNSRdMPzhjH/+6AqmcWbU=;
  b=HSK1CATbELmWFKY/b27ZrPr3S7qGDp9JYfuTKCNckQ+L3SBQFpczTXYC
   wSjwDiUID2WpzVUZLkQkP3f6CMsGNMp9dNovnA+fbEEGTyOOSwLaZrp9V
   aJHeWz8tFStCViulAGWSSDw2xirQXJSx75WDIymDZAR2WbjbzCiYeuQeF
   qmhP20F/7AAU/8RMfyw3mAQFL4X27Zg2Sea99M2MGwskz8nQL4ZuIoVbX
   ommblVwALSOlZncKFoW86ygY8NFTNKs3Mw41EeB9jj+wkdoWcCf3/kUON
   cuSNcm/bFDJQ51D1QL76in3vXinL8mjOKv+RChDUcPA+HEcTghYwEdVjR
   w==;
X-CSE-ConnectionGUID: JLJHovLtTEmBPIEnzxJvIA==
X-CSE-MsgGUID: b/mV0OdBQFSjkeTUNilc6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100804276"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100804276"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 00:59:02 -0700
X-CSE-ConnectionGUID: yJ0pgwkOS12m/cnXwuPAiQ==
X-CSE-MsgGUID: oTWrYukfR6WJZBV+cRgm0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2501762"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa011.fm.intel.com with ESMTP; 18 Sep 2026 00:59:01 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 9ABAD99; Fri, 18 Sep 2026 09:58:55 +0200 (CEST)
Date: Fri, 18 Sep 2026 09:58:55 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: typec: pd: mark usb_power_delivery sysfs devices as
 PM not required
Message-ID: <aqzvP4vQcSr8Wb-B@black.igk.intel.com>
References: <20260914093923.1910484-1-xu.yang_2@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914093923.1910484-1-xu.yang_2@oss.nxp.com>

On Mon, Sep 14, 2026 at 05:39:23PM +0800, Xu Yang wrote:
> From: Xu Yang <xu.yang_2@nxp.com>
> 
> The usb_power_delivery device tree (pd, capabilities, and pdo objects
> created by usb_power_delivery_register()/_capabilities(), and add_pdo())
> is a pure sysfs representation with no PM callbacks of its own.
> 
> TCPM's state machine runs in its own kthread and is not synchronized with
> the system PM core's suspend/resume sequencing. A Type-C wakeup interrupt
> can resume the system and let TCPM register a partner's source/sink
> capabilities (and their PDOs) before the parent device's device_complete()
> has cleared its power.is_prepared flag. When this happens, device_pm_add()
> observes the parent's stale is_prepared state and prints a spurious:
> 
>   source-capabilities: PM: parent pd1 should not be sleeping
> 
> This is harmless but confusing. Mark all three device (pd, cap and pdo)
> types with device_set_pm_not_required() so PM core will skip dpm_list
> tracking for them entirely.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/pd.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/typec/pd.c b/drivers/usb/typec/pd.c
> index 766c76d63328..a200d1f50977 100644
> --- a/drivers/usb/typec/pd.c
> +++ b/drivers/usb/typec/pd.c
> @@ -517,6 +517,7 @@ static int add_pdo(struct usb_power_delivery_capabilities *cap, u32 pdo, int pos
>  	p->dev.parent = &cap->dev;
>  	p->dev.type = type;
>  	dev_set_name(&p->dev, "%u:%s", position + 1, name);
> +	device_set_pm_not_required(&p->dev);
>  
>  	ret = device_register(&p->dev);
>  	if (ret) {
> @@ -579,6 +580,7 @@ usb_power_delivery_register_capabilities(struct usb_power_delivery *pd,
>  	cap->dev.parent = &pd->dev;
>  	cap->dev.type = &pd_capabilities_type;
>  	dev_set_name(&cap->dev, "%s", cap_name[cap->role]);
> +	device_set_pm_not_required(&cap->dev);
>  
>  	ret = device_register(&cap->dev);
>  	if (ret) {
> @@ -715,6 +717,7 @@ usb_power_delivery_register(struct device *parent, struct usb_power_delivery_des
>  	pd->dev.type = &pd_type;
>  	pd->dev.class = &pd_class;
>  	dev_set_name(&pd->dev, "pd%d", pd->id);
> +	device_set_pm_not_required(&pd->dev);
>  
>  	ret = device_register(&pd->dev);
>  	if (ret) {
> -- 
> 2.34.1

-- 
heikki
