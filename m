Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839121A270
	for <imx@lists.linux.dev>; Fri, 21 Feb 2025 01:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740100817; cv=none; b=n1ovmHKEas3AGWLKhfHNKIfVeVxXMRKCh9I3qspoZ7mTtzA9/P+iuS6Qpq/2XnOOiCBpsuXbCBYygmahFKutg2bkgj/LsJVvnJhcDBpfPEQKj/i7yv67MBUZJLMnDdu/4ThYi4IcBRboISp01x/oqL78QKI6bS6ixr0hVdo5XRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740100817; c=relaxed/simple;
	bh=dP1BWXU5HhYmfLM76OH2hghfVB9l+IVQ6Ldu8qmUq4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q8wmyCfGTtkQmCsmT7NG+Xs+zI1UOEpmyDjsCvrN/MrpVOsK/aNtETZQqzVHdAJHozmqsisS8A65dPUBt/+YnbyaVDp9sr1MvsnoYaOS+PL3s4WxiQvbzvuiB3KeFGHHC7bcTZRPBVmV7fU0MquDqidQKgxZMfYN2YBc6bULbVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U1zztue4; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U1zztue4"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-abbdf897503so418726966b.0
        for <imx@lists.linux.dev>; Thu, 20 Feb 2025 17:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740100814; x=1740705614; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aLdWDE99RnF8L+T7bBwrOWdjhYLCj2lWLdBJFG4CamA=;
        b=U1zztue4wyk3pP0PIv5Py334E2+GXKpuxjTM9rEiDvZ1t5hIG3xAPLfTWgSBh8m6zN
         woXdsN0UZSfC4g0rJzTamggwWeS5lfBfDzaNqRnlWaFJi7aLmobdiY8rZjLiozPHl6Fg
         c6TMb4rRS41T5YZdkAkGAbyVmkeHqldz8Yq9hoEIxVwtl93YBspiA0WvSx8wtVWWchEi
         RA/JFfbntCs79hlHPrCo+xMVndzBSC4qPs4CzCQ3nhLn2yepx2gcpyI4kumC4UE8p2EX
         ziLhReezSj4NobE+bopWrTnt/vyriu1FzyVOackNzUawqZhQ8e7lJgdPLxhqb3uwhZAm
         K6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740100814; x=1740705614;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aLdWDE99RnF8L+T7bBwrOWdjhYLCj2lWLdBJFG4CamA=;
        b=vLk9/vudfVyCgbg3a4BfmGscpOZhVFMoak780qLr7b+8KBTMv/ShUoS/9IKUkAew1h
         CP18alj0ToPLktJEljekbCDiZhKDXB3zN4lCIM3mmjPiMNAqPYr5vdIbmII84lne/58F
         d0BM0kZheWfAcPOv8n6LIh6iswgqY3nyVYscpq7f0A1aNgKFKHeILqIRAJOOx5b19Tzb
         RUKqjYc6hHvBkskqwHdLfGX/cPHGY2e0jxOQv8+XZV2G0MhdAyCgi3LKefkC7Uy8DlDi
         lhfFRNpYIwZRbhBdX/1CkLy0kaqWfOxPbnaTwGMm5oOu4MaazrLHo6+Vl2/kxTTCZNXy
         dAYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWImgBTXHJHRVR7bebWMuQTHhQ0Ab7Y9a/uSexUx7zYoxTghyx1MxhC/PvKjGiMsSRwyBo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzqTbvvnvoTQo+TgjKCe3ecBvFDL+hf7UX+Ry0xGyIgPbMRgBF2
	m17iOXaB5N9vWrWCQRvlm62ahLRZN6TtXx61mBWDt2uMTRnpQ3ADeSHQWqZbXRk=
X-Gm-Gg: ASbGncvEh6bnemmMG77nN6KAunJ4hzdDMesxnIxlNeQ4KL+rNLE6tF1rUNe9ebJXTAh
	PIwN7XWIaCVO7uCPiRBvpyvMojZg0vs2Rx0CvkImkB/DGaiZSzwp3IUpxDPQFr4C+0u2Yc8KNWz
	IydF80wdtpZASmV8FZlx+50PHWq8ccmGWdjHGFgfk98bDpovYmB3E7aJmTatuR4xwusC0dKze7Z
	9HrVhJN/6mzyS7SMP/gyysFV0qjPytNCTrNuUnkWkxNhXdHsmitvrQyujL+F2cj+O6pzQVpDkv+
	lyz1WZjaleRCuBEHQOgM4QjJynMDAyKuYzaIrYN157yt
