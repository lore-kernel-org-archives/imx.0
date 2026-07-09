Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EB0421EF4
	for <imx@lists.linux.dev>; Thu,  9 Jul 2026 11:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783596779; cv=none; b=o9marf+QDet64NIiA+Q6pNNoXhGL/yAeler5eOGB/RDkNA+6WcMjAKFVNFEaSrV000ybUiNHI/7zWt2gA8kp9C3ecIglB0V0UttYtqgOUM8zEkcJ0SSsnju6OcJaBTDOo7NJe8NcEvC2YaVuA7gHZurbtIcYQ1hdpj1LCvg+WJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783596779; c=relaxed/simple;
	bh=lvRoX7NF7koqKSVMWIj1y8gTZBU4/f7JqGnAfGc3AXE=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=ke7q1q3MEG9A9q/mkgyfwNmfdyzX14uhhseowE137qTS4p+2NALEn9PDBa3Y7S/AANN8ckiPFlB2vvhUvCi0o88noCdaYnQdryxvR6v3Szex1IIUanZK/dP5gcQdjvbhLCS7CD8uxff64Dycfh10/0/bFgjhql5+DLRpsiliQxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=j9i0vHo/; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="j9i0vHo/"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47dec32798aso657215f8f.1
        for <imx@lists.linux.dev>; Thu, 09 Jul 2026 04:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783596775; x=1784201575; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CLjzyOv/WTLBRnX5mDjhunmkUjnf60dz6rJau52ia58=;
        b=j9i0vHo/PB9mgOqwRQMctl+seD3pTGPXW+PaudWESpv0rbn3zq7ecoBMo78qUiYm8I
         n3ZzkLowZSd90rP6rue7M3wS9KKpOkoZZ7RfxYkPeDCSOhC3tQqQWKZU436qe3XK3lcX
         aABJoZWt61UfH6BqKmSSkoSx5avEEldSv2WgrFuOd+BOHBYy4QBOgyRBbg0xOvHdyt87
         KNkLYUNGCt16OAmZIjafz8a5ZoYCVT5F0K03cUSZ9Lw1v4IzohcMY+KAacBtnuNPin3A
         +fNBTk3f8I4wTn6+/sCI+1JUM9EpND4heh+1TQCKjVz50r4Rh/8HLHxas/mmz+poU1gw
         DEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783596775; x=1784201575;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CLjzyOv/WTLBRnX5mDjhunmkUjnf60dz6rJau52ia58=;
        b=rHUx4MRxFyuWIFWB1sXnLaXOb04ZIg5tXVG/U2aZDOxxDc5EO3O5KqAQNzQNd6mPV8
         n3p3ohgXFKaMkncNZ11uN7cmOdW7P7JIoIn/W4b2wyiuD9T0kIDD2URm16oe9mQL1bSu
         XsT/hT9QSwLUQAK07FFiSQQVl4uCuj84Lg0nYrRZb20861JCUJS4q98qH+p9U8toezT5
         UrXSIR6l6W3JB9Y3uCHzd6IhcqsvDcjJHIoibHNdxGPLyN/C6tyscgC2kOo1TQTJVhMM
         8BlAUGN0xZWMu5jUQz/Q1fk1EVEiKFD8Yobn6/4F6TJjX3Nshdhm6Hx0Yey9zuIhFpUX
         FUdQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro6tncgCoIfPQNzduP7BjfMRH9ZXg6U7jGCh+S/tCax8NyrxGs/XguPK0pKiZEfflf1wRI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6qax8QaPKdFCcaBOoE+tifIPcwF75NeSeuDb6Ma9uAMo3faad
	TRBr4q+vlTuqqblZRCx2pw35DP0jnWj4iGdyarO2b5pZ1QLjxkLOuWkUNI1w+npTfVw=
