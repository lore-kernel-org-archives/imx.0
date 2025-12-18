Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73436277CAB
	for <imx@lists.linux.dev>; Thu, 18 Dec 2025 19:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766086625; cv=none; b=qrBEovP5IiE1E32m5CTW35T3TuGT8KH2hMIpDYVyrRrHq8SF0h0MG/tS6fIeHBf70MwvomwaYLmUmDjAhldm10ZiGv0AsyMLu78K9dQwIVRPLAc/YUkUmlOrW3dc66/ntid0DzVzZwHiJR9dDEPHmconbo/jzTxOBr5qz1YGmdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766086625; c=relaxed/simple;
	bh=w4ijCxv5nGSdlsC0Jn4air83tfFljT1G/MgpGFT8x2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GEyXvy3btHipAJVM3pI/gTbjyBIx0Y/74zOFOmOah7JRLT9f3tsxKLApwIIt2ejxNfo4Wz5JM0s8D7+FdZMJF2QuSF0A29OJMdZyaaz1SAi5lDmLfADWniE+m/hQCpgttjESB/znfvrE3g8iEbryvxltZXG96xb/n+YdUAD+Tj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eAYoR2ok; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eAYoR2ok"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42fbad1fa90so888806f8f.0
        for <imx@lists.linux.dev>; Thu, 18 Dec 2025 11:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766086622; x=1766691422; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k+3WA68tbyaWMaCBDkCMe377aB/ts6/EjKX02uXHPEQ=;
        b=eAYoR2okSmrbBHbnmOjj6Mvr+cRP2bNqkZe1QuJSi9BSABSmnGaH8G9znp3Ffx9di4
         t3I13tqFPi52E+5Ac3Bo+GkX4qfwh1Fw5ksx7elIFkv9RHc1VJgQRtiWgT1HPr0aN5Vz
         AaAjTnL0SSB2dlBrAc5B/RSulxInbzZy0Hf/WKuYLXOF6QR+wLc5GCz/Z4ayKuwQIZ//
         jzQlz2Et1GC2ugmN9ypRhp2y1f2LDIsuoZL/rxcwXQuF8VIfI+RzuduUTB5Y/3Qk2wCk
         IFl3dAplLabJtl9HPXdK9Uhfl2wNqHNJ9VdkE2kV7EeMkbdZpp6xVOLypjYzFPwoR0zk
         9CGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766086622; x=1766691422;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+3WA68tbyaWMaCBDkCMe377aB/ts6/EjKX02uXHPEQ=;
        b=BuQee4Ai6YdgmBK6/JzslG0l0gzJSBY8QBnAxvH/yj/C4wS6WrEcKq9403k7/5DgXS
         8+XZL9o0bXYM1m38iGrXbFL25t3asmqxcjRLQL6KhxJUXgVNyDOAMEJL9Cqy51cC01s7
         gqhFkqYCUvpcSplca5lmJquC6zIKVg6xZ771QHNR6PJawMwArTyd3yvDk9UcprrJH5kK
         I03bOTVuBiR7pnlvphjTRxFUD5oP0oa3O+3QnqUXjHAum4ko5ASl+JjNQSBV2tJ7FJrK
         nKi+VgjL/85Og8XLb7VTvgJYDcCweZF1XN15PI1UVErGeLBRtBf01hHwQe1ezHeSQDB6
         uDqg==
X-Forwarded-Encrypted: i=1; AJvYcCXGP0VjmzDcNuXxtSaMhyqVWuHXq0klVIEjl6GYoiwH2OAXmxGyXZmi/+BMiF8LLfPWcdU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZ0hMoX17Jx3al22EdbDP2fJUDQfWBNgYcgkQLf/MhX+MPnC2k
	rrnZ14F4thWF4uXS+55Jr6th07VdMMRGNZ+jVBchHxoAyBCcQ9MJlvSw
X-Gm-Gg: AY/fxX7YhMMixFw0L4uV9rZotC6r7VztamzSsPRWXvK1lseVKxp0ns7AcTMczdT8z2Y
	VPK26quILyOGqNyYlg5P3e5VE6d+iWjhxzVQ7wZhbQ7vz7v+b0dABKfCL7dPc1uBQPKVwN/h2CX
	pp8kLFot+uO4zra7OUoGTDKAi/4qqGZRSvkjp4YXYcED3bsp23U+XPmo8AaO3JCvFug9TvkobHF
	wzB0WzpFwyy4OSWHvVA8dhaPmTvGmjfBc1Lw6Yj/pW4+eUbS8WB78hs1wbV7VCMS8B1t14g77BR
	WKf/ikGSohj+kh37qQSsRjexf/ZkmIp3igXtnHUmzCghUw1t3+7h4DFkcO9z+AtqWVxIFUazA0b
	qWY1S5F0EMHUU0UuQ9a5wNQWmIt8edESqh9IXkV4NBctJ8aw7wFNqGUNUH22545jk/Kmm3aRVGM
	aUS3wmG83m4eFvBxSvg3cTVNm568FbXROvRHqdRCdRfBXUVlPBGzsTG5KBbV2i2Fq9h7EKDQf+Y
	hHjlKbgM0qG54/pM709Lg==
X-Google-Smtp-Source: AGHT+IHrRzBlIY+FRB9tFL8aSm3apHXMpPAzl6Tnco5Z8RZxNW6uXBEK/NYhBHMWetr8sM0EXHXAfw==
X-Received: by 2002:a05:6000:220b:b0:431:701:4a1a with SMTP id ffacd0b85a97d-4324e4d0f68mr746833f8f.26.1766086621517;
        Thu, 18 Dec 2025 11:37:01 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa2bdfsm555186f8f.32.2025.12.18.11.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 11:37:01 -0800 (PST)
Date: Thu, 18 Dec 2025 20:36:59 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de,
	j.zink@pengutronix.de, linux-kernel@vger.kernel.org,
	xu.yang_2@nxp.com, jun.li@nxp.com, Frank.Li@nxp.com,
	haibo.chen@nxp.com, linux-phy@lists.infradead.org,
	imx@lists.linux.dev, Stefano Radaelli <stefano.r@variscite.com>,
	Pierluigi Passaro <pierluigi.p@variscite.com>
Subject: Re: [PATCH v1] phy: fsl-imx8mq-usb: Fix PCS_TX_SWING_FULL register
 configuration
Message-ID: <aURX2-jM0FZbLNrc@Lord-Beerus.station>
References: <20251218174920.359282-1-stefano.r@variscite.com>
 <CAOMZO5BGtgDemQeLvJ+hjY+zBtpFLp=pkpD9js0SfknE4fHd4w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5BGtgDemQeLvJ+hjY+zBtpFLp=pkpD9js0SfknE4fHd4w@mail.gmail.com>

Hi Fabio,
> 
> The change looks good to me, but the Subject is a bit misleading.
> 
> It gives the impression that PCS_TX_SWING_FULL is a register.
> 
> What about:
> 
> phy: fsl-imx8mq-usb: Clear the PCS_TX_SWING_FULL field before using it

Thank you for the review! You're absolutely right, the subject was
misleading. I'll send a v2 with the improved subject line you suggested.

Best regards,
Stefano
