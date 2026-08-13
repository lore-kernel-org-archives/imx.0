Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EB7314B8F
	for <imx@lists.linux.dev>; Thu, 13 Aug 2026 19:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786648527; cv=none; b=VefNUFvTJViDJ7LLehE97NPG/0ZXd1cuxszOBfChz19X+UFxcnqTZjCvLruiUN+bfSj8AOQFTpNgsF8xAKcllZekAciXVHNlRU4sIuOEJJxUGoTssb6jukSZvre63QmCsgznSfBzE2pmHxlUM09IVJb11++yr08SN0VPoYkanFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786648527; c=relaxed/simple;
	bh=XTeaCcEc2SN8BtA8kLHMieDCplCMiP8uY0kYtrEqg4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ITnk8AVSUJkMIh8bjwU9Qv8P8VZsEWIDqPOh2K0zZZMTtWbRE/irWxFOsOON9furVQTkj9WOdarSD669+WoWBZyrFa3KTNzE7WvATZxL5W1t8gaH5urFXjEgTGRbvVUWW4c/vlcWj7zZAOykGFqo6d5AOnQSfLhkRZRnF7RYZaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BK03QTZg; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BK03QTZg"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso113210f8f.0
        for <imx@lists.linux.dev>; Thu, 13 Aug 2026 12:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786648524; x=1787253324; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XTeaCcEc2SN8BtA8kLHMieDCplCMiP8uY0kYtrEqg4s=;
        b=BK03QTZgm6AEQuSoJuBlwSyEt2m9BS86QB/lhkZQaCCmfWjCfhhALqDrhX55Be62er
         o5FR/K88/Xn2HSDKryosv+CfDWU8ecjVlC3MLQ3JNmdUOywSdKWAiAJs3PjBIRxyMQiC
         +Al2quheg/IhMaiRKm80Sq7/yosERIMZ1LcNx81neI0/BEIhEwxkXC/H09gsVXS964ec
         kXdKMli8wKElZsCWxy/N2Io44e5hQBv5mrlMGn+YdO1sgAYMnqeqfSm1cuA+TwkbndA2
         GkoTzvm7oTNP9V72muJa27xXAzVbnmAGPmMGMfgQbjG0PvnXtEbcZwjJfrR65W4d/h8j
         PPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786648524; x=1787253324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XTeaCcEc2SN8BtA8kLHMieDCplCMiP8uY0kYtrEqg4s=;
        b=fhj72RdbC3BnXJZKUZrSxH8SMYdyNL+SvfwP5cezyQ0+RsgRnVDGxTRsBE9M/F//LX
         xNwM9ErND3A7y/RL/0oDPj4Dl9KAHV70oRRhwK0I9YlJUNJ6GwW+fas+QTokS2KejfoU
         neKPZxAsDczw64CCk0puwlMH5egipoM6MaGdzV8JdUF/U+sh8dHFBgNAaqyFO1VdNsYZ
         JsJ9SWA7VuvdbI16W0pIxOqWs2FS73hkWDFSThXJXE2KgSY4kBRbnnk9Nddf3atcMNy1
         /Pr/2MVdioeRZOVk6zilQ5W65IIDdWme7RMFCPstrw9mQ0bB8gn3KitJhqXGUkIWAdW+
         4VRg==
X-Forwarded-Encrypted: i=1; AHgh+RpQM584XXKn4fH78xwRzsVLaRMyEXLOZvqDAWAxxR614eLijPDqwmteDAXDlnxYQn3Cy9s=@lists.linux.dev
X-Gm-Message-State: AOJu0YwPyrFrT+EdrNLSFtNKSG0EUOkDMuRn+PHLZ8xOQnQsQIEigTYA
	LvgnfJL6TD8TILnrOo3bvVwvjecjsd9/Wv3aXDTAXRVZyef4K9zrV3wS
X-Gm-Gg: AR+sD12QpfQvG7ldlcpu8vbkc8ANnzK6W9rjPi4uD4iXUgD8mi0kq/JM8LCRCXVCp7X
	7r6ukFHJKKS87vNqEVFZwuzuEnZmTPWddBKCVz1Uh0eCZ8GsDZAwspjX+CMkDDHe6K0oGYhVwks
	bSVZhNXR+deQLPmN+3uEJb0C469PJ6zLRQ6JFR1K6DajFs8keghS0w9Y+1COKlr0ntH04YJYTaV
	JyBA4Oib8zAxG2uiYsn+y/WTGYENoJRvN1QlNtaYubO9CBVZnAPX+SnHElSOU+fzTCQ50EsfQBJ
	AKdvGZjknWfvZhFWQKC1q6m0+KwtsrE0sF7HPiRX/XgbC88gT9pPlpqLwQOaIZ4tQuj6pIBRjIt
	w5XZs9A+Mi3sR8eH/wHC+WZdfUrvaYvdlGh0fEGpb1DAJNVbL1m0Zvs1WChQ+exbhkQOpeFkvr4
	dB37oSWy1aY5xCF0jrVaB7m27aoyy9iAq9dKtmFQsv13quuSXgo0DFi3Ge2o/kYueT+A==
X-Received: by 2002:a05:6000:38a:b0:481:5276:e4e3 with SMTP id ffacd0b85a97d-48160748b69mr654934f8f.19.1786648524165;
        Thu, 13 Aug 2026 12:15:24 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f200752sm1618261f8f.1.2026.08.13.12.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 12:15:23 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: Re: [PATCH v4 0/4] ARM: dts: vf: Iris carrier board for the Colibri VF50 and VF61
Date: Thu, 13 Aug 2026 21:15:22 +0200
Message-ID: <20260813191522.2334974-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <CAOMZO5BwLCRd_cTV82J0KgPfSF6_kUKiSUbG-SKxNxiNu0VKOg@mail.gmail.com>
References: <CAOMZO5BwLCRd_cTV82J0KgPfSF6_kUKiSUbG-SKxNxiNu0VKOg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

Hi Fabio,

> What about the latest mainline kernel, 7.2-rc7?

The series is based on it, the base-commit in the cover letter
(3d6d817622b0) is 7.2-rc7; the 6.18 mentioned there is the LTS our
reference image runs.

To make sure, I have now also boot tested exactly this combination on
the hardware: 7.2-rc7 (multi_v7_defconfig) plus this series on the
Colibri VF50 on an Iris boots to login, with Ethernet up, both PWM
chips registering, the microSD slot, all three UARTs, the carrier RTC
probing, the SODIMM gpio names in place, the EXT_IO pin group applied
and both transceiver hogs holding their pins.

One thing unrelated to this series showed up on the way: gpio-vf610
has no get_direction callback, and the gpiolib in 7.2-rc7 now WARNs on
every gpiod_get_direction() call because of that, so the boot log
carries a number of identical gpiolib.c:431 backtraces on any Vybrid
board. I will send a small gpio-vf610 patch for it separately.

Thanks,
Mehmet
