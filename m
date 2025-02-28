Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE5073477
	for <imx@lists.linux.dev>; Fri, 28 Feb 2025 18:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740767233; cv=none; b=azPLGOntFdPV0s5Pv1pepis0aZGLm2f5QYH/MPAIScsHUga/a+KE8hLCUbwZe83PmZoxGotlhJK3D7/ChFwAhf4R07fa7BDKrFKq8ycWrVCgReFCCNWpUf52DUg6dzxjDDqn9dM1q+IU7EM04oFjON2zxTjXFJacrGyHYmCLo4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740767233; c=relaxed/simple;
	bh=hdMspbXPClV3jdqioSLxLUE8j2eq/5ydweh+bec1xZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DO5CPn7mh3e3xvAJ0TVo5hsUxWrDm8nLpyvtpcpQwOrfl8OzsoOIOEGal7piLDUxjxgTblyggZC9tlCgZE9taLQjXv+3cawqfc+sbeQiXAYy4ir2XZgnWR3HezQxmKiNuDvr2qaaSQglknCzZwvCYfTueVqMcq0yIgYhG8AQxLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=dILOl6dK; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="dILOl6dK"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 083DA1034EAF8;
	Fri, 28 Feb 2025 19:26:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740767223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EEWR1Biyrz/i/9OwEZXDJ1J5UyzPcJrvLTGLj7Exnds=;
	b=dILOl6dKlPvSkD8jJQ3pREfonS5ajNyFDt0yNkJ2Bmgk2sqUHs9TQKM747E5dq1gdWxUT5
	JjYuCzYPpZwkW/JK5vHS+mvIUP1E0Q4opAw9di3+a/A4GykvnQGp+XO7xLmhV5kKDcTaRm
	BQ+xQqFdvPo4EMC8nTKIoHdotUusxvCf410fQLT1RjkHqA69JqwIljUIAjar1HUGbXC+nt
	wfQUeDba/PRyfRG9wRFGfJp8B8WVC1ftkaWvMOFyXtJPmmIuVty/XMp4YEtvOjy1c2wVzR
	JUnEsnCLSI618BX+wB5nIc70D9Rir0sWbtYEJCIPHhd67M6oCcKTVHCvakQTZw==
Message-ID: <bf3486cb-4f87-4cf4-ab6a-6c8cc627ce53@denx.de>
Date: Fri, 28 Feb 2025 17:43:59 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] reset: simple: Add support for Freescale i.MX95 GPU
 reset
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org, imx@lists.linux.dev
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-3-marex@denx.de> <2425297.NG923GbCHz@steina-w>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <2425297.NG923GbCHz@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 2/28/25 10:58 AM, Alexander Stein wrote:

Hi,

>>   drivers/reset/reset-simple.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
>> index 2760678398308..1415a941fd6eb 100644
>> --- a/drivers/reset/reset-simple.c
>> +++ b/drivers/reset/reset-simple.c
>> @@ -133,9 +133,17 @@ static const struct reset_simple_devdata reset_simple_active_low = {
>>   	.status_active_low = true,
>>   };
>>   
>> +static const struct reset_simple_devdata reset_simple_fsl_imx95_gpu_blk_ctrl = {
>> +	.reg_offset = 0x8,
> 
> Shouldn't you add ".nr_resets = 1"? Otherwise this will have 8 resets
> (resource_size(res) * BITS_PER_BYTE).

I should, thanks.

> On a side note: RM says this is a write-once register. Do we consider writing
> this register again?
> BTW: Would it be possible to disable it completely (until reset) by writing 1?
My observation is that this register is set and cannot be cleared by 
writing 0 into it, if I write 0 into this register and read it back, it 
stays at 1 .

Maybe NXP can clarify whether modelling this as reset-simple is really a 
good idea or whether it would be better to rewrite this as custom reset 
driver ?

[...]
