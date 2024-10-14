Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3666E154BE2
	for <imx@lists.linux.dev>; Mon, 14 Oct 2024 09:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728896630; cv=none; b=l1LhKp5ezttvGGp9ofeZS520vcP85QSwi0+xbyYIBHSLGhqZXmak0lr78hbyUAMR7BVjwWA2Hv288oux5pJDU1TsYSq4IIzCcF//C45RZArXewLFbgfbNJD12S2bnSgRBlcUJNBrO/5qIcY+vugCIO84Mw5zUPrQNpoQuGgv5ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728896630; c=relaxed/simple;
	bh=sHpyCuwQq/I2DTs7dmBgkBNOQIwrlp6onpFJ3nE1MTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iljtzMVPqWDaKEbXfKepYha455NHUwNPQg1Y+1p9IMoHf+GexjG1l1yJgd/VJ+8vO+ZTlA5tPZdXkuEFr8Vwdi7QvMvNQ5X8aqv9aUId2j+vY/pIZg1WpSS0SUx60odw7ei7rzx1WTdSjBVK3fDPkoxW2wU/wayCCXqn75mYXsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R4iXGzcf; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R4iXGzcf"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c97cc837c3so1145663a12.0
        for <imx@lists.linux.dev>; Mon, 14 Oct 2024 02:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728896626; x=1729501426; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ej1J1uipGZreJY91YHwmy1fCwa14PATNAE1OP3F9fzI=;
        b=R4iXGzcfVpMKnokOV23FbZLCryymyG3InNV2wiud7QfZPntyMU7tT3UgxCIHO173y+
         UbZnpUczPM8C4M+qbJoDqwoPTjs3i34YrEpxWtCkuIti56I5p88168oY1uiNSK7NXisN
         3D5von60vXroxZiFEn4xuOuROF8JswXk6qxyfk73oNbrkJBdsjhsvoc/7iffTvkuK6tg
         Btc2m+eD5Jno9EnLm9swC/6u3FME7L2iBGuSM9EJ1FSp2VWL2Ez4epv9J5y3MdSr/Bm0
         9g+x6uStC1zyfsG8IxsdcBe2fA1HllE7jHxkga+ROk33Lh4+Eeq9yGAXgmZIHwPmqQR0
         qTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728896626; x=1729501426;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ej1J1uipGZreJY91YHwmy1fCwa14PATNAE1OP3F9fzI=;
        b=haoA1cnJchqA+BV0MDKlnVyElSPf1ONEpusX//4CNhiy7QAlLqVeNNmIMQFQiXWg8y
         dSIRVwcBudmcWVmGRHGaWLvKnEuzSGeVfWpAYOr7106xKSBTGj9dNdXXYSjmNbJS5ssk
         WpJc+56h6JDW75mnu9bOfC4IVU0peg1VMENXCj8AalsAJLD0kvHeVp8nWZdz1hTOwL6+
         iCPtkAEJRMn9TDNbygdu6zQ/K9IWmcbZyEbKVv1tzmT1/NLi563zDlmIHgOLrdRPSLO0
         2D8YYJyaDjkyDQwsvlzvxyKH+DQmK9FbcXY+n6pGoiJ1dxRNMF06TEakZvPGnc3THjcx
         nkNA==
X-Forwarded-Encrypted: i=1; AJvYcCUr3oGY96I/Qxxc9Ccs1/MkT4cm/ovcKzM/kOxs2Ia8ql0yGhk4O4Bn1LLEcpZkgHnZOFo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwGwKMExVTLSxxBBpwcBNcEcnmChcUL1fiycPLs3JAUpn5VZicK
	8Br/qELeMBL2EDmyGxK0dbI8V0muiBKbFTlSdkkvN5tJfk5s6j78lFoIkcOkXAA=
X-Google-Smtp-Source: AGHT+IGb7GDEfrG1cF+8kZu+KeiDnhyofexGNBASYbiwubzKma7DssNASeS3npGWfvqJswAeHNJYow==
X-Received: by 2002:a05:6402:278e:b0:5c9:5a96:2869 with SMTP id 4fb4d7f45d1cf-5c95a962ce0mr7082905a12.10.1728896626352;
        Mon, 14 Oct 2024 02:03:46 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c93711bb78sm4924587a12.33.2024.10.14.02.03.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 02:03:45 -0700 (PDT)
Message-ID: <2afe4f3c-e2ce-4cc0-88ac-348e6f3f7e26@linaro.org>
Date: Mon, 14 Oct 2024 10:03:43 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: dt-bindings: Use additionalProperties: false
 for endpoint: properties:
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-0-a2bb12a1796d@linaro.org>
 <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-2-a2bb12a1796d@linaro.org>
 <7ecxjoa7aije46cxmkyfd6ihxnqw4wleqkioddomxbwlu7qtrc@4dkfitppeksu>
 <6f461cb3-3a41-4a3d-b9b2-71b1c6be77f7@linaro.org>
 <9510b546-28fa-4fb4-b06e-0af5f9fd3bbb@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <9510b546-28fa-4fb4-b06e-0af5f9fd3bbb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/10/2024 09:47, Krzysztof Kozlowski wrote:
> If a common binding for a group of devices encourages you to list its
> subset, then it is not that common.
> 
> Solution is to fix that, e.g. split it per classes of devices.

It might be possible to have

          $ref: /schemas/media/video-interfaces-endpoint-defaults.yaml#

which declares the typical list ->

$ref: /schemas/media/video-interfaces.yaml#
additonalProperties:false

properties:
     data-lanes: true
     link-frequencies: true
     remote-endpoints: true

required:
     data-lanes
     link-frequencies
     remote-endpoints

and then if you need say clock-noncontinuous you'd just include

$ref: /schemas/media/video-interfaces.yaml#
unevaluatedProperties: false

and then list whatever you need

> Or don't care and use unevaluatedProps because it makes people's life
> easier and is still correct. If it is not correct, then this should be
> used as an argument.

I'll wait to see what people think before progressing this patch further.

---
bod
