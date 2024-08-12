Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E55B188018
	for <imx@lists.linux.dev>; Mon, 12 Aug 2024 16:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723481327; cv=none; b=P/Zpnt3jSjACmUPVKiLs0dswnoqmeKuP2yxJOcskL+7ckI1igv6DKj9w+LUJ0W9ilWbwKa+5ovfnGwEQ8zu+sfZbGTPpTuDljQZf1da4z/GxKIXiCH/p6GX/bJBcf+vXLV6T9sYo4F0wZGO4c0WZDptL43jaWxQYqIU0MGaRAVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723481327; c=relaxed/simple;
	bh=XlaiAMQh1V6IadrgEMbgyeLhJ3AoIR6vUvuyik168Es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=keuL6UCfJK6/UcYlAkx6yBWn9xeZ5jfjmuDe3Cz/7LtEoe2Bi1/vc4k4lUYKEaloA32fzROSupqj5VKDlWd51uYBzx7FDPAiuBBSXqntqe6LZwP5C5rOd/4flzwPa/X14ltLk7lwVqeMDKHs9FfHIfMGhEJhPVVsVQnj766QlYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AROERX9k; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AROERX9k"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1fd66cddd07so30471625ad.2
        for <imx@lists.linux.dev>; Mon, 12 Aug 2024 09:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723481326; x=1724086126; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hpMVxN3h+wXRgJtl6Puat78aXyyI7hCBpes+Mit4XIQ=;
        b=AROERX9ksJJ/Uhf6BZE6ptb5EGOwf34cnDQb2cl5uqBaXxvBe4V1PG1qVqrkzOSAjg
         2VVeOpkmqdmZH8zIVPR5faQ7osZhrO/ed/ej0wbtc3FICsVCmNB1g10uHR2xgkeOZRa1
         C4ujCZ6bkddkGQEHgmk5B/8EL7VPCNehLAAuw6BPAZW4WUpPrDDzRAbknrCNYc0WSee6
         LKVlwOQgTdUAOcncAh7YlYaBk+BcKOZ10woSwbBQsqQ+Mtt9TGYu1SER0/3jXM2ycRAx
         Z8KTxtw0cOUc8FtqtfnaI1UcIoX54zegWCQ/KO9rO1gc6KAbfgVdIIWCL4a7RwkpjqMD
         v0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723481326; x=1724086126;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hpMVxN3h+wXRgJtl6Puat78aXyyI7hCBpes+Mit4XIQ=;
        b=D8IzMLu0l8KqZi2C3aEmGfEOXwH4G9/sal4Mmd9QOJGfn0kDL6oyWUI8zCt5rnRaZW
         AONhQ2qialvw83LMjU9UuFT+R+FDb4tIkz9b1dw9lvdd4Gq13y4T/Al4xhqe9rcNz2M8
         OKiC7eVQBLwy4q9OcoYNMRC2pl/Zw1htVzxtGI+P3a776jf6btCwVKy12emg1qfBZCJL
         s0jc0VyZS4uOV2yvh3JxtsXPsdX8dBpZb4tA4hfdW+XHXv3JQxdKsxzBz69+izp/Eaem
         As7iQ34fVyLNXwozBBvG97fFcdleFMmQdafpEIWX3x/uY7U2JLF7ttVCrtV2chSNcFMV
         q0Yw==
X-Forwarded-Encrypted: i=1; AJvYcCUvMACJzpW3irFlycAYUDkuYcTWIPlc/Zph5RtRcUKvvpe7onQ8nNtJbCjCZqK2JGC7/LU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwqLVihnteDuxx/O5NLxk78pWBgT7csaYa4LO8oxBmK1I91MvU2
	q78q3YTb0cpWsFWSmmMKvHFKzFGqXBs0DoCUcgXR2DA3+JocNFIf
X-Google-Smtp-Source: AGHT+IHdDf7SW+xokXQj9UeB5NGIK7iiYD2rn/ORwOD8E5Ll4AimeY8xbAADkg0XqSxW4hNHVgstXQ==
X-Received: by 2002:a17:902:e74f:b0:1f4:620b:6a27 with SMTP id d9443c01a7336-201ca120464mr12826775ad.13.1723481325443;
        Mon, 12 Aug 2024 09:48:45 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:53c5:10b0:cfab:3972])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200bb7eeeafsm40051455ad.26.2024.08.12.09.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 09:48:45 -0700 (PDT)
Date: Mon, 12 Aug 2024 09:48:42 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: input: touchscreen: convert ad7879
 to yaml format
Message-ID: <Zro86hWQVyaOAQKf@google.com>
References: <20240810143840.3615450-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240810143840.3615450-1-Frank.Li@nxp.com>

On Sat, Aug 10, 2024 at 10:38:34AM -0400, Frank Li wrote:
> Convert binding doc ad7879.txt to yaml format.
> Additional change:
> - Add ref to /schemas/spi/spi-peripheral-props.yaml
> - Add #gpio-cell
> - Remove  spi-cpol and spi-cpha in example, the place hold 'spi' can't
> correct detect spi-controler.yaml. So these two properties can't
> be recongnized.
> 
> Fix warning:
> arch/arm64/boot/dts/freescale/imx8dx-colibri-aster.dtb:
> /bus@5a000000/i2c@5a800000/touchscreen@2c: failed to match any schema with compatible: ['adi,ad7879-1']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thank you.

-- 
Dmitry
