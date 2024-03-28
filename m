Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4001413AD18
	for <imx@lists.linux.dev>; Thu, 28 Mar 2024 22:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711663233; cv=none; b=Rq+avcA1x/f/ieuWtsDuY0yhbtfmro4yDlDIpvKxb+NPl4o8Sfn2RZTM+j0VmJPJREdCopjiCYbzxm7x649F1P6ccSBrlDBNHrrUxWq7Bd0uqi2ZKJna9jVsXsQqYTVtiN4j5aGxCEhLh+qh1ZM38EPkevbfb+srv10AjAGMd9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711663233; c=relaxed/simple;
	bh=OnsfEWGxjPhenLXNPPgn/fTxfEbTRbr9ba77sLH2j5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kopm2XELsZJKvTbFbwIEBVjiz4T/7IwAt9DeBRB1cA2Fi/ag9x+dv805+kpE9FxmduKZZ9AD0SXjri/h6XSu3pLwDWFH9ojCNuJcvelKH/tvM0rDznH3F4oQSDOSzHggDsYSMwPi+7VH5uEScMvKoOJj/IpoRnHBzLBw+1odjTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UCHM58tR; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UCHM58tR"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-341b01dbebbso1205676f8f.0
        for <imx@lists.linux.dev>; Thu, 28 Mar 2024 15:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711663229; x=1712268029; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+UXpLDzEJhLrG5sKF75pz/iotzbUX0jhYNPtvtcn7a8=;
        b=UCHM58tRe8KcQPBCaa8UKe3RcrQHJ0Pi21F0UNiChkYO/3QnJL4KqIc1sb+YjTRLlm
         q0TuzMmnG115Rh6HkmJDkNH3i5PgWd/O3LAtATEwl8MC5eDI0yaQ7DSsatuTF/4IbxiS
         LtYSRbAt1XbdG2hC1hpig3xLz5tgC4GudBUiXXDaw39G/v/VuHmq40fOGjSlNmLkKYhI
         O7Fcl+4zoJGBsP0/DjmJ7lRevhuDXjHJfTE8Tqpggmv7HBo7TCrcm364vrppNl9/+UYV
         my8L19u2q2OFk7/91YcRt2MSRSqYQSHZ/ufRjKXlL/mDZS3aWTOH2oB3/hJPxNF15Xu5
         hb2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711663229; x=1712268029;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UXpLDzEJhLrG5sKF75pz/iotzbUX0jhYNPtvtcn7a8=;
        b=twk/fTNpeiSyiCuZf+sXZlL2j4RmIUOd+6H4wevj86PBdMceD4lZ4BuIUH/tvKVmMI
         qIi8qeLnc9WtYqAQtGMCrXdEUAbJwA+1bZn0cZUMKYMgXhzMEND0PjTKSYlLtaZgbWmJ
         akd4fZmSIOpU+CSDRJsBsGDBYCisk2ZqNzTQjn9JZLcQ5Oj7dc90B07Flg5f61sqbWg5
         T37zu8PapMj4pMgFM6QBxbOTo3reNbZF8iQtXpb4KG+Sn1pdNKFjDu5stshfrks1lFgi
         UyKot48jofWWalbBWjWfkOooyMb4wm6WJE2DnBNWeQo+ttXQJYQviiMDxaXp4PT65S2u
         zDcA==
X-Forwarded-Encrypted: i=1; AJvYcCXseUVgkLFVv3o9v/sUYoNYiz7NPfwgwhtWUXgrGwvlldrQ5bhP2iP4+icHOKDZHMP08A0ExcEBlv0tt3cFdhSNV8Ud
X-Gm-Message-State: AOJu0YyGFzwwhDRvPGCEzpts5zBb2ooMh5GCTy95gNXm9ngHX8TxYScS
	bNRKmUtxvFeEJUNz68mT5zgEv7YE2MM+RyiEjlQGiyTUseO93z9b+8WyvHoTjA4=
X-Google-Smtp-Source: AGHT+IHksJkhKrH5njNeiv6zhPfLLsMVt8hDw8dLc+YeObfnbywVwkOis4YCll41OGC8zaz2+3zjDA==
X-Received: by 2002:a5d:49ca:0:b0:341:ab13:6d50 with SMTP id t10-20020a5d49ca000000b00341ab136d50mr241818wrs.28.1711663229613;
        Thu, 28 Mar 2024 15:00:29 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.50])
        by smtp.gmail.com with ESMTPSA id co20-20020a0560000a1400b0034334af2957sm1241600wrb.37.2024.03.28.15.00.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 15:00:28 -0700 (PDT)
Message-ID: <4babcbcd-d123-4725-b1bc-1edd7269900b@linaro.org>
Date: Thu, 28 Mar 2024 23:00:27 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: arm: Add Emcraft Systems i.MX8M Plus
 NavQ+ Kit
To: Gilles Talis <gilles.talis@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, robh@kernel.org,
 shawnguo@kernel.org, festevam@gmail.com, alex@voxelbotics.com
References: <20240328202320.187596-1-gilles.talis@gmail.com>
 <20240328202320.187596-3-gilles.talis@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240328202320.187596-3-gilles.talis@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/03/2024 21:23, Gilles Talis wrote:
> Add DT compatible string for Emcraft NavQ+ kit based on
> the i.MX8M Plus SoC from NXP
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

