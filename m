Received: from mail-m49224.qiye.163.com (mail-m49224.qiye.163.com [45.254.49.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8C5185B48
	for <imx@lists.linux.dev>; Wed,  4 Feb 2026 01:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.224
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770167423; cv=none; b=J5/P3BznVmQcbsptsViXpjkL/E2G89L94wHGhRcNOvF9+XUkidlXlMIZVLLKHoy7SYb8F9UyQb2LX0aiG9QkfnWd//jGnbW7eZkjcYLxsmeiVAoBceG5tJ02uXGx0FuWhJVc4hJU/byLiwMuYNytfyygHZm+1PGuHt7PPsDgx+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770167423; c=relaxed/simple;
	bh=N07gY89EuSEYf36dEC4Rpxftlpaz3On9AMbxSIwK9gY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=dJrxwzzSjQvEs13rWSqUlBRmcszYv7XqICmA7Ldn5DeT5odfSzCn25QNi0y/lgQfwmCxd+NaLEkhimWlmAmS2Iq0d8QdRFw3KyaixtlPXj1+5BPeiYXWxy5+8tmw4+Ko8hE8nKY4TjZfXkkTJqiMLj9yxi9ttThowVRJ/0l+Q7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=PdtvcqXr; arc=none smtp.client-ip=45.254.49.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="PdtvcqXr"
Received: from [172.16.12.43] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 330509a94;
	Wed, 4 Feb 2026 09:10:05 +0800 (GMT+08:00)
Message-ID: <8c305f74-7fa7-4798-b1b3-e96544d962a1@rock-chips.com>
Date: Wed, 4 Feb 2026 09:09:07 +0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v8 05/18] drm/bridge: Move legacy bridge driver out of imx
 directory for multi-platform use
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 dmitry.baryshkov@oss.qualcomm.com
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 jingoohan1@gmail.com, p.zabel@pengutronix.de, hjc@rock-chips.com,
 heiko@sntech.de, andy.yan@rock-chips.com, dianders@chromium.org,
 m.szyprowski@samsung.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20251217093321.3108939-1-damon.ding@rock-chips.com>
 <20251217093321.3108939-6-damon.ding@rock-chips.com>
 <DG2S064XPGXL.1MQDAKWZEK50K@bootlin.com>
 <7256ecf9-b10b-428c-a1a6-e35e80a686ed@rock-chips.com>
 <9e1da672-a52d-4ec3-a20a-fe6f8ca15496@rock-chips.com>
 <DG58VCQ54OZA.2QHGR8JFIATY2@bootlin.com>
Content-Language: en-US
In-Reply-To: <DG58VCQ54OZA.2QHGR8JFIATY2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c26330b5c03a3kunme492eb66731d02
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU1KQlYdTB0aGRgfSRlIHU1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=PdtvcqXrIboBxzk6mrQxMh8OFknDSWkG8VsQx3P2oelUvZoMue4STcE+QfhITy/PiSZqtgQYee4sBfRWs14gKK0t47AQ3BXE7Nr3wCtaOHKY9WaYy5G//B0ZE4uGhgQl/TKkSj0hcrsxCsAcdXg1gNWy7TRdCUVD4w3MwfbcuEU=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=ro6VqhMxsjofyYNi+p5gticfSsMMFPfjQqGDTGdq+b8=;
	h=date:mime-version:subject:message-id:from;

Hi Luca,

On 2/3/2026 6:11 PM, Luca Ceresoli wrote:
> Hello Damon,
> 
> On Tue Feb 3, 2026 at 2:31 AM CET, Damon Ding wrote:
>> Hi,
>>
>> On 2/2/2026 10:54 AM, Damon Ding wrote:
>>> Hi Luca,
>>>
>>> On 1/31/2026 8:33 PM, Luca Ceresoli wrote:
>>>> Hello Damon, Dmitry,
>>>>
>>>> On Wed Dec 17, 2025 at 10:33 AM CET, Damon Ding wrote:
>>>>> As suggested by Dmitry, the DRM legacy bridge driver can be pulled
>>>>> out of imx/ subdir for multi-platform use. The driver is also renamed
>>>>> to make it more generic and suitable for platforms other than i.MX.
>>>>>
>>>>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>>>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>>>
>>>>> ---
>>>>>
>>>>> Changes in v7:
>>>>> - Rename legacy-bridge to of-display-mode-bridge.
>>>>> - Remove unnecessary API drm_bridge_is_legacy().
>>>>
>>>> ...
>>>>
>>>>> --- a/drivers/gpu/drm/bridge/Kconfig
>>>>> +++ b/drivers/gpu/drm/bridge/Kconfig
>>>>> @@ -244,6 +244,16 @@ config DRM_NXP_PTN3460
>>>>>        help
>>>>>          NXP PTN3460 eDP-LVDS bridge chip driver.
>>>>>
>>>>> +config DRM_OF_DISPLAY_MODE_BRIDGE
>>>>> +    tristate
>>>>> +    depends on DRM_BRIDGE && OF
>>>>> +    help
>>>>> +      This is a DRM bridge implementation that uses
>>>>> of_get_drm_display_mode
>>>>> +      to acquire display mode.
>>>>> +
>>>>> +      Newer designs should not use this bridge and should use proper
>>>>> panel
>>>>> +      driver instead.
>>>>
>>>> "Newer designs should not use this bridge", but in patch 8 you are
>>>> introducing a new use ot devm_drm_of_display_mode_bridge(). Shouldn't you
>>>> instead "use proper panel driver instead" in patch 8?
>>>>
>>>> Can you point to the conversation where the converstaion where Dmitry
>>>> suggested this change? Maybe it already contains the answer to my
>>>> qustion. Also adding a link to that conversation in the commit message
>>>> woule be useful.
>>>>
>>>
>>> First of all, thanks for your reviews on this patch series.
>>>
>>> link: https://lore.kernel.org/all/
>>> xwenycscalzdlpuxytorbiyvej3k7pv3lhxwtadilxq65ipwsv@x5rxm53w5e22/
>>>
>>> I think it may be a misleading issue caused by directly copying the
>>> previous Kconfig description. Now that the new
>>> devm_drm_of_display_mode_bridge() helper has been added, drivers using
>>> the panel-bridge framework can rely on it to maintain compatibility with
>>> legacy display mode parsing.
> 
> Ah, I think I got the point: the mode description in device tree is legacy,
> but the driver itself is not legacy and will be current until we need to
> support legacy device tree. Correct?
> 
> If that's correct, this patch looks OK to me with a new Kconfig help text.

Right. I want to apply the advanced panel-bridge framework for Exynos DP 
driver, and this newly added API helps handle the legacy device tree 
that it supports.

The v9 will come soon.

> 
>>> It would be better to update the comment as follows:
>>>
>>> This is a DRM bridge implementation that uses of_get_drm_display_mode to
>>> acquire display mode.
>>>
>>> It exists for compatibility with legacy display mode parsing, in order
>>> to conform to the panel-bridge framework.
>>>
>>
>> Dmitry, what's you take on this?
> 
> Dmitry's opinion would be much more relevant than mine. I don't know much
> myself about this driver.
> 

Best regards,
Damon


