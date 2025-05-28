Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AED21FF41
	for <imx@lists.linux.dev>; Wed, 28 May 2025 19:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748462229; cv=none; b=dA6Ib+U6XbwuVG58i36Nv3b4xLJHocVKRonqnweiSGO1TidzmkjxHUGLZYm6lnOm6fbYHQG1WZyvZlgbkbFDk3q60YzzroqnrCSP/0+9BEQbZT0rBwx3Q6FoiKzDG3Iz9q3+81wInsdzZXAQ3BLVFwcVBrdd+Gy4ET8mkomiuhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748462229; c=relaxed/simple;
	bh=Xsz6XZ7exOnaDVgyk9FhTekrCZof58PjSId5OiV3byk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cKasLnckEnRFxYE5yWi+3bQ6qEWNSn7gGWIpoy+CE7QHZKuSjmqiXe7eSPxhAUmiXSS8oSQ4/imnNkXwZY4yqT7mZaVRmBDhs1SBd30LCqIACfRwsCJskHrfdzzyhimlV9yB9xdvwtWa4yEFvsJtSsIItR/rWzGVveWb0dNARC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sGgWMHea; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sGgWMHea"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-450cfb79177so227315e9.0
        for <imx@lists.linux.dev>; Wed, 28 May 2025 12:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748462226; x=1749067026; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IsxIxIK6IO+/d1azvrpZkxNeZUasvn91vkyCez/ohhE=;
        b=sGgWMHeakwro9I+uZIHAA1VDHIQOqoHWoaMeTDSrxGJMn9qUe50HjoekU45wJ6LxC5
         QRx0/kUKKP1wGYb7zEeagkUN+hp7cIjikiBU1Ei5d/x8lR+uPYpAAQsq901h/9g5/RoY
         z8IuMuS3RcExJOq8es7ziR+HsymSESYXWRxoVNYSd4aLaHLSEZarnkKQNZ8jO8PB6zNv
         5vH833vJu4S3+92i4ri7ofOwkpdm9Cxn+F+jgFFBJPuNG0mCFTzTL7vBEtK4YKLKwGpw
         J4h0NrAJpiCWzj0mayf8BzFHwSP2qGyJzaKKEFeOhBSTb0uuT9wtUGEUQb7YdT4G8IYm
         zRTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748462226; x=1749067026;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IsxIxIK6IO+/d1azvrpZkxNeZUasvn91vkyCez/ohhE=;
        b=B5wqAp8DFMXcO/gBopgZPYoEfn56+UfkFi3MUYIdLTDvHsYAqO5oIjoOYMSkvIYoBy
         mWPzVI9IRJM2RM1PjSl5Xp1eGmHMGc3N+kg4S7EMxS7GhhC8I8znEMIgdvnRQGQUMgwc
         ZxSrapRKj7OT3esXn5qIETt0c+IA8yVrspSX4DxH/MpLnKmW7sLzJorfSdBfYUQl3caq
         zud8M4BF2ZSQmZYCp/7Ur7XDJPZgoNme6AlfrIqilvNrbjwFNCGmIoSL9D9EJC9tU735
         9unGQCfQwyn8iHpjvywbCz+ugcEFSBtLQarQ7EAEYYBO9YErQ1D7ns216xYfhVD9A7P0
         QU5w==
X-Forwarded-Encrypted: i=1; AJvYcCXSAR5Ut0yrPcTOEJ8mTfgCwPvxcMZomj3jylYTU9gSxP6maM/4KluHc+ecrzQP9t+HT0A=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0Tjyib+aL08iPVHUoc3XyankkRcR55xhZS5JW40KKUk8KUQDZ
	8a6Jx7cY4ZsXv1/IvGLclqN/07VWusvQ9rYIDKn02flHlUJLpltPYCpvrw6gYvj/m2o=
X-Gm-Gg: ASbGncvSJGfdwH62k5JkqhqGEvwCPzEvCjEJY11cUBtR+lHssMCFzXODRGtf3LKoTYZ
	T9GbbMqoCPSQqmTwEY2jpcjyvrST9ZvwXb2jTpeQ8LBt6lyOlejGlHG73caEEAZLHx8SHHyBswI
	kKQ7EsBonZ63iQX4c2nkvqNixZNF0mrSnkoiUAXFUlFvSyOBtXqDrzy00Pp4cdPw/wv6m0gFRl7
	m8AxIZvv/MeKg+WHc7ntBsEuaR35LrtqYJ+mOTDq8pn2EFEhwor/3zVJFtM7S6zWcD/nl/Iho/2
	pDqG9KGcX0NZubo0MH3KpDrYwcX+lxgKZI2LNGN2+hkbYmqS+4t0qIQ=
X-Google-Smtp-Source: AGHT+IHO8Svq/QgVTHmZClL5gffMevyHOz1Cco0x7cPWvVyVd9ZXnG4onhYM/UN/PlwWdqGJFqmo+g==
X-Received: by 2002:a05:600c:35d3:b0:442:f4a3:b5ec with SMTP id 5b1f17b1804b1-44c9301650cmr187985425e9.4.1748462226120;
        Wed, 28 May 2025 12:57:06 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-450cfc04120sm638565e9.16.2025.05.28.12.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:57:05 -0700 (PDT)
Date: Wed, 28 May 2025 22:57:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peter Chen <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Xu Yang <xu.yang_2@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, s32@nxp.com,
	linaro-s32@linaro.org
Subject: [PATCH 0/4] usb: chipidea: Add support for s32g2 and s32g3
Message-ID: <cover.1748453565.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patchset adds support for the s32g2 and s32g3 chips.

Dan Carpenter (4):
  dt-bindings: usb: Add compatible strings for s32g2/s32g3
  usb: chipidea: usbmisc: s32g: Re-apply init settings during resume
  usb: chipidea: s32g: Add usb support for s32g2
  usb: chipidea: s32g: Add usb support for s32g3

 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml |  2 +
 .../devicetree/bindings/usb/fsl,usbmisc.yaml  |  2 +
 drivers/usb/chipidea/ci_hdrc_imx.c            |  6 ++
 drivers/usb/chipidea/usbmisc_imx.c            | 91 +++++++++++++++++++
 4 files changed, 101 insertions(+)

-- 
2.47.2

