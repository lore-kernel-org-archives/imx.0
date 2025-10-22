Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A7E2D0601
	for <imx@lists.linux.dev>; Wed, 22 Oct 2025 04:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761107659; cv=none; b=sv6KKdQcXLpB/NXw/4IjP5Qkfi5kxs2uIyrwI77UhBDO7xY7dWZg1jzgPIQF7Hz7q0Fa5Xe69/01cdogKD6sPKLYSr1bg3rhJhLLQ2vP048C4R6XfrpZQpyaKT9EIoOQQNXQRy55vNrYg9Y0EvuwDVx1cW1PCQDOyDkIueHWwMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761107659; c=relaxed/simple;
	bh=Ta3vLBQn3sKyycsd6zk6kL1yNYlGExTdBO+VCjlMbt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pjy18q6uTWNEeUpg5Xh9MkNlNRSuEmjMopHMtwAZTZ7Dmi/+Hm9VkSP5IMJn65r1KXNnuwxAaEyw7VakafczyjIMCcW84N5+Z6EAaXOudOorIZGJM58NM8Xqw81JY7N6iwQKsYs4wsS/k6DQk1fqpOqP6wjV03avtAJpw9fYgLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=rjnlIqM1; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="rjnlIqM1"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-290b48e09a7so76850825ad.0
        for <imx@lists.linux.dev>; Tue, 21 Oct 2025 21:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761107657; x=1761712457; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ppwCPMx8V2Sf6deae1nCYy7pnPOnc4IDjA11Y0/2goo=;
        b=rjnlIqM17lPdb1/prCp+jItOWMHTqH/P5xdB5fzhGb8LW/oY9kmLy5lVF1zv7Y1vOE
         uVhsIrCfCtKGO/HY20KX85n8cF2TBOzAXPkTdh3dg5FrokdfahqSFJ/Rt33Ib5nr0GlN
         r12Y/YQA/hYYCzmc9v5rfZtkiAaAa7lpBaH0JCbNnwb6rgI5AenfUMLIvenGnBdONAXq
         Zu4QmDfO0UHIZOmtcGjYcYkDJ9wX/mHnpFXZPq8zIC2CRyailKRL/UHi4gg/MoallYoK
         TkMyYonKjNLNGlzB1GI1eV8OvfSTRrjo2n8YB/XMEyxRi6BfKdtv+59yyfR6uRia5WFY
         IyTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761107657; x=1761712457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ppwCPMx8V2Sf6deae1nCYy7pnPOnc4IDjA11Y0/2goo=;
        b=AwvxVr4e/tqcEtRshr5l6Ol/cWXei7lawqL2Oo7sK7g62Vhzqo3rF+E8HwanzoRJrp
         Un2PiTTx3Czl0LBke8XYdBTR/l20akR1Sh/sWzIvM6cpw5f2uw1OyWVQHbjM2xmCW58K
         YRxskaqQSvGyFZWOVb5IJ8u9PctuZPQWd4cMYafDSW4Pci13Sbr2Y2rXxYyikpXpET+E
         wwesQKu0r9KDm2G6zuhpeneeNIJy1gAlHyIpodgqF+XwZ+kUvnEMxe9EoHGCA74ruvm1
         wKAGaXYCjms+G6sqlcYNgAqTu4msWDLzJxceq1SbbrvNYxGjxoOIjXUdHd7Su2x9VWd8
         GxJQ==
X-Forwarded-Encrypted: i=1; AJvYcCW02hm9BzK87eRbRU3zNgWwXyKbSLycmjUM+4BqF+kmKWtYzViXOvnfdZIiRKBW1onf/Ec=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz06RzDGPMvb13lsW49peC/iOWtmyNKca1DNwNNQ5Y2z+ccTR9z
	YhUQUcujhKHfELBc6NYSku5A+2WNKTZjJCpCsuwrOqE64K6KnXuc3LfeY8+yMpkcVWo=
