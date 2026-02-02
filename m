Received: from mail-m3283.qiye.163.com (mail-m3283.qiye.163.com [220.197.32.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3593772627
	for <imx@lists.linux.dev>; Mon,  2 Feb 2026 06:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770013447; cv=none; b=A+9eVtyNrgk5TKUqnqudjutay1fhFEboq8ppbxCxvPV11x4tmjQHuvkVn8yFhf+PV0Wp5LofifiFbk9WlmBymU2KtwIVbKH3rJqnAtfH5kojn6Y+aCh5g8EL+xazLavwOn1TO76paCj3WCTnD/u0Gj4KALcfHF4xVXmS8K3tt/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770013447; c=relaxed/simple;
	bh=eN6Hjz3OEO4k7vAq9qMZrLEjctiXSbhybB5C/fz8ENI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vkt0xb2sbcOqha0wRLSkSYu23TYU5RkaccRItbBESqST+wgPl0q8gx8ie+gfo/DJqn/YxclhmOwwdwzIzHuzkcQM12S991WSpFAw0lX9JQDi9G+Szxr9h+KlxulnUs6kqB6AGo2KZjehJUe7+PmK4vmecWE/E4RV5/C0+R+GoEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=Ts+rjOYN; arc=none smtp.client-ip=220.197.32.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="Ts+rjOYN"
Received: from [172.16.12.43] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 32be0b186;
	Mon, 2 Feb 2026 10:54:40 +0800 (GMT+08:00)
Message-ID: <7256ecf9-b10b-428c-a1a6-e35e80a686ed@rock-chips.com>
Date: Mon, 2 Feb 2026 10:54:40 +0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 05/18] drm/bridge: Move legacy bridge driver out of imx
 directory for multi-platform use
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 jingoohan1@gmail.com, p.zabel@pengutronix.de, hjc@rock-chips.com,
 heiko@sntech.de, andy.yan@rock-chips.com, dmitry.baryshkov@oss.qualcomm.com,
 dianders@chromium.org, m.szyprowski@samsung.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20251217093321.3108939-1-damon.ding@rock-chips.com>
 <20251217093321.3108939-6-damon.ding@rock-chips.com>
 <DG2S064XPGXL.1MQDAKWZEK50K@bootlin.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <DG2S064XPGXL.1MQDAKWZEK50K@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9c1c4614a203a3kunm30717a4a5e3cc3
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUpIH1YYThhOSU4YSx9NGUpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=Ts+rjOYNWVt4hbMscObl1buxmrB9NU9+2g8/C/wLM5u+Eax2HmzsZNBv3v9cSSiwtBrolYAc/VUT2lnOCMJlGZFJvoa/6jdZZHVRNmmEfdv7qqSTtSwqul/F044OZvyweToEzCvHftxXwzhDu5LwMZ0B560xSqMTzoi2rXZ5pg0=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=xUpUiGwHMrZ8s9RiBnn1fJV1AjhFTWfzEI9RrVPC33c=;
	h=date:mime-version:subject:message-id:from;

Hi Luca,

On 1/31/2026 8:33 PM, Luca Ceresoli wrote:
> Hello Damon, Dmitry,
> 
> On Wed Dec 17, 2025 at 10:33 AM CET, Damon Ding wrote:
>> As suggested by Dmitry, the DRM legacy bridge driver can be pulled
>> out of imx/ subdir for multi-platform use. The driver is also renamed
>> to make it more generic and suitable for platforms other than i.MX.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>
>> ---
>>
>> Changes in v7:
>> - Rename legacy-bridge to of-display-mode-bridge.
>> - Remove unnecessary API drm_bridge_is_legacy().
> 
> ...
> 
>> --- a/drivers/gpu/drm/bridge/Kconfig
>> +++ b/drivers/gpu/drm/bridge/Kconfig
>> @@ -244,6 +244,16 @@ config DRM_NXP_PTN3460
>>   	help
>>   	  NXP PTN3460 eDP-LVDS bridge chip driver.
>>
>> +config DRM_OF_DISPLAY_MODE_BRIDGE
>> +	tristate
>> +	depends on DRM_BRIDGE && OF
>> +	help
>> +	  This is a DRM bridge implementation that uses of_get_drm_display_mode
>> +	  to acquire display mode.
>> +
>> +	  Newer designs should not use this bridge and should use proper panel
>> +	  driver instead.
> 
> "Newer designs should not use this bridge", but in patch 8 you are
> introducing a new use ot devm_drm_of_display_mode_bridge(). Shouldn't you
> instead "use proper panel driver instead" in patch 8?
> 
> Can you point to the conversation where the converstaion where Dmitry
> suggested this change? Maybe it already contains the answer to my
> qustion. Also adding a link to that conversation in the commit message
> woule be useful.
> 

First of all, thanks for your reviews on this patch series.

link: 
https://lore.kernel.org/all/xwenycscalzdlpuxytorbiyvej3k7pv3lhxwtadilxq65ipwsv@x5rxm53w5e22/

I think it may be a misleading issue caused by directly copying the 
previous Kconfig description. Now that the new 
devm_drm_of_display_mode_bridge() helper has been added, drivers using 
the panel-bridge framework can rely on it to maintain compatibility with 
legacy display mode parsing.

It would be better to update the comment as follows:

This is a DRM bridge implementation that uses of_get_drm_display_mode to 
acquire display mode.

It exists for compatibility with legacy display mode parsing, in order 
to conform to the panel-bridge framework.

Best regards,
Damon

