Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446621547C9
	for <imx@lists.linux.dev>; Tue, 15 Jul 2025 11:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752578592; cv=none; b=r+LCwfMC05PSI/TJpLY1hzoeX718XbJbprBmjobz7yRV+gG+1gX1P8wtwbT08WqNiHapZ4tPHRZ3rtcbnb+iRfN8Kh/7lgY0TfIzamKnh6ai0cbWWDEuEH7p47B+RAw+uqEgw1rvPGQFxX0LA4y8lXSkrQ/TE0P1qwUa69SK9tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752578592; c=relaxed/simple;
	bh=bZ90k2ZHoazxrj+WXjgsKXIynmPY+DOAnPKqwHoqjFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DNvM8rywCYYHEeWr7oLDBI9jtVFADWJotjo23zj83cBjocsEXIfC44eLAIiuo/OXagE7kYXMqAqZtrg9HmlPlppfuqJXRO4ODLagJQ6nTld5n+V4M/G7UOOVaGP3+kHWuWZ8lTstyzYMjn2zwJYgtJnJWzFLcymew/IP4lUGr/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nLvIiZ4c; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nLvIiZ4c"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45629703011so2748065e9.0
        for <imx@lists.linux.dev>; Tue, 15 Jul 2025 04:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752578588; x=1753183388; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IROohcnT2HQCfIKhsx/yQHN0OEa0Xb+k3P4V46L5bTY=;
        b=nLvIiZ4c464tj9nIPSaybqc8Vc/kbqzWD2f3QaCS6vNGbs2ozOu3o9H/O/RxUXiDRU
         4SEQaZyterUBu03Rx8CrL2Vj5BLA9yQjOfQw7uV755uUXp9fAesshOLLkHNXZkbqV3iQ
         FYTf3zUdcI2s5KRVRQU7o5Hbqcg/oSomjV9RuMuXJKnoQyte5u9nyNhP2jkw5/EdqzvJ
         D5ZkIKpSgVoXmZ4pSyMY8Q1DtIqNaXCNdMPuZINgVexPzDvkyS6X0ybRYF+qaBYCmDc6
         SSSzF0XrmW88/tbBSlsk8oNOCs8ipfjW7pZq9vqpbghef0vmdTOK1M0u2jbw7YJNqX0Y
         W4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752578588; x=1753183388;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IROohcnT2HQCfIKhsx/yQHN0OEa0Xb+k3P4V46L5bTY=;
        b=XVuAfKdhxYGw/qWqNKVTu6uq64uAy1SBmKmqEZF3e6sZKi6K69JPycb77vgQwW/yTJ
         oas5ddb7kfU5QztOto2au7ijQhZ3SCPL+WE/eYzp+UnNjToL7/tB/cuV6H1Fj2vLzAsK
         48dg+qka2ncDZgY1Gsc38s4djkn9sDu5N8nWZatU8ia/BXhN5fQbrhfx/SkAB9vUo5E1
         n1nmT3d9YcuuodFjCwrVVI6NIth2ug/AbjD8Tqoxp+TjXp/YmzBhoOvh+Irh5FCQOKIH
         unEuk4jhgWypt2am8ODmZ2XtlIrGBLq4ah8WrE1h3P2TNIZndmN3UB5QU8oDtL6v+/tr
         Yi/w==
X-Forwarded-Encrypted: i=1; AJvYcCUoNQUhkD5Oze/USIPQpsx1+0JJ9fNJ68qGvmJlJrXV7hUc+UBAJRn167nT1474CxUcTy4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwEVKo4MDP7+zra+mUx32AyTrhWBrO0CWZoNTt6N5yO0BOlqKHG
	h41BXnSsj/fWwJ77eLRgWi8EvpV6P2hdLyx+/oUArJmt1ULdbYudSxsASKaoMsZRNow=
X-Gm-Gg: ASbGncvl+4Fzz1nbEHbI1SdscHF+LSSLYbrodSVZIz4mwTnLI5Yq52/EkxzId68295q
	fHUnV5TGqRseyMu62Ol33VdYJJpyRA8WJk0w+hfUaahsg8pPCiFwLLVO9+Ll2wNqOi7hvs3xFrt
	M5nG6qlgVwhP81wamn1pROzYMH15qR6aGQK9IkcVe5eOaVBoblWIhTqwKMTLvYbVcrBzCp//wBz
	ZZz346kuTlHl0LKnP1kOoJ7nJe0Yh/V813n5qjFRg3sdWbwfDxffuQy3aw/ykjMUlfmgsaWPUer
	+jq85oj2F1xqk63Vsh6J9oJLJ3ilArynoXBSHJ0luApJOtQfXFWF1UD3LrCxR/h8Riyw0qOle/D
	6iIQQFriy19odq2W5ARFnbmDb09pcs93UVgmOPm55sCxrIX2vsxOPtStIOBBFEFdOZA7LVZA=
X-Google-Smtp-Source: AGHT+IHQ3prgUe5cBnNidral8utHdbyigrerAyg9IXxceMi1779788HUGWodqsh1bemWlLH3jivHPg==
X-Received: by 2002:a05:600c:37cc:b0:456:117b:94bc with SMTP id 5b1f17b1804b1-456117b95bdmr100596885e9.17.1752578588578;
        Tue, 15 Jul 2025 04:23:08 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8bd1997sm15158740f8f.10.2025.07.15.04.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 04:23:08 -0700 (PDT)
Date: Tue, 15 Jul 2025 13:23:06 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:CLOCKSOURCE, CLOCKEVENT DRIVERS" <linux-kernel@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: timer: Add fsl,timrot.yaml
Message-ID: <aHY6GnjMW0SSJQgU@mai.linaro.org>
References: <20250528165351.691848-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250528165351.691848-1-Frank.Li@nxp.com>

On Wed, May 28, 2025 at 12:53:50PM -0400, Frank Li wrote:
> Add fsl,timrot.yaml for i.MX23/i.MX28 timer.
> 
> Also add a generic fallback compatible string "fsl,timrot" for legacy
> devices, which have existed for over 15 years.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - Use items for interrupts
> - update commit message to said for legancy devices.
> ---

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