X-Gm-Gg: ASbGncvIiHa1Ii3Sw9zR6pHdhs9N48tdgUcfLEuT3lZ054R+shQ6XWF3H/zTvjmDEZ5
	PwbRXtt4Tb1iE+wwJp3WPVbdfZmT5NV+u6npZ96Q7HEDALbw+JAFrAAVbnUYq6L4wTWeBIMJo97
	ab6Wbnz2Fcw/HAsvAJrHyHeNWaf2QUYYlxNl2UioLEcU5QOYoP6+1f4clzxOZ12aP06RBmYjX09
	Tv5qWa5VYC1CvXlfy6M9xzakErQvm4WNnI/X/A8B9xQqiKkuWtka+iWcAGOoLLd1speJfP7cZKp
	fxA1HVgsA7OOG/kiy1AomaeIJIcwTtRgTcr4u+n14wwFEb1BA09bMCGUZcsoJj1igwPfWq05o7B
	X8yxTQ7De2A2XKTLAo+yCgz+iQCmjR8+IiQTOmYcA68U8iHZ+D9+asyar6NkcTfWpTQtkxXDZg1
	Wm5vy6CilSKOcm
X-Google-Smtp-Source: AGHT+IGRbL8alcY98vwlpMmB68/E/fiZ8vvTYnBqywFldOw2mBZIi0C45CU+Ljv9QC55tUOEBjim+g==
X-Received: by 2002:a17:903:1d1:b0:290:2a14:2ed5 with SMTP id d9443c01a7336-290c9c89fd2mr213302675ad.4.1761107657244;
        Tue, 21 Oct 2025 21:34:17 -0700 (PDT)
Received: from [10.211.55.5] ([4.28.11.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471fe4cdsm126257025ad.97.2025.10.21.21.34.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 21:34:16 -0700 (PDT)
Message-ID: <ba01b2a5-a04b-4a6a-9257-09f38f2ba5ef@riscstar.com>
Date: Tue, 21 Oct 2025 23:34:15 -0500
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] dt-bindings: spi: fsl-qspi: support SpacemiT K1
To: Conor Dooley <conor@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: han.xu@nxp.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dlan@gentoo.org, guodong@riscstar.com, devicetree@vger.kernel.org,
 linux-spi@vger.kernel.org, imx@lists.linux.dev, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251020165152.666221-1-elder@riscstar.com>
 <20251020165152.666221-3-elder@riscstar.com>
 <20251020-blinked-primary-2b69cf37e9fe@spud>
 <b28d71c4-d632-4ee5-8c4b-270649fca882@riscstar.com>
 <710c36f2-3551-4738-a965-f1564416348c@sirena.org.uk>
 <20251020-florist-campus-a397bf94d129@spud>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251020-florist-campus-a397bf94d129@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/25 1:39 PM, Conor Dooley wrote:
> On Mon, Oct 20, 2025 at 07:26:17PM +0100, Mark Brown wrote:
>> On Mon, Oct 20, 2025 at 01:06:46PM -0500, Alex Elder wrote:
>>> On 10/20/25 12:39 PM, Conor Dooley wrote:
>>
>>>>> +          - spacemit,k1-qspi
>>
>>>> Are the newly added resets mandatory for the spacemit platform?
>>
>>> This is interesting.  I never even tried it without specifying them.
>>
>>> I just tried it, and at least on my system QSPI functioned without
>>> defining these resets.  I will ask SpacemiT about this.  If they are
>>> not needed I will omit the first patch (which added optional resets),
>>> and won't use them.
>>
>> It might be safer to describe them, otherwise things are vulnerable to
>> issues like the bootloader not leaving things in a predictable state.
> 
> Yeah, if a linux driver requires that a bootloader set up a clock or
> de-assert a reset etc, then the binding should mark them required since,
> as you say, a bootloader change might do away with that de-assertion.
> Additionally, the stage doing that de-assertion etc could be U-Boot
> or barebox, which import devicetrees from Linux, so making sure that
> the resets are present has that benefit too.

OK, so the resets property (added in patch 1) will stay.  It will
be defined such that it is an optional property, and only when the
compatible string includes "spacemit,k1-qspi".

					-Alex