X-Gm-Gg: AfdE7clTN2jEyU0MjPgpjnGV9xURM+kUodq2jsLuvNN8PqZK8MZAlnSGjvsR5IyVq0w
	HDbaEaKmfc9e4AbkUJ+TlN2tZJi514bkvg2c+7VJJoJ6uMMcfcYG4gfV4vYfXcmOe6yXTIvigx8
	GecF4+/M+r11lrlgqQwxKg86S5lydLYwJEMxPeeILtzPjcnNB2PuXqkFLSY4jv18lTomSc4w0Xn
	1XMjQzY+lFizSqjHx+ziDPs/AOimAkSVgJnSc/mEP5FhszFuU4yhqIE0StDsRNDSVXKLumrEJIz
	TW4IHkVtrQvO7D0siDfEXsy6P7ZNuGoxBnUS9dEdtPQcP829cUN8/6dkvpuBIEj0pX0thd0CJRW
	kkwF9bBOJ8BbmyfwtwSzdP1LMCiDWtWsRdA+GC1ufj0EfeUiK4j5WuYQ4IYdm9dCPCP5QAKPNR0
	42rKL3BA5ssVcsknCQcQ13NRkc72DDwx80m3fx4v0NbMy5uKCclB4Q
X-Received: by 2002:adf:e195:0:b0:47d:eee8:ec40 with SMTP id ffacd0b85a97d-47df0797e7fmr7287312f8f.38.1783596774909;
        Thu, 09 Jul 2026 04:32:54 -0700 (PDT)
Received: from [192.168.7.218] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47a9de1d8f1sm51491575f8f.3.2026.07.09.04.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 04:32:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 5/5] i3c: master: Add optional_bytes for
 variable-length GET CCC validation
From: Alexandre Mergnat <amergnat@baylibre.com>
To: tze.yee.ng@altera.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jorge Marques <jorge.marques@analog.com>, 
 =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>, 
 Felix Gu <ustc.gu@gmail.com>, 
 Manikanta Guntupalli <manikanta.guntupalli@amd.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Jarkko Nikula <jarkko.nikula@linux.intel.com>, imx@lists.linux.dev
In-Reply-To: <2e07dc944eab1c4358be1da87fa5000e711ac8bd.1783493868.git.tze.yee.ng@altera.com>
References: <cover.1783493867.git.tze.yee.ng@altera.com>
 <2e07dc944eab1c4358be1da87fa5000e711ac8bd.1783493868.git.tze.yee.ng@altera.com>
Date: Thu, 09 Jul 2026 13:32:44 +0200
Message-Id: <178359676411.1767060.12087768870697006429.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=419; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=lvRoX7NF7koqKSVMWIj1y8gTZBU4/f7JqGnAfGc3AXE=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqT4bjluy7zrbpNSclHQ8EeuHb7lIqwFLY+2OQL
 p7mhmQgtriJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCak+G4wAKCRArRkmdfjHU
 RTpYD/0X1X+hSUbcA7uP4N9hoS+E+Xq0BvJeA8eUc0sZaGfgUreShrBwNL0ypoYqbiVlDQ40m1s
 q1p9XAmjHaPZZaA5O7SYeT3i91SRyAmETeelF2NuQ1uv5OOefSIhSvSQHGmZRaIjN08EexAe4sn
 YiSTEYg8UMZHGwAQ5TFPSY2c8iwdpmx8fdgLTzWfqIXiAR9IgY39Iw2UdGGPxHKSlwMHnZEdO0s
 EjNI/3xiz5zzUUS9ao3nFQ59zEFUq5RAL5xFQ5uhq7Y08OiIr+9K3F6F0d7JGHCkca8SdkqRLJq
 oRs9ZKdWRXOsA/95u42z+84L1YMMTf8vWGtZ+pUoOYEBbPcbFUt+eM0Dn4y7aZHU6L0y71qjog5
 iom/UaCK/awELvrQuqbE06LCcsNYBRU5MLwFjusZagYQhDcSE5RHf7+zrjZF9G21S3HFCYZ93Ek
 gfZhFcRG57xq5d9QQDlmKzjpWFMXpCCYy+R1VsrCS6C1RrmdeJMjVrMUI2tPVoYzGul+w8gD9ld
 byKUACRjbuv70DuZU9V9HD9wbIgNWCqsg+7c504pmLTx8B8L8qaFTzfO65fv8Lw2tDbw0c0MGa8
 dePEULSAhsn9+7bH0d3001RlmO57outneVIpswo3jds8TtddxB/2INOjr/WwxZW5D2ZRZTFfPRt
 sOi7v6P0RP428yw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

On Wed, 08 Jul 2026 00:17:41 -0700, tze.yee.ng@altera.com <tze.yee.ng@altera.com> wrote:
> Add optional_bytes to struct i3c_ccc_cmd_payload so callers describe
> variable-length GET CCC responses. GETMRL and GETMXDS set optional_bytes
> at the call site. Extend i3c_ccc_validate_payload_len() to honour it.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>
