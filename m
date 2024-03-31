Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B2F1474CB
	for <imx@lists.linux.dev>; Sun, 31 Mar 2024 19:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711914825; cv=none; b=WpurdsTI8I1dzlEV6GmOrtk1AcLnQk23lSnjeHmjwctNpedKV2m/eww2TN4qkNVfvMnxMuyneOxf+FyVQezwvF45KkfcLPw4mpETN5K8KwPXtcgpXFaZhWoFZEpq9aPJeLjJxHU3lpGxvILA2OY/sf+q44V0bsjYw5xt9avzqCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711914825; c=relaxed/simple;
	bh=86E79lBADpkhatxugvZKRP6tnDy5hZGpVtOTbREHzf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F7lBIME90NdHibQUsOuEd0uMsRaJdg2JDtKGWMaRa523Fb07Fk2YildVXBjYnL5KZlkKXA4tmMABL2sXWuoIdAAebCCpbPKyHZV0J7I+CAvGrkm+4GVJ1W367TPOEi42wGEL9JUYQ7I5082Vjn1EKnSSM4DR5gMeRnKONoU9qEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EdtE4y0g; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EdtE4y0g"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-56d7a0cf96cso2147996a12.2
        for <imx@lists.linux.dev>; Sun, 31 Mar 2024 12:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711914822; x=1712519622; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bRzhiBeUjd+mUeMOnyzOzBUEf3I5ECrDUeyDnQ05+p8=;
        b=EdtE4y0geFpkQIFe+wDkRevhl0mbCZgaM1FolNSAe/yNMHh2PF6dEbyxQS8T5855tA
         S++7Gr9r4G0ETwyB3l5CdsStkcW4Ga3fo110r7jMoid80N230VOqutkFr7INk7aP/j4E
         rx9Lx8FuV3L1vPNpKbFnn1WAD5Ye+SFIsl7RM7t8BuV0gBdsdoMJm0pAqOqzs8xW9g+U
         S1ZhOXqmX0U5dnmEKlR1G+ywbnHVl6GFZawFhQCknw+v9ke1kAiJjSQfenrYFok5Kxlj
         OQb3KJOOnB9Gnwg4u4wRkhPwXKIsi9KtD4gZC+9AzHy2YRdZ6/goVuTnUmFSDvPMqRJV
         p7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711914822; x=1712519622;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRzhiBeUjd+mUeMOnyzOzBUEf3I5ECrDUeyDnQ05+p8=;
        b=X/iKo75RcsSM5O4uXY/cACE1M491OLo9YJ7DY5aVzmcaov0/W6+ySefxcdcXkmBYJB
         /BSxXVnW5xiI+yymkoElhxeBezJJZobV4pJKVRxO14Hv79W5S+3fU1VT8n+nluia238Y
         cJ0oAfshNx7nlVV1b/gZq/1oZ4Jko4+4PYG9WbSvKbUhvKBZcLmjjRtgzRRm5vJn+LjS
         aB4WN+iN6aiBN8ScEm97Qopib64c028c7l2vOQ7LUKrEEg18YkF+cKK7ZUTYFmO2c07O
         rmdsDfZDqrOfMU0I82oWaNt06gkknt/zHboUHrN1LH/F2ciNJn8haA8OuoJ2IZpRM9EX
         ixsw==
X-Forwarded-Encrypted: i=1; AJvYcCW3EX3iO9u4onEjEfW0IJUUpjgWhyYTWpIcWfDSJSQ3zLTGiFOM0QA2O3R3j1VqxHzUGqsPxS2eXyd1Uug2t9sBra/9
X-Gm-Message-State: AOJu0Yzd6KeIVkOWmNMft44gOSiMzQIODrjKK0eE2FXibPqOflLC8d/Q
	+TydR37H8+8xHc8pDj/hd1jMgUMSjMVCntYuCQ7D2MejIrE9IMXQz6RY8I5UoN4=
X-Google-Smtp-Source: AGHT+IGn6zFCTs4ZtvnaVuPzUlhajsp4FwGqiYJeYJjaYN8e8wZH5rRehMeDlZjR6yT5MsypVMoMCw==
X-Received: by 2002:a50:8d07:0:b0:56c:17be:5b03 with SMTP id s7-20020a508d07000000b0056c17be5b03mr5746372eds.36.1711914821803;
        Sun, 31 Mar 2024 12:53:41 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id f5-20020a05640214c500b0056bf7f92346sm4747110edx.50.2024.03.31.12.53.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Mar 2024 12:53:41 -0700 (PDT)
Message-ID: <e9809695-760e-42d2-a79c-bc2d4debdc32@linaro.org>
Date: Sun, 31 Mar 2024 21:53:39 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] Add support i.MX95 BLK CTL module clock features
To: Peng Fan <peng.fan@nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20240324-imx95-blk-ctl-v5-0-7a706174078a@nxp.com>
 <ce1b814a-6b1b-4773-ad29-b572d00f56c9@linaro.org>
 <DU0PR04MB9417426E1F8EA9560213E58488382@DU0PR04MB9417.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <DU0PR04MB9417426E1F8EA9560213E58488382@DU0PR04MB9417.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/03/2024 14:00, Peng Fan wrote:
>> Subject: Re: [PATCH v5 0/4] Add support i.MX95 BLK CTL module clock
>> features
>>
>> On 24/03/2024 08:51, Peng Fan (OSS) wrote:
>>> i.MX95's several MIXes has BLK CTL module which could be used for clk
>>> settings, QoS settings, Misc settings for a MIX. This patchset is to
>>> add the clk feature support, including dt-bindings
>>>
>>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>>> ---
>>> Changes in v5:
>>> - Merge bindings except the one has mux-controller
>>> - Separate clock ID headers in a separate patch per Rob's comments
>>
>> Where did he suggest it?
> 
> See https://lore.kernel.org/all/20240315165422.GA1472059-robh@kernel.org/
> 

He said under specific line about one specific define. There is
absolutely nothing about splitting the header into new patch.

NAK

Best regards,
Krzysztof

