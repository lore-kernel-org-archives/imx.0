Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482614657D8
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 16:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768925511; cv=none; b=VAnIr8OrOzat4fqcx+g2WuhzIa4BqPWkpBugcbdFWucpg5wxZy+5ERBtAFrYWD2p96laigLcFEgYwbn1DfgR5X0DA/RPTLswIO6Viye0JnVVMNkJVqtvbLRm1/qHX15wD4PShaZmoKEtIwEnphCTwBlNYNwQmNyy5j3Me00IFw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768925511; c=relaxed/simple;
	bh=buupeckl6Ur2K0f6PNMs+weNQzg7qW70tzVIb7P2wJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X9HdxkIXTTIyxKIAE/0izqWrUG7euAhkPXQ/GTjlkuTOu+I88B6soBbf2/hPtWmakWmeWhbzsf3W8RtkefLRxc0qTm5K0RHyfX6zcJXa6L7RvE3fCHee4nHqhzRtfb3ED0yHxVqrEAgISeXpbC8M9jlHOVS4cOp/UFJjWYA0orM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r6eOjI19; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r6eOjI19"
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-43596062728so302977f8f.1
        for <imx@lists.linux.dev>; Tue, 20 Jan 2026 08:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768925507; x=1769530307; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eDF4hEQ49oVuoE1o1FuTuulQQD1AKtsuCPOT8o0CxOI=;
        b=r6eOjI199NhPJO06xUH9+9HeRQVmZHxgIVAFMLRlGioEGTOum3FudX4Nn4jo1B/IHX
         oc9FW99QQ9A0sIXKlb/e9GJNUpBPs64hq0+L3FycQ2G91ZCHaawExCJYIYzTl5JkglXt
         +rwYapL971gZYXmrqbtfvc6jQQEgRdpBuhAo06guMiOkhH9sCxKbkPrG8Y1R7rsP1srJ
         rfQLjHFyP7gZG7A0/8n2dPXMXgTOKjSXmHRWoZR944uDdmfb+9rbLUb+APaLEG8BhIly
         JZZsHqVNx9kpAapDD41b3IOz9FTEQ0MoR90zTm29+A4rgZeVkNx/WnmwIGFmubxlY3vv
         M0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768925507; x=1769530307;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eDF4hEQ49oVuoE1o1FuTuulQQD1AKtsuCPOT8o0CxOI=;
        b=e6vzsz1hLQ/DFSihq8U/NVRb7DMWG19FI9JTdhzttJqKixYpdbvB91ZiOMogu1uEub
         e1KQoz8c3EkLwgJlZHG0s2gIaaAgj97Pt/X3siBvCJnljupo7DSAfcUVRpaBW+dobpaz
         VBKBVwF0X0hqQ4pX6EYnItVtHbxdoFot1/qAVUnKJjModGKN2PaRkKK3/umwxZoeRibW
         om6I/hJPtQMbrjcX0HYeO/iaO4eNRhLINg8niyGMJsOLldhWuO1hi4J/xBasF/SNENv2
         BRc0XErCzH3vNLBc8X+2RaCWpWTB4GAwotmfzV21mDQKLOtrFDweOA9GvesA4UIavhvs
         3N1Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3329RyQr9PBQ38drTvEiZzsuAPiG43JN/gq7WWiqB+ogEB3iR2oW6n4UgoraoasxTYC0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzMX9X3SNSGdZvxUZD34jQjr+i2ZW9w9Z2UNJ38Pa92eRaca7JV
	1KZlcOWrD5GfMDYRBjFAf2xOJnRDp6jLGDtlOd9jbixpOK8l9FSilIc8BfOHUfZ87PE=
X-Gm-Gg: AZuq6aIzf9/kOor6Bt6XpShodxOLTDBnPHlv8crQrD3GLMih20Wk1007H/teF89z5pK
	7OCr9DRoI3f4hA7RSJbUNRvDgH+XEHky6kFYFVZNY4FhemCU9Y69IhzNktbymzbaSclL2arwOL6
	ea+1SPtEvg9gHM5Snau7dT9aWFcUGuR5bpt6inKCYp5BgbsuO6xHghhtKT9J8tMRVf+pWg/khsm
	4kORqCoGtLdy9mxRNADfBV4TOOi3xjIVWko35DghEovrbWS9KbGDRzCjf0qaw1Fg+6rzpK1l0zb
	joZxu4pMtOspE5/+eJZvfLgOIGruxnWQkF/rMlDRBsqPf4vkt1y3v+9TYmHCMiYMrTD4wgR4xkb
	zmq2snLt14x75oVqC+SKHK167vk6ONk9OcXapiE8VokMsx89RHZB8rp+/J2A/iY1xN9Xb9AV4d3
	X96ObamExeSuhIp47J/ZTrb2ZiUz9J6G6IrfBMggC4+i8fqqMJ+xtQegck0dF7shSYNA==
X-Received: by 2002:a05:6000:400e:b0:432:c17c:3094 with SMTP id ffacd0b85a97d-434cc99cd37mr25319021f8f.3.1768925507512;
        Tue, 20 Jan 2026 08:11:47 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:73c1:f0e1:c420:e523? ([2a05:6e02:1041:c10:73c1:f0e1:c420:e523])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4356996cf42sm30553088f8f.20.2026.01.20.08.11.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 08:11:47 -0800 (PST)
Message-ID: <dedf467f-594a-4039-8baa-f43744463b1a@linaro.org>
Date: Tue, 20 Jan 2026 17:11:45 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] clocksource/drivers/imx-tpm: Support building
 imx-tpm driver as module
To: Daniel Baluta <daniel.baluta@gmail.com>,
 Zhipeng Wang <zhipeng.wang_1@nxp.com>
Cc: tglx@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, chun-hung.wu@mediatek.com,
 walter.chang@mediatek.com, jstultz@google.com, amergnat@baylibre.com,
 aisheng.dong@nxp.com, jindong.yue@nxp.com, xuegang.liu@nxp.com
References: <20260119095511.3030739-1-zhipeng.wang_1@nxp.com>
 <20260119095511.3030739-5-zhipeng.wang_1@nxp.com>
 <CAEnQRZBf6ymmrHUVXPdvQ3pQWwhON-dCqJ2v8FZPRBEo-X=zPQ@mail.gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <CAEnQRZBf6ymmrHUVXPdvQ3pQWwhON-dCqJ2v8FZPRBEo-X=zPQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/19/26 11:38, Daniel Baluta wrote:
> On Mon, Jan 19, 2026 at 11:56 AM Zhipeng Wang <zhipeng.wang_1@nxp.com> wrote:
>>
>> From: Jindong Yue <jindong.yue@nxp.com>
>>
>> Change defconfig as tristate type and add platform driver
>> to support building it as a module.
>>
>> Signed-off-by: Jindong Yue <jindong.yue@nxp.com>
>> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> 
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> 
> So you can now select the driver Y/M/n even if no COMPILE_TEST present.
> 
> I wonder why we needed the `if COMPILE_TEST` in the first place. But anyhow,
> this change looks good.

The logic is to keep the timer option silent and let the platform's 
Kconfig to select the timer driver when enabling the platform.

Then we wanted to be able to compile-test those drivers even if the 
platform is not selected.

Now we want to choose between module or compiled-in.

I'm not sure if we really want to manually select the timer driver or 
switch to module.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
