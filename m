Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F334A3F28
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 22:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789683963; cv=none; b=Lw3rCPAmnr9IdOBBQxutWeNvFnOm1puCbj19R+p4vhM4uBHOGlVYhsZEcxKR/Co/VLbRQ6HP4DtBnU11HMCHi+hChISW9TjV5jOX+KAx0+UpKKlAlT1vll23rNDiXrRXIvZDPYUbBbhoxJEabWDVRHV0pkB8k4QyWY2htPnfRPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789683963; c=relaxed/simple;
	bh=l9/NyfXKy1WrGYxW/ylBLHr+m63MzpB0UkpPW7lkV6o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hbkE0uNq9fzWKax7u8A0Bkhy5z5IL7bVHGozcQ3gq0rCaTYco6EC//tkZtRO8ZZIVxlLZFgu0hg1Q1PJFujmd2g3I2TJu8UqXKNNlnshJEfLb+9NzxbsP8BX+lnZcE+NXrHzwHTPTthZD0MMcfbib44OKeRiLUZGVWNPYFOyDJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QdRCgkwi; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QdRCgkwi"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so1607345e9.1
        for <imx@lists.linux.dev>; Thu, 17 Sep 2026 15:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789683959; x=1790288759; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CrlZYOE4Tb+zUOHoD48b//tG3mcCRvsKdsWOXCdCJnk=;
        b=QdRCgkwiN5xQv5jQb6tsDIIzzG86LyCl6oeFO6kdxIqr0M5gjCX0m9hdxgz1j9pJd3
         u3wZXoeEfHVB6bgsJ3t/Jl79vCK3CTwWNDSKuLnwQ/9svNwt8/jKrfe3k1lA/esm1TK0
         yiwf9uTENusQcos388yIBHm70Ii0CcMZAidDRS5Qx/B3m62++x7wy5Pz/dktBP/roJuI
         ONFW5ZxWOaG24OfJr4wTaiPNSlEwhIvNghmqz/Vb36eRxgmRVrtbZgfey3iVVo2VTusW
         xvh6dECMwqOhlErytrUSIxRNpLiZ0EnpdeLn4HyPbR9h7deoIRv/N7FqUhPnlPTjaS2c
         Yx2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789683959; x=1790288759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CrlZYOE4Tb+zUOHoD48b//tG3mcCRvsKdsWOXCdCJnk=;
        b=t4PQ42RXVlyrUm1BiAKojamlQqv5l9EzCVViAQWmdo8S9BBC0uhOe6V0TV6CzwdlVt
         LRQA5x2bjnWVrTaWm6FqWxnxsAKtQEbqUmraePwlECJTqJqU0yRpYl9aaa5WH44aFPGQ
         gd4Ox9jRtw87OH+ea42XIp44PUm6TyZ9FFaNRnTAno707S1e5eeEJ0wrdGZY3K/ua4Ec
         /GydMsnwGHogv0YJfAUVZyFLx3qjnVbh/q3gCcFE1VRjRy/26vT4OVvvrXdIMZCKhYd/
         C7ICJJVDvHuremngJoiA6kJJIhcNSC4c0WKUy+3fpRQuXDv9QQ31KfxlshWLfinKLiEk
         ZUsw==
X-Forwarded-Encrypted: i=1; AKwUvBxYRygQI2+36HtuPO7AjhN0TH0E0I65GKAs2VellIY3m0YxkbyAEWJoUIHFUu2OZ7TESdU=@lists.linux.dev
X-Gm-Message-State: AFuF++nEPtQ4U5OU5cjZh55ScvBnv6fT6EA+XTGWT0iH3DAIfMwjZF5+
	QHL+kPgJBr1rH/pvhuRoW4csG+LC+GUDZ2JItIJTtt+3a9MVaJ1BbfjF
X-Gm-Gg: AYBFou3jmdBFIo/LfyKVymXlyBu3PrxYUDqlI0rzxs/FI7Bi1WgsCn0v5rFCoQ6ye65
	6i9DYGEqYmpOnNhP9mCeFE5Muou3TIp6xVvFaRmSEYZ/e2NdfB6kzxvdTKn+iwK3CAUQLs4wlds
	7QvIvVYlXIjDGuhJEcLz5tiGu//30qgY3CK1kyHhAy72fCZ0wfJ02SF2sWkA4Hhkl3uidRWnZKb
	CoU7i3wsKqFgCj4laR1b2/YWO369O15RfwSGnysCzwk7klm7cqEqwWyhWYEPd1PEf8RfwmLvn4f
	6FPKaCj0BO5NuU91Bqf4ra6ggf7kTg608+ptskcMNyWMr7G0Yjp+/FhAFGaRNYV1qorITpLKUOE
	Lo7SUHR1RDF5wsCaQSWVIo/ugeywPnYVmyP3to7NwHyLDjiFmn7XJrW0ZFXK66LCKFOBFczCykF
	pdA+SS1Q+cuNT79aDQzRVZSkzj9+dxwMqoilEaH1bSV9VsxbkdYFYloGuxBYiharqQip5rvf+6J
	koizJefdJUwuPYjXs5HwypDzH1rKWeO/pObDK8SacBrIx9CwxmkPLew8Ymum/eL8pL85DtLdI/u
	98mKfX7kqx+0mPo7JWeKPw==
X-Received: by 2002:a05:600c:3b17:b0:49c:fc6e:8cae with SMTP id 5b1f17b1804b1-49fc5737b80mr3154795e9.18.1789683958822;
        Thu, 17 Sep 2026 15:25:58 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc56aab7csm5583835e9.1.2026.09.17.15.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:25:57 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 0/3] arm64: dts: imx8mm-var-dart: update SoM support
Date: Fri, 18 Sep 2026 00:25:42 +0200
Message-ID: <cover.1789683864.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series updates the Variscite DART-MX8M-MINI SoM device tree to
better reflect the currently supported hardware configuration.

The changes configure SAI3 in synchronous RX mode, add TPM support,
and increase the Ethernet PHY reset deassert delay to improve PHY
detection reliability.

v2->v3:
 - Fixed reset-gpio polarity

v1->v2:
 - Add tpm pinctrl
 - Add comment on tpm reset line

Stefano Radaelli (3):
  arm64: dts: imx8mm-var-dart: configure SAI3 synchronous RX mode
  arm64: dts: imx8mm-var-dart: add TPM support
  arm64: dts: imx8mm-var-dart: increase PHY reset deassert delay

 .../boot/dts/freescale/imx8mm-var-dart.dtsi   | 21 ++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)


base-commit: 46d8fa682d263271f3ef7bf95166b124c19d6c62
-- 
2.47.3

