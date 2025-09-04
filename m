Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD12F3054CA
	for <imx@lists.linux.dev>; Thu,  4 Sep 2025 13:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756993783; cv=none; b=dquj756DE2fcywy/lAxp40F4ycUnr81ce7yTh8lMSJR/E2NcPt5PfDCrJfVaJsY8dZdrN5wusJOzm/eoPGq5oV8mma+sDHpYFFEgNUi2X3bIsIdtvi/RFJQIuAE9JXBgQMNUi61mRwRk1mFdyiUPXhK9iFBKTqoLXyosf6gTrAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756993783; c=relaxed/simple;
	bh=0A6d2OfdcQaf6fvM7d144gsJwiSxigjXsdQkyq1yPrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nm1oskg8+6V1XqcPXVYMl+o+1/61diEyPjwY0g9yfSP/+o9cPVsOdqj0yNCnzvD/zoc/e9AgmUmlvUwdvH5MpjjpWVRUWGDiLZFza8IQXgqiO7BSuBY//I32MKZI4IrVFahz0VlRfdMgFfimD+qa1tAm5UzBEF8SfqltUL1bAVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Z8oGhy3B; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Z8oGhy3B"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cHgnt1KWHz9srp;
	Thu,  4 Sep 2025 15:49:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1756993778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Eyv4JfVwk6E7rSyv4qxxGsrvnR26XQTwFmzC798VcA=;
	b=Z8oGhy3BizEHytmaH8F6sq9GpUXO8WVDZYaX3DqqpQ5FOZLnpCLgY5+KwRcHe/2Bymwo53
	pWeX0VVqcbLJTlM/79SHzKAKZTPcxMe+OFOu+vlajVrtgz2pcbha11l+uViNnaak+dE5tC
	kdIvb4wYEbp0Cr8BIdD6BsZyQeTGT3pMmZUS19RKcBlSNN8ty8CCZXCjYiMVOANSdqXdSx
	1iKFM0oZB10Ks2J6ktdRWIVDBHng1p6JLsrJN+onB7MYAv6LiRMZ3P7h6ImasnOfyQH5cX
	ZaWy/mNKr9TO6yOdfJUnjtbuk5NeSbBsHtIrAqNZJm7WotSMIBOIZtAEdl4WWw==
Message-ID: <7d4e773b-64ac-49ce-8d8b-7a39c353d18f@mailbox.org>
Date: Thu, 4 Sep 2025 15:49:31 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev
References: <20250321200625.132494-1-marex@denx.de>
 <20250321200625.132494-5-marex@denx.de>
 <20250324094333.7afb17a1@collabora.com>
 <c1de2afb-3559-4fbb-b13b-2373175b420b@denx.de>
 <20250325084349.344a0f11@collabora.com>
 <7aadf355-edf0-46fc-b969-65c3789375ca@denx.de>
 <20250325153507.61d82e39@collabora.com>
 <4c06aef3-a254-437c-aa15-8e3eb7bf5951@denx.de>
 <20250325155231.0d1b1000@collabora.com>
 <838a0c6b-845b-428d-86b3-1480e5b8080f@mailbox.org>
 <20250904082224.113d0cd1@fedora>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250904082224.113d0cd1@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 74f787c64e361a067a0
X-MBO-RS-META: 4dihidnqffe48jkhfqpgw3ysi95xrxr6

On 9/4/25 8:22 AM, Boris Brezillon wrote:
> Hello Marek,

Hello Boris,

>> Can you please test the following patch (also attached) on one of your
>> devices, and tell me what the status is at the end . The diff sets the
>> GLB_HALT bit and then clears it again, which I suspect should first halt
>> the GPU and (this is what I am unsure about) then again un-halt/resume
>> the GPU ?
> 
> It doesn't work like that. What you're describing is like executing
> "shutdown" on your terminal and then typing "boot" on the keyboard
> after your computer has been shut down.

That is what I thought , yes .

I think what I am looking for is the "power key" .

[...]

>> That means, the GPU remains halted at the end, even if the "GLB_HALT"
>> bit is cleared before the last print. The clearing of GLB_HALT is also
>> what panthor_fw_post_reset() does.
> 
> After the halt has been processed by the FW, the memory region where
> you check the halt status again is inert, since the micro-controller
> (MCU) supposed to update those bits is off at this point. The FW
> interface is really just a shared memory region between the CPU and
> MCU, nothing more.

Right.

>> I suspect the extra soft reset I did before "un-halted" the GPU and
>> allowed it to proceed.
> 
> Hm, not quite. I mean, you still need to explicitly boot the MCU after
> a reset, which is what the write to MCU_CONTROL [1] does. What the
> soft-reset does though, is reset all GPU blocks, including the MCU.
> This means the MCU starts from a fresh state when you reach [1].

I have a feeling the write to MCU_CONTROL does nothing in my case.

Is there some way to probe the MCU state before/after setting GLB_HALT, 
and also before/after the MCU_CONTROL write, using 
gpu_read()/gpu_write() register operations, to find out what is going on 
with the MCU at each point ?
