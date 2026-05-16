Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844ED2DFF3F
	for <imx@lists.linux.dev>; Sat, 16 May 2026 19:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778958760; cv=none; b=JuBiDxuc7Zjg9rHzh1BM2x+pWwHES0PYAp42PLtZFNz9xtiglK7iM4FYE6Ft9oqI73HufGksdmjXpXD/NRSqVdkSXsfyFKuLbDXGzLJNzSG7jIqLWZlU9CnL4p6rVso09ps8CugYRdtOC+NRDHxOk0HLAlsKXWW/zg9sUbRt9Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778958760; c=relaxed/simple;
	bh=hG0Yhe9R0tYlEtNEFtvbCQm6+gcTS41hol9HDbNl7FQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=US8cEQqLQmsK6l23oELCtQNMMlIaDiX/SiU2a8lfgBEHmEJmhFyvDbkIrR6Ks1RP5uRe1prWtPyu0rUcj/eZfdLUYR02Kv2JHf7sQuuA/lU4zeu/Z/b26fa9gh5oarp1pNHQnJTdvarGiw7qWbueJ/w+CEm4fxM670TcI6uUUYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=Vjdwry1H; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="Vjdwry1H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1778958756;
 bh=YHX7S/DsNwm3hpSpTHdSzp6yqTOTSjeCJp/lmLO+M4A=;
 b=Vjdwry1HWRJxWagtQCUxn0mRzuJaAkMMa2PWMRa8u4FsfQ+6/CcjPXY8D8ovt/AeZRxDDW+4v
 YntlnYRCkL4pjt10mwYT2JGdOIuxfFRIXz+eFUrF7yz1PrqRTJGZWFpjRyKGxFjC7x5gTvwoKbp
 pP62y10ZgbrT0CsWkYJQ++E2VvzIVL9JYm0R8d1DZ4FIOWg+/flKsh5RH94n4a2zoiTOOAfBN2c
 tQZyW6b1NZKXV0Wz8d+SxfyprdOijrN9AHjNpC8XiXYXxNLHHZAAJu5FRqrvHz6C2DP813ysBqG
 UvD/hNBbQpmyope+HhRv+WPjEbBg0XGGcl/ls+QgqFfw==
X-Forward-Email-ID: 6a08c19e5c12e46019b1e950
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.8.12
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <7122628f-a397-4407-86c7-a3612dc67cb4@kwiboo.se>
Date: Sat, 16 May 2026 21:12:27 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/22] drm: bridge: dw_hdmi: Invalidate CEC phys addr
 from connector detect
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, linux-sunxi@lists.linux.dev,
 imx@lists.linux.dev, linux-amlogic@lists.infradead.org, Frank.Li@kernel.org
References: <20260516183838.2024991-10-jonas@kwiboo.se>
 <20260516190705.AEFC3C19425@smtp.kernel.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260516190705.AEFC3C19425@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/16/2026 9:07 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Moving CEC physical address invalidation exclusively to dw_hdmi_connector_detect breaks CEC functionality when dw_hdmi operates purely as a DRM bridge.
> --
> 
> commit 05206110d2cbe02dc5e2cae3b6c3e7d2d8cdbe48
> Author: Jonas Karlman <jonas@kwiboo.se>
> Subject: drm: bridge: dw_hdmi: Invalidate CEC phys addr from connector detect
> 
> This commit delays the CEC physical address invalidation from the IRQ
> handler until the connector detect operation is called.
> 
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> index 5fd26ff8f55b4..aae1b890167b1 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> @@ -2472,7 +2472,17 @@ dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
>>  {
>>  	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi,
>>  					     connector);
>> -	return dw_hdmi_detect(hdmi);
>> +	enum drm_connector_status status;
>> +
>> +	status = dw_hdmi_detect(hdmi);
>> +
>> +	if (status == connector_status_disconnected) {
>> +		mutex_lock(&hdmi->cec_notifier_mutex);
>> +		cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
>> +		mutex_unlock(&hdmi->cec_notifier_mutex);
>> +	}
>> +
>> +	return status;
>>  }
> 
> Does moving the invalidation exclusively to dw_hdmi_connector_detect break
> CEC functionality when the hardware operates purely as a DRM bridge?

No, hdmi->cec_notifier is going to be NULL when the hardware operates
purely as a DRM bridge, CEC notifier was only created for the dw-hdmi
connector prior to this series.

Regards,
Jonas

> Before this change, cec_notifier_phys_addr_invalidate was called directly
> from the hardware interrupt handler, guaranteeing execution on disconnect
> regardless of how the driver was configured.
> 
> In bridge-only mode, the connector is created externally and
> dw_hdmi_connector_detect is never executed. The DRM core or downstream
> component instead calls dw_hdmi_bridge_detect, which was not updated here
> to include the CEC invalidation logic. The CEC physical address might not
> be invalidated on unplug in bridge mode, which would be a regression.
> 
> I see this is addressed later in the series by commit 795c172faddab (drm:
> bridge: dw_hdmi: Update EDID and CEC phys addr in bridge detect()), but
> this intermediate patch appears to introduce a functional regression that
> might affect bisection.
> 
> [ ... ]
> 
>> @@ -3106,12 +3116,6 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
>>  				       phy_stat & HDMI_PHY_HPD,
>>  				       phy_stat & HDMI_PHY_RX_SENSE);
>>  
>> -		if ((phy_stat & (HDMI_PHY_RX_SENSE | HDMI_PHY_HPD)) == 0) {
>> -			mutex_lock(&hdmi->cec_notifier_mutex);
>> -			cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
>> -			mutex_unlock(&hdmi->cec_notifier_mutex);
>> -		}
>> -
>>  		if ((intr_stat & HDMI_IH_PHY_STAT0_HPD) &&
>>  		    (phy_stat & HDMI_PHY_HPD))
>>  			status = connector_status_connected;
> 

