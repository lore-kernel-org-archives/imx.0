Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B979F19ABC6
	for <imx@lists.linux.dev>; Wed, 18 Dec 2024 10:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734519406; cv=none; b=Es1zBl0HVqkgDqTPJcZ/0O6iDETCRKLDc+dHjO0FTm9xUxQBB+8DZBdsRi+CvmHmKHsUlau0F4FkdzitWHeEZ/yqyOnyEZL926cyhvcM5veGeUZl8xnnMGWyRJ3RGg62S/SwJElH3dcOEWC4hgzpvH+3oLY7mRV7nXIBSypgem8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734519406; c=relaxed/simple;
	bh=1U926oL0MDod9834V/+y8z2gIy7U+dCjf8CDW1Dhy+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ISJSStrYCFEzeVkUFbP1IARW2eny+JlYRwiYVhDX7HzyZzbsJ/uDb6M94WfybEImAQEXeth7AC21vkiBmVrgSDR/KDD36FXvIiGun/HB8BSndV0m5HnQ08r9+F8uqhRdlONIFD4z2LGvV7fChEj6/SB8eqUYMUBk1k7lDMEISc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HHCiGqz/; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HHCiGqz/"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aa684b6d9c7so1044854166b.2
        for <imx@lists.linux.dev>; Wed, 18 Dec 2024 02:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734519403; x=1735124203; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1U926oL0MDod9834V/+y8z2gIy7U+dCjf8CDW1Dhy+k=;
        b=HHCiGqz/DORMT9SJ8LAiuvkr4/UMzIo8UFZDwf0zPO2Icvhn9Tp6sVaYZ67cDrhms7
         aHI94zuajhvUGOugb8JV6iHMUEXs4yp6H0q+AcUfTCpYGPldB8do6Sw7xHRsHS8niHVt
         Ry2qah0HAB3LNldinTU7IiClRvEpXGQQrDKlQjTQ3gSFUUAStulBhrsUjK+8l+xTsesY
         PEhZz+luU89ee0ARMGi4cHzLSxXSg0OJdVfK6Xh464rovxVCy59KhRd8f97oe9IGBsgp
         Nrrf6iscr1nlWvSPy4YevduoKHZWwobVXMylVSO+Dsq3WxiclW+bw933QLVOdm5KfpEW
         e6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734519403; x=1735124203;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1U926oL0MDod9834V/+y8z2gIy7U+dCjf8CDW1Dhy+k=;
        b=h5lmNeiP+sGUNSKF+rmZMwxeZ9o6qG8lDrr3HiepAj2I22LTjET4HiLn8CP8x/qXLw
         Pp5sRLxtaAJ6VWklBYcxJ/OEWaOpBSu+a7BIFALSgJVyrSmFmYeSHDdzQI3rG/MfV0wD
         fXaA9DN7RlWtLF3ELMoHHNXeKUGUq1n2/ILPNtfAfn6tD60bilBidwiknDQbxSUW124c
         h77AOzYNVtDSmozsWdBM26pGy1bCmrcrcG6rZlMAGWYpZCQT/RNmq5wbNSsQ8kYdK3A2
         D2wyRdgASQKAaCT0j0ol3bYOgHz9GCWmNQXbaJJtCboCn3pZRf4VK0AFlfsCkebMNHXJ
         aQjw==
X-Forwarded-Encrypted: i=1; AJvYcCXC29ILOA3EWVTt+FAzHpKrUN1+LjjKQUXW3pJCW4qr8PTxeobdUKsSXDutCAGivBH1R3I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzx8gf9br25TYElFaNpU64cDMO6yvA1VFgrRl1nDC8EnMXHIgp3
	Ce+u5OARoxMegtevwsfZ6VuyKdxaMmAE7rAFfOx9U6vqll8QTM8O7R9rh82q+Cg=
X-Gm-Gg: ASbGncskyGvl6nuZX6dOTywIttckhXXV8qjcfMEPTUQhY/CjMh0ytY2uUxKfLE/vY7n
	GaYR0yxZzc3k07XCfqLqbq74CEtfWCpSFqm+FhHT26wtQCThYGymgwfj4f02WDhp/aGDMuKfAuT
	xWmxHFFYZdMQlQQPj0WqNgLG3nZ1VyDHSzGQ8r0+sYy72A9KPOBpG+o4DH9xdB4NN1Nw+yrES4T
	a0LGshdZ+ruDMIm9vOTpvFUcG+1kjb0TxGSILv72FBENMn+fsPu4SK/CyumKw==
X-Google-Smtp-Source: AGHT+IE/DWSsh274zbrdOvo9gwMqTUpaPLUr/pgihNb/oqeoC9Ggo5slLMiTVrniiI/U8u/pkIWoVg==
X-Received: by 2002:a17:907:96a7:b0:aa6:82ea:69d6 with SMTP id a640c23a62f3a-aabf476eaedmr223466666b.18.1734519403047;
        Wed, 18 Dec 2024 02:56:43 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aabc8060de7sm299490266b.53.2024.12.18.02.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 02:56:42 -0800 (PST)
Date: Wed, 18 Dec 2024 13:56:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
	andre.draszik@linaro.org, rdbabiera@google.com,
	m.felsch@pengutronix.de, emanuele.ghidoli@toradex.com,
	parth.pancholi@toradex.com, francesco.dolcini@toradex.com,
	u.kleine-koenig@baylibre.com, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v4] usb: typec: tcpci: fix NULL pointer issue on shared
 irq case
Message-ID: <1f50582e-1332-450b-9da9-08bb25d798cc@stanley.mountain>
References: <20241218095328.2604607-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218095328.2604607-1-xu.yang_2@nxp.com>

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

