Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29A9657C5
	for <imx@lists.linux.dev>; Mon,  8 Apr 2024 11:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712575928; cv=none; b=tZj8XxNIB+oFWh/kKrW6d4SzMGZf9iaejRuzt2lxE/iRbdCkH446CPvrLvA0S0zb1zRR39yb5fFTSgYscp3SvnVDPlV2Dnxs4FxV/UMF3h1Wx8IYIx5t5NGvqlSDBwtJwnVIdeJeDLOAfM5nXTUjMyV3qIfjSifE67ac7gRUuw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712575928; c=relaxed/simple;
	bh=NMC3WWzWIj1cVvm+tSzJA8DZM1+0DETwbcajhb95PCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hLBvDgKnEvI2bN20ecZU7YTShnnfcuzSkYyc/U3z0AG2SnswznSNLDl812rYHM5bLJkkZB/eRDp6uGzgS8xFYLbuIRzg5Rev6/Iei7Qnr6s2s1rwFcgO6k+iTEL5qeVbaW84qV0eswUpGUlrNHyI7vGq6cFxFQNnnyVRu90Okl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R0W7tuwn; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R0W7tuwn"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2a2fbbd6cd6so1094046a91.1
        for <imx@lists.linux.dev>; Mon, 08 Apr 2024 04:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712575926; x=1713180726; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UCdmzeMLSBkXEEXH5D1ENzq3ZEPECLv63bbf/w1/YSc=;
        b=R0W7tuwnDlr+jKYoJIYJ+wxkteBwdL34R7GEdORVMPLGcOWiaB6zkSYtmDGjsD5Env
         hAhrQO+gdZqGBWGul2nYqo/CYy/p4rj0ZrxN/Bw8QlS6u4iQjEvNbDSx1utXVozaTRf0
         isLFAQiclX/ZAcQ3lXVdaImJVBgIn8Bz2YRnQTHZ+EgSzvoYIRpo4b3rlBFD7QIUNSg4
         l+CVfZZ+7GcB7+BlO6CxmipJeLn15ixGHRw/+fUZa5s5wyCsLVhUPkMe19bOHRRpJHx5
         b9qvBUTeS+c24ra19GBDbAnG6dkXmrUSukz6qfaloCB9tg1AugNlhwXxAGwHTWWUR3ik
         x6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712575926; x=1713180726;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UCdmzeMLSBkXEEXH5D1ENzq3ZEPECLv63bbf/w1/YSc=;
        b=czCdJtcb2OhXkYH6DGbOnaf2IZEafZbcJ1HuezKpEjK9Ybj+c6CMSbjZMsHNxtIVg4
         MaVnKJdn/8gd3c89a34gFQLnirgoDz03jFVXJ4Snm7Le1862yk6EHb1xxJRI+04ojvfV
         aqlG9em1ulFlB3viQ06ZYbPBMbq1Bm/4VMvrMwvlXq26fo+wh/oWJZIDRv7JXCHkdgoZ
         ItZE6/7rinlH84YKKOhhF8BXTERjg/kpVdYmPgtrZYcDSdLqBXb9qV38ghSvvSwe3b5V
         Kh9Yxm/AD6wu7PyaC66kXnPibJM/I0C5NE492WaMuskYGXA/oVIMnLqcWo8aeY/Aj5Eb
         ILTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdN4aZ55Wapzd18YJ6Cf8WB8AHrGjlhYLwHtMEppA/ph4VbHvHIo96OmA54LRbufuw8le8XKbv3F1BRzFuyy5fuWw3
X-Gm-Message-State: AOJu0Yyr8SCAtAfNZSlZvhP3WUJhxYM+dPOutZKWKdDA/g8hVP4AetGs
	2lHE63QpfJ8/KIjYjH0vm+SlzAN3D63GpKP9TxcL/dhlRwHR7RI/xIcb/PAwBYMhgVZ3jz4rdmE
	Gjq/Id4YawTF+CvVs6Qf8Jqu+FGY=
X-Google-Smtp-Source: AGHT+IHtRrXqvgdQjO1xoCVveYgBS1g2kOJwaGacmWBBIY8sfhWT2cTP4+14GnDQVQW9yZRcH+Pwi+i4RsN3e7/vicg=
X-Received: by 2002:a17:90b:2292:b0:2a2:afca:c635 with SMTP id
 kx18-20020a17090b229200b002a2afcac635mr7399934pjb.0.1712575926321; Mon, 08
 Apr 2024 04:32:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240408092449.6-1-ian.ray@gehealthcare.com>
In-Reply-To: <20240408092449.6-1-ian.ray@gehealthcare.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 8 Apr 2024 08:31:53 -0300
Message-ID: <CAOMZO5B-vTRSfi=tNc_iZxnxYstL8JJOd_1rMf4ps9WHyfx0GQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8mp-msc-sm2s: Add i2c{1,6} sda-/scl-gpios
To: Ian Ray <ian.ray@gehealthcare.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ian,

> +       pinctrl_i2c1_gpio: i2c1gpiogrp {
> +               fsl,pins =
> +                       <MX8MP_IOMUXC_I2C1_SCL__GPIO5_IO14              0x400001c3>,

The Sion bit is unnecessary in the GPIO mode so you could pass 0x1c3 instead.
