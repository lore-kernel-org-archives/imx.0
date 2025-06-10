Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFA028033F
	for <imx@lists.linux.dev>; Tue, 10 Jun 2025 08:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543131; cv=none; b=saGyo1u47CGObBwpqE+sufUtA3gN+BM+1JeTO69mv8bisW/8RP8I2Dt/uB4w2BYiJ+Ghkga1xzi4UUFMpSDg4qki95TBwVL4TbFWpk4Kg64PXcNKSeefvJ86RIYShnmne1tMwdti4WkSNJaaJcTuSVIXjjuuFnChV+/BbJL1VMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543131; c=relaxed/simple;
	bh=oJYRsQDIZIFS1gyuxKSeATK987ZVV/SuTaXBG/5waxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cKN4gbkn8usVnchuN5PSjwibtWYQElZeMhAe587j4HZEIr4LFQppiCVwstGNlS3AajRTC/4CdeWW6/R+1GzNq1D5JTNCHixMMtQUrQ9W4A4iduLOOZgCbQikwB5Gv85cglNQ7htxJI5l6w6aEnX6fbYerny8RCeIcK5UIyNjFB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wffhiNso; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wffhiNso"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a5257748e1so3437989f8f.2
        for <imx@lists.linux.dev>; Tue, 10 Jun 2025 01:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749543128; x=1750147928; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQOikj5+hOjYofyjQTxrgd5Ve5lIEwTQk5A2jm1d/4w=;
        b=wffhiNso4afBDD97BgWEAnD8XV0EYnA0vIUhcRkTarR5pwmwn+Mk4etAcTFT7usUv+
         6VIiE5jOYvVkzq/edK62VWIrHQIujcNg7dtZ6H5MHbG7rDiOg6+qzIDGPqbUy9YlIUx4
         IRVjJeyzpcFKWSN0lcOmJVZ89IKXF7IyqSVisoHV/y1nQiD8PJ+P7s/WkgiQewA24OTD
         aJYhxQ4bHKCx7jpTCTBpe/Bmvr6YcYs0FtyTbYnf4Q6QhUQd2Y7RFMONj+H1NlChw0Wx
         xU7eBI+bV20LDzzXZYgfo2HO6aRzXcpUTGuFka/GpXK82DEC0iRST1qrj8zUBesQNk/1
         UNeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543128; x=1750147928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQOikj5+hOjYofyjQTxrgd5Ve5lIEwTQk5A2jm1d/4w=;
        b=AZzTMCEmG8nfdSExxDXENkwKS2N7h1yfPYZHFXh1K/NEdcppTSEVcTRwl6IruCbRQj
         YlajReunqlGRloDgSTb/v+qWuOMoyGsvMtYoYx8Ne3bsY57R5Uvagd8OG1uufFrqIC/s
         si8y7BQPzr3SppZwTqZJp3ob40S5FTWl6xJEPTol3f+SQk0raclOevy/IAPfd5gf6y03
         x91QKS1ju025rZNL6GGsD53I+NpMvn23y6oQtxiZvp+aCnR1FnpEHXhvJ5hY7Jmk9CAO
         2sjDlKgU6JCAdXiyzyZTbYPAjXGqbNl1e98MSdlVThI5K23TD4Gz/mCf5JkfihHj9mDD
         YLxw==
X-Forwarded-Encrypted: i=1; AJvYcCVZg3zIUEuqWSB/xYqSXSxGZOYA8P59a3Mxg8Ook/veqip7RUOfcL8YIzjMY0egNQrIZPo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyqpUkYbPZZT6AvFVP6YjoK7bY8+hdhYaU3vGo898GuCqsynyup
	w9SLvHRrec1ny6/3I2wkFw+IblOoa+qPnc4KB03ZNxAIhUCq9QiCDKIik36CCRPbQfE=
X-Gm-Gg: ASbGnctz/JcF7uloSyLVQMoLJyRb26KqvL7VERwe2Ao2dpSQUyhxrD7rrF2jrlfyoX0
	nI2l9mlVI5flVAJeW43xuadBwy3Wfxih9CMcvP19R9CQpZa04j06LGsDDtw8u7I0ufBOEcb5fje
	B+rtwEOTEsObTqEMOFKu5gb+w39YqEQGErmNY7OHeSGG+ZjAGaQH/vPlO0WUu44wliLBD2ZA8+c
	sE488e9iu5BUmuzevhv0R+8xNr100vxlClBmmFO3ue0Sh5YvpkGVTN4ZzJivZ/G4awWv8MKy4mH
	UVijfsXVZtH9XwqdLzq+8NqeB5dIzax51pHY+zm0jaTpaa/XNoZX1Q5dlxz3
X-Google-Smtp-Source: AGHT+IHeh5JOUa/6DesJDFgxEXglaZaNBYUlWKW1tsF1e+6vqxndSIUGrZ0XXtHALOHyX4qbc6zicA==
X-Received: by 2002:a5d:64c6:0:b0:3a4:ec23:dba7 with SMTP id ffacd0b85a97d-3a531886727mr13057182f8f.31.1749543128214;
        Tue, 10 Jun 2025 01:12:08 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730b9b3esm130838565e9.25.2025.06.10.01.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:12:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	imx@lists.linux.dev
Subject: Re: [PATCH v3 1/1] dt-bindings: gpio: convert gpio-74xx-mmio.txt to yaml format
Date: Tue, 10 Jun 2025 10:11:55 +0200
Message-ID: <174954311123.28634.14290388105456519016.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250604144631.1141430-1-Frank.Li@nxp.com>
References: <20250604144631.1141430-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 04 Jun 2025 10:46:30 -0400, Frank Li wrote:
> Convert gpio-74xx-mmio.txt to yaml format.
> 
> 

Applied, thanks!

[1/1] dt-bindings: gpio: convert gpio-74xx-mmio.txt to yaml format
      https://git.kernel.org/brgl/linux/c/0e3b7b8759a7f3597e64fc12a8a017111edbf777

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
