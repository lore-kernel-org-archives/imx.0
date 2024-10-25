Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C8420EA51
	for <imx@lists.linux.dev>; Fri, 25 Oct 2024 19:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729885423; cv=none; b=BXt+x7DPiYrF/JvBw4FX2G5dJJE4aYym3AdYjz4JRZEd7K1FmS6CTAvnkzl13SPF1cVmz/KC27G71Mh4JrJSK/L4364dH+7pxD0QXWoEdOzzD13zBoqkUYR7cUfS4fo6qiD/cCEsZf9WCffgTbLISnJGPLB56Sm6cUlQ0po7p0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729885423; c=relaxed/simple;
	bh=lSsZDvEhOeZyn9VaJIiTtvyjKgumKCFxoFXoQeta2sM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lXq/HLak/mr05HZ5uNO4x5cBocCro2wR2GYjh7Lm8B4SEFI3AbMrZ4HBVxzzwyL4cBq1PhmJwY1v5K76TGoeGrdMzmtoizFJYot0qWwAHrmQScy1Na7Vz/vPXOpG26veJFtH+9KP/nVbRFuN9XsZzQNwGtwjd3GmskSsiBvrlq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pFTqVIrM; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pFTqVIrM"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4314fa33a35so22884095e9.1
        for <imx@lists.linux.dev>; Fri, 25 Oct 2024 12:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729885420; x=1730490220; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lSsZDvEhOeZyn9VaJIiTtvyjKgumKCFxoFXoQeta2sM=;
        b=pFTqVIrMS3U7if6M/1++/ZT6yt71SdY398Ex+j4LytNobr4fReE6MHbOqgbrBsYxTT
         doOg7oHESWK7DTWfJO8SBPGt8wO0dwZwCdQWRZKElg11aYnV8LJH+CgWST85uhmGDNx1
         vEHL6L/dmmSAEqw7l9ItopmXyKys3f5tuhTKO0v/wQJB7Ve+oaMpAoo+bKaM821TxWzC
         P+jgo7Zb2ZMEmt+1FPRfzX35QshuOt/6QI8NWv87bu9SLA6FzVUUvog6j24psrNHFVhc
         iTUPge4OCFhoZRpyu5FnfAr3X0tKwWDOmh3DDlKcnzA8a1CEWlP3wijjMzusxC+gNzus
         dAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729885420; x=1730490220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lSsZDvEhOeZyn9VaJIiTtvyjKgumKCFxoFXoQeta2sM=;
        b=kRW+oqMnTdino2A8Uo1Fx6NTMVEigidjGm/2iMHQAbsvhjBocDstvv0EthsTWkVzvG
         Eiul6idpZN2lyIUxZ0cBviMxBj5CiGyWx7dRx1QXFpmHKe5z8vG8gfMwZkJwT1diT6Yw
         b4LgAo5vY9XXlax25cIWkSEypFoxIfD5EzgrZsbC6jD8ABL4otxmRWrX1tmlP9zjatNG
         yjJ5lx6F9uLmClMG1K8vOWzYd6qe5Lq7LhwdqPCTCyXdhCf/Q0EQACv+2pi0XoS00HdI
         nBUdmANJDbFFZDQuyIc9RncK6p/xZ864y0F3GQDf9iKqpH4HCWkDHawn/buTaSETO9Rr
         1/nQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOKC05IrRMroEeUIdl4RxWLgrClkTn3++GM4GVoR1Kda5jaRYLTe2EgT+yLH3pQvRT9+I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7WQiWib3VCrcTkDbslN4V90KEbnLgXCn8vdqYIq0Ot0cbRm/j
	5q3OvoH+ZeZgLV8jlmgomMl1mYEaEcEC1mQGhlSzREALvEtJ6Gm0T8nu199IrcY=
X-Google-Smtp-Source: AGHT+IEzPuLj09sW3XJSXTYzYRkCzcdUHuV5hctMILxMB/GePRDvwaT9iOwJTJZ47PpX92GjYN8nCA==
X-Received: by 2002:a05:600c:4f51:b0:431:59b2:f0d1 with SMTP id 5b1f17b1804b1-4319ac6fd9dmr2332175e9.4.1729885420036;
        Fri, 25 Oct 2024 12:43:40 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b5430absm56939735e9.6.2024.10.25.12.43.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 12:43:39 -0700 (PDT)
Message-ID: <94eca595-6ac2-40cf-9437-cb6695c45344@linaro.org>
Date: Fri, 25 Oct 2024 20:43:38 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: dt-bindings: Remove assigned-clock-* from
 various schema
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Martin Kepplinger <martink@posteo.de>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 "Paul J. Murphy" <paul.j.murphy@intel.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Martin Hecht <martin.hecht@avnet.eu>, Zhi Mao <zhi.mao@mediatek.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Mikhail Rudenko <mike.rudenko@gmail.com>,
 Ricardo Ribalda <ribalda@kernel.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Dongchun Zhu <dongchun.zhu@mediatek.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Todor Tomov <todor.too@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20241025-b4-linux-next-202041004-i2c-media-yaml-fixes-v2-1-1b4535174a5a@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241025-b4-linux-next-202041004-i2c-media-yaml-fixes-v2-1-1b4535174a5a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/10/2024 17:21, Bryan O'Donoghue wrote:
> Remove extraneous assigned-clock* from media/i2c/* schemas, retain in the
> relevant examples.

Ah, pardon me.

I've neglected to update the commit log.

https://lore.kernel.org/all/20241012172430.GB5212@pendragon.ideasonboard.com/

I will send a V3 to make it so.

---
bod


