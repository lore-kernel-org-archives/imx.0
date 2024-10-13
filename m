Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A136EB4A
	for <imx@lists.linux.dev>; Sun, 13 Oct 2024 10:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728816270; cv=none; b=TO8d8fkg2QckiK+VXS7BNnsawZSNgF/CzZjbITVXyglRu3jivvSdgIsm6CTRCwCfQZ0Mir70i73FSHTdwRcQFD+NTTaEUREDs5mMiJ1cUOjEAf0LHW7nnQNIGbV6PoHSr2IqdeoT2kaBawhSTfreaCtHmBLtWUKfqb/PR4ft6T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728816270; c=relaxed/simple;
	bh=X/WzFSNG9UXVDe5ObTkY2Z9LAkPpAaQBZa/87PdOLYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ki9F+ETEI9s/MiKIsDaCcUmLIoTPmKE11KQhDwLaSC/CxT/McbHAWJ09thQarEbLbD9IItAHv0iHEXuRm6QJ8FCVvL6Yqnq1MOV0pi1lnDMp4sm67uc2mJAADJ3eEX+OLcjyZlZe8/1OSlrx+eXdj1IJdqkl3QgpC3esHSZWsBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BE0lEtty; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BE0lEtty"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c94a7239cfso1195402a12.3
        for <imx@lists.linux.dev>; Sun, 13 Oct 2024 03:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728816268; x=1729421068; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ts1R90nEHJoQVeK5SWtRBNEDE+lrpIhze62//d5StiQ=;
        b=BE0lEttyqwUbcPrO0ubsfhp/2Xloxs/YK2Pa8D8mCVy2PdzrHGNFr5j7JrV8b4NWLJ
         c3KNKJaBflSsJEyuOz87OPLwdQnMk7IRo2XV0ltZ/pX7cTOYnVTVDcce+RpPmvgGWJgd
         /nW3+9BBJkhFMP5QGOfn47KCZyhC6WMn4NjJP7XGzX57p9pNNI+wfFMikRKmKnvO012E
         4CSB+k8BcjTdl5aeu+hTs8J1tpd9HbTRdCiSUa4BGy2BRGlqoxdmiTQvkWoG52MsjEMY
         xyPBA29kb/VXCo6t1WjT37BWJQyWVGYfsHsfiZ2+MckCVU0TbfE48rMy7Dug18VCSKfy
         IrxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728816268; x=1729421068;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ts1R90nEHJoQVeK5SWtRBNEDE+lrpIhze62//d5StiQ=;
        b=GjxH3J/LneIZ47EfFHAqlV8gShofqLbinYSY33kQf/pIVyxtbMY2EryotOvDPRed98
         jHkoClPJxG0bJr9BlhLRjC/BFHow6zs0yRPfFq2+wEo/CBtgdndVpLN4UWtZsWrdUFJw
         fAWsFWB8M8yYcJAq9aMhTmwsfIayUWcVwCxL9Tnqdi8ufzN9eh1/1Be3ioWz750rp8RE
         qWusNI06CqjBCJlKlc+80xTsTuhNOW9a57xHc7UIBn0EH19iNW+2H6NjrnmcR0gLXjVL
         PccqLBmXZL89siG3Fu6P2TdIvFWOqTkh15mQn5sCXj0BtKRBrgzE6bJYb/dX17mk8N1A
         C3wA==
X-Forwarded-Encrypted: i=1; AJvYcCV2EJq5jQWyVhdMvqLMhOD46+lwlemJ/+GjTBz8Az/SKM+k/Cm47lAitoh/6aefx4moJug=@lists.linux.dev
X-Gm-Message-State: AOJu0YxMWO3wD2zbMYwR27D1RxZGiPS/PgCoilledRerFrVq+QUy5iem
	rIKTQvwtlnj+/Yav5CVa2wASHnpZnnRS1fI1DcpXIynGrLdJd65IlZrVGn1Eom4=
X-Google-Smtp-Source: AGHT+IFiRsrwKX/5PtJcK4cGmlJ2UJ7yOCgzC+qEpTHb5ZJ+6wBKnUiuR8gg5WwUrpxesrYe7fLvbQ==
X-Received: by 2002:a05:6402:c41:b0:5c5:b7fd:170a with SMTP id 4fb4d7f45d1cf-5c95ac50794mr8118037a12.28.1728816267533;
        Sun, 13 Oct 2024 03:44:27 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99f8dbd6d0sm122556866b.200.2024.10.13.03.44.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Oct 2024 03:44:27 -0700 (PDT)
Message-ID: <aa140a74-b473-408c-8529-e12f0e285759@linaro.org>
Date: Sun, 13 Oct 2024 11:44:24 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: dt-bindings: Use additionalProperties: false
 for endpoint: properties:
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
 Todor Tomov <todor.too@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-0-a2bb12a1796d@linaro.org>
 <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-2-a2bb12a1796d@linaro.org>
 <20241012180935.GC5212@pendragon.ideasonboard.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241012180935.GC5212@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/2024 19:09, Laurent Pinchart wrote:
>> +          clock-lanes: true
> This shouldn't be needed, as the sensor doesn't support clock lane
> remapping. Could we drop the clock-lanes property from upstream device
> tree sources instead ?

Yes probably.

---
bod
