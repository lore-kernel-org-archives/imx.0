Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78544280A34
	for <imx@lists.linux.dev>; Tue, 18 Feb 2025 18:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739904671; cv=none; b=mebiScETWOKMVSHEhVzrsoDtXS5eryxhxsySwQ2hJ9sR7tUr+gxjETO4/QuTFhQ7TpMxoYqpbkwShQrdPPZaDMkeLjFTGoPJIyOOyTe8xGz+aZkhQv1LvygEwIHY3c9/1AO350TceJ0pwJHbKxv7WEcn0ThkRzpG4lTyjQeeY1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739904671; c=relaxed/simple;
	bh=MoO/m337yGrtN/rDuUa+yPCfHoVc7loFFqayxFZslPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s7S900X1PyY8oXy92QpyFgZzuftlGXa+jDPXjOTpvZhQY1QyilpCNDULF18ofDz7Girl7AcYDETMVspCUD1PkyhEJFQy3LW1dk0F4SwTI0etFkOXlJWJiRkrLKeQ5YIgcoFLAGkUTeLxUXGU5zc0ZP8pLYS6dzjsCtHDun3u/GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z9QDM8BC; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z9QDM8BC"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38de1a5f039so5780191f8f.2
        for <imx@lists.linux.dev>; Tue, 18 Feb 2025 10:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739904667; x=1740509467; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J2kLFupIIGJ1/RHSRRNvz/y3ILtkw1UuLgcN/irDm3o=;
        b=Z9QDM8BCERNUSGvCz9Ul5/fvnP6I+nIq8NvbcslxdqHkwOE1quvRuFvWz0Znyt9yK5
         VwMK+QZ3TDYJUijfWmTilchuGpTacIAvV3yYduYmqa4TpSFKsP8WtncC6XnZtf9QhsKL
         yr5aPRJIFEAz5Zc4Qj5r6ngEtT8ckIrER8lRKnJtzHKgtf6GfrRLobh/0wUh0MYS8SyG
         9YUNl5NhPV4R5EE3EFmFTOc02MDu6GNw8DlP3wnDAH5mbJvI72GFZQ4gAQIDjQv+3Lbj
         88N18KWeE5t/GX+uSrR6g3eLCjncmZiQZLS+NIKEmDzxGdjVD6v1xC1TUp9BccJAFSCM
         t+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739904667; x=1740509467;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J2kLFupIIGJ1/RHSRRNvz/y3ILtkw1UuLgcN/irDm3o=;
        b=h3wNOP5AMDMDFozO+v22zEdqgyjwVZc/tlggRLSv38vbiP2aNgRV67WSnDMo8bo4RC
         indeCJM59gjM3abVTkBTLC1AJo/KrIDP/3p46EwRH8rH5BmqzZ2cvTlcGD3lmpAPl4xH
         aDyOiMzI2blzVzkFElAQWC5LJAGohic2t7ZVUwj2QLFA3Gbd3gZYSkMKfm/1F/F5VXeU
         PmClDqHHf5mYSo68k5pOJIc6LQ7186d6lWevd0PLi5Ny0vNSc4C/9vihpBjICsKQVAmU
         dbwl9tjyJR+O9BS+2ncJcN8B7O91IkCwSKA2L+gFbkQIR4o8iF3DYcM6cw25GkJ3tL3y
         QOIA==
X-Forwarded-Encrypted: i=1; AJvYcCWlidTqZK4g5CVmjFsugIqorjBbgVuqBBD2coU5QcSjrF7CeU8/MXJynBGOWg/ynTHDqAg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxvOpOktGFJwoKDniWS5LNv8mUoJDDvCHtLFg0I4jd7x40t6wGi
	Tuxl3Z9ZYAvyc3JufcRekDmRfxx4aR/CvFmZC390DYYb/y4hgKehNeNEmOpBlug=
X-Gm-Gg: ASbGncsrMPt6yuo2D8ui4WQHRPtf5NuAkeNtP/JBAfcCIMsX+EVRzzcpN3hRCH0TvZu
	vZf3EkawecjFOPGSC3GHf84jQ/BZ3QyVD4AYIsyAp+1MPB3XsXLKJd1ug+ykDqYZUTYuCfrq5gJ
	s7Q7Mh4BUY5ufSMlPpVmdE94pwZy0B9vta7z6HXDybuEbgiS3rP1OLcS6SXyNrAd/3/YUhH+rOh
	I1Qbe0AVNY3mGE4nu0OUDOHuONQjglo5mtymedU2/rlLW28RfR+pE6u5TA9LR4p2pbTfV+z7g6c
	VDWYR8IloDRIHtWalznw0UUTtYlZDj/va6CVkWu6RsEBLmU3smmb93o=
X-Google-Smtp-Source: AGHT+IGWiGnjxl9amPWMtpBg/TTVGWv0w0/3DeUvonXPRwth4gPx2Sx4xPYck/WL22fVGRawD9RD9A==
X-Received: by 2002:a5d:6d01:0:b0:38f:4e30:6bbb with SMTP id ffacd0b85a97d-38f4e30bc4amr8481365f8f.25.1739904666800;
        Tue, 18 Feb 2025 10:51:06 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38f259d5e92sm15924221f8f.66.2025.02.18.10.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 10:51:06 -0800 (PST)
Message-ID: <5f7f39b9-5cf8-4ebe-816f-d56e52bc7408@linaro.org>
Date: Tue, 18 Feb 2025 19:51:05 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] thermal/drivers/qoriq: Use dev_err_probe()
 simplify the code
To: Frank Li <Frank.li@nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
References: <20241209164859.3758906-1-Frank.Li@nxp.com>
 <Z5EULLr7hsk1RIZy@lizhi-Precision-Tower-5810>
 <8693bf83-9878-404e-b609-dcaf758d485c@linaro.org>
 <Z7TEGQQ/JM/q454F@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <Z7TEGQQ/JM/q454F@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/02/2025 18:32, Frank Li wrote:
> On Wed, Jan 22, 2025 at 06:41:22PM +0100, Daniel Lezcano wrote:
>> Hi Frank,
>>
>> On 22/01/2025 16:52, Frank Li wrote:
>>> On Mon, Dec 09, 2024 at 11:48:58AM -0500, Frank Li wrote:
>>>> Use dev_err_probe() and devm_clk_get_optional_enabled() to simplify the
>>>> code.
>>>>
>>>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>>
>> I applied the patches, thanks
>>
> 
> Thanks, I have not seen at linux-next/master. Anything missed?

No, it is in the thermal/bleeding-edge ATM and will go through 
thermal/linux-next tomorrow.

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
