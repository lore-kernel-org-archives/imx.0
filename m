Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4DA2475D0
	for <imx@lists.linux.dev>; Thu, 13 Aug 2026 19:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786649862; cv=none; b=ikBePrFRmQoIs2/LlmM3XzDCjWM9k04LBoB8kOD95jXiVneZzqXq7RgHFwYclapAMF2UsIov/7JMvJkHR+wPSK0K8gE5zPY9D6yKWioEtK1IefxC0qDgjAouUvcuZQONYQIv+UDwBgf0O0fAr437vJBiocqcprngyfvycmORvDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786649862; c=relaxed/simple;
	bh=omqIZSFkWVF2X6+aL5ujgWk54LbjoA8G5ZfVjBIfeRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JVlFCRkfcViJ7S7+Ks5EDGbVb5cFKp+kppnwcxbjaVocrLZFO8nc7BZiCC3xpFnU8n8vW/VzPObFA6A5UmVfjQ9xSZlUQsQSP4FXZzxJcpG18agn0wPmnKYD9MUv14LRXmD3VW/i5slwma0FZLzvlG29Mm6cL1hhiYUfDf+58T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WDDqkRlz; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WDDqkRlz"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47362928f65so181365f8f.2
        for <imx@lists.linux.dev>; Thu, 13 Aug 2026 12:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786649858; x=1787254658; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=51c7EGTXWgCerge/+6g5NVFzyP7AuWBklS9kpsuyY74=;
        b=WDDqkRlzrAl9IqY76xKUuUhBpK5ayAfIWRkRw+18hBDso1qZx/8UMqyweccVFCI3LK
         3CFOVMHa1nWCzF2NFuiacScgry+id60Q6HCzVp+jGMm9iS957yUn26Nwes3EU5zBRWLJ
         c8rq1SaulCNxJ5AQBImuLcbVxJpb9a2j+WblimsD4tjFVoktjBLU2YbBrVTGQRFpj3Yv
         y2hYn/k0+1kFNOziIjSoTZpRkUM9x0206FKO+Vim75jOmVA71LLSB1Y88zbWXRMUxwMJ
         /AQzXCK7+e00p5jlEK4WmekJsqzfS+7Pa8F1KS7AAwi+jfGd/++RgOuS6Pix2EinodHh
         VZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786649858; x=1787254658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=51c7EGTXWgCerge/+6g5NVFzyP7AuWBklS9kpsuyY74=;
        b=jfHBQGUTk+fLfF5JumQcFYUwsBJPx35o1QNAvC8PvwB009PwABQAz2xkLz6LzMndNX
         YkLyS/uOeXuekmf7c3LM+u8WceH6WHitJ+NZ89op2fIXAswsgeCNm3scTGlKbJnE35rQ
         h9kZPY5bVYu6Gr/UkmZGXa21I2XQl9E74MKj1EvhuDcJjqKZ3DOf19wYEMpUQmAsqPl2
         yDW9QzNXnk1pd+HPhFSNx73xunpRxB6x1bOzSuRODj2zjEODYjGhlZAs/JFw2uKhcD9N
         oF6+SY0yZ5FbjmC3sK8fiOn35pkW3iOnWkFP3iANfbfd16jDVzJ3lbA917EBRTd9xnrs
         54dQ==
X-Forwarded-Encrypted: i=1; AHgh+RosgsGg/Ta7hb7HPTsIVOdr7dK8UASjXFK0hAkcJR3pY9AkoqxLOQX0XQTQEwMKnS2+b7o=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9AbAsjUqNNwIwX0LcP+JwoCKm8OXvOJFlaRMDqEfBe+I5SdVL
	7aqQZsH5pg4WfUY/68UQyvUtw2WRhkPzJwDv/+sT5KDFS1l7ynBT7h+x
X-Gm-Gg: AR+sD12KkjIbDW0LYrXdpdClnr6bC4SF6v1lOg2iCN4AmyVe6EjJnyR0NKTn8htPBrh
	u5f1zYcSUPJ186f2QIR2/RYPxJnReWGSoGITqq3IWGotIGhMrs+cI0slCYpHZGcR3nnwCcTJ9KB
	rvGNOpMwvG9rVMUGYLKsGwOTkx4bv2G4KQ67yOFcK/UNrAJbKjkxrIRTtNrODhD2u7klzHpz+Lq
	EqD8zIyBgSTZ/4O1zS1S70w0tVCF388KKLxxa32nmVLRx9/HWZf0SsyJi4HSk1vD0GqyTvZW7Ta
	oU4YUE2gdQm9JDBZNo5o1MonVUao25o3zRiDpTrMyUHipYB0h3T5DnF5Wfax10TAGfmi1DEa6xv
	6XXNrEhZKMXFUpyC0VNfEI/KNSRL8K2bFk/ZYTZCgJHMH1jrWXBIq36Hw8Ahma6p6sdg0471QbO
	RcqlF0RAo/RXiHpN1fy6fOwnCAwrs8uMQhRiDDq6QgEbP94XXqp0JEvB2WA41OGOx5cg==
X-Received: by 2002:a05:6000:4a05:b0:45e:f8d0:d22c with SMTP id ffacd0b85a97d-48160761e84mr778789f8f.25.1786649858491;
        Thu, 13 Aug 2026 12:37:38 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f2b1a91sm1727273f8f.21.2026.08.13.12.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 12:37:37 -0700 (PDT)
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
Date: Thu, 13 Aug 2026 21:37:37 +0200
Message-ID: <20260813193737.2346630-1-mehmet.fide@gmail.com>
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

A correction on the gpiolib warning I mentioned: it is not a gpio-vf610
matter after all, so no driver patch from me.

Half of it is already fixed: d761c7e38a00 ("gpiolib: Check
gc->get_direction() before calling gpiod_get_direction()") in the GPIO
tree covers the debugfs dump path. The remaining backtrace comes
through the i2c generic GPIO bus recovery, which calls
gpiod_get_direction() on any controller without .get_direction(), and
for that I have sent a gpiolib patch:

  https://lore.kernel.org/all/20260813193715.2346477-1-mehmet.fide@gmail.com/

With both in place, 7.2-rc7 plus this series boots the Colibri VF50 on
the Iris with a clean log.

Thanks,
Mehmet
