Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9680F1AA790
	for <imx@lists.linux.dev>; Mon, 11 Nov 2024 19:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731352975; cv=none; b=ExZLhXCUVVcdnn0Mq+7hd8G895D9pcYtzH5EH48GxvFAKkz1uglS4kRQMVcCV+oBxC/dEVDaAH1T1mc7r531Z5jaxlRiIxatDKusNQymXLU7VzGmWMm1T1CMWkt/5/zvMnclR60dQRIblopILkYNcwu9QLlbabnvTdkedIq5lwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731352975; c=relaxed/simple;
	bh=/nmLjHtfpdNdhGIZlqXYWtJccSFVnju/0KheTIMKdy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L9rg4N4v4jedMIeuFm0q3JsI7Y3cqQk2tvahsgyMog7NBAgdjw0HeQsO6LZpxPBycbquRmKX0niGrvCv1+a657JWXa1maP6r7bWOkIlfDfaR4eQcevEkJYBmsDjc/HLXKZ8Pq9OeQHqR+Yr+OroNJVE0mKSSzdYWl66qBE8cpAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BINFDsHs; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BINFDsHs"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-2884910c846so2192832fac.0
        for <imx@lists.linux.dev>; Mon, 11 Nov 2024 11:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731352972; x=1731957772; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P+f3u/Hy7ggU6TYper9ScR7UkjM6HPFZfTcg01Knz8Q=;
        b=BINFDsHsfLUAKGHIz+mtFafpkjoUxovQBfm3p/vpnJUXdrk9N5V9Tx48d5k3VD4QzV
         3sS5/xB2AtFEY+YEo6J8v5TaFuVtAzX4tqvE5dyRoV5AaquA7XLNsvyGtG0m/fOWtZkx
         1Zm17Gem4TxSh0XbIdlECqTCy+J3BtSz881QAHHdeDBOhSLOs1qp29xzIoA6Dwaz+33/
         pdOVyaafBmWeMidynDx9mBmDWz+fu3WTYAbKe2oZ4kwccpkXq8ddcKGBoOHMT7k/idK2
         l0LY8FjHScn5oMmdDVqCpnUb0GPwm355WtuzLMbZTLB4p2Wux1KWj6fpXjzE0msDmBMk
         XsPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731352972; x=1731957772;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P+f3u/Hy7ggU6TYper9ScR7UkjM6HPFZfTcg01Knz8Q=;
        b=hw/HsoR9TZgn0d6bfrIYYaJTjrf92F3ZFLM1P9O5MxvNO6xif11ARcEwDIMVlQ2eTr
         vPyidrVbQBs8qgOEQwUy3H5ExrwBydOWN81INkLgRHvIBIvdlU0aC9TGoMMlCZJr6/yp
         DRiFCO8RYIhN0Z0LHh25+u8wrgbpdqCaHZ16AIP0j74Q0k7815LoWGfhMS/BNSp/nxPW
         FiE8zef1VSXdffqwmQFQzCjGojfjdu40pufsIkeFmLAzPvfPGQkvbQdV0nfLa0/WZKPS
         Zj8l4KoT22J8z7QiiTIrMUzYiO/DjeR97E7jN01LFa29fiwY3rp038GzZHZWtGxrdM6S
         t0/g==
X-Forwarded-Encrypted: i=1; AJvYcCXNRy40G6TM9U+CjIFEEWJ/ES0MgtlFsg7iUibYp+Q+7R091cwVVVcdYNuDYU5Ga85PHPI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwAg0K638ftpwzNZqyvZkAVuiqFD5ojv3JEkmhszHr5sEnrIGdG
	ZU2czbUKs5J+Sb/BPSip+S6ZTkUBTrIgESNpAoauWUKkgg6JuGBW2pO6eA==
X-Google-Smtp-Source: AGHT+IG2nHO+Bg1rkJrf7qfukU+vp9KRWNaZefDaFklMRxL7gpN5i3aVFdozoWQvKm9ndIshve7DYA==
X-Received: by 2002:a05:6870:d110:b0:287:3cf8:4abe with SMTP id 586e51a60fabf-29560099278mr11079889fac.18.1731352972553;
        Mon, 11 Nov 2024 11:22:52 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f644036sm8879120a12.66.2024.11.11.11.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 11:22:51 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 11 Nov 2024 11:22:51 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jean Delvare <jdelvare@suse.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 1/5] dt-bindings: hwmon: ti,tmp108: Add nxp,p3t1085
 compatible string
Message-ID: <afbd8490-f5bb-4ca3-8da0-aa1f01de5efa@roeck-us.net>
References: <20241111-p3t1085-v3-0-bff511550aad@nxp.com>
 <20241111-p3t1085-v3-1-bff511550aad@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111-p3t1085-v3-1-bff511550aad@nxp.com>

On Mon, Nov 11, 2024 at 12:31:58PM -0500, Frank Li wrote:
> The register layout of P3T1085 is the same as ti,tmp108. Add compatible
> string nxp,p3t1085 for it. The difference of P3T1085 is support I3C.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied.

Thanks,
Guenter
