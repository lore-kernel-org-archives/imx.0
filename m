Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BBA224234
	for <imx@lists.linux.dev>; Mon, 10 Mar 2025 10:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741602052; cv=none; b=GZQcWXFB4nlGyUlLaOHgnjVy2/dW1pixnM9D45qL+T/rpUJA8sIJF1JWjBCTB1Cezx8iPkRUYeqrYzWLhhc/LwSguWft/+qSUXwI6zbryQ23BcZosyd7TM9YduS4GeJazoqkBh3qFO0/0JgEOSlQesarxLGp/mhvkdmuktoW7/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741602052; c=relaxed/simple;
	bh=JL/iJrs0I5b9N2nPbKpSW6ls+LbJc9PGy7+bMaAhX1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=krVXghzp3bquQiBjkrxfAEYVYEEe8971feo2Z0znkecF/T+Q7UeW7ixXrOxm4FKudnd5w77xULxIFCOe8LVLJgPii+CdJJ2e03dWskKu66Oq27zkJPZFsojBXIbabFXqrfNQjuci4cYV8FTdBEQs/VNNMDlX6Wol+lOpLL3Qf9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bbCZN7cS; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bbCZN7cS"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-390fdaf2897so3778277f8f.0
        for <imx@lists.linux.dev>; Mon, 10 Mar 2025 03:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741602049; x=1742206849; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/apE3VuG/fufAOpi2xtHrpN+LPCwiTLqat5jnVcZLFc=;
        b=bbCZN7cSd/0OdNwwanBnbWAdkUF+nvQFIL7fq0Qq8RukKCor3wZ5W7jF1BlqMVI5QN
         ImLzQqmzU/qUQJunVJiA/Dsr2W8KmvtLQMkjSBjPM3pEVbL8PDJ+TFK+6rrbWf5VbGzO
         baBzDNsJV0qz+qiV4JcqfMO/2y5wIRFMoRbMtsNTjN15nkSr+YUCcHdjO3rh/OmGGi2q
         cRWRrJlPR2x+viw4Fxy3D4ac7tyOFLALHGSYOIdoFr2YyhQsyFXMt/PsWcbgSq+51hYd
         t1+5iInXYtFm9Mi7RVMaEtzyXF9bef/BTcFlb91ht53O4LUtlVvFqwZnGbGotqGKfK0S
         5afw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741602049; x=1742206849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/apE3VuG/fufAOpi2xtHrpN+LPCwiTLqat5jnVcZLFc=;
        b=LeRp+qCVOSGpQsgQfC59FMQOr5FAdwALllEi4Cd/UuaoL0nGXWvBxJA663k3jAf8DT
         zZUFInjI1NZDU4D+actlaRSHQEmac3LMJbJCl06cqHsWcThAqu5QEg6tqSzOA3GzCIs9
         17a5cYAEnuHpb4zgoKUaeinCZYw8S023As2l2NxLBxujrTTgr6LGqgy/ZdOXobKB3A+2
         sO7p8m3EisLru0w2UBsf0oXQ2nDs9/0WIHlZCsoW+NAO6nMX55h4xueBG21+Mzy74KIk
         SzZmubXBeiNd6Bl8DETYt3RNhsz6fV6sGic/lEPO4JHLzkQwj7Y6GlkQDlMnimLQGJNb
         luJw==
X-Forwarded-Encrypted: i=1; AJvYcCUpAj4kE9QE64QGg/fPIq1whmvz8tZdhT017Cgxxjk0tdr/9gCIoGecB/B48WOlmhb2Owo=@lists.linux.dev
X-Gm-Message-State: AOJu0YykXGvcHFxrRz90BCMeh3+HJjsJ1JSYnsn6LxJZk11eYF7kwIgM
	KMYaEZi8BgXNQClchdUu5LchjEAGQiVqV0A/kXPd/Z9EvxHRP4TjbZjaBEOFJpQ=
X-Gm-Gg: ASbGncv1+l1KwwWmqW2AcGh7BSQn8a+ucWF3+tfbw1XozgxWZa94mtMxm9NJzJ/G+MU
	l3fYF8j+dRxkSxdkox78cT5JWiGiUPIa9+ezXcurF4GOnlV10iwsLbSQuvvGMMlB67NvirkJo8W
	wtmDzFX35VcP8DRylgERn3asjysmQUkiUhEwswxPPLAMzVuqwrHsO1LelG3w8X2v0E9HAB25fci
	XfR57njC2Jg/4JyyF1TvrTonXuVp5yDZM1GY8xgr71gx94opI5U2xMPM3KjAi2Pmmpku1GubQiy
	1cDslAKaVwnOfpcA4ud+DWGr10/qDiTUz2RhvOqSoCeN
X-Google-Smtp-Source: AGHT+IFfzfWd3QOlDox/vtQwZeERmiQYf6W46ID0K0ZY6jsQM3TpjDckCeiqjrDVUJkjElclE1Hehw==
X-Received: by 2002:a5d:59a8:0:b0:391:328d:65a2 with SMTP id ffacd0b85a97d-39132da24ddmr10077276f8f.38.1741602049284;
        Mon, 10 Mar 2025 03:20:49 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2711:39c0:fb51:b639])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfa52sm14068218f8f.21.2025.03.10.03.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 03:20:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stefan Agner <stefan@agner.ch>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	imx@lists.linux.dev
Subject: Re: [PATCH] dt-bindings: gpio: vf610: Add i.MX94 support
Date: Mon, 10 Mar 2025 11:20:46 +0100
Message-ID: <174160204380.20418.6002822066800519604.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250306170921.241690-1-Frank.Li@nxp.com>
References: <20250306170921.241690-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 06 Mar 2025 12:09:21 -0500, Frank Li wrote:
> Add compatible string "fsl,imx94-gpio" for the i.MX94 chip, which is
> backward compatible with i.MX8ULP. Set it to fall back to
> "fsl,imx8ulp-gpio".
> 
> 

Applied, thanks!

[1/1] dt-bindings: gpio: vf610: Add i.MX94 support
      commit: e93160942585832a1836381018daf9729eb9ca64

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