X-Google-Smtp-Source: AGHT+IGvRDTlkH1zTKRe+mAKqwe3ESbEQp8XsF/35YcwuDu9Yhfk7y+ptfPIYtK+S0ZC3xZG+Qnjqg==
X-Received: by 2002:a17:907:8b96:b0:abb:ebf8:72d9 with SMTP id a640c23a62f3a-abbeddc91a6mr586592266b.15.1740100813535;
        Thu, 20 Feb 2025 17:20:13 -0800 (PST)
Received: from [192.168.1.130] ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb8ad6720esm998432766b.88.2025.02.20.17.20.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 17:20:13 -0800 (PST)
Message-ID: <9028f7a8-7cf7-4ebf-86a6-0d894c66edb1@gmail.com>
Date: Fri, 21 Feb 2025 03:20:10 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] imx_dsp_rproc: Use reset controller API to control
 the DSP
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Daniel Baluta <daniel.baluta@nxp.com>, robh@kernel.org, shawnguo@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, mathieu.poirier@linaro.org,
 shengjiu.wang@nxp.com, Frank.Li@nxp.com, peng.fan@nxp.com,
 laurentiu.mihalcea@nxp.com, iuliana.prodan@nxp.com
References: <20250219192102.423850-1-daniel.baluta@nxp.com>
 <20250219192102.423850-9-daniel.baluta@nxp.com>
 <c52e6c5c-f49e-4727-b669-086ae7cb0e1e@gmail.com>
 <6e03b0c09c4e6d222670025c6540f73a0a0a819d.camel@pengutronix.de>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <6e03b0c09c4e6d222670025c6540f73a0a0a819d.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/20/2025 5:45 PM, Philipp Zabel wrote:
> On Do, 2025-02-20 at 00:22 +0200, Laurentiu Mihalcea wrote:
>> On 2/19/2025 9:21 PM, Daniel Baluta wrote:
>>> Use the reset controller API to control the DSP on i.MX8MP. This way
>>> we can have a better control of the resources and avoid using a syscon
>>> to access the audiomix bits.
>>>
>>> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
>>> Reviewed-by: Peng Fan <peng.fan@nxp.com>
>>> ---
>>>  drivers/remoteproc/imx_dsp_rproc.c | 25 +++++++++++++++++--------
>>>  drivers/remoteproc/imx_rproc.h     |  2 ++
>>>  2 files changed, 19 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
>>> index ea5024919c2f..631563e4f86d 100644
>>> --- a/drivers/remoteproc/imx_dsp_rproc.c
>>> +++ b/drivers/remoteproc/imx_dsp_rproc.c
>>> @@ -19,6 +19,7 @@
>>>  #include <linux/pm_runtime.h>
>>>  #include <linux/regmap.h>
>>>  #include <linux/remoteproc.h>
>>> +#include <linux/reset.h>
>>>  #include <linux/slab.h>
>>>  
>>>  #include "imx_rproc.h"
>>> @@ -111,6 +112,7 @@ enum imx_dsp_rp_mbox_messages {
>>>   */
>>>  struct imx_dsp_rproc {
>>>  	struct regmap				*regmap;
>>> +	struct reset_control			*reset;
>> Maybe rename this to "stall"? There's also the DAP stuff that's actually used
>> to reset the core so this might be a bit confusing?
> So Run/Stall does not actually reset anything? Maybe then it should not
> be modeled as a reset control. It looks to me like the
> DAP_PWRCTL[CORERESET] bit in the Audio Processor Debug region would be
> a much better fit.

Yep, it does not as far as I'm aware. This bit is used to insert stall cycles
into the accelerator's pipeline. As for the DAP bit: agreed.

(Daniel pls feel free to correct me if I got something wrong here)

For a bit of context here:

Previous approach used a syscon to manage the Run/Stall bit (see [1], "fsl,dsp-ctrl"
property). The main issue with that is that syscon doesn't enforce any device dependency
(e.g: PM) and you do need the AUDIOMIX power domain to be powered on before accessing
the registers from said syscon.

Now, AUDIO_BLK_CTRL offers multiple DSP-related configuration bits (Run/Stall bit included).
If we ever decide we want to access those bits we can't model them as reset controllers as it
makes no sense whatsoever. As such, I think that modelling Run/Stall as a reset controller is
just an arguably unneeded and inaccurate (assuming reset controllers are supposed
to model only actual reset signals) solution.

IMO, unless someone can think of a scenario in which this would break, we should just cut our
losses and go back to the syscon-based approach. The DSP is already attached to the AUDIOMIX
power domain so it should be on when attempting to access its registers. Also, the DSP
should be the only device wanting to configure the DSP-related AUDIO_BLK_CTRL bits anyways?

What are your thoughts on this?


[1]: https://lore.kernel.org/imx/20250212085222.107102-1-daniel.baluta@nxp.com/

Thanks,
Laurentiu
