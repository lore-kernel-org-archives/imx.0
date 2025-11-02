Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD10918D65C
	for <imx@lists.linux.dev>; Sun,  2 Nov 2025 17:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762103727; cv=none; b=dgvNTTX/g3mTEeK2Br9DhUvPT8WfRuYpzZqRBup2T6g74HAA7p+mFZLcHjw94CMeHl4XEjrTdKB77yMYolKSKdiAsSlSs63EgGGBUnD7iA+M/xJasepj+zlT1Bhw9t6u7o704TAdQkR/oEsE7/nhhrco0FX1vfgOcEgG4PJwmdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762103727; c=relaxed/simple;
	bh=/QhroAsSo0Y2EwqhxEnrjVx8V0/aRjNyFLOtqeiTt94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T062Wit8aloDrNKVkaPcAj0/VeNW5DVOPymuI9XyKuxBMrKb+wqvA7mfO1DBVmfDLRNUOhGUmv27T9F6cIOJpDpcK7eYGVV4/UQJzjbqR/RllNw03tqwUh9AskkQqjDe2iq8/yVEaLJ67LqbxUu62KScXMR2VP5IEDq0Bk5MT6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=UvXRZ7bD; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="UvXRZ7bD"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4d01Z20q5Tz9slM;
	Sun,  2 Nov 2025 18:15:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762103722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BFpdLMII0EG/uXMQS+E4Vw7nKG+ReHRISfwxssVFI9s=;
	b=UvXRZ7bDu9O4ZrHV72XvvB6yU3Z5LI+jaMxZyKdMUO3KU2hA46wC+PxOVP9bzqNXvsneUs
	sl9HWw55Jlu4y11sF+dvaApaLFTp1oQVtMVHy2yA3AZt0K3Kh0b7dCpzsPydXqYbwCjFrU
	okvozNZIQgwpk/q1LcTaDYx/QIMOxKxcvhul3wifKN2qeUb0cgEI7dduhm6a3fW1k4lVdu
	A+CW9EgF0cmJ67bNJ8laI/8XlP5xaK4zEybXOCxsVG0R9vukPlju6vxyI3GjM/+iquR91V
	tuLoIL2I8aQLwgBt+kfOI0MXZc6BrnLQCuGQNOjQLl5zVGs9eoFpMXkaMcS3Ig==
Message-ID: <500852c9-2cd5-4897-a139-4e93988f5469@mailbox.org>
Date: Sun, 2 Nov 2025 17:14:05 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH v4 07/14] drm/imx: dc: Add DPR channel support
To: Liu Ying <victor.liu@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
References: <20251016-imx8-dc-prefetch-v4-0-dfda347cb3c5@nxp.com>
 <20251016-imx8-dc-prefetch-v4-7-dfda347cb3c5@nxp.com>
 <174bdb5a-b5a8-4856-a0ac-8caaaefde136@mailbox.org>
 <24f99c46-ca5d-43cc-a2eb-a6e5029e9f86@nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <24f99c46-ca5d-43cc-a2eb-a6e5029e9f86@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 3sitdqczazy5k6eyore371b5sdu9hua4
X-MBO-RS-ID: 505e1783efc7f667bb3

On 10/20/25 4:47 AM, Liu Ying wrote:

Hello Liu,

sorry for my late reply.

>>> +++ b/drivers/gpu/drm/imx/dc/Kconfig
>>> @@ -1,6 +1,7 @@
>>>    config DRM_IMX8_DC
>>>        tristate "Freescale i.MX8 Display Controller Graphics"
>>>        depends on DRM && COMMON_CLK && OF && (ARCH_MXC || COMPILE_TEST)
>>> +    depends on IMX_SCU
>> Can the SCU dependency be made optional,
> 
> I don't think this can be done.  If you grep 'depends on IMX_SCU' in
> kernel, you may find a handful of existing dependancies.

Sure, I do not dispute this part.

But the SCU dependency can be contained in a component of this driver, 
which is not used by MX95, and used only by MX8Q . Then there will be no 
problem.

>> or per-module,
> 
> Well, DRM_IMX8_DC(for the imx8_dc_drm module) depends on IMX_SCU just as
> this patch does.

I assume it shouldn't have to, because the SCU dependency is only 
relevant for the prefetch engine ?

>> or somehow abstracted out (via regmap?),
> 
> Like I replied to your i.MX95 DC patch series's cover letter, SCU accesses
> registers via Cortex-M core instead of Cortex-A core IIUC.  I really don't
> know how to abstract IMX_SCU out, especially via regmap.

The simplest way would be to use regmap_config .reg_read and .reg_write 
, if there is no better way.

>> so iMX95 support can be added into the driver easily too ?
> 
> Like I replied to your i.MX95 DC patch series, I think i.MX95 DC support
> can be in drivers/gpu/drm/imx/dc, but it should be in a separate module
> (something like imx95_dc_drm) plus an additional common module(like
> imx_dc_drm_common).
This design part is something I do not fully understand. Sure, it can be 
two modules, but in the end, the result would have to be capable of 
being compiled into single kernel binary if both modules would be =y in 
Kconfig anyway.
